--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

TOOL.Name = "Resizer"
TOOL.Description = "Changes the size of entities."

TOOL.Scales = {
  0.25,
  0.5,
  0.75,
  1.0,
  1.5,
  2.0,
  3.0,
}

TOOL.ScaleIndex = TOOL.ScaleIndex or {}

local function IsValidEntity(ent)
  return ent and ent ~= NULL and not ent:IsPlayer()
end

function TOOL:PrimaryAttack(swep, player, trace)
  local ent = trace.m_pEnt
  if not IsValidEntity(ent) then
    return
  end

  local entIndex = ent:entindex()
  local idx = (self.ScaleIndex[entIndex] or 0) + 1
  if idx > #self.Scales then
    idx = 1
  end
  self.ScaleIndex[entIndex] = idx

  local scale = self.Scales[idx]

  ent:KeyValue("scale", tostring(scale))
end

function TOOL:SecondaryAttack(swep, player, trace)
  local ent = trace.m_pEnt
  if not IsValidEntity(ent) then
    return
  end

  self.ScaleIndex[ent:entindex()] = 4

  ent:KeyValue("scale", "1.0")
end
