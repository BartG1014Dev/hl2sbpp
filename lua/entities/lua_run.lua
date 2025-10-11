--========== Copyright (C) 2025, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

function ENT:Initialize() end

function ENT:StartTouch(pEntity) end

function ENT:Touch(pEntity) end

function ENT:EndTouch(pEntity) end

function ENT:VPhysicsUpdate(pPhysics) end

function ENT:RunCode(activator, caller, code)
  local f = loadstring(code)
  if f then
    f()
  end
end

function ENT:AcceptInput(name, activator, caller, value, id)
  if (name == "RunCode") and (type(value) == "string") then
    self:RunCode(activator, caller, value)
    return true
  end

  if (name == "RunPassedCode") and (type(value) == "string") then
    self:RunCode(activator, caller, value)
    return true
  end

  return false
end
