--========== Copyright (C) 2025, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

-- FIXME: this file is made just to shut up the console and fix the skybox
function ENT:Initialize()
	if ( not _CLIENT ) then
		local allowPrecache = self.IsPrecacheAllowed();
		self.SetAllowPrecache( true );
		self.SetAllowPrecache( allowPrecache );
		
		local skyname = cvar.FindVar("sv_skyname")
		skyname:SetValue("painted") -- haha
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
