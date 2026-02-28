---@class KeyValues
---@field name string
KeyValues = {}

---Adds a sub key to this KeyValues node.
---@param kv KeyValues
function KeyValues:AddSubKey(kv) end

---Chains a KeyValues node after this one (linked-list style).
---@param kv KeyValues
function KeyValues:ChainKeyValue(kv) end

---Removes all subkeys and values.
function KeyValues:Clear() end

---Copies all subkeys from another KeyValues into this one.
---@param kv KeyValues
function KeyValues:CopySubkeys(kv) end

---Creates and returns a new empty KeyValues node.
---@return KeyValues
function KeyValues:CreateNewKey() end

---Deletes this KeyValues instance.
function KeyValues:deleteThis() end

---Finds a subkey by name.
---If `create` is true, creates the key if it does not exist.
---@param key string
---@param create boolean|nil
---@return KeyValues|nil
function KeyValues:FindKey(key, create) end

---Gets a color value from a key.
---@param key string
---@return table|nil -- Usually {r, g, b, a}
function KeyValues:GetColor(key) end

---Returns the data type of a key.
---@param key string
---@return integer
function KeyValues:GetDataType(key) end

---Returns the first subkey (including values).
---@return KeyValues|nil
function KeyValues:GetFirstSubKey() end

---Returns the first "true" subkey (excludes value-only keys).
---@return KeyValues|nil
function KeyValues:GetFirstTrueSubKey() end

---Returns the first value node.
---@return KeyValues|nil
function KeyValues:GetFirstValue() end

---Gets a float value from a key.
---@param key string
---@param default number|nil
---@return number
function KeyValues:GetFloat(key, default) end

---Gets an integer value from a key.
---@param key string
---@param default number|nil
---@return number
function KeyValues:GetInt(key, default) end

---Returns the name of this KeyValues node.
---@return string
function KeyValues:GetName() end

---Returns the internal symbol name identifier.
---@return integer
function KeyValues:GetNameSymbol() end

---Returns the next KeyValues node in the chain.
---@return KeyValues|nil
function KeyValues:GetNextKey() end

---Returns the next true subkey.
---@return KeyValues|nil
function KeyValues:GetNextTrueSubKey() end

---Returns the next value node.
---@return KeyValues|nil
function KeyValues:GetNextValue() end

---Gets a string value from a key.
---@param key string
---@param default string|nil
---@return string
function KeyValues:GetString(key, default) end

---Checks if a key is empty.
---@param key string
---@return boolean
function KeyValues:IsEmpty(key) end

---Loads KeyValues data from a file.
---@param fs any -- FileSystem interface
---@param filename string
---@param pathID string|nil
---@return boolean
function KeyValues:LoadFromFile(fs, filename, pathID) end

---Creates a deep copy of this KeyValues object.
---@return KeyValues
function KeyValues:MakeCopy() end

---Processes resolution-specific conditional keys.
---@param resolution string
function KeyValues:ProcessResolutionKeys(resolution) end

---Removes a subkey from this node.
---@param kv KeyValues
function KeyValues:RemoveSubKey(kv) end

---Saves this KeyValues structure to a file.
---@param fs any -- FileSystem interface
---@param filename string
---@param pathID string|nil
---@return boolean
function KeyValues:SaveToFile(fs, filename, pathID) end

---Sets a color value for a key.
---@param key string
---@param color table -- {r, g, b, a}
function KeyValues:SetColor(key, color) end

---Sets a float value for a key.
---@param key string
---@param value number
function KeyValues:SetFloat(key, value) end

---Sets an integer value for a key.
---@param key string
---@param value number
function KeyValues:SetInt(key, value) end

---Sets the name of this KeyValues node.
---@param name string
function KeyValues:SetName(name) end

---Sets the next KeyValues in the chain.
---@param kv KeyValues
function KeyValues:SetNextKey(kv) end

---Sets a string value for a key.
---@param key string
---@param value string
function KeyValues:SetString(key, value) end

---Sets the string value of this node directly.
---@param value string
function KeyValues:SetStringValue(value) end

---Enables or disables escape sequence parsing.
---@param use boolean
function KeyValues:UsesEscapeSequences(use) end

NULL_KEYVALUES = NULL

return KeyValues
