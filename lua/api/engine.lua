---@class engine
engine = {}

---Activates or deactivates an occluder.
---@param occluderID integer
---@param active boolean
function engine.ActivateOccluder(occluderID, active) end

---Changes the player's team.
---@param team string
function engine.ChangeTeam(team) end

---Checks if key trapping has finished.
---@param keyCode integer
---@return boolean
function engine.CheckDoneKeyTrapping(keyCode) end

---Triggers a checkpoint with a name.
---@param name string
function engine.CheckPoint(name) end

---Sends a client console command.
---@param cmd string
function engine.ClientCmd(cmd) end

---Sends a server console command.
---@param cmd string
function engine.ServerCommand(cmd) end

---Sends an unrestricted client command.
---@param cmd string
function engine.ClientCmd_Unrestricted(cmd) end

---Returns whether the console is visible.
---@return boolean
function engine.Con_IsVisible() end

---Copies framebuffer to a material.
---@param materialName string
---@return boolean
function engine.CopyFrameBufferToMaterial(materialName) end

---Culls a box defined by mins and maxs.
---@param mins Vector
---@param maxs Vector
---@return boolean
function engine.CullBox(mins, maxs) end

---Checks if a box touches an area frustum.
---@param mins Vector
---@param maxs Vector
---@param area integer
---@return boolean
function engine.DoesBoxTouchAreaFrustum(mins, maxs, area) end

---Draws engine portals.
function engine.DrawPortals() end

---Begins engine stats frame.
function engine.EngineStats_BeginFrame() end

---Ends engine stats frame.
function engine.EngineStats_EndFrame() end

---Gets the size of a game lump.
---@param lumpID integer
---@return integer
function engine.GameLumpSize(lumpID) end

---Gets the version of a game lump.
---@param lumpID integer
---@return integer
function engine.GameLumpVersion(lumpID) end

---Gets the application ID (Steam AppID).
---@return integer
function engine.GetAppID() end

---Gets the server time.
---@return integer
function engine.Time() end
return engine
