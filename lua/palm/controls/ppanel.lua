-- ppanel.lua

---@class PPanel:Frame
---@field Init fun(self:PPanel, parent:Panel?, panelName:string)
local PPanel = {
    base = "Frame",

    Init = function(self, parent)
        self:SetParent(parent)
    end,

	Activate = function(self)
	end,
}

CONTROLS.Add("PPanel", PPanel)
