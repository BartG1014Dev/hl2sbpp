---@class gpGlobals
gpGlobals = {}

---Returns the time elapsed in seconds for the current frame (absolute frame time).
---@return number
function gpGlobals.absoluteframetime() end

---Returns the current server or simulation time (seconds).
---@return number
function gpGlobals.curtime() end

---Returns the current rendered frame count.
---@return integer
function gpGlobals.framecount() end

---Returns time elapsed in seconds since the last frame.
---@return number
function gpGlobals.frametime() end

---Returns seconds per server tick (tick interval).
---@return number
function gpGlobals.interval_per_tick() end

---Returns true if the current environment is a client.
---@return boolean
function gpGlobals.IsClient() end

---Returns configured maximum number of clients on the server.
---@return integer
function gpGlobals.maxClients() end

---Returns the network protocol version used by the server.
---@return integer
function gpGlobals.network_protocol() end

---Returns the real world time since server start (seconds).
---@return number
function gpGlobals.realtime() end

---Returns how many simulation ticks happened this frame.
---@return integer
function gpGlobals.simTicksThisFrame() end

---Returns the current server tick count.
---@return integer
function gpGlobals.tickcount() end

_CLIENT = true
CLIENT = true

_GAME = true
SERVER = true

--- global NULL value
NULL = nil

--- global INVALID_PANEL value
INVALID_PANEL = nil

return gpGlobals
