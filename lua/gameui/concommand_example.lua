-- concommand_example.lua

local concommand = require( "concommand" )

local FCVAR_CLIENTDLL = _E.FCVAR.CLIENTDLL

local function OnTestCmd()
	print("Hello, i am in a ConCommand!")
end

concommand.Create(
	"TestCmd", -- Name
	OnTestCmd, -- Function
	"Says a thing.", -- Description
	FCVAR_CLIENTDLL --Flags
)