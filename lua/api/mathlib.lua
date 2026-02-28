---@class mathlib
mathlib = {}

---Clamps a value
---@param x number
---@param y number
---@param z number
---@return number
function mathlib.clamp(x, y, z) end

---Returns the absolute value of x
---@param x number
---@return number
function mathlib.abs(x) end

---Returns the sine of x (x in radians)
---@param x number
---@return number
function mathlib.sin(x) end

---Returns the hyperbolic sine of x
---@param x number
---@return number
function mathlib.sinh(x) end

---Returns the cosine of x (x in radians)
---@param x number
---@return number
function mathlib.cos(x) end

---Returns the hyperbolic cosine of x
---@param x number
---@return number
function mathlib.cosh(x) end

---Returns the tangent of x (x in radians)
---@param x number
---@return number
function mathlib.tan(x) end

---Returns the hyperbolic tangent of x
---@param x number
---@return number
function mathlib.tanh(x) end

---Returns the arcsine of x (in radians)
---@param x number
---@return number
function mathlib.asin(x) end

---Returns the arccosine of x (in radians)
---@param x number
---@return number
function mathlib.acos(x) end

---Returns the arctangent of x (in radians)
---@param x number
---@return number
function mathlib.atan(x) end

---Returns the arctangent of y/x taking into account the quadrant
---@param y number
---@param x number
---@return number
function mathlib.atan2(y, x) end

---Returns the smallest integer greater than or equal to x
---@param x number
---@return number
function mathlib.ceil(x) end

---Returns the largest integer less than or equal to x
---@param x number
---@return number
function mathlib.floor(x) end

---Returns the remainder of x/y
---@param x number
---@param y number
---@return number
function mathlib.fmod(x, y) end

---Returns the integer and fractional parts of x
---@param x number
---@return number ip
---@return number fp
function mathlib.modf(x) end

---Returns the square root of x
---@param x number
---@return number
function mathlib.sqrt(x) end

---Returns x raised to the power y
---@param x number
---@param y number
---@return number
function mathlib.pow(x, y) end

---Returns the natural logarithm of x
---@param x number
---@return number
function mathlib.log(x) end

---Returns the base-10 logarithm of x
---@param x number
---@return number
function mathlib.log10(x) end

---Returns e raised to the power x
---@param x number
---@return number
function mathlib.exp(x) end

---Converts radians to degrees
---@param x number
---@return number
function mathlib.deg(x) end

---Converts degrees to radians
---@param x number
---@return number
function mathlib.rad(x) end

---Returns the normalized fraction and exponent of x
---@param x number
---@return number frac
---@return integer exp
function mathlib.frexp(x) end

---Returns x * 2^exp
---@param x number
---@param exp integer
---@return number
function mathlib.ldexp(x, exp) end

---Returns the minimum of all arguments
---@vararg number
---@return number
function mathlib.min(...) end

---Returns the maximum of all arguments
---@vararg number
---@return number
function mathlib.max(...) end

---Returns a random number between 0 and 1, or in a specified range
---@param l? integer
---@param u? integer
---@return number
function mathlib.random(l, u) end

---Sets the seed for random number generation
---@param seed integer
function mathlib.randomseed(seed) end

---@return number pi
mathlib.pi = 3.14159265358979323846

---@return number huge
mathlib.huge = math.huge

return mathlib
