---@class cvar
cvar = {}

--- Allocates a DLL identifier.
---@return integer
function cvar.AllocateDLLIdentifier() end

--- Prints colored text to console.
---@param color table -- Color(r,g,b,a)
---@param text string
function cvar.ConsoleColorPrintf(color, text) end

--- Prints debug text to console.
---@param text string
function cvar.ConsoleDPrintf(text) end

--- Prints plain text to console.
---@param text string
function cvar.ConsolePrintf(text) end

--- Finds a ConVar by name.
---@param name string
---@return ConVar
function cvar.FindVar(name) end

--- Gets a command line value.
---@param name string
---@return string
function cvar.GetCommandLineValue(name) end

--- Reverts all flagged ConVars.
---@param flag integer
function cvar.RevertFlaggedConVars(flag) end

return cvar
