---@alias NavDirType
---| 0 # NORTH
---| 1 # EAST
---| 2 # SOUTH
---| 3 # WEST

---@alias NavCornerType
---| 0 # NORTH_WEST
---| 1 # NORTH_EAST
---| 2 # SOUTH_EAST
---| 3 # SOUTH_WEST

---A rectangular region defining a walkable area in the nav mesh.
---@class CNavArea
CNavArea = {}

---Returns the unique ID of this area.
---@return integer
function CNavArea:GetID() end

---Returns the centroid of this area as a world position.
---@return Vector
function CNavArea:GetCenter() end

---Returns the width of the area along the X axis.
---@return number
function CNavArea:GetSizeX() end

---Returns the height of the area along the Y axis.
---@return number
function CNavArea:GetSizeY() end

---Returns the north-west and south-east corners of this area.
---@return Vector nwCorner
---@return Vector seCorner
function CNavArea:GetExtent() end

---Returns the world position of the given corner.
---@param corner NavCornerType
---@return Vector
function CNavArea:GetCorner(corner) end

---Sets the world position of the given corner.
---@param corner NavCornerType
---@param pos Vector
function CNavArea:SetCorner(corner, pos) end

---Returns a random point within the area.
---@return Vector
function CNavArea:GetRandomPoint() end

---Returns the Z (ground height) of the area at the given X/Y coordinates.
---@param x number
---@param y number
---@return number
function CNavArea:GetZ(x, y) end

---Returns true if this area is blocked for the given team.
---@param teamID? integer  Defaults to TEAM_ANY
---@return boolean
function CNavArea:IsBlocked(teamID) end

---Marks or unmarks the area as blocked for the given team.
---@param blocked boolean
---@param teamID? integer  Defaults to TEAM_ANY
function CNavArea:SetBlocked(blocked, teamID) end

---Returns true if the given world position is on or above this area.
---@param pos Vector
---@return boolean
function CNavArea:Contains(pos) end

---Returns true if the given position or area overlaps this area's 2D extents.
---@param posOrArea Vector|CNavArea
---@param tolerance? number  Only used when posOrArea is a Vector. Default 0.
---@return boolean
function CNavArea:IsOverlapping(posOrArea, tolerance) end

---Returns true if this area and the given area are approximately co-planar.
---@param other CNavArea
---@return boolean
function CNavArea:IsCoplanar(other) end

---Returns true if this area is badly formed (zero or negative size).
---@return boolean
function CNavArea:IsDegenerate() end

---Returns true if this area is approximately flat.
---@return boolean
function CNavArea:IsFlat() end

---Returns true if this area is approximately square.
---@return boolean
function CNavArea:IsRoughlySquare() end

---Returns true if there are no bi-directional connections on the given side.
---@param dir NavDirType
---@return boolean
function CNavArea:IsEdge(dir) end

---Returns the closest point on this area to the given position.
---@param pos Vector
---@return Vector
function CNavArea:GetClosestPointOnArea(pos) end

---Returns the squared distance from this area to the given position.
---@param pos Vector
---@return number
function CNavArea:GetDistanceSquaredToPoint(pos) end

---Returns true if the given area is connected in the given direction.
---If direction is omitted, all four directions are checked.
---@param other CNavArea
---@param dir? NavDirType
---@return boolean
function CNavArea:IsConnected(other, dir) end

---Returns the number of areas connected in the given direction.
---@param dir? NavDirType  Defaults to NORTH (0)
---@return integer
function CNavArea:GetAdjacentCount(dir) end

---Returns the i-th adjacent area in the given direction.
---@param dir NavDirType
---@param index integer  0-based index
---@return CNavArea|nil
function CNavArea:GetAdjacentArea(dir, index) end

---Returns a random adjacent area in the given direction.
---@param dir? NavDirType  Defaults to NORTH (0)
---@return CNavArea|nil
function CNavArea:GetRandomAdjacentArea(dir) end

---Returns a table of all adjacent areas across all four directions.
---@return CNavArea[]
function CNavArea:GetAllAdjacentAreas() end

---Returns the attribute bit flags for this area.
---@return integer
function CNavArea:GetAttributes() end

---Sets the attribute bit flags for this area.
---@param bits integer
function CNavArea:SetAttributes(bits) end

---Returns true if the area has all of the given attribute bits set.
---@param bits integer
---@return boolean
function CNavArea:HasAttributes(bits) end

---Clears the given attribute bits from this area.
---@param bits integer
function CNavArea:RemoveAttributes(bits) end

---Returns the place descriptor (ID) assigned to this area.
---@return integer
function CNavArea:GetPlace() end

---Sets the place descriptor for this area.
---@param place integer
function CNavArea:SetPlace(place) end

---Returns the number of players of the given team currently in this area.
---Pass 0 to count all teams.
---@param teamID? integer  Defaults to 0 (all teams)
---@return integer
function CNavArea:GetPlayerCount(teamID) end

---Returns the 0..1 light intensity at the given world position within the area.
---@param pos Vector
---@return number
function CNavArea:GetLightIntensityAtPos(pos) end

---Returns the 0..1 light intensity averaged over the whole area.
---@return number
function CNavArea:GetLightIntensity() end

---Returns a table of Vector positions for each hiding spot in this area.
---@return Vector[]
function CNavArea:GetHidingSpots() end

---Increases the danger value of this area for the given team.
---@param teamID integer
---@param amount number
function CNavArea:IncreaseDanger(teamID, amount) end

---Returns the current danger value for this area for the given team.
---@param teamID integer
---@return number
function CNavArea:GetDanger(teamID) end

---Returns true if any part of this area is visible from the given eye position.
---@param eye Vector
---@return boolean
function CNavArea:IsVisible(eye) end

---Returns true if the given area is potentially visible from somewhere in this area (fast PVS check).
---@param other CNavArea
---@return boolean
function CNavArea:IsPotentiallyVisible(other) end

---Returns true if the given area is completely visible from somewhere in this area (fast PVS check).
---@param other CNavArea
---@return boolean
function CNavArea:IsCompletelyVisible(other) end

---Returns true if this area is actively damaging (e.g. fire).
---@return boolean
function CNavArea:IsDamaging() end

---Marks this area as damaging for the given duration in seconds.
---@param duration number
function CNavArea:MarkAsDamaging(duration) end

---Returns true if the center of this area is underwater.
---@return boolean
function CNavArea:IsUnderwater() end

---Returns true if this area is a battlefront (where rushing teams initially meet).
---@return boolean
function CNavArea:IsBattlefront() end

---Returns true if a large immobile object is obstructing this area.
---@param maxObstructionHeight? number  Defaults to StepHeight
---@return boolean
function CNavArea:HasAvoidanceObstacle(maxObstructionHeight) end

---Returns the maximum height of any avoidance obstruction above the ground.
---@return number
function CNavArea:GetAvoidanceObstacleHeight() end

---Returns the minimum time for someone of the given team to reach this area from spawn.
---@param teamID integer
---@return number
function CNavArea:GetEarliestOccupyTime(teamID) end

---Returns the time this area was last cleared of enemies for the given team.
---@param teamID integer
---@return number
function CNavArea:GetClearedTimestamp(teamID) end

---Sets the cleared timestamp for this area to the current time.
---@param teamID integer
function CNavArea:SetClearedTimestamp(teamID) end

---Global navigation mesh interface
---@class navmeshLib
navmesh = {}

---Returns a table of all nav areas on the current map.
---@return CNavArea[]
function navmesh.GetAllNavAreas() end

---Returns the nav area nearest to the given position.
---@param pos Vector
---@param maxDist? number      Maximum search distance. Default 10000.
---@param checkLOS? boolean    Whether to check line of sight. Default false.
---@param checkGround? boolean Whether to require ground contact. Default true.
---@return CNavArea|nil
function navmesh.GetNearestNavArea(pos, maxDist, checkLOS, checkGround) end

---Returns the nav area that is immediately beneath the given position (exact overlap, not nearest).
---@param pos Vector
---@param beneathLimit? number  Maximum distance below pos to search. Default 120.
---@return CNavArea|nil
function navmesh.GetNavArea(pos, beneathLimit) end

---Returns the nav area with the given unique ID, or nil if not found.
---@param id integer
---@return CNavArea|nil
function navmesh.GetNavAreaByID(id) end

---Returns the total number of nav areas on the current map.
---@return integer
function navmesh.GetNavAreaCount() end

---Returns true if a nav mesh has been loaded for the current map.
---@return boolean
function navmesh.IsLoaded() end

---Returns true if the nav mesh has been analyzed (hiding spots, encounter spots, etc).
---@return boolean
function navmesh.IsAnalyzed() end

---Returns the Z coordinate of the topmost ground level below the given point.
---@param pos Vector
---@return number height
---@return boolean success
function navmesh.GetGroundHeight(pos) end

---Increases danger weights in the given nav area and nearby ones.
---@param teamID integer
---@param amount number
---@param area CNavArea   The area to start from.
---@param pos Vector      World position of the danger source.
---@param maxRadius number
---@param dangerLimit? number  Defaults to -1 (no limit).
function navmesh.IncreaseDangerNearby(teamID, amount, area, pos, maxRadius, dangerLimit) end

return CNavArea, navmesh
