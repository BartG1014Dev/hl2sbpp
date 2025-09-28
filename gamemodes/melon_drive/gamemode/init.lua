--========== Copyleft � 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

includeC( "shared.lua" )

local tSpawnPointClassnames = {
  "info_player_deathmatch",
  "info_player_combine",
  "info_player_rebel",
  "info_player_terrorist",
  "info_player_counterterrorist",
  "info_player_axis",
  "info_player_allies",
  "info_player_start"
}

function GM:AddLevelDesignerPlacedObject( pEntity )
	return false
end

function GM:AllowDamage( pVictim, info )
end

function GM:CanEnterVehicle( pPlayer, pVehicle, nRole )
end

function GM:CanHavePlayerItem( pPlayer, pItem )
  if ( cvar.FindVar( "mp_weaponstay" ):GetInt() > 0 ) then
    if ( pPlayer:Weapon_OwnsThisType( pItem:GetClassname(), pItem:GetSubType() ) ) then
	  return false;
	end
  end
end

function GM:CanPlayerHearPlayer( pListener, pTalker, bProximity )
end

function GM:CheatImpulseCommands( pPlayer, iImpulse )
end

function GM:CheckChatForReadySignal( pPlayer, chatmsg )
end

function GM:CleanUpMap()
end

function GM:ClientConnected( pEntity, pszName, pszAddress, reject, maxrejectlen )
end

function GM:ClientDisconnected( pClient )
end

function GM:FlItemRespawnTime( pItem )
  return cvar.FindVar( "sv_hl2mp_item_respawn_time" ):GetFloat();
end

function GM:FlPlayerFallDamage( pPlayer )
end

function GM:FlPlayerSpawnTime( pPlayer )
end

function GM:FPlayerCanRespawn( pPlayer )
end

function GM:FPlayerCanTakeDamage( pPlayer, pAttacker )
end

function GM:FShouldSwitchWeapon( pPlayer, pWeapon )
end

function GM:GetPlayerHandModel(player, handStr, soundType)
end

function GM:GiveDefaultItems( pPlayer )
	--pPlayer:EquipSuit();
end

function GM:Host_Say( pPlayer, p, teamonly )
end

function GM:InitHUD( pPlayer )
end

function GM:ItemShouldRespawn( pItem )
	return false
end

function GM:LevelInit( strMapName, strMapEntities, strOldLevel, strLandmarkName, loadGame, background )
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

function GM:NetworkIDValidated( strUserName, strNetworkID )
end

function GM:PlayerCanHearChat( pListener, pSpeaker )
end

function GM:PlayerCanPickupObject( pObject, massLimit, sizeLimit )
end

function GM:PlayerDeathSound( info )
end

function GM:PlayerDeathThink( pPlayer )
end

function GM:PlayerEntSelectSpawnPoint( pHL2MPPlayer )
  local tSpawnPoints = {}
  local pSpot = NULL
  for _, classname in ipairs( tSpawnPointClassnames ) do
    pSpot = gEntList.FindEntityByClassname( NULL, classname )
    while ( pSpot ~= NULL ) do
      table.insert( tSpawnPoints, pSpot )
      pSpot = gEntList.FindEntityByClassname( pSpot, classname )
    end
  end
  return tSpawnPoints[ math.random( 1, #tSpawnPoints ) ]
end

function GM:PlayerGotItem( pPlayer, pItem )
end

function GM:PlayerInitialSpawn( pPlayer )
end

function GM:PlayerPickupObject( pHL2MPPlayer, pObject, bLimitMassAndSize )
	return false
end

function GM:PlayerSpawn( pPlayer )
	local ent = self:PlayerEntSelectSpawnPoint( ToHL2MPPlayer( pPlayer ) )

	if ent then
		pPlayer.CurrentKartPos = ent:GetAbsOrigin()
		pPlayer:SnapEyeAngles( ent:GetAbsAngles() )
	else
		pPlayer.CurrentKartPos = Vector(0,0,0)
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

function GM:PlayerThink( pPlayer )
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
	local yaw   = math.rad(ang.y)

	local forward = Vector(
		math.cos(pitch) * math.cos(yaw),
		math.cos(pitch) * math.sin(yaw),
		-math.sin(pitch)
	)

	local speed = 10
	pPlayer.kart:VPhysicsGetObject():AddVelocity(
		forward * speed, forward * speed
	)

	ToHL2MPPlayer(pPlayer):AddFlag(32768) -- FL_GODMODE
	ToHL2MPPlayer(pPlayer):AddFlag(65536) -- FL_NOTARGET
	ToHL2MPPlayer(pPlayer):AddEffects(32) -- EF_NODRAW
	pPlayer:RemoveFlag(8) 				  -- FL_DUCKING

	pPlayer:SetMoveType( MoveType.NOCLIP )
	pPlayer:SetLocalOrigin( pPlayer.CurrentKartPos - Vector(0,0,70) )
	pPlayer:SetFOV(pPlayer, 100, 0, 0)
end

function GM:RemoveLevelDesignerPlacedObject( pEntity )
end

function GM:RestartGame()
end

function GM:ServerActivate( edictCount, clientMax )
end

function GM:ShouldHideServer()
end

function GM:VecItemRespawnSpot( pItem )
end

function GM:VecItemRespawnAngles( pItem )
end

function GM:WeaponShouldRespawn( pWeapon )
end

function GM:Weapon_Equip( pPlayer, pWeapon )
	pPlayer:StripWeapons()
end
