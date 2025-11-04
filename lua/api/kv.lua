---@class KeyValues
KeyValues = {}

function KeyValues:AddSubKey(kv) end
function KeyValues:ChainKeyValue(kv) end
function KeyValues:Clear() end
function KeyValues:CopySubkeys(kv) end
function KeyValues:CreateNewKey() end
function KeyValues:deleteThis() end
function KeyValues:FindKey(key, create) end
function KeyValues:GetColor(key) end
function KeyValues:GetDataType(key) end
function KeyValues:GetFirstSubKey() end
function KeyValues:GetFirstTrueSubKey() end
function KeyValues:GetFirstValue() end
function KeyValues:GetFloat(key, default) end
function KeyValues:GetInt(key, default) end
function KeyValues:GetName() end
function KeyValues:GetNameSymbol() end
function KeyValues:GetNextKey() end
function KeyValues:GetNextTrueSubKey() end
function KeyValues:GetNextValue() end
function KeyValues:GetString(key, default) end
function KeyValues:IsEmpty(key) end
function KeyValues:LoadFromFile(fs, filename, pathID) end
function KeyValues:MakeCopy() end
function KeyValues:ProcessResolutionKeys(resolution) end
function KeyValues:RemoveSubKey(kv) end
function KeyValues:SaveToFile(fs, filename, pathID) end
function KeyValues:SetColor(key, color) end
function KeyValues:SetFloat(key, value) end
function KeyValues:SetInt(key, value) end
function KeyValues:SetName(name) end
function KeyValues:SetNextKey(kv) end
function KeyValues:SetString(key, value) end
function KeyValues:SetStringValue(value) end
function KeyValues:UsesEscapeSequences(use) end

-- Integer bounds
MAX_COORD_INTEGER = 16384
MIN_COORD_INTEGER = -MAX_COORD_INTEGER

-- Fractional bounds (15/16)
MAX_COORD_FRACTION = 1.0 - (1.0 / 16.0)
MIN_COORD_FRACTION = -1.0 + (1.0 / 16.0)

-- Float bounds
MAX_COORD_FLOAT = 16384.0
MIN_COORD_FLOAT = -16384.0

-- Width of the coordinate system
COORD_EXTENT = 2 * MAX_COORD_INTEGER

-- Maximum traceable distance (cube diagonal)
MAX_TRACE_LENGTH = 1.732050807569 * COORD_EXTENT

-- Longest possible range (same as MAX_COORD_INTEGER)
MAX_COORD_RANGE = MAX_COORD_INTEGER
return KeyValues
