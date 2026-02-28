--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

local concommand = require("concommand")

-- Local means dont use it anywhere else
local function OnTestCmd()
  print("Hello, I am in a ConCommand!")
end

concommand.Create(
  "TestCmd", -- Name
  OnTestCmd, -- Function
  "Says a thing.", -- Description
  FCVAR.CLIENTDLL --Flags
)
