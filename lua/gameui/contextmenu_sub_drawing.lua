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

local CContextSubDrawing = {
	m_pDrawingPanel = INVALID_PANEL,
}

-------------------------------------------------------------------------------
-- Purpose: Constructor
-------------------------------------------------------------------------------
function CContextSubDrawing:Init(parent)
	self:LoadControlSettings("resource/ContextSubDrawing.res");
end

-------------------------------------------------------------------------------
-- Purpose: 
-------------------------------------------------------------------------------
function CContextSubDrawing:OnResetData()
end

-------------------------------------------------------------------------------
-- Purpose: 
-------------------------------------------------------------------------------
function CContextSubDrawing:OnOK(applyOnly)
end

-------------------------------------------------------------------------------
-- Purpose: 
-------------------------------------------------------------------------------
function CContextSubDrawing:OnApplyChanges()
end

vgui.register( CContextSubDrawing, "CContextSubDrawing", "PropertyPage" )