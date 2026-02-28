---@class mathlib
mathlib = {}

---Clamps a value
---@param x number
---@param y number
---@param z number
---@return number
function mathlib.clamp(x, y, z) end

---Converts an Angle into directional vectors.
---
---If only `forward` is provided, only the forward vector is calculated.
---If `right` and `up` are also provided, all three basis vectors are calculated
---
---@overload fun(ang: QAngle, forward: Vector)
---@param ang QAngle
---@param forward Vector
---@param right Vector
---@param up Vector
function mathlib.AngleVectors(ang, forward, right, up) end

---Converts a direction vector into an Angle.
---
---If only `ang` is provided, calculates pitch and yaw.
---If `pseudoup` is provided, roll is calculated as well
---
---@overload fun(forward: Vector, ang: Angle)
---@param forward Vector
---@param pseudoup Vector
---@param ang Angle
function mathlib.VectorAngles(forward, pseudoup, ang) end

return mathlib
