include( "acttable.lua" )

SWEP.PrintName				= "BaseWeapon"
SWEP.ViewModel				= "models/weapons/v_pistol.mdl"
SWEP.WorldModel				= "models/weapons/w_pistol.mdl"
SWEP.anim_prefix			= "python"
SWEP.Slot					= 1
SWEP.SlotPos				= 1
SWEP.ViewModelFOV 			= 100

SWEP.clip_size				= 999
SWEP.clip2_size				= -1
SWEP.default_clip			= 999
SWEP.default_clip2			= -1
SWEP.primary_ammo			= "None"
SWEP.secondary_ammo			= "None"

SWEP.weight					= 7
SWEP.item_flags				= 0

SWEP.damage					= 0

SWEP.SoundData				=
{
	empty					= "Weapon_Pistol.Empty",
	single_shot				= "Weapon_357.Single"
}

SWEP.showusagehint			= 0
SWEP.autoswitchto			= 1
SWEP.autoswitchfrom			= 1
SWEP.BuiltRightHanded		= 1
SWEP.AllowFlipping			= 1
SWEP.MeleeWeapon			= 0

SWEP.DrawCrosshair = true
SWEP.DrawAmmo = false

SWEP.m_acttable            =
{
	{ ACT.HL2MP_IDLE,					ACT.HL2MP_IDLE_PISTOL,					false },
	{ ACT.HL2MP_RUN,					ACT.HL2MP_RUN_PISTOL,					false },
	{ ACT.HL2MP_IDLE_CROUCH,			ACT.HL2MP_IDLE_CROUCH_PISTOL,			false },
	{ ACT.HL2MP_WALK_CROUCH,			ACT.HL2MP_WALK_CROUCH_PISTOL,			false },
	{ ACT.HL2MP_GESTURE_RANGE_ATTACK,	ACT.HL2MP_GESTURE_RANGE_ATTACK_PISTOL,	false },
	{ ACT.HL2MP_GESTURE_RELOAD,			ACT.HL2MP_GESTURE_RELOAD_PISTOL,		false },
	{ ACT.HL2MP_JUMP,					ACT.HL2MP_JUMP_PISTOL,					false },
	{ ACT.RANGE_ATTACK1,				ACT.RANGE_ATTACK_PISTOL,				false },
};

function SWEP:Initialize()
	self.m_bReloadsSingly	= false;
	self.m_bFiresUnderwater	= false;
	modelName = "models/props_junk/watermelon01.mdl"
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

	--self:SendWeaponAnim( 180 );
	pPlayer:SetAnimation( 5 );
	ToHL2MPPlayer(pPlayer):DoAnimationEvent( 0 );


	self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.10;
	self.m_flNextSecondaryAttack = gpGlobals.curtime() + 0.75;

	local eye = pPlayer:EyeAngles()
	local shootpos = pPlayer:EyePosition()
	
	local forward, right, up = pPlayer:GetVectors()
	
	local ent = CreateEntityByName("prop_physics_multiplayer")
	if ent ~= NULL then
		ent.PrecacheModel( modelName ) -- @ThePixelMoon: fucker
		ent:SetAbsOrigin( shootpos + forward * 32 )
		ent:SetAbsAngles( eye )
		ent:SetOwnerEntity( pPlayer )
		ent:SetModel( modelName )
		ent:Spawn()
		ent:Activate()
		
		ent:SetAbsVelocity(forward * 2000)
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

	local vForward 		= Vector()
	local vRight 		= Vector()
	local vUp  			= Vector()
	local angle 		= QAngle()
	local vecEye 		= pPlayer:EyePosition();
	pPlayer:EyeVectors( vForward, vRight, vUp );

	tr = trace_t()
	MASK_SHOT = _E.MASK.SHOT
	UTIL.TraceLine( vecEye, vecEye + vForward * 56755, MASK_SHOT, this, 0, tr );
	
	local entity = tr.m_pEnt
	
	if ( entity ~= NULL ) then
		modelName = entity:GetModelName()
		if ( entity:VPhysicsGetObject() or entity:IsNPC() ) then
			if ( entity:IsPlayer() ) then return; end
			local ENTITY_DISSOLVE_ELECTRICAL_LIGHT = 2
			local dissolve = effect.Dissolve( entity, modelName, gpGlobals.curtime(), ENTITY_DISSOLVE_ELECTRICAL_LIGHT, false )
			UTIL.Remove( dissolve )
		end
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

