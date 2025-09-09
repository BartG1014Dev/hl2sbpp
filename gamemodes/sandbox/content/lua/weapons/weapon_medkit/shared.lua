--========== Copyleft � 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose: Initialize the base scripted weapon.
--
--===========================================================================--

SWEP.printname				= "MEDKIT"
SWEP.viewmodel				= "models/weapons/c_medkit.mdl"
SWEP.playermodel			= "models/weapons/w_medkit.mdl"
SWEP.anim_prefix			= "anim"
SWEP.bucket					= 5
SWEP.bucket_position		= 3

SWEP.clip_size				= 30
SWEP.clip2_size				= -1
SWEP.default_clip			= 30
SWEP.default_clip2			= -1
SWEP.primary_ammo			= "ar2"
SWEP.secondary_ammo			= "None"

SWEP.weight					= 7
SWEP.item_flags				= 0

SWEP.damage					= 75

SWEP.SoundData				=
{
	empty					= "",
	single_shot				= "HealthKit.Touch"
}

SWEP.DrawCrosshair = true
SWEP.DrawAmmo = true
SWEP.UseHands = true

SWEP.ShowUsageHint			= false
SWEP.AutoSwitchTo			= true
SWEP.AutoSwitchFrom			= true
SWEP.BuiltRightHanded		= true
SWEP.AllowFlipping			= true
SWEP.MeleeWeapon			= false

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
	{ ACT.MP_JUMP,						ACT.HL2MP_JUMP_PISTOL,					false },
};

function SWEP:Initialize()
	self.m_bReloadsSingly	= false;
	self.m_bFiresUnderwater	= true;
end

function SWEP:Precache()
end

function SWEP:PrimaryAttack()
	local pPlayer = self:GetOwner();
	
	if ( ToBaseEntity( pPlayer ) == NULL ) then
		return;
	end

	local vForward 		= Vector()
	local vRight 		= Vector()
	local vUp  			= Vector()
	local vecEye 		= pPlayer:EyePosition();
	pPlayer:EyeVectors( vForward, vRight, vUp );
	
	local tr = trace_t()
	MASK_SHOT = _E.MASK.SHOT
	UTIL.TraceLine( vecEye, vecEye + vForward * 56755, MASK_SHOT, pPlayer, 0, tr );

	local ent = tr.m_pEnt
	if not ent:IsPlayer() then return false end

	if ent:GetHealth() >= 100 then
		print("100 hp")
		return
	end

	if ( self.m_iClip1 <= 0 ) then
		if ( not self.m_bFireOnEmpty ) then
			self:Reload();
		else
			self:WeaponSound( WeaponSound.EMPTY );
			self.m_flNextPrimaryAttack = 0.15;
		end

		return;
	end

	self:WeaponSound( WeaponSound.SINGLE );

	self:SendWeaponAnim( ACT.VM_PRIMARYATTACK );
	 
	ToHL2MPPlayer(pPlayer):DoAnimationEvent( PlayerAnimEvent.ATTACK_PRIMARY );

	self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.25;

	self.m_iClip1 = self.m_iClip1 - 1;

	ent:SetHealth(ent:GetHealth() + 5)
	
	-- fallback
	if ent:GetHealth() >= 100 then
		ent:SetHealth(100)
	end

	if ( self.m_iClip1 == 0 and pPlayer:GetAmmoCount( self.m_iPrimaryAmmoType ) <= 0 ) then
		-- HEV suit - indicate out of ammo condition
		pPlayer:SetSuitUpdate( "!HEV_AMO0", 0, 0 );
	end
end

function SWEP:SecondaryAttack()
	local pPlayer = self:GetOwner();

	if ( ToBaseEntity( pPlayer ) == NULL ) then
		return;
	end

	if pPlayer:GetHealth() >= 100 then
		print("100 hp")
		return
	end

	if ( self.m_iClip1 <= 0 ) then
		if ( not self.m_bFireOnEmpty ) then
			self:Reload();
		else
			self:WeaponSound( WeaponSound.EMPTY );
			self.m_flNextSecondaryAttack = 0.15;
		end

		return;
	end

	self:WeaponSound( WeaponSound.SINGLE );

	self:SendWeaponAnim( ACT.VM_PRIMARYATTACK );
	 
	ToHL2MPPlayer(pPlayer):DoAnimationEvent( PlayerAnimEvent.ATTACK_PRIMARY );

	self.m_flNextSecondaryAttack = gpGlobals.curtime() + 0.25;

	self.m_iClip1 = self.m_iClip1 - 1;

	pPlayer:SetHealth(pPlayer:GetHealth() + 5)
	
	-- fallback
	if pPlayer:GetHealth() >= 100 then
		pPlayer:SetHealth(100)
	end

	if ( self.m_iClip1 == 0 and pPlayer:GetAmmoCount( self.m_iPrimaryAmmoType ) <= 0 ) then
		-- HEV suit - indicate out of ammo condition
		pPlayer:SetSuitUpdate( "!HEV_AMO0", 0, 0 );
	end
end

function SWEP:Reload()
	local fRet = self:DefaultReload( self:GetMaxClip1(), self:GetMaxClip2(), 182 );
	if ( fRet ) then
--		self:WeaponSound( 6 );
		ToHL2MPPlayer(self:GetOwner()):DoAnimationEvent( 3 );
	end
	return fRet;
end

function SWEP:Think()
end

function SWEP:CanHolster()
end

function SWEP:Deploy()
end

function SWEP:GetDrawActivity()
	return ACT.VM_DRAW;
end

function SWEP:Holster( pSwitchingTo )
end

function SWEP:ItemPostFrame()
end

function SWEP:ItemBusyFrame()
end

function SWEP:DoImpactEffect()
end
