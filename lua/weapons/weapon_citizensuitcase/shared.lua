--========== Copyleft � 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose: 
--
--===========================================================================--

DEFINE_BASECLASS( "weapon_citizenpackage" )

SWEP.PrintName				= "#HL2_SMG1"
SWEP.ViewModel 				= "models/weapons/w_suitcase_passenger.mdl"
SWEP.WorldModel 			= "models/weapons/w_suitcase_passenger.mdl"
SWEP.AnimPrefix				= "smg2"
SWEP.Slot					= 2
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
	{ ACT.IDLE,						ACT.GESTURE_RANGE_ATTACK_SMG2,					false },
	{ ACT.WALK,						ACT.GESTURE_RANGE_ATTACK_SHOTGUN,					false },
};
