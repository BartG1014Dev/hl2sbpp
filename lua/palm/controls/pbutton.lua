-- pbutton.lua

---@class PButton:Frame
---@field Init fun(self:PButton, parent:Panel?, text:string, actionSignalTarget:Panel, cmd:string)
local PButton = {
  base = "Button",

  Init = function(self, parent, text, actionSignalTarget, cmd)
    self:SetParent(parent)
  end,

  Activate = function(self) end,
}

CONTROLS.Add("PButton", PButton)
