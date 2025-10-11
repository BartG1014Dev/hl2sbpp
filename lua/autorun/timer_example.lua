-- timer_example.lua

local concommand = require("concommand")
local Timer = require("timer")

local FCVAR_CLIENTDLL = _E.FCVAR.CLIENTDLL

-- Local means dont use it anywhere else
local function OnTimerExample()
  Timer.Simple(1, function()
    print("1 second has passed!")
  end)
end

concommand.Create(
  "TimerExample", -- Name
  OnTimerExample, -- Function
  "Times for 1 second, and prints a message.", -- Description
  FCVAR_CLIENTDLL --Flags
)
