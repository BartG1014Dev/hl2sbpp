--======== Copyright (C) 2025-2025, Team HL2SB++, All rights reserved. ========--
--
-- Purpose:
--
--===========================================================================--

DEFINE_BASECLASS( "vehicle_scripted" )
DEFINE_FACTORY( "CPropVehicleDriveable" )

-- You need a 4-wheel model, you can't use non-physics vehicle models like the airboat!
ENT.ModelName = "models/buggy.mdl"
ENT.VehicleScript = "scripts/vehicles/jeep_test.txt"

function ENT:SetupMove( pDriver, pMoveHelper )
	local obj = self:VPhysicsGetObject()
	if IsValid(obj) then
		local vel = Vector(0, 0, 100)
		obj:SetVelocity(vel, vel)
	end
end
