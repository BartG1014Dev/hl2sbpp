-- @CopyrightAss

SWEP.printname				= "FISTS"
SWEP.viewmodel				= "models/weapons/c_arms.mdl"
SWEP.playermodel			= ""
SWEP.anim_prefix			= "fist"
SWEP.bucket					= 5
SWEP.bucket_position		= 1

SWEP.clip_size				= -1
SWEP.clip2_size				= -1
SWEP.default_clip			= -1
SWEP.default_clip2			= -1
SWEP.primary_ammo			= "None"
SWEP.secondary_ammo			= "None"

SWEP.weight					= 10
SWEP.item_flags				= 0

SWEP.damage					= 42

SWEP.SoundData				=
{
	reload	=		"Default.Reload"
}


SWEP.showusagehint			= false
SWEP.autoswitchto			= true
SWEP.autoswitchfrom			= true
SWEP.BuiltRightHanded		= true
SWEP.AllowFlipping			= true
SWEP.MeleeWeapon			= true
SWEP.UseHands				= true

SWEP.DrawCrosshair = true
SWEP.DrawAmmo = false

SWEP.m_acttable            =
{
	{ ACT.MP_STAND_IDLE,				ACT.HL2MP_IDLE_FISTS,					false },
	{ ACT.MP_CROUCH_IDLE,				ACT.HL2MP_IDLE_CROUCH_FISTS,			false },
	{ ACT.MP_RUN,						ACT.HL2MP_RUN_FISTS,					false },
	{ ACT.MP_CROUCHWALK,				ACT.HL2MP_WALK_CROUCH_FISTS,			false },
	{ ACT.MP_ATTACK_STAND_PRIMARYFIRE,	ACT.HL2MP_GESTURE_RANGE_ATTACK_FISTS,	false },
	{ ACT.MP_ATTACK_CROUCH_PRIMARYFIRE,	ACT.HL2MP_GESTURE_RANGE_ATTACK_FISTS,	false },
	{ ACT.MP_RELOAD_STAND,				ACT.HL2MP_GESTURE_RELOAD_FISTS,		false },
	{ ACT.MP_RELOAD_CROUCH,				ACT.HL2MP_GESTURE_RELOAD_FISTS,		false },
	{ ACT.MP_JUMP,						ACT.HL2MP_JUMP_FISTS,					false },
	{ ACT.MP_SWIM,						ACT.HL2MP_SWIM_FISTS,					false },
	{ ACT.MP_SWIM_IDLE,					ACT.HL2MP_SWIM_IDLE_FISTS,					false },
};

function SWEP:Initialize()
	self.m_bReloadsSingly	= false;
	self.m_bFiresUnderwater	= true;
end

function SWEP:Precache()
	self.PrecacheScriptSound( "Flesh.ImpactHard" );
	self.PrecacheScriptSound( "WeaponFrag.Throw" );
end

function SWEP:PrimaryAttack()
    local pPlayer = self:GetOwner()
	if ( ToBaseEntity( pPlayer ) == NULL ) then
		return;
	end

	local vForward 		= Vector()
	local vRight 		= Vector()
	local vUp  			= Vector()
	local angle 		= QAngle()
	local vecEye 		= pPlayer:EyePosition();
	pPlayer:EyeVectors( vForward, vRight, vUp );

    local fRange = 48

    local startPos = pPlayer:Weapon_ShootPosition()
    local endPos = startPos + pPlayer:GetAutoaimVector( AUTOAIM_5DEGREES ) * fRange

	tr = trace_t()
	MASK_SHOT = _E.MASK.SHOT
    UTIL.TraceLine(startPos, endPos, MASK_SHOT, pPlayer, 0, tr)
	
    local bDidHit = tr:DidHit()
    local hitEnt = tr.m_pEnt
    
	local anim = "fists_left"
	local vm = pPlayer:GetViewModel( 0 )
	vm:SetSequence( vm:LookupSequence( anim ) )
	vm:ResetSequenceInfo()
	vm:SetCycle( 0 )
	vm:StudioFrameAdvance()

    self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.8
    self.m_flNextSecondaryAttack = self.m_flNextPrimaryAttack

	if bDidHit then
		if hitEnt then
			self:EmitSound("Flesh.ImpactHard")
		end

		local vecSrc		= pPlayer:Weapon_ShootPosition();
		local vecAiming		= pPlayer:GetAutoaimVector( AUTOAIM_5DEGREES );

		local info = { m_iShots = 1, m_vecSrc = vecSrc, m_vecDirShooting = vecAiming, m_vecSpread = vec3_origin, m_flDistance = MAX_TRACE_LENGTH, m_iAmmoType = 1 };
		info.m_pAttacker = pPlayer;

		-- Fire the bullets, and force the first shot to be perfectly accuracy
		ToHL2MPPlayer( pPlayer ):FireBullets( info );

		--Disorient the player
		local angles = pPlayer:GetLocalAngles();

		angles.x = angles.x + random.RandomInt( 0 );
		angles.y = angles.y + random.RandomInt( 0 );
		angles.z = 0;

if not _CLIENT then
		pPlayer:SnapEyeAngles( angles );
end
	else
		self:EmitSound("WeaponFrag.Throw")
	end

    pPlayer:ViewPunch(QAngle(-2, math.random(-1,1), 0))

    self.NextIdle = self.m_flNextPrimaryAttack - gpGlobals.curtime()
end


function SWEP:SecondaryAttack()
    local pPlayer = self:GetOwner()
	if ( ToBaseEntity( pPlayer ) == NULL ) then
		return;
	end

	local vForward 		= Vector()
	local vRight 		= Vector()
	local vUp  			= Vector()
	local angle 		= QAngle()
	local vecEye 		= pPlayer:EyePosition();
	pPlayer:EyeVectors( vForward, vRight, vUp );

    local fRange = 48

    local startPos = pPlayer:Weapon_ShootPosition()
    local endPos = startPos + pPlayer:GetAutoaimVector( AUTOAIM_5DEGREES ) * fRange

	tr = trace_t()
	MASK_SHOT = _E.MASK.SHOT
    UTIL.TraceLine(startPos, endPos, MASK_SHOT, pPlayer, 0, tr)
	
    local bDidHit = tr:DidHit()
    local hitEnt = tr.m_pEnt

	local anim = "fists_right"
	local vm = pPlayer:GetViewModel( 0 )
	vm:SetSequence( vm:LookupSequence( anim ) )
	vm:ResetSequenceInfo()
	vm:SetCycle( 0 )
	vm:StudioFrameAdvance()

    self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.8
    self.m_flNextSecondaryAttack = self.m_flNextPrimaryAttack

	if bDidHit then
		if hitEnt then
			self:EmitSound("Flesh.ImpactHard")
		end

		local vecSrc		= pPlayer:Weapon_ShootPosition();
		local vecAiming		= pPlayer:GetAutoaimVector( AUTOAIM_5DEGREES );

		local info = { m_iShots = 1, m_vecSrc = vecSrc, m_vecDirShooting = vecAiming, m_vecSpread = vec3_origin, m_flDistance = MAX_TRACE_LENGTH, m_iAmmoType = 1 };
		info.m_pAttacker = pPlayer;

		-- Fire the bullets, and force the first shot to be perfectly accuracy
		ToHL2MPPlayer( pPlayer ):FireBullets( info );

		--Disorient the player
		local angles = pPlayer:GetLocalAngles();

		angles.x = angles.x + random.RandomInt( 0 );
		angles.y = angles.y + random.RandomInt( 0 );
		angles.z = 0;

if not _CLIENT then
		pPlayer:SnapEyeAngles( angles );
end
	else
		self:EmitSound("WeaponFrag.Throw")
	end

    pPlayer:ViewPunch(QAngle(-2, math.random(-1,1), 0))

    self.NextIdle = self.m_flNextPrimaryAttack - gpGlobals.curtime()
end

function SWEP:Reload()
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
    self.NextIdle = gpGlobals.curtime()
end

function SWEP:GetDrawActivity()
	return ACT.VM_DRAW;
end

function SWEP:Holster( pSwitchingTo )
end

function SWEP:ItemPostFrame()
    local pPlayer = ToHL2MPPlayer( self:GetOwner() )
    if not IsValid(pPlayer) then return end

    local vm = pPlayer:GetViewModel(0)
    if not IsValid(vm) then return end

    local curtime = gpGlobals.curtime()

    if curtime >= self.m_flNextPrimaryAttack then
        self.NextIdle = self.NextIdle or 0
        local idleInterval = 3

        if curtime > self.NextIdle then
            local anim = "fists_idle_0" .. math.random(1, 2)
            vm:SetSequence(vm:LookupSequence(anim))
            vm:ResetSequenceInfo()
            vm:SetCycle(0)
            vm:StudioFrameAdvance()

            self.NextIdle = curtime + idleInterval
        end
    end
end

function SWEP:ItemBusyFrame()
end

function SWEP:DoImpactEffect()
end

