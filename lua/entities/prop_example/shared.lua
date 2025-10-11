--========== Copyright (C) 2025, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

local Warning = dbg.Warning
local Msg = dbg.Msg

function ENT:Initialize()
	if ( not _CLIENT ) then
		local allowPrecache = self.IsPrecacheAllowed();
		self.SetAllowPrecache( true );
		self.PrecacheModel( "models/props_junk/wood_crate001a.mdl" );
		self:SetModel( "models/props_junk/wood_crate001a.mdl" )
		self.SetAllowPrecache( allowPrecache );
		local pPhysicsObject = self:VPhysicsInitNormal( 6, 0, false );

		-- add red glow effect
		self:SetGlowEffectColor(255, 0, 0)
		self:AddGlowEffect()

		if ( not pPhysicsObject ) then
			self:SetSolid( SolidType.NONE );
			self:SetMoveType( MoveType.NONE );
			Warning("ERROR!: Can't create physics object for " .. self:GetModelName() .. "\n" );
		end
	end
end

function ENT:StartTouch( pEntity )
end

function ENT:Touch( pEntity )
end

function ENT:EndTouch( pEntity )
end

function ENT:VPhysicsUpdate( pPhysics )
end
