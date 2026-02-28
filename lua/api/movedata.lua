---Holds all movement input and state for a single player movement tick
---@class CMoveData
CMoveData = {}

---Returns the current button bitmask (IN_* flags held this tick).
---@return integer
function CMoveData:GetButtons() end

---Sets the button bitmask for this tick.
---@param buttons integer
function CMoveData:SetButtons(buttons) end

---Returns the button bitmask from the previous tick.
---@return integer
function CMoveData:GetOldButtons() end

---Sets the previous tick button bitmask.
---@param buttons integer
function CMoveData:SetOldButtons(buttons) end

---Returns true if the given IN_* button is currently held.
---@param button integer  One of the IN_* constants
---@return boolean
function CMoveData:KeyDown(button) end

---Returns true if the given IN_* button was just pressed this tick (down now, not last tick).
---@param button integer  One of the IN_* constants
---@return boolean
function CMoveData:KeyPressed(button) end

---Returns true if the given IN_* button was just released this tick (up now, was down last tick).
---@param button integer  One of the IN_* constants
---@return boolean
function CMoveData:KeyReleased(button) end

---Returns the player's view angles this tick.
---@return QAngle
function CMoveData:GetViewAngles() end

---Sets the player's view angles for this tick.
---@param angles QAngle
function CMoveData:SetViewAngles(angles) end

---Returns the absolute (world-space) view angles this tick.
---@return QAngle
function CMoveData:GetAbsViewAngles() end

---Returns the forward/back movement input (-maxspeed .. +maxspeed).
---Positive = forward, negative = back.
---@return number
function CMoveData:GetForwardMove() end

---Sets the forward/back movement input.
---@param speed number
function CMoveData:SetForwardMove(speed) end

---Returns the left/right strafe input (-maxspeed .. +maxspeed).
---Positive = right, negative = left.
---@return number
function CMoveData:GetSideMove() end

---Sets the left/right strafe input.
---@param speed number
function CMoveData:SetSideMove(speed) end

---Returns the up/down movement input (used for noclip, ladders, swimming).
---@return number
function CMoveData:GetUpMove() end

---Sets the up/down movement input.
---@param speed number
function CMoveData:SetUpMove(speed) end

---Returns the maximum speed cap for this tick as determined server-side.
---@return number
function CMoveData:GetMaxSpeed() end

---Sets the maximum speed cap for this tick.
---@param speed number
function CMoveData:SetMaxSpeed(speed) end

---Returns the maximum speed as reported by the client.
---@return number
function CMoveData:GetClientMaxSpeed() end

---Sets the client-reported maximum speed.
---@param speed number
function CMoveData:SetClientMaxSpeed(speed) end

---Returns the player's current velocity this tick.
---@return Vector
function CMoveData:GetVelocity() end

---Sets the player's velocity for this tick.
---@param velocity Vector
function CMoveData:SetVelocity(velocity) end

---Returns the player's absolute world origin at the start of this tick.
---@return Vector
function CMoveData:GetOrigin() end

---Sets the player's absolute world origin for this tick.
---@param origin Vector
function CMoveData:SetOrigin(origin) end

---Returns the player's origin from the previous tick.
---@return Vector
function CMoveData:GetOldOrigin() end

---Returns the radius of the movement constraint zone (0 = no constraint).
---@return number
function CMoveData:GetConstraintRadius() end

---Sets the movement constraint radius.
---@param radius number
function CMoveData:SetConstraintRadius(radius) end

---Returns the speed scale applied when inside the constraint zone (0..1).
---@return number
function CMoveData:GetConstraintSpeedFactor() end

---Sets the speed scale applied inside the constraint zone.
---@param factor number
function CMoveData:SetConstraintSpeedFactor(factor) end

---Returns the world-space center of the movement constraint zone.
---@return Vector
function CMoveData:GetConstraintCenter() end

---Sets the world-space center of the movement constraint zone.
---@param center Vector
function CMoveData:SetConstraintCenter(center) end

return CMoveData
