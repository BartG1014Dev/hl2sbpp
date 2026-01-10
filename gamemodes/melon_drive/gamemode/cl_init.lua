--========== Copyright (C) 2025, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

includeC("shared.lua")

function GM:LevelInitPostEntity()
  engine.ClientCmd_Unrestricted("thirdperson\n")
end
