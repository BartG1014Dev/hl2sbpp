--========== Copyleft © 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose: 
--
--===========================================================================--

include( "../includes/extensions/panel.lua" )

local FCVAR_CLIENTDLL = _E.FCVAR.CLIENTDLL

--require( "concommand" )
include( "../includes/modules/concommand.lua" )

local hContextMenu = INVALID_PANEL

local function PositionDialog(dlg)
	if ( dlg == INVALID_PANEL ) then
		return;
	end

	local x, y, ww, wt, wide, tall;
	x, y, ww, wt = surface.GetWorkspaceBounds();
	wide, tall = dlg:GetSize();

	-- Center it, keeping requested size
	dlg:SetPos(x + ((ww - wide) / 2), y + ((wt - tall) / 2));
end

local function OnOpenContextMenu()
	if ( ToPanel( hContextMenu ) == INVALID_PANEL ) then
		hContextMenu = vgui.CContextMenu(VGui_GetGameUIPanel(), "ContextMenu");
		PositionDialog( hContextMenu );
	end
	hContextMenu:Activate();
	hContextMenu:SetVisible( true );
end

local function OnCloseContextMenu()
	if ( ToPanel( hContextMenu ) == INVALID_PANEL ) then
		hContextMenu = vgui.CContextMenu(VGui_GetGameUIPanel(), "ContextMenu");
		PositionDialog( hContextMenu );
	end
	hContextMenu:Activate();
	hContextMenu:SetVisible( false );
end

concommand.Create( "+contextmenu", OnOpenContextMenu, "Open content dialog.", FCVAR_CLIENTDLL )
concommand.Create( "-contextmenu", OnCloseContextMenu, "Open content dialog.", FCVAR_CLIENTDLL )