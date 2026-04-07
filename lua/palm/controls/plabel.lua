--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PLabel:PPanel
---@field Init fun(self:PLabel, parent:Panel?, panelName:string, text:string)
local PLabel = {
  base = "Label",

  Init = function(self, parent, text)
    self:SetParent(parent)
    self:SetText(text or "")
    self:SizeToContents()
    self:SetVisible(true)
  end,
}

CONTROLS.Add("PLabel", PLabel)
