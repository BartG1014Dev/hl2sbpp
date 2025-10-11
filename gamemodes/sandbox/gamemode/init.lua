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

function GM:AddLevelDesignerPlacedObject(pEntity)
  return false
end

function GM:PlayerSpawn(pPlayer) end

function GM:GiveDefaultItems(pPlayer)
  -- give basically everything
  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "Pistol")
  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "SMG1")
  _R.CBasePlayer.GiveAmmo(pPlayer, 3, "smg1_grenade")
  _R.CBasePlayer.GiveAmmo(pPlayer, 3, "grenade")
  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "Buckshot")
  _R.CBasePlayer.GiveAmmo(pPlayer, 32, "357")
  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "AR2")
  _R.CBasePlayer.GiveAmmo(pPlayer, 5, "AR2AltFire")
  _R.CBasePlayer.GiveAmmo(pPlayer, 3, "rpg_round")
  _R.CBasePlayer.GiveAmmo(pPlayer, 3, "slam")

  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "9mmRound")
  _R.CBasePlayer.GiveAmmo(pPlayer, 32, "357Round")
  _R.CBasePlayer.GiveAmmo(pPlayer, 10, "MP5_Grenade")
  _R.CBasePlayer.GiveAmmo(pPlayer, 3, "RPG_Rocket")
  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "Uranium")
  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "Hornet")
  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "Snark")
  _R.CBasePlayer.GiveAmmo(pPlayer, 3, "TripMine")
  _R.CBasePlayer.GiveAmmo(pPlayer, 3, "Satchel")
  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "12mmRound")
  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "BuckshotHL1")
  _R.CBasePlayer.GiveAmmo(pPlayer, 255, "XBowBoltHL1")
  _R.CBasePlayer.GiveAmmo(pPlayer, 5, "GrenadeHL1")

  _R.CBasePlayer.GiveAmmo(pPlayer, 30, "Medkit")

  pPlayer:GiveNamedItem("weapon_crowbar")
  --pPlayer:GiveNamedItem( "weapon_stunstick" )
  pPlayer:GiveNamedItem("weapon_pistol")
  pPlayer:GiveNamedItem("weapon_357")
  pPlayer:GiveNamedItem("weapon_smg1")
  pPlayer:GiveNamedItem("weapon_ar2")
  pPlayer:GiveNamedItem("weapon_shotgun")
  pPlayer:GiveNamedItem("weapon_frag")
  pPlayer:GiveNamedItem("weapon_crossbow")
  pPlayer:GiveNamedItem("weapon_rpg")
  --pPlayer:GiveNamedItem( "weapon_slam" )
  pPlayer:GiveNamedItem("weapon_physcannon")
  --pPlayer:GiveNamedItem( "weapon_bugbait" )
  pPlayer:GiveNamedItem("weapon_toolgun")
  pPlayer:GiveNamedItem("weapon_physgun")

  -- uhh im a shitty coder yes
  local pWeapon = pPlayer:Weapon_OwnsThisType("weapon_physgun")
  if pWeapon then
    pPlayer:Weapon_Switch(pWeapon, 0)
  end
end

function GM:LevelInit(strMapName, strMapEntities, strOldLevel, strLandmarkName, loadGame, background)
  gpGlobals.mapname = strMapName
end

function GM:ItemShouldRespawn(pItem)
  pItem:AddSpawnFlags(2 ^ 30)
  -- return 6
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

function GM:PlayerPickupObject(pHL2MPPlayer, pObject, bLimitMassAndSize) end
