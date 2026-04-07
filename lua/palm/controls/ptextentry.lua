--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class PTextEntry:PPanel
---@field Init fun(self:PTextEntry, parent:Panel?, panelName:string, text:string)
local PTextEntry = {
  base = "TextEntry",

  Init = function(self, parent, panelName, text)
    if not panelName then
      panelName = "TextEntry"
    end
    if not text then
      text = ""
    end

    self:SetParent(parent)
    self:SetText(text)

    self:SetPaintBackgroundEnabled(true)
    self:SetPaintBorderEnabled(true)
    self:SetMouseInputEnabled(true)
    self:SetKeyBoardInputEnabled(true)
  end,
}

CONTROLS.Add("PTextEntry", PTextEntry)
