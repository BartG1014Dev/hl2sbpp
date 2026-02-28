--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

TOOL.Name = "Color"
TOOL.Description = "Changes the color of entities."
TOOL.Colors = {
  Color(255, 0, 0), -- red
  Color(0, 255, 0), -- green
  Color(0, 0, 255), -- blue
  Color(255, 255, 0), -- yellow
  Color(255, 0, 255), -- magenta
  Color(0, 255, 255), -- cyan
  Color(255, 255, 255), -- white
}
TOOL.ColorIndex = TOOL.ColorIndex or {}

local function IsValidEntity(ent)
  return ent and ent ~= NULL and not ent:IsPlayer()
end

function TOOL:PrimaryAttack(swep, player, trace)
  local ent = trace.m_pEnt
  if not IsValidEntity(ent) then
    return
  end

  local entIndex = ent:entindex()
  local idx = (self.ColorIndex[entIndex] or 0) + 1
  if idx > #self.Colors then
    idx = 1
  end
  self.ColorIndex[entIndex] = idx

  local col = self.Colors[idx]
  ent:SetRenderColor(col:r(), col:g(), col:b())

  print(string.format("Set %s to color #%d (%d %d %d)", tostring(ent), idx, col:r(), col:g(), col:b()))
end

function TOOL:SecondaryAttack(swep, player, trace)
  -- TODO:
end
