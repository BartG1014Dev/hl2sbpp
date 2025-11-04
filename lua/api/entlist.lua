---@class gEntList
gEntList = {}

---Cleans up the delete list
function gEntList:CleanupDeleteList() end

---Clears all entities
function gEntList:Clear() end

---Finds an entity by classname
---@param ent CBaseEntity? The entity to start searching from, or nil
---@param classname string
---@return CBaseEntity?
function gEntList.FindEntityByClassname(ent, classname) end

---Finds the nearest entity of a given classname
---@param classname string
---@param pos Vector
---@param radius number
---@return CBaseEntity?
function gEntList:FindEntityByClassnameNearest(classname, pos, radius) end

---Finds an entity by name
---@param ent CBaseEntity? Starting entity
---@param name string
---@param opt1 CBaseEntity?
---@param opt2 CBaseEntity?
---@param opt3 CBaseEntity?
---@return CBaseEntity?
function gEntList:FindEntityByName(ent, name, opt1, opt2, opt3) end

---Returns the first entity in the list
---@return CBaseEntity?
function gEntList.FirstEnt() end

---Returns the next entity after the given one
---@param ent CBaseEntity
---@return CBaseEntity?
function gEntList.NextEnt(ent) end

---Number of active edicts
---@return number
function gEntList:NumberOfEdicts() end

---Number of entities
---@return number
function gEntList:NumberOfEntities() end

---Checks if entities are being cleared
---@return boolean
function gEntList:IsClearingEntities() end

---Notify entity creation
---@param ent CBaseEntity
function gEntList:NotifyCreateEntity(ent) end

---Notify entity spawn
---@param ent CBaseEntity
function gEntList:NotifySpawn(ent) end

---Reset delete list and returns number of items cleared
---@return number
function gEntList:ResetDeleteList() end

---Report entity flags changed
---@param ent CBaseEntity
---@param oldFlags number
---@param newFlags number
function gEntList:ReportEntityFlagsChanged(ent, oldFlags, newFlags) end

return gEntList
