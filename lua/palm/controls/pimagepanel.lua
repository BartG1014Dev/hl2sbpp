--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PImagePanel:PPanel
---@field Init fun(self:PImagePanel, parent:Panel?, panelName:string)
local PImagePanel = {
  base = "ImagePanel",

  Init = function(self, parent, panelName)
    if not panelName then
      panelName = "ImagePanel"
    end

    self:SetParent(parent)

    self:SetPaintBackgroundEnabled(false)
    self:SetPaintBorderEnabled(false)
    self:SetMouseInputEnabled(false)
  end,
}

CONTROLS.Add("PImagePanel", PImagePanel)
