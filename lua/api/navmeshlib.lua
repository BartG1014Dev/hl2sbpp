---@class navmeshlib
navmesh = {}

---Gets all nav areas.
---@return CNavArea[]
function navmesh.GetAllNavAreas() end

---Finds the nav area closest to a position.
---@param pos Vector
---@param beneathLimit? number @default 120
---@param distLimit? number @default 10000
---@param checkLOS? boolean
---@return CNavArea?
function navmesh.GetNearestNavArea(pos, beneathLimit, distLimit, checkLOS) end

return navmesh
