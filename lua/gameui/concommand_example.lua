-- concommand_example.lua

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
