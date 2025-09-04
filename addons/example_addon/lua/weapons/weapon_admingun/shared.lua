SWEP.printname				= "AdminGun"
SWEP.viewmodel				= "models/weapons/v_pist_weagon.mdl"
SWEP.playermodel			= "models/weapons/w_pist_weagon.mdl"
SWEP.anim_prefix			= "python"
SWEP.bucket					= 1
SWEP.bucket_position		= 1

SWEP.clip_size				= 999999
SWEP.clip2_size				= -1
SWEP.default_clip			= 999999
SWEP.default_clip2			= -1
SWEP.primary_ammo			= "SMG1"
SWEP.secondary_ammo			= "None"

SWEP.weight					= 10
SWEP.item_flags				= 0

SWEP.damage					= 999999

SWEP.SoundData				=
{
	empty					= "Weapon_Pistol.Empty",
	single_shot				= "weapons/automag/deagle-1.wav"
}

SWEP.showusagehint			= false
SWEP.autoswitchto			= true
SWEP.autoswitchfrom			= true
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
	self.m_bFiresUnderwater	= false;
	self.modelName = "grenade_ar2"
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
			self:WeaponSound( 0 );
			self.m_flNextPrimaryAttack = 0.15;
		end

		return;
	end

	self:WeaponSound( 1 );
	pPlayer:DoMuzzleFlash();

	self:SendWeaponAnim( 180 );
	pPlayer:SetAnimation( 5 );
	ToHL2MPPlayer(pPlayer):DoAnimationEvent( 0 );

	self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.01;
	self.m_flNextSecondaryAttack = gpGlobals.curtime() + 0.01;

	self.m_iClip1 = self.m_iClip1 - 1;

	local vecSrc		= pPlayer:Weapon_ShootPosition();
	local vecAiming		= pPlayer:GetAutoaimVector( 0.08715574274766 );

	local info = { m_iShots = 1, m_vecSrc = vecSrc, m_vecDirShooting = vecAiming, m_vecSpread = vec3_origin, m_flDistance = MAX_TRACE_LENGTH, m_iAmmoType = self.m_iPrimaryAmmoType };
	info.m_pAttacker = pPlayer;

	-- Fire the bullets, and force the first shot to be perfectly accuracy
	pPlayer:FireBullets( info );

	--Disorient the player
	local angles = pPlayer:GetLocalAngles();

	angles.x = angles.x + random.RandomInt( 0 );
	angles.y = angles.y + random.RandomInt( 0 );
	angles.z = 0;

if not _CLIENT then
	pPlayer:SnapEyeAngles( angles );
end

	pPlayer:ViewPunch( QAngle( -0, random.RandomFloat( -0, 0 ), 0 ) );

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

	local vForward 		= Vector()
	local vRight 		= Vector()
	local vUp  			= Vector()
	local angle 		= QAngle()
	local vecEye 		= pPlayer:EyePosition();
	pPlayer:EyeVectors( vForward, vRight, vUp );

	tr = trace_t()
	MASK_SHOT = _E.MASK.SHOT
	UTIL.TraceLine( vecEye, vecEye + vForward * 567556, MASK_SHOT, this, 15, tr );
	
  	local grenade = CreateEntityByName( self.modelName )
	if grenade ~= NULL then
		grenade.PrecacheModel( self.modelName )
		grenade:SetModel( self.modelName )
		grenade:SetLocalOrigin( tr.endpos )
		grenade:SetAbsAngles( angle )
		grenade:Spawn()
	end

	if ( self.m_iClip1 == 0 and pPlayer:GetAmmoCount( self.m_iPrimaryAmmoType ) <= 0 ) then
		-- HEV suit - indicate out of ammo condition
		pPlayer:SetSuitUpdate( "!HEV_AMO0", 0, 0 );
	end
end

function SWEP:Reload()
end

function SWEP:Think()
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

