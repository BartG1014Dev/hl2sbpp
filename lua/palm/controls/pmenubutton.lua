--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PMenuButton:PPanel
---@field Init fun(self:PMenuButton, parent:Panel?, panelName:string, text:string, actionTarget:Panel?, command:string)
local PMenuButton = {
  base = "MenuButton",

  Init = function(self, parent, panelName, text, actionTarget, command)
    if not panelName then
      panelName = "MenuButton"
    end
    if not text then
      text = ""
    end

    self:SetParent(parent)
    self:SetText(text)
  end,
}

CONTROLS.Add("PMenuButton", PMenuButton)
