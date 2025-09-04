--========== Copyleft � 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose: Initialize the base scripted weapon.
--
--===========================================================================--

SWEP.printname				= "TOOLGUN"
SWEP.viewmodel				= "models/weapons/v_pistol.mdl"
SWEP.playermodel			= "models/weapons/w_pistol.mdl"
SWEP.anim_prefix			= "smg2"
SWEP.bucket					= 2
SWEP.bucket_position		= 2

SWEP.clip_size				= -1
SWEP.clip2_size				= -1
SWEP.default_clip			= -1
SWEP.default_clip2			= -1
SWEP.primary_ammo			= "Pistol"
SWEP.secondary_ammo			= "None"

SWEP.weight					= 7
SWEP.item_flags				= 0

SWEP.damage					= 0

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
SWEP.MeleeWeapon			= false
SWEP.UseHands				= true

SWEP.DrawCrosshair = true
SWEP.DrawAmmo = false

SWEP.m_acttable            =
{
	{ ACT.MP_STAND_IDLE,				ACT.HL2MP_IDLE_PISTOL,					false },
	{ ACT.MP_CROUCH_IDLE,				ACT.HL2MP_IDLE_CROUCH_PISTOL,			false },
	{ ACT.MP_RUN,						ACT.HL2MP_RUN_PISTOL,					false },
	{ ACT.MP_CROUCHWALK,				ACT.HL2MP_WALK_CROUCH_PISTOL,			false },
	{ ACT.MP_ATTACK_STAND_PRIMARYFIRE,	ACT.HL2MP_GESTURE_RANGE_ATTACK_PISTOL,	false },
	{ ACT.MP_ATTACK_CROUCH_PRIMARYFIRE,	ACT.HL2MP_GESTURE_RANGE_ATTACK_PISTOL,	false },
	{ ACT.MP_RELOAD_STAND,				ACT.HL2MP_GESTURE_RELOAD_PISTOL,		false },
	{ ACT.MP_RELOAD_CROUCH,				ACT.HL2MP_GESTURE_RELOAD_PISTOL,		false },
};

function SWEP:Initialize()
	self.m_bReloadsSingly	= false;
	self.m_bFiresUnderwater	= true;
	self.ToolMode = 1;

	if _CLIENT then
		TOOLGUN_LabelFont = surface.CreateFont()
		-- name, size, weight, blur, scanlines, flags, range min/max
		surface.SetFontGlyphSet(TOOLGUN_LabelFont, "Trebuchet MS", 18, 700, 0, 0, 0)
	end
end

function SWEP:Precache()
end

function SWEP:PrimaryAttack()
	local pPlayer = self:GetOwner()

	self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.25;
	
	self:SendWeaponAnim( 180 );
	pPlayer:SetAnimation( 5 );
	ToHL2MPPlayer(pPlayer):DoAnimationEvent( 0 );

	local vForward 		= Vector()
	local vRight 		= Vector()
	local vUp  			= Vector()
	local vecEye 		= pPlayer:EyePosition();
	pPlayer:EyeVectors( vForward, vRight, vUp );
	
	local tr = trace_t()
	MASK_SHOT = _E.MASK.SHOT
	UTIL.TraceLine( vecEye, vecEye + vForward * 56755, MASK_SHOT, pPlayer, 0, tr );

	local pEntity = tr.m_pEnt;
	if pEntity == NULL then
		print("not an ent")
		return false
	end

	local pBaseAnimating = pEntity:GetBaseAnimating()
	if pBaseAnimating == NULL then
		print("not an baseanimating")
	end

	if self.ToolMode == 1 then
		if pBaseAnimating:IsPlayer() then
			print("Erm..No.")
			return false
		end

		pBaseAnimating:Dissolve()
	elseif self.ToolMode == 2 then
	elseif self.ToolMode == 3 then
	else
		print("how")
		return false
	end

end

function SWEP:SecondaryAttack()
	self.ToolMode = self.ToolMode + 1;
	if self.ToolMode == 3 then
		self.ToolMode = 1
	end

	print("current mode: " .. self.ToolMode)

	self.m_flNextSecondaryAttack = gpGlobals.curtime() + 0.5;
end

function SWEP:Reload()
	return true;
end

function SWEP:Think()
	if _CLIENT then
		local ply = self:GetOwner()

		local text = "Sex!"

		local padding = 10
		local padbox = 6
		local font = TOOLGUN_LabelFont

		-- get text size via your wrapper (returns wide,tall)
		local tw, th = surface.GetTextSize(font, text)

		local w, h = surface.GetScreenSize()
		local x = w - tw - padding
		local y = padding

		surface.DrawSetColor(0, 0, 0, 255)
		surface.DrawFilledRect(x - padbox, y - padbox, tw + padbox * 2, th + padbox * 2)
	end
end

function SWEP:CanHolster()
end

function SWEP:Deploy()
end

function SWEP:GetDrawActivity()
	return 171;
end

function SWEP:Holster( pSwitchingTo )
end

function SWEP:ItemPostFrame()
end

function SWEP:ItemBusyFrame()
end

function SWEP:DoImpactEffect()
end
