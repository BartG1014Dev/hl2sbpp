--========== Copyleft � 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose: 
--
--===========================================================================--

SWEP.PrintName 				= "#HL2_SMG1"
SWEP.ViewModel 				= "models/weapons/w_package.mdl"
SWEP.WorldModel 			= "models/weapons/w_package.mdl"
SWEP.AnimPrefix 			= "smg2"
SWEP.Slot 					= 2
SWEP.SlotPos				= 0

SWEP.Primary = 
{
	ClipSize = -1,
	DefaultClip = -1,
	Automatic = false,
	Ammo = "None",
}

SWEP.Secondary = 
{
	ClipSize = -1,
	DefaultClip = -1,
	Automatic = false,
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
-- Purpose: 
-------------------------------------------------------------------------------
function SWEP:ItemPostFrame()
	-- Do nothing
end

-------------------------------------------------------------------------------
-- Purpose: Remove the citizen package if it's ever dropped
-------------------------------------------------------------------------------
function SWEP:Drop( vecVelocity )
	self:Drop( vecVelocity );
if not _CLIENT then
	UTIL.Remove( self );
end
end


