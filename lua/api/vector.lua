---@class Vector
---@field x number # X component
---@field y number # Y component
---@field z number # Z component
Vector = {}

---Create a new Vector. Defaults to (0,0,0).
---@param x number|nil
---@param y number|nil
---@param z number|nil
---@return Vector
function Vector.Vector(x, y, z) end

---Return the cross product of two vectors.
---@param a Vector
---@param b Vector
---@return Vector
function Vector:Cross(a, b) end

---Return the euclidean distance to another vector.
---@param a Vector
---@return number
function Vector:DistTo(a) end

---Return squared euclidean distance to another vector (faster).
---@param a Vector
---@return number
function Vector:DistToSqr(a) end

---Return dot product with another vector.
---@param a Vector
---@return number
function Vector:Dot(a) end

---Initialize components (mutates).
---@param x number
---@param y number
---@param z number
function Vector:Init(x, y, z) end

---Mark vector as invalid (engine sentinel).
function Vector:Invalidate() end

---Return whether length is greater than value.
---@param f number
---@return boolean
function Vector:IsLengthGreaterThan(f) end

---Return whether length is less than value.
---@param f number
---@return boolean
function Vector:IsLengthLessThan(f) end

---Return whether the vector contains only valid finite numbers.
---@return boolean
function Vector:IsValid() end

---Return vector length (magnitude).
---@return number
function Vector:Length() end

---Return 2D length (ignores z).
---@return number
function Vector:Length2D() end

---Return squared 2D length.
---@return number
function Vector:Length2DSqr() end

---Return squared length (faster than Length).
---@return number
function Vector:LengthSqr() end

---Return component-wise max between two vectors.
---@param a Vector
---@return Vector
function Vector:Max(a) end

---Return component-wise min between two vectors.
---@param a Vector
---@return Vector
function Vector:Min(a) end

---Perform MulAdd: this = a + b * scalar (mutates).
---@param a Vector
---@param b Vector
---@param scalar number
function Vector:MulAdd(a, b, scalar) end

---Negate components (mutates).
function Vector:Negate() end

---Normalize in-place. Returns original length.
---@return number
function Vector:NormalizeInPlace() end

---Set vector to a random point inside a sphere of given radii (mutates).
---@param minRadius number
---@param maxRadius number
function Vector:Random(minRadius, maxRadius) end

---Return whether this vector is within axis-aligned box [min, max].
---@param minV Vector
---@param maxV Vector
---@return boolean
function Vector:WithinAABox(minV, maxV) end

---Set components to zero (mutates).
function Vector:Zero() end

---Index metamethod: access x/y/z or methods.
---@param key string
---@return number|function
function Vector:__index(key) end

---Newindex metamethod: assign x/y/z.
---@param key string
---@param value number
function Vector:__newindex(key, value) end

---Return string representation, e.g. "Vector: (x y z)".
---@return string
function Vector:__tostring() end

---Equality (component-wise).
---@param a Vector
---@param b Vector
---@return boolean
function Vector.__eq(a, b) end

---Addition (component-wise).
---@param a Vector
---@param b Vector
---@return Vector
function Vector.__add(a, b) end

---Subtraction (component-wise).
---@param a Vector
---@param b Vector
---@return Vector
function Vector.__sub(a, b) end

---Multiplication (vector * scalar or scalar * vector).
---@param a Vector|number
---@param b Vector|number
---@return Vector
function Vector.__mul(a, b) end

---Division (vector / scalar).
---@param a Vector
---@param b number
---@return Vector
function Vector.__div(a, b) end

---Unary minus (negation).
---@param a Vector
---@return Vector
function Vector.__unm(a) end

-- Common global constants
---@type Vector
vec3_origin = nil -- global Vector constant (0,0,0)
---@type Vector
vec3_invalid = nil -- global invalid vector sentinel

--- Utility functions for vector calculations, random number generation, tracing, and visual effects.
return Vector
