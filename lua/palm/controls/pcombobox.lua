--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PComboBox:PPanel
---@field Init fun(self:PComboBox, parent:Panel?, panelName:string, height:number, allowEdit:boolean)
local PComboBox = {
  base = "ComboBox",

  Init = function(self, parent, panelName, height, allowEdit)
    if not panelName then
      panelName = "ComboBox"
    end
    if not height then
      height = 5
    end
    if allowEdit == nil then
      allowEdit = false
    end

    self:SetParent(parent)
  end,
}

CONTROLS.Add("PComboBox", PComboBox)
