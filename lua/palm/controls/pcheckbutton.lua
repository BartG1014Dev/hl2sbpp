--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PCheckButton:CheckButton
---@field Init fun(self:PCheckButton, parent:Panel?, panelName:string, text:string)
local PCheckButton = {
  base = "CheckButton",

  Init = function(self, parent, text)
    self:SetParent(parent)
  end,

  Activate = function(self) end,
}

CONTROLS.Add("PCheckButton", PCheckButton)
