-- pframe.lua
---@param dlg self:PPanel
local function PositionDialog(dlg)
    if not IsValid(dlg) then
        return
    end
    
    local w, h = surface.GetScreenSize()
    if not w or not h or w == 0 or h == 0 then return end
    
    -- double check
    if not IsValid(dlg) then
        return
    end
    
    local pw, ph = dlg:GetSize()
    if not pw or not ph then return end
    
    dlg:SetPos((w - pw) / 2, (h - ph) / 2)
end

---@class PFrame:PPanel
---@field Init fun(self:PFrame, parent:Panel?, panelName:string, width?:number, height?:number)
local PFrame = {
    base = "PPanel",

    Init = function(self, parent, panelName, w, h)
        if not panelName then panelName = "Window" end
		if not w then w = 200 end
		if not h then h = 200 end

        self:SetParent(parent)

       	self:SetPaintBackgroundEnabled(true)
		self:SetPaintBorderEnabled(true)

		self:SetCloseButtonVisible(false)
        self:SetSizeable(true)
		self:SetTitleBarVisible(true)
		self:SetMoveable(true)

		self:SetCloseButtonVisible(false)
		self:SetMinimizeButtonVisible(false)
		self:SetMaximizeButtonVisible(false)

		self:SetSizeable(false) -- we didn't specify that we can't size; don't allow it for displaying purposes

		self:Activate()

		self.IsPopupV = false

		self.closeButton = vgui.Create("PButton", self, "X", self, "Close")
		self.closeButton:SetVisible(true)
		self.closeButton:SetPos(0,0)
		self.closeButton:SetSize(20, 20)
		self.closeButton:AddActionSignalTarget( self )
		self.closeButton:SetEnabled(false)

		self.minifyButton = vgui.Create("PButton", self, "_", self, "Minimize")
		self.minifyButton:SetVisible(true)
		self.minifyButton:SetPos(0,0)
		self.minifyButton:SetSize(20, 20)
		self.minifyButton:AddActionSignalTarget( self )
		self.minifyButton:SetEnabled(false)

		self.maximizeButton = vgui.Create("PButton", self, "■", self, "Maximize")
		self.maximizeButton:SetVisible(true)
		self.maximizeButton:SetPos(0,0)
		self.maximizeButton:SetSize(20, 20)
		self.maximizeButton:AddActionSignalTarget( self )
		self.maximizeButton:SetEnabled(false)

		self.Center = function(self)
			PositionDialog(self)
			self:Activate() -- hacky hacky!!
		end

		self.Paint = function()
			surface.DrawSetColor(255, 255, 255, 30);
        	surface.DrawFilledRect(0, 0, self:GetWide(), 30);
		end

		-- move it here so we wouldn't be able to fuck everything up
		self.PaintBackground = function()
			local padding = 5
			local buttonWidth, buttonHeight = self.closeButton:GetSize()
			local panelWidth = self:GetWide()

			self.closeButton:SetPos(panelWidth - buttonWidth - padding, padding)

			buttonWidth, buttonHeight = self.minifyButton:GetSize()
			self.minifyButton:SetPos(panelWidth - buttonWidth - padding - 50, padding)

			buttonWidth, buttonHeight = self.maximizeButton:GetSize()

			self.maximizeButton:SetPos(panelWidth - buttonWidth - padding - 25, padding)
		end

		self.OnCommand = function(self, command)
			if command == "Close" then
				-- LOL!
				self:SetVisible(false)
			end
			if command == "Maximize" then
				print("TODO")
			end
			if command == "Minimize" then
				-- LOL!
				self:SetVisible(false)
			end
		end

		self.SetDraggable = function(self, bool)
			self:SetMoveable(bool)
		end

		self.ShowCloseButton = function(self, bool)
			--self.closeButton:SetVisible(bool)
			self.closeButton:SetEnabled(bool)

			local padding = 5
			local buttonWidth, buttonHeight = self.closeButton:GetSize()
			local panelWidth = self:GetWide()

			self.closeButton:SetPos(panelWidth - buttonWidth - padding, padding)
		end

		self.ShowMinimizeButton = function(self, bool)
			--self.minifyButton:SetVisible(bool)
			self.minifyButton:SetEnabled(bool)

			local padding = 5
			local buttonWidth, buttonHeight = self.minifyButton:GetSize()
			local panelWidth = self:GetWide()

			self.minifyButton:SetPos(panelWidth - buttonWidth - padding - 50, padding)
		end

		self.ShowMaximizeButton = function(self, bool)
			--self.minifyButton:SetVisible(bool)
			self.maximizeButton:SetEnabled(bool)

			local padding = 5
			local buttonWidth, buttonHeight = self.maximizeButton:GetSize()
			local panelWidth = self:GetWide()

			self.maximizeButton:SetPos(panelWidth - buttonWidth - padding - 25, padding)
		end

		self.MakePopup = function(self)
			self.IsPopupV = true

			self:Center()
		end

    end,
}

CONTROLS.Add("PFrame", PFrame)
