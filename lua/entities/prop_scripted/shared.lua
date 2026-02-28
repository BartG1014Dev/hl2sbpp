--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

DEFINE_BASECLASS("prop_scripted")
DEFINE_FACTORY("CBaseAnimating")

function ENT:Initialize() end

function ENT:StartTouch(pOther) end

function ENT:Touch(pOther) end

function ENT:EndTouch(pOther) end

function ENT:VPhysicsUpdate(pPhysics) end
