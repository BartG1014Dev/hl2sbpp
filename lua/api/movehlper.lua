---@class IMoveHelper
IMoveHelper = {}

--- Create a new move helper instance.
---@return IMoveHelper
function IMoveHelper.MoveHelper() end

--- Reset the list of touched entities for this move helper.
function IMoveHelper:ResetTouchList() end

--- Add a trace result and velocity to the touched list.
---@param trace trace_t Trace result
---@param velocity Vector Impact velocity
---@return boolean True if added successfully
function IMoveHelper:AddToTouched(trace, velocity) end

--- Process all recorded impact events.
function IMoveHelper:ProcessImpacts() end

--- Print a formatted message to the console (debugging).
---@param index integer Message index
---@param message string Message to print
function IMoveHelper:Con_NPrintf(index, message) end

--- Apply falling damage to the associated player.
---@return boolean True if damage was applied
function IMoveHelper:PlayerFallingDamage() end

--- Set a player animation state.
---@param anim integer PLAYER_ANIM enum value
function IMoveHelper:PlayerSetAnimation(anim) end

--- Get the surface properties for the current movement context.
---@return IPhysicsSurfaceProps Surface properties object
function IMoveHelper:GetSurfaceProps() end

--- String representation of the IMoveHelper object.
---@return string
function IMoveHelper:__tostring() end

--- Represents physical parameters for a surface (e.g., friction, elasticity).
return IMoveHelper
