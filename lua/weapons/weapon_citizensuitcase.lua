--========== Copyright (C) 2025, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose: 
--
--===========================================================================--

SWEP.PrintName 				= "#HL2_SMG1"
SWEP.ViewModel 				= "models/weapons/c_arms_animations.mdl"
SWEP.WorldModel 			= "models/weapons/w_suitcase_passenger.mdl"
SWEP.AnimPrefix 			= "smg2"
SWEP.Slot 					= 2
SWEP.SlotPos				= 0

SWEP.Primary = 
{
	ClipSize = -1,
	DefaultClip = -1,
	Automatic = true,
	Ammo = "None",
}

SWEP.Secondary = 
{
	ClipSize = -1,
	DefaultClip = -1,
	Automatic = true,
	Ammo = "None",
}

SWEP.Weight					= 0
SWEP.ItemFlags				= 0

SWEP.DrawCrosshair = true
SWEP.DrawAmmo = false

SWEP.SoundData				=
{
}

SWEP.m_acttable				=
{
	{ ACT.IDLE,						ACT.GESTURE_RANGE_ATTACK_SMG1,					false },
	{ ACT.WALK,						ACT.GESTURE_RANGE_ATTACK_SMG1_LOW,				false },
};

-------------------------------------------------------------------------------
-- Purpose: Remove the citizen package if it's ever dropped
-------------------------------------------------------------------------------
function SWEP:Drop( vecVelocity )
	self:Drop( vecVelocity );
	if not _CLIENT then
		UTIL.Remove( self );
	end
end
