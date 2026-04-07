--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PRadioButton:PPanel
---@field Init fun(self:PRadioButton, parent:Panel?, panelName:string, text:string)
local PRadioButton = {
  base = "RadioButton",

  Init = function(self, parent, panelName, text)
    if not panelName then
      panelName = "RadioButton"
    end
    if not text then
      text = ""
    end

    self:SetParent(parent)
    self:SetText(text)
  end,
}

CONTROLS.Add("PRadioButton", PRadioButton)
