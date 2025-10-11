-- concommand_example.lua
-- Being in autorun means it will only execute in-map.

local cvar = require( "cvar" )

local FCVAR_CLIENTDLL = _E.FCVAR.CLIENTDLL

-- Local means dont use it anywhere else
local function OnTestCmdChange(var, oldValueStr, oldValueNum)
	-- Print the message on client only.
	if CLIENT then
		print("I've been changed!")
	end
end

local test_convar = ConVar(
	"test_convar", -- ConVar name
	"0", -- Default value
	FCVAR_CLIENTDLL -- Flags
)

cvar.AddChangeCallback(	
	"test_convar", -- convar name
	"OnTestCmdChange", -- callback name
	OnTestCmdChange -- function
)

-- You can also easily make a user-client convar.
local test_convar_2 = CreateClientConVar(
	"test_convar_2", -- name
	"0", -- default value
	false, -- Saves? (ARCHIVE)
	true -- Is in user info?
)
