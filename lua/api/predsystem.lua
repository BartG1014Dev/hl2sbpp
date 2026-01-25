---@class IPredictionSystem
---Library to control client/server prediction events.
IPredictionSystem = {}

---Suppresses all prediction events.
---@param suppress boolean Whether to suppress events.
function IPredictionSystem.SuppressEvents(suppress) end

---Suppresses host-specific prediction events for a given entity.
---@param entity any The entity whose host events to suppress.
function IPredictionSystem.SuppressHostEvents(entity) end
return IPredictionSystem
