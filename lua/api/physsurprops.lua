---@class IPhysicsSurfaceProps
IPhysicsSurfaceProps = {}

--- Get physical parameters for a surface by index.
---@param surfaceIndex integer Surface index
---@return surfacephysicsparams_t Physics parameters
function IPhysicsSurfaceProps:GetPhysicsParameters(surfaceIndex) end

--- Get physics properties for a surface by index.
---@param surfaceIndex integer Surface index
---@return number density Surface density
---@return number thickness Surface thickness
---@return number friction Surface friction
---@return number elasticity Surface elasticity
function IPhysicsSurfaceProps:GetPhysicsProperties(surfaceIndex) end

--- Get the name of a surface property by index.
---@param surfaceIndex integer Surface index
---@return string Property name
function IPhysicsSurfaceProps:GetPropName(surfaceIndex) end

--- Get the string associated with a sound index.
---@param soundIndex integer Sound index
---@return string Sound string
function IPhysicsSurfaceProps:GetString(soundIndex) end

--- Get complete surface data by index.
---@param surfaceIndex integer Surface index
---@return surfacedata_t Surface data
function IPhysicsSurfaceProps:GetSurfaceData(surfaceIndex) end

--- Get the index of a surface property by name.
---@param propName string Property name
---@return integer Surface index
function IPhysicsSurfaceProps:GetSurfaceIndex(propName) end

--- Parse surface data from a file and text buffer.
---@param filename string File name
---@param text string Text buffer
---@return integer Result code
function IPhysicsSurfaceProps:ParseSurfaceData(filename, text) end

--- Get the total number of surface properties.
---@return integer Property count
function IPhysicsSurfaceProps:SurfacePropCount() end

--- String representation of the IPhysicsSurfaceProps.
---@return string
function IPhysicsSurfaceProps:__tostring() end

--- Global physics surface properties instance.
---@type IPhysicsSurfaceProps
physprops = {}

return IPhysicsSurfaceProps
