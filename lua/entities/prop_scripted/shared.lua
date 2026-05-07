--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

DEFINE_BASECLASS("prop_scripted")
DEFINE_FACTORY("CBaseAnimating")

function ENT:Initialize() end

---@param pOther CBaseEntity
function ENT:StartTouch(pOther) end

---@param pOther CBaseEntity
function ENT:Touch(pOther) end

---@param pOther CBaseEntity
function ENT:EndTouch(pOther) end

---@param pPhysics IPhysicsObject
function ENT:VPhysicsUpdate(pPhysics) end
