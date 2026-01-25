---@class trace_t
--- All solid flag, true if the trace started in a solid area.
---@field allsolid boolean
--- Bitmask of contents the trace passed through.
---@field contents integer
--- Displacement surface flags.
---@field dispFlags integer
--- End position of the trace.
---@field endpos Vector
--- Fraction of the trace completed before hitting something (0..1).
---@field fraction number
--- Fraction of the trace left in solid (for starting inside solid).
---@field fractionleftsolid number
--- Hitbox index of the entity hit.
---@field hitbox integer
--- Hitgroup of the entity hit.
---@field hitgroup integer
--- Entity hit by the trace.
---@field m_pEnt CBaseEntity
--- Physics bone index hit (if any).
---@field physicsbone integer
--- Start position of the trace.
---@field startpos Vector
--- True if the trace started inside solid.
---@field startsolid boolean
--- Surface info of the hit.
---@field surface CSurface
trace_t = {}

--- Checks if the trace hit anything.
---@return boolean
function trace_t:DidHit() end

--- Checks if the trace hit a non-world entity (player, prop, etc.).
---@return boolean
function trace_t:DidHitNonWorldEntity() end

--- Checks if the trace hit the world geometry.
---@return boolean
function trace_t:DidHitWorld() end

--- Returns the entity index of the hit entity (0 if none).
---@return integer
function trace_t:GetEntityIndex() end

--- Returns true if the trace hit a displacement surface.
---@return boolean
function trace_t:IsDispSurface() end

--- Returns true if the displacement surface is buildable.
---@return boolean
function trace_t:IsDispSurfaceBuildable() end

--- Returns true if the displacement surface has Prop1 flag.
---@return boolean
function trace_t:IsDispSurfaceProp1() end

--- Returns true if the displacement surface has Prop2 flag.
---@return boolean
function trace_t:IsDispSurfaceProp2() end

--- Returns true if the displacement surface is walkable.
---@return boolean
function trace_t:IsDispSurfaceWalkable() end

--- Creates a new empty trace_t.
---@return trace_t
function trace_t() end
return trace_t
