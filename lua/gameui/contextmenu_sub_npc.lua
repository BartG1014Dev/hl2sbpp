--========= Copyleft © 2010-2013, Team Sandbox, Some rights reserved. ============--
--
-- Purpose: 
--
-- $NoKeywords: $
--
--=============================================================================--
include( "../includes/extensions/table.lua" );
include( "../includes/extensions/keyvalues.lua" );
include( "../includes/extensions/vgui.lua" );

local vgui = vgui;

local CContextSubNPC = {
	m_pDrawingPanel = INVALID_PANEL,
}

-------------------------------------------------------------------------------
-- Purpose: Constructor
-------------------------------------------------------------------------------
function CContextSubNPC:Init(parent)
	self:LoadControlSettings("resource/ContextSubNPC.res");
end

-------------------------------------------------------------------------------
-- Purpose: 
-------------------------------------------------------------------------------
function CContextSubNPC:OnResetData()
end

-------------------------------------------------------------------------------
-- Purpose: 
-------------------------------------------------------------------------------
function CContextSubNPC:OnOK(applyOnly)
end

-------------------------------------------------------------------------------
-- Purpose: 
-------------------------------------------------------------------------------
function CContextSubNPC:OnApplyChanges()
end

vgui.register( CContextSubNPC, "CContextSubNPC", "PropertyPage" )