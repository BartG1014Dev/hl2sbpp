--========== Copyleft � 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

GM.Name			= "Sandbox"
GM.Homepage		= ""
GM.Developer	= "Team HL2SB++"
GM.Manual		= nil

function GM:Initialize()
if ( not _CLIENT ) then
  engine.ServerCommand( "mp_falldamage 0\n" )
  engine.ServerCommand( "mp_flashlight 1\n" )
  engine.ServerCommand( "sv_infinite_aux_power 1\n" ) -- @ThePixelMoon: why isn't this on by default?
else
  -- Andrew; not the right place to put this, but oh well.
  self:CreateDefaultPanels()
end
end

function GM:FlWeaponRespawnTime( pWeapon )
  return -1
end

function GM:FlWeaponTryRespawn( pWeapon )
  return 0
end

function GM:WeaponShouldRespawn( pItem )
  pItem:AddSpawnFlags( 2^30 )
  -- return 2
end
