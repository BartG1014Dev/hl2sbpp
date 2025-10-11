--======== Copyright (C) 2025-2025, Team HL2SB++, All rights reserved. ========--
--
-- Purpose: Tests the implementation of gEntList.* functions.
--
--===========================================================================--

local pEntity = gEntList.FindEntityByClassname( pEntity, "prop_physics*" )
while ( pEntity ~= NULL ) do
  pEntity:SetRenderColor( 255, 0, 0, 255 )
  pEntity = gEntList.FindEntityByClassname( pEntity, "prop_physics*" )
end
