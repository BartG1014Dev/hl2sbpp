---@class QAngle
---@field x number # Pitch (or X) component
---@field y number # Yaw (or Y) component
---@field z number # Roll (or Z) component
QAngle = {}

---Create a new QAngle. Defaults to (0,0,0).
---@param x number|nil
---@param y number|nil
---@param z number|nil
---@return QAngle
function QAngle.QAngle(x, y, z) end

---Initialize angle components (mutates).
---@param x number
---@param y number
---@param z number
function QAngle:Init(x, y, z) end

---Mark as invalid.
function QAngle:Invalidate() end

---Return whether the angle contains valid finite components.
---@return boolean
function QAngle:IsValid() end

---Return vector length (treated as 3D vector of angles).
---@return number
function QAngle:Length() end

---Return squared length.
---@return number
function QAngle:LengthSqr() end

---Index metamethod: access x/y/z or methods.
---@param key string
---@return number|function
function QAngle:__index(key) end

---Newindex metamethod: assign x/y/z.
---@param key string
---@param value number
function QAngle:__newindex(key, value) end

---Return string representation of the angle.
---@return string
function QAngle:__tostring() end

---Equality (component-wise).
---@param a QAngle
---@param b QAngle
---@return boolean
function QAngle.__eq(a, b) end

---Addition (component-wise).
---@param a QAngle
---@param b QAngle
---@return QAngle
function QAngle.__add(a, b) end

---Subtraction (component-wise).
---@param a QAngle
---@param b QAngle
---@return QAngle
function QAngle.__sub(a, b) end

---Multiply angle by scalar.
---@param a QAngle
---@param s number
---@return QAngle
function QAngle.__mul(a, s) end

---Divide angle by scalar.
---@param a QAngle
---@param s number
---@return QAngle
function QAngle.__div(a, s) end

---Unary minus (negation).
---@param a QAngle
---@return QAngle
function QAngle.__unm(a) end

-- Common global constant
---@type QAngle
vec3_angle = nil -- global QAngle constant (0,0,0)
return QAngle
