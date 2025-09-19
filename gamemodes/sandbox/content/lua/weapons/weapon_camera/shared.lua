--========== Copyleft � 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose: Initialize the base scripted weapon.
--
--===========================================================================--

SWEP.printname				= "CAMERA"
SWEP.viewmodel				= "models/weapons/c_arms_animations.mdl"
SWEP.playermodel			= ""
SWEP.anim_prefix			= "fists"
SWEP.bucket					= 5
SWEP.bucket_position		= 1

SWEP.clip_size				= -1
SWEP.clip2_size				= -1
SWEP.default_clip			= -1
SWEP.default_clip2			= -1
SWEP.primary_ammo			= "ar2" -- bypassing the scheme!1!
SWEP.secondary_ammo			= "None"

SWEP.DrawCrosshair = false
SWEP.DrawAmmo = false

SWEP.weight					= 7
SWEP.item_flags				= 0

SWEP.damage					= 75

SWEP.SoundData				=
{
	empty					= "",
	single_shot				= ""
}

SWEP.ShowUsageHint			= false
SWEP.AutoSwitchTo			= true
SWEP.AutoSwitchFrom			= true
SWEP.BuiltRightHanded		= true
SWEP.AllowFlipping			= true
SWEP.MeleeWeapon			= true
SWEP.UseHands				= true

SWEP.m_acttable            =
{
	{ ACT.MP_STAND_IDLE,				ACT.HL2MP_IDLE_CAMERA,					false },
	{ ACT.MP_CROUCH_IDLE,				ACT.HL2MP_IDLE_CROUCH_CAMERA,			false },
	{ ACT.MP_RUN,						ACT.HL2MP_RUN_CAMERA,					false },
	{ ACT.MP_CROUCHWALK,				ACT.HL2MP_WALK_CROUCH_CAMERA,			false },
	{ ACT.MP_ATTACK_STAND_PRIMARYFIRE,	ACT.HL2MP_GESTURE_RANGE_ATTACK_CAMERA,	false },
	{ ACT.MP_ATTACK_CROUCH_PRIMARYFIRE,	ACT.HL2MP_GESTURE_RANGE_ATTACK_CAMERA,	false },
	{ ACT.MP_RELOAD_STAND,				ACT.HL2MP_GESTURE_RELOAD_CAMERA,		false },
	{ ACT.MP_RELOAD_CROUCH,				ACT.HL2MP_GESTURE_RELOAD_CAMERA,		false },
	{ ACT.MP_JUMP,						ACT.HL2MP_JUMP_CAMERA,					false },
	{ ACT.MP_SWIM,						ACT.HL2MP_SWIM_CAMERA,					false },
	{ ACT.MP_SWIM_IDLE,					ACT.HL2MP_SWIM_IDLE_CAMERA,					false },
};

function SWEP:Initialize()
	self.m_bReloadsSingly	= false;
	self.m_bFiresUnderwater	= true;

	self.FOVSteps = {25, 50, 75, 100, 125}
	self.CurrentFOVIndex = 1
end

function SWEP:Precache()
end

function SWEP:PrimaryAttack()
	local pPlayer = self:GetOwner()
end

function SWEP:SecondaryAttack()
    local ply = self:GetOwner()
    if not ply then return false end

    self.CurrentFOVIndex = self.CurrentFOVIndex + 1
    if self.CurrentFOVIndex > #self.FOVSteps then
        self.CurrentFOVIndex = 1
    end

    local newFOV = self.FOVSteps[self.CurrentFOVIndex]

    ply:SetFOV(ply, newFOV, 0.15, 0)

	self.m_flNextSecondaryAttack = gpGlobals.curtime() + 0.2;
end

function SWEP:Reload()
	return true;
end

function SWEP:Think()
end

function SWEP:CanHolster()
end

function SWEP:Deploy()
	if _CLIENT then
		engine.ClientCmd_Unrestricted("cl_drawhud 0\n")
	else
		-- TODO: will this change other players too?
		engine.ServerCommand("cl_drawhud 0\n")
	end
end

function SWEP:GetDrawActivity()
	return ACT.VM_DRAW;
end

function SWEP:Holster( pSwitchingTo )
	if _CLIENT then
		engine.ClientCmd_Unrestricted("cl_drawhud 1\n")
	else
		-- TODO: will this change other players too?
		engine.ServerCommand("cl_drawhud 1\n")
	end
end

function SWEP:ItemPostFrame()
end

function SWEP:ItemBusyFrame()
end

function SWEP:DoImpactEffect()
end
