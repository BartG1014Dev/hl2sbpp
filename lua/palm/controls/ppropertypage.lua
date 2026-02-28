--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PPropertyPage:PropertyPage
---@field Init fun(self:PPropertyPage, parent:Panel?, panelName:string)
local PPropertyPage = {
  base = "PropertyPage",

  Init = function(self, parent)
    self:SetParent(parent)
  end,

  Activate = function(self) end,
}

CONTROLS.Add("PPropertyPage", PPropertyPage)
