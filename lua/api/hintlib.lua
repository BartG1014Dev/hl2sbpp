---@class hintlib
hintlib = {}

---Makes a hint.
---@param name string
---@param delay integer
function hintlib.AddHint(name, delay) end

---Makes a hint. Alt ver
---@param name string
---@param type integer
---@param dur integer
function hintlib.AddNotify(name, type, dur) end

--- Represents the result of a trace (line/hull) in the game world.
return hintlib
