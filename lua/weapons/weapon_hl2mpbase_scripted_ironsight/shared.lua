--========== Copyleft � 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose: Initialize the base scripted weapon.
--
--===========================================================================--

SWEP.printname				= "#HL2_357Handgun"
SWEP.viewmodel				= "models/weapons/c_357.mdl"
SWEP.playermodel			= "models/weapons/w_357.mdl"
SWEP.anim_prefix			= "python"
SWEP.bucket					= 1
SWEP.bucket_position		= 1

SWEP.clip_size				= 6
SWEP.clip2_size				= -1
SWEP.default_clip			= 6
SWEP.default_clip2			= -1
SWEP.primary_ammo			= "357"
SWEP.secondary_ammo			= "None"

SWEP.DrawCrosshair = true
SWEP.DrawAmmo = true

SWEP.weight					= 7
SWEP.item_flags				= 0

SWEP.damage					= 75

SWEP.SoundData				=
{
	empty					= "Weapon_Pistol.Empty",
	single_shot				= "Weapon_357.Single"
}

SWEP.showusagehint			= false
SWEP.autoswitchto			= true
SWEP.autoswitchfrom			= true
SWEP.BuiltRightHanded		= true
SWEP.AllowFlipping			= true
SWEP.MeleeWeapon			= false
SWEP.UseHands				= true

SWEP.IronsightPosOffset = Vector(
	-10, 		-- forward
	-4.65, 		-- right
	0.75 		-- up
)
SWEP.IronsightAngOffset = QAngle( 0, 0, 0 )
SWEP.IronsightFOVOffset = -12
SWEP.CanUseIronsight = true

SWEP.m_acttable            =
{
	{ ACT.MP_STAND_IDLE,				ACT.HL2MP_IDLE_REVOLVER,					false },
	{ ACT.MP_CROUCH_IDLE,				ACT.HL2MP_IDLE_CROUCH_REVOLVER,			false },
	{ ACT.MP_RUN,						ACT.HL2MP_RUN_REVOLVER,					false },
	{ ACT.MP_CROUCHWALK,				ACT.HL2MP_WALK_CROUCH_REVOLVER,			false },
	{ ACT.MP_ATTACK_STAND_PRIMARYFIRE,	ACT.HL2MP_GESTURE_RANGE_ATTACK_REVOLVER,	false },
	{ ACT.MP_ATTACK_CROUCH_PRIMARYFIRE,	ACT.HL2MP_GESTURE_RANGE_ATTACK_REVOLVER,	false },
	{ ACT.MP_RELOAD_STAND,				ACT.HL2MP_GESTURE_RELOAD_REVOLVER,		false },
	{ ACT.MP_RELOAD_CROUCH,				ACT.HL2MP_GESTURE_RELOAD_REVOLVER,		false },
	{ ACT.MP_JUMP,						ACT.HL2MP_JUMP_REVOLVER,					false },
	{ ACT.MP_SWIM,						ACT.HL2MP_SWIM_REVOLVER,					false },
	{ ACT.MP_SWIM_IDLE,					ACT.HL2MP_SWIM_IDLE_REVOLVER,					false },
};

function SWEP:Initialize()
	self.m_bReloadsSingly	= false;
	self.m_bFiresUnderwater	= false;
end

function SWEP:Precache()
end

function SWEP:PrimaryAttack()
	-- Only the player fires this way so we can cast
	local pPlayer = self:GetOwner();

	if ( ToBaseEntity( pPlayer ) == NULL ) then
		return;
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
	pPlayer:DoMuzzleFlash();

	self:SendWeaponAnim( ACT.VM_PRIMARYATTACK );
	 
	ToHL2MPPlayer(pPlayer):DoAnimationEvent( PlayerAnimEvent.ATTACK_PRIMARY );

	self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.75;
	self.m_flNextSecondaryAttack = gpGlobals.curtime() + 0.75;

	self.m_iClip1 = self.m_iClip1 - 1;

	local vecSrc		= pPlayer:Weapon_ShootPosition();
	local vecAiming		= pPlayer:GetAutoaimVector( AUTOAIM_5DEGREES );

	local info = { m_iShots = 1, m_vecSrc = vecSrc, m_vecDirShooting = vecAiming, m_vecSpread = vec3_origin, m_flDistance = MAX_TRACE_LENGTH, m_iAmmoType = self.m_iPrimaryAmmoType };
	info.m_pAttacker = pPlayer;

	-- Fire the bullets, and force the first shot to be perfectly accuracy
	ToHL2MPPlayer( pPlayer ):FireBullets( info );

	--Disorient the player
	local angles = pPlayer:GetLocalAngles();

	angles.x = angles.x + random.RandomInt( -1, 1 );
	angles.y = angles.y + random.RandomInt( -1, 1 );
	angles.z = 0;

if not _CLIENT then
	pPlayer:SnapEyeAngles( angles );
end

	pPlayer:ViewPunch( QAngle( -8, random.RandomFloat( -2, 2 ), 0 ) );

	if ( self.m_iClip1 == 0 and pPlayer:GetAmmoCount( self.m_iPrimaryAmmoType ) <= 0 ) then
		-- HEV suit - indicate out of ammo condition
		pPlayer:SetSuitUpdate( "!HEV_AMO0", 0, 0 );
	end
end

function SWEP:HasIronsights()
	return self.CanUseIronsight;
end

function SWEP:SecondaryAttack()
	self:ToggleIronsights();

	self.m_flNextSecondaryAttack = gpGlobals.curtime() + 0.6;
end

function SWEP:Reload()
	if ( self:IsIronsighted() ) then
		-- quite a hacky hack but it should work
		self:ToggleIronsights();
	end

	local fRet = self:DefaultReload( self:GetMaxClip1(), self:GetMaxClip2(), 182 );
	if ( fRet ) then
--		self:WeaponSound( 6 );
		ToHL2MPPlayer(self:GetOwner()):DoAnimationEvent( PlayerAnimEvent.RELOAD );
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
