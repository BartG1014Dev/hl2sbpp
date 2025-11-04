---@class CNavArea
CNavArea = {}

---Returns the unique ID of this nav area.
---@return integer
function CNavArea:GetID() end

---Returns the center position of the area.
---@return Vector
function CNavArea:GetCenter() end

---Returns the X size (width) of the area.
---@return number
function CNavArea:GetSizeX() end

---Returns the Y size (length) of the area.
---@return number
function CNavArea:GetSizeY() end

---Gets one of the four corners of the area.
---@param corner integer @0–3 (see NavCornerType)
---@return Vector
function CNavArea:GetCorner(corner) end

---Sets one of the four corners of the area.
---@param corner integer @0–3
---@param pos Vector
function CNavArea:SetCorner(corner, pos) end

---Returns a random point inside the area.
---@return Vector
function CNavArea:GetRandomPoint() end

---Checks if the area is blocked for a given team.
---@param teamID? integer
---@return boolean
function CNavArea:IsBlocked(teamID) end

---Marks this area as blocked/unblocked.
---@param blocked boolean
---@param teamID? integer
---@param blocker? Entity
function CNavArea:SetBlocked(blocked, teamID, blocker) end

---Checks if the position is inside this area.
---@param pos Vector
---@return boolean
function CNavArea:Contains(pos) end

---Finds the closest point inside the area to a given position.
---@param pos Vector
---@return Vector
function CNavArea:GetClosestPointOnArea(pos) end

---Returns squared distance from this area to a position.
---@param pos Vector
---@return number
function CNavArea:GetDistanceSquaredToPoint(pos) end

---Gets light intensity at a given position.
---@param pos Vector
---@return number
function CNavArea:GetLightIntensityAtPos(pos) end

---Gets average light intensity for the area.
---@return number
function CNavArea:GetLightIntensity() end

---Returns the number of adjacent areas in a given direction.
---@param dir? integer @NavDirType
---@return integer
function CNavArea:GetAdjacentCount(dir) end

---Returns a specific adjacent area.
---@param dir integer @NavDirType
---@param idx integer
---@return CNavArea?
function CNavArea:GetAdjacentArea(dir, idx) end

---Returns a random adjacent area.
---@param dir? integer
---@return CNavArea?
function CNavArea:GetRandomAdjacentArea(dir) end

---Returns the number of players currently in the area.
---@param teamID? integer
---@return integer
function CNavArea:GetPlayerCount(teamID) end

---Returns all hiding spots in the area.
---@return Vector[]
function CNavArea:GetHidingSpots() end

---String representation for debugging.
---@return string
function CNavArea:__tostring() end
return CNavArea
