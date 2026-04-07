--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PMenu:PPanel
---@field Init fun(self:PMenu, parent:Panel?, panelName:string)
local PMenu = {
  base = "Menu",

  Init = function(self, parent, panelName)
    if not panelName then
      panelName = "Menu"
    end

    self:SetParent(parent)
  end,
}

CONTROLS.Add("PMenu", PMenu)
