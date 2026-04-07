--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PLabel:PPanel
---@field Init fun(self:PLabel, parent:Panel?, panelName:string, text:string)
local PLabel = {
  base = "Label",

  Init = function(self, parent, panelName, text)
    if not panelName then
      panelName = "Label"
    end
    if not text then
      text = ""
    end

    self:SetParent(parent)
    self:SetText(text)
  end,
}

CONTROLS.Add("PLabel", PLabel)
