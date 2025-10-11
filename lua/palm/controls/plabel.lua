-- plabel.lua

---@class PLabel:Button
---@field Init fun(self:PLabel, parent:Panel?, panelName:string, text:string, actionSignalTarget:Panel, cmd:string)
local PLabel = {
    base = "Button",

    Init = function(self, parent, text, actionSignalTarget, cmd)
		actionSignalTarget = self
		cmd = ""

        self:SetParent(parent)

		self:SetPaintBackgroundEnabled(false)
		self:SetMouseInputEnabled(false)
		self:SetKeyBoardInputEnabled(false)
		self:SetFgColor(Color(255,255,255,255))
		self:SetContentAlignment(Alignment.a_west)
		self:SetPaintBorderEnabled(false) -- no border, it's ugly
    end,

	Activate = function(self)
	end,
}

CONTROLS.Add("PLabel", PLabel)
