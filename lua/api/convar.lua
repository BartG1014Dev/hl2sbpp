---@class ConVar
ConVar = {}

function ConVar:AddFlags(flags) end
function ConVar:GetBool() end
function ConVar:GetDefault() end
function ConVar:GetFloat() end
function ConVar:GetHelpText() end
function ConVar:GetInt() end
function ConVar:GetMax() end
function ConVar:GetMin() end
function ConVar:GetName() end
function ConVar:GetString() end
function ConVar:IsCommand() end
function ConVar:IsFlagSet(flag) end
function ConVar:IsRegistered() end
function ConVar:Revert() end
function ConVar:SetValue(value) end
return ConVar
