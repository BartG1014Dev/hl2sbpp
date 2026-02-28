--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

local Warning = dbg.Warning
local Msg = dbg.Msg

local physObj
local PI = 3.14159265359

function ENT:Initialize()
  if not _CLIENT then
    local allowPrecache = self.IsPrecacheAllowed()
    self.SetAllowPrecache(true)
    self.PrecacheModel("models/props_junk/watermelon01.mdl")
    self:SetModel("models/props_junk/watermelon01.mdl")
    self.SetAllowPrecache(allowPrecache)
    physObj = self:VPhysicsInitNormal(6, 0, false)
    if not physObj then
      self:SetSolid(SolidType.NONE)
      self:SetMoveType(MoveType.NONE)
      Warning("ERROR!: Can't create physics object for " .. self:GetModelName() .. "\n")
    end

    -- ballooonnzzzz
    physObj:SetMass(100)
    physObj:Wake()
    physObj:EnableGravity(false)

    -- get keyvalue color
    local r = self:GetKeyValue("red") or 255
    local g = self:GetKeyValue("green") or 0
    local b = self:GetKeyValue("blue") or 0

    -- coloring
    self:SetRenderColor(r, g, b, 255)
  end
end

function ENT:StartTouch(pEntity) end

function ENT:Touch(pEntity) end

function ENT:EndTouch(pEntity) end

function ENT:VPhysicsUpdate(pPhysics)
  physObj:SetVelocity(Vector(0, 0, physObj:GetMass() * PI), Vector(0, 0, 0))
end
