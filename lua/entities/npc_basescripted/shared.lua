--======== Copyright (C) 2025-2025, Team HL2SB++, All rights reserved. ========--
--
-- Purpose:
--
--===========================================================================--

DEFINE_BASECLASS( "prop_scripted" )
DEFINE_FACTORY( "CBaseAnimating" )

ENT.isEnemy = true
ENT.Weapon = nil

ENT.FootstepIntervalBase = 0.45
ENT.NextFootstepTime = 0
ENT.FootstepLeft = true

function ENT:Initialize()
	if ( not _CLIENT ) then
		local allowPrecache = self.IsPrecacheAllowed();
		self.SetAllowPrecache( true );

		-- no random for now
		self.PrecacheModel( "models/player/group03/male_07.mdl" );
		self:SetModel( "models/player/group03/male_07.mdl" );

		self.SetAllowPrecache( allowPrecache );

		local pPhysicsObject = self:VPhysicsInitNormal( 6, 0, false );
		if ( not pPhysicsObject ) then
			self:SetSolid( SolidType.NONE );
			self:SetMoveType( MoveType.NONE );
			Warning("ERROR!: Can't create physics object for " .. self:GetModelName() .. "\n" );
		else
			pPhysicsObject:Wake();
		end
	end

	self:SetHealth( 100 );
	self:UseClientSideAnimation();

    self:SetMoveType( MoveType.STEP );
    self:SetSolid( SolidType.BBOX );
	self:SetCollisionBounds(Vector(-16,-16,0), Vector(16,16,72))

	self:ClearFlags()
	self:AddFlag( 768 ) -- FL_CLIENT | FL_FAKECLIENT

	self.IsFiring = false
	self.FollowPlayer = true -- DoMove must be true for this!
	self.DebugAnim = false
	self.DoMove = true

	--self:GiveWeapon("weapon_smg1")
end

function ENT:TakeDamage(dmginfo)
    local dmg = dmginfo:GetDamage()

	if SERVER then
    	self:SetHealth((self:GetHealth() or 100) - dmg)

		if self:GetHealth() <= 0 then
			self:DeathThink()
		end
	end
end

function ENT:GiveWeapon(classname)
    if not SERVER then return end

    if self.Weapon and self.Weapon ~= NULL then
        self.Weapon:Remove()
    end

    local weapon = CreateEntityByName(classname)
    if weapon == NULL then return end

    local converted = weapon:ToBaseCombatWeapon()
    if converted == NULL then
        Warning("Failed to convert entity "..classname.." to CBaseCombatWeapon\n")
        weapon:Remove()
        return
    end

    converted:SetAbsOrigin(self:GetAbsOrigin() + Vector(0,0,40))
    converted:Spawn()
    converted:Activate()

    local handBone = self:LookupBone("ValveBiped.Bip01_R_Hand")
    if handBone then
        converted:SetParent(self, handBone)
        converted:AddEffects( 1 ) -- EF_BONEMERGE
    end

    converted:SetOwnerEntity(self)
    if converted.Deploy then converted:Deploy() end
    if converted.SendWeaponAnim then converted:SendWeaponAnim(converted:GetPrimaryAttackActivity()) end

    self.Weapon = converted
    print("GiveWeapon: weapon ready:", self.Weapon, "clip1:", self.Weapon:Clip1())
end

function ENT:StartTouch( pOther )
end

function ENT:Touch( pOther )
end

function ENT:EndTouch( pOther )
end

function ENT:VPhysicsUpdate( pPhysics )
end
