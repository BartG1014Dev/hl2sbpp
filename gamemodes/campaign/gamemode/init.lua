--========== Copyleft � 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

includeC( "shared.lua" )

function GM:AddLevelDesignerPlacedObject( pEntity )
  return false
end

function GM:GiveDefaultItems( pHL2MPPlayer )
end

function GM:ItemShouldRespawn( pItem )
  pItem:AddSpawnFlags( 2^30 )
  -- return 6
end

function GM:DebugEntityNames()
  local pEntity = gEntList.FirstEnt()
  while ( pEntity ~= NULL ) do
    if ( pEntity:GetEntityName() ~= "" ) then
      print( tostring( pEntity ) .. " (" .. pEntity:GetEntityName() .. ")" )
    end
    pEntity = gEntList.NextEnt( pEntity )
  end
end

local HL2toHL1 = {
    models = {
        ["models/barney.mdl"] = "models/barney_hl1.mdl",
        ["models/barnacle.mdl"] = "models/barnacle_hl1.mdl",
		["models/headcrab.mdl"] = "models/headcrab_hl1.mdl",
		["models/gman.mdl"] = "models/gman_hl1.mdl",
    },
    weapons = {
        ["weapon_crowbar"] = "weapon_crowbar_hl1",
        ["weapon_glock"] = "weapon_glock_hl1",
        ["weapon_357"] = "weapon_357_hl1",
        ["weapon_egon"] = "weapon_egon_hl1",
		["weapon_gauss"] = "weapon_gauss_hl1",
		["weapon_mp5"] = "weapon_mp5_hl1",
		["weapon_crossbow"] = "weapon_crossbow_hl1",
		["weapon_rpg"] = "weapon_rpg_hl1",
		["weapon_satchel"] = "weapon_satchel_hl1",
		["weapon_shotgun"] = "weapon_shotgun_hl1",
		["weapon_snark"] = "weapon_snark_hl1",
		["weapon_tripmine"] = "weapon_tripmine_hl1",
		["weapon_handgrenade"] = "weapon_handgrenade_hl1",
		["weapon_hornetgun"] = "weapon_hornetgun_hl1",
    }
}

function GM:FixHL1()
    local mapName = string.lower(gpGlobals.mapname)

    if string.sub(mapName, 1, 1) == "t0" or string.sub(mapName, 1, 1) == "c0"
	  or string.sub(mapName, 1, 1) == "c1" or string.sub(mapName, 1, 1) == "c2"
	  or string.sub(mapName, 1, 1) == "c3" or string.sub(mapName, 1, 1) == "4" then
		engine.ServerCommand("mov_2004 1\n")

        local pEntity = gEntList.FirstEnt()
        while pEntity ~= NULL do
            local mdl = pEntity:GetModelName()
            if mdl and HL2toHL1.models[mdl] then
				pEntity.PrecacheModel(HL2toHL1.models[mdl])
                pEntity:SetModel(HL2toHL1.models[mdl])
            end

            local class = pEntity:GetClassname()
            if class and HL2toHL1.weapons[class] then
                local hl1Weapon = CreateEntityByName(HL2toHL1.weapons[class])
                if IsValid(hl1Weapon) then
                    hl1Weapon:SetAbsOrigin(pEntity:GetAbsOrigin())
                    hl1Weapon:SetAbsAngles(pEntity:GetAbsAngles())
                    hl1Weapon:Spawn()
                    pEntity:Remove()
                end
            end
			
            pEntity = gEntList.NextEnt(pEntity)
        end
    else
		engine.ServerCommand("mov_2004 0\n")
	end
end

function GM:PlayerDeathThink( pPlayer )
	ToHL2MPPlayer(pPlayer).IsDead = true
end

function GM:RemoveFallTriggers()
  local pEntity = gEntList.FindEntityByName( NULL, "fall_trigger" )
  local tTriggers = {}
  while ( pEntity ~= NULL ) do
    table.insert( tTriggers, pEntity )
    pEntity = gEntList.FindEntityByClassname( pEntity, "fall_trigger" )
  end

  for i, pTrigger in ipairs( tTriggers ) do
    pTrigger:Remove()
  end
end

function GM:LevelInit( strMapName, strMapEntities, strOldLevel, strLandmarkName, loadGame, background )
  gpGlobals.mapname = strMapName

  -- self:DebugEntityNames()
  self:FixHL1()
  self:RemoveFallTriggers()

  -- Sometimes an ent will Remove() itself during its precache, so RemoveImmediate won't happen.
  -- This makes sure those ents get cleaned up.
  gEntList.CleanupDeleteList();
end

GM.m_tPickups = {}

function GM:CheckPickups()
  local pEntity = gEntList.FindEntityByName( NULL, "player_spawn_items" )
  local tEntities = {}
  while ( pEntity ~= NULL ) do
    table.insert( self.m_tPickups, pEntity:GetClassname() )
    table.insert( tEntities, pEntity )
    pEntity = gEntList.FindEntityByName( pEntity, "player_spawn_items" )
  end

  for i, pEntity in ipairs( tEntities ) do
    pEntity:Remove()
  end
end

function GM:PlayerGotItem( pPlayer, pItem )
  pItem:Remove()
end

function GM:PlayerInitialSpawn( pPlayer )
  self:CheckPickups()
end

local g_bFirstPlayerSpawned = false

function GM:PlayerThink( pPlayer )
  if not ToHL2MPPlayer(pPlayer).IsDead then
	ToHL2MPPlayer(pPlayer).IsDead = false
  else
	if ToHL2MPPlayer(pPlayer).IsDead == true then
		ToHL2MPPlayer(pPlayer):SetSolid(SolidType.NONE)
		ToHL2MPPlayer(pPlayer):AddFlag(32768) -- FL_GODMODE
		ToHL2MPPlayer(pPlayer):AddFlag(65536) -- FL_NOTARGET
		ToHL2MPPlayer(pPlayer):AddEffects(32) -- EF_NODRAW
		ToHL2MPPlayer(pPlayer):SetMoveType(MoveType.NOCLIP, 0)
		ToHL2MPPlayer(pPlayer):SetRenderColor(0, 0, 0, 0) -- invisible lmao
		return false
	end
  end
end

function GM:PlayerSpawn( pPlayer )
  for _, classname in ipairs( self.m_tPickups ) do
    local pEntity = CreateEntityByName( classname )
    pEntity:SetAbsOrigin( pPlayer:GetAbsOrigin() )
    pEntity:Spawn()
    pEntity:Touch( pPlayer )
  end

  if ( not g_bFirstPlayerSpawned ) then
    g_bFirstPlayerSpawned = true
    return false
  end

  local pEntity = gEntList.FindEntityByName( NULL, "global_newgame_template*" )
  local tEntities = {}
  while ( pEntity ~= NULL ) do
    pEntity:AcceptInput( "ForceSpawn", pPlayer, pPlayer, 0 )
    pEntity = gEntList.FindEntityByName( pEntity, "global_newgame_template*" )
  end
  return false
end

function GM:PlayerPickupObject( pHL2MPPlayer, pObject, bLimitMassAndSize )
	if pHL2MPPlayer.IsDead == true then return false end
end
