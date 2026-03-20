---@class INetworkStringTable
local INetworkStringTable = {}

---@param isServer boolean
---@param value string
---@return integer
function INetworkStringTable:AddString(isServer, value) end

---@param tick integer
---@return boolean
function INetworkStringTable:ChangedSinceTick(tick) end

---@param value string
---@return integer
function INetworkStringTable:FindStringIndex(value) end

---@return integer
function INetworkStringTable:GetEntryBits() end

---@return integer
function INetworkStringTable:GetMaxStrings() end

---@return integer
function INetworkStringTable:GetNumStrings() end

---@param index integer
---@return string
function INetworkStringTable:GetString(index) end

---@return integer
function INetworkStringTable:GetTableId() end

---@return string
function INetworkStringTable:GetTableName() end

---@param index integer
---@param data string
function INetworkStringTable:SetStringUserData(index, data) end

---@param tick integer
function INetworkStringTable:SetTick(tick) end

---@return string
function INetworkStringTable:__tostring() end

---@class networkstringtable
networkstringtable = {}

---@param name string
---@param maxEntries integer
---@param userdataSize? integer
---@param userdataBits? integer
function networkstringtable.CreateStringTable(name, maxEntries, userdataSize, userdataBits) end

---@param name string
---@param maxEntries integer
---@param userdataSize? integer
---@param userdataBits? integer
---@param allowClientSideAdd? boolean
---@return INetworkStringTable
function networkstringtable.CreateStringTableEx(name, maxEntries, userdataSize, userdataBits, allowClientSideAdd) end

---@param name string
---@return INetworkStringTable
function networkstringtable.FindTable(name) end

---@return integer
function networkstringtable.GetNumTables() end

---@param index integer
---@return INetworkStringTable
function networkstringtable.GetTable(index) end

function networkstringtable.RemoveAllTables() end

---@param table INetworkStringTable
---@param allow boolean
function networkstringtable.SetAllowClientSideAddString(table, allow) end

return INetworkStringTable, networkstringtable