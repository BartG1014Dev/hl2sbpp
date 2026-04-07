--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PSlider:PPanel
---@field Init fun(self:PSlider, parent:Panel?, panelName:string)
local PSlider = {
  base = "Slider",

  Init = function(self, parent, panelName)
    if not panelName then
      panelName = "Slider"
    end

    self:SetParent(parent)

    self:SetRange(0, 100)
    self:SetValue(50)
  end,
}

CONTROLS.Add("PSlider", PSlider)
