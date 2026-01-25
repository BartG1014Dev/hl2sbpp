--========== Copyright (C) 2025, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

includeC("shared.lua")

local tSpawnPointClassnames = {
  "info_player_deathmatch",
  "info_player_combine",
  "info_player_rebel",
  "info_player_terrorist",
  "info_player_counterterrorist",
  "info_player_axis",
  "info_player_allies",
  "info_player_start",
}

function GM:CanEnterVehicle(pPlayer, pVehicle, nRole) end

function GM:CanHavePlayerItem(pPlayer, pItem)
  if cvar.FindVar("mp_weaponstay"):GetInt() > 0 then
    if pPlayer:Weapon_OwnsThisType(pItem:GetClassname(), pItem:GetSubType()) then
      return false
    end
  end
end

function GM:FlItemRespawnTime(pItem)
  return cvar.FindVar("sv_hl2mp_item_respawn_time"):GetFloat()
end

function GM:GiveDefaultItems(pPlayer)
  --pPlayer:EquipSuit();
end

function GM:LevelInit(strMapName, strMapEntities, strOldLevel, strLandmarkName, loadGame, background)
  gpGlobals.mapname = strMapName

  local pEntity = gEntList.FirstEnt()
  while pEntity ~= NULL do
    local class = pEntity:GetClassname()
    if class == "func_door" or class == "prop_door_rotating" or class == "func_door_rotating" then
      UTIL.Remove(pEntity)
    end

    pEntity = gEntList.NextEnt(pEntity)
  end
end

function GM:PlayerEntSelectSpawnPoint(pHL2MPPlayer)
  local tSpawnPoints = {}
  local pSpot = NULL
  for _, classname in ipairs(tSpawnPointClassnames) do
    pSpot = gEntList.FindEntityByClassname(NULL, classname)
    while pSpot ~= NULL do
      table.insert(tSpawnPoints, pSpot)
      pSpot = gEntList.FindEntityByClassname(pSpot, classname)
    end
  end
  return tSpawnPoints[math.random(1, #tSpawnPoints)]
end

function GM:PlayerPickupObject(pHL2MPPlayer, pObject, bLimitMassAndSize)
  return false
end

function GM:PlayerSpawn(pPlayer)
  local ent = self:PlayerEntSelectSpawnPoint(ToHL2MPPlayer(pPlayer))

  if ent then
    pPlayer.CurrentKartPos = ent:GetAbsOrigin()
    pPlayer:SnapEyeAngles(ent:GetAbsAngles())
  else
    pPlayer.CurrentKartPos = Vector(0, 0, 0)
  end

  pPlayer.kart = CreateEntityByName("prop_physics_override")
  pPlayer.kart.PrecacheModel("models/props_junk/watermelon01.mdl")
  pPlayer.kart:SetModel("models/props_junk/watermelon01.mdl")
  pPlayer.kart:SetLocalOrigin(pPlayer.CurrentKartPos)
  pPlayer.kart:KeyValue("targetname", pPlayer:GetPlayerName())
  pPlayer.kart:Spawn()
  pPlayer.kart:Activate()

  pPlayer:StripWeapons()
end

function GM:PlayerThink(pPlayer)
  -- should be vector, fuck
  if not IsValid(pPlayer.kart) then
    pPlayer.kart = CreateEntityByName("prop_physics_override")
    pPlayer.kart.PrecacheModel("models/props_junk/watermelon01.mdl")
    pPlayer.kart:SetModel("models/props_junk/watermelon01.mdl")
    pPlayer.kart:SetLocalOrigin(pPlayer.CurrentKartPos)
    pPlayer.kart:KeyValue("targetname", pPlayer:GetPlayerName())
    pPlayer.kart:Spawn()
    pPlayer.kart:Activate()
  end

  pPlayer.CurrentKartPos = pPlayer.kart:GetLocalOrigin()

  local ang = pPlayer:EyeAngles()

  local pitch = math.rad(ang.x)
  local yaw = math.rad(ang.y)

  local forward = Vector(math.cos(pitch) * math.cos(yaw), math.cos(pitch) * math.sin(yaw), -math.sin(pitch))

  local speed = 10
  pPlayer.kart:VPhysicsGetObject():AddVelocity(forward * speed, forward * speed)

  ToHL2MPPlayer(pPlayer):AddFlag(32768) -- FL_GODMODE
  ToHL2MPPlayer(pPlayer):AddFlag(65536) -- FL_NOTARGET
  ToHL2MPPlayer(pPlayer):AddEffects(32) -- EF_NODRAW
  pPlayer:RemoveFlag(8) -- FL_DUCKING

  pPlayer:SetMoveType(MoveType.NOCLIP)
  pPlayer:SetLocalOrigin(pPlayer.CurrentKartPos - Vector(0, 0, 70))
  pPlayer:SetFOV(pPlayer, 100, 0, 0)
end

function GM:Weapon_Equip(pPlayer, pWeapon)
  pPlayer:StripWeapons()
end
