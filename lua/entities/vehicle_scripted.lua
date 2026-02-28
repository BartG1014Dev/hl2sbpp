--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

DEFINE_BASECLASS("vehicle_scripted")
DEFINE_FACTORY("CPropVehicleDriveable")

-- You need a 4-wheel model, you can't use non-physics vehicle models like the airboat!
ENT.ModelName = "models/buggy.mdl"
ENT.VehicleScript = "scripts/vehicles/jeep_test.txt"

function ENT:Initialize() end

function ENT:SetupMove(pDriver, pMoveHelper, pMoveData) end

function ENT:Think() end

function ENT:ProcessMovement(pPlayer, pMoveData) end

function ENT:FinishMove(pPlayer, pMoveData) end

function ENT:ExitVehicle(nRole) end
