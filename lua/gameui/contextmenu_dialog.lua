--========= Copyleft � 2010-2013, Team Sandbox, Some rights reserved. ============--
--
-- Purpose:
--
-- $NoKeywords: $
--===========================================================================--

include( "../includes/extensions/table.lua" );
include( "../includes/extensions/vgui.lua" );

local vgui = vgui;
local Msg = dbg.Msg;

local CContextMenu = {}

-------------------------------------------------------------------------------
-- Purpose: Basic help dialog
-------------------------------------------------------------------------------
function CContextMenu:Init(parent, panelName)
	self:SetDeleteSelfOnClose(true);
	local w,h = surface.GetScreenSize();
	self:SetBounds(0, 0, w, h); -- @ThePixelMoon: quite a nasty hack
	self:SetSizeable( false );
	self:SetPaintBackgroundEnabled( false );

	self:SetTitle( "", true );

	-- debug timing code, this function takes too long
--	local s4 = system.GetCurrentTime();

	self:AddPage(vgui.CContextSubDrawing(self, ""), "Drawing");
	self:AddPage(vgui.CContextSubNPC(self, ""), "NPCs");

--	local s5 = system.GetCurrentTime();
--	Msg("CContextMenu:Init(): " .. (s5 - s4) * 1000.0 .. "ms\n");

	-- self:GetPropertySheet():SetTabWidth(84);

	self:SetApplyButtonVisible( false );
	self:SetCancelButtonVisible( false );
	self:SetOKButtonVisible( false );
	self:SetTitleBarVisible( false );
	self:SetCloseButtonVisible( false );
	self:SetPaintBorderEnabled( false );
end

-------------------------------------------------------------------------------
-- Purpose: Opens the dialog
-------------------------------------------------------------------------------
function CContextMenu:Run()
	self:SetTitle("", true);
	self:Activate();
end

vgui.register( CContextMenu, "CContextMenu", "PropertyDialog" )