-- example_panel.lua
local concommand = require( "concommand" )
include("palm/cl_init.lua")

local FCVAR_CLIENTDLL = _E.FCVAR.CLIENTDLL

local function OnOpenExamplePanel()
	local Frame = vgui.Create( "PFrame" )
	Frame:SetPos( 5, 5 ) 
	Frame:SetSize( 300, 150 ) 
	Frame:SetTitle( "Name window" ) 
	Frame:SetVisible( true ) 
	Frame:SetDraggable( false ) 
	Frame:ShowCloseButton( true ) 

	local Label = vgui.Create( "PLabel", Frame, "Ass" )
	Label:SetPos( 5, 30 )
	Label:SetVisible( true )

	Frame:MakePopup()
end

concommand.Create( "OpenExamplePanel", OnOpenExamplePanel, "Opens an example panel.", FCVAR_CLIENTDLL )