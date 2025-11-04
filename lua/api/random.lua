---@class random
random = {}

---Returns a random float between a and b.
---If only one argument is given, returns between -a and a.
---If no arguments are given, returns 0.
---@param a number|nil
---@param b number|nil
---@return number
function random.RandomFloat(a, b) end

---Returns a random float between a and b, modified by an exponent.
---@param a number|nil
---@param b number|nil
---@param exponent number|nil Defaults to 1.0
---@return number
function random.RandomFloatExp(a, b, exponent) end

---Returns a random integer between a and b.
---If only one argument is given, returns between -a and a.
---If no arguments are given, returns 0.
---@param a integer|nil
---@param b integer|nil
---@return integer
function random.RandomInt(a, b) end

---Sets the seed of the random number generator.
---@param seed integer
function random.SetSeed(seed) end
return random
