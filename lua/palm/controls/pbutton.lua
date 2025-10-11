-- pbutton.lua

local function DrawGradient(w,h)
	surface.DrawSetColor(255, 255, 255, 255)
	surface.DrawSetTextureFile(696769, "gui/gradient_down", 0, true)
	surface.DrawTexturedRect(0, 0, w, h)
end

---@class PButton:Frame
---@field Init fun(self:PButton, parent:Panel?, text:string, actionSignalTarget:Panel, cmd:string)
local PButton = {
    base = "Button",

    Init = function(self, parent, text, actionSignalTarget, cmd)
        self:SetParent(parent)

		PaintBackground = function()
			DrawGradient(self:GetWide(), self:GetTall())
		end
    end,

	Activate = function(self)
	end,
}

CONTROLS.Add("PButton", PButton)
