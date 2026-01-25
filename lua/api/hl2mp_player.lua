
---@class CHL2MP_Player : CBasePlayer
---@field m_fNextThinkPushAway number|nil
CHL2MP_Player = {}

---Create a ragdoll for this player on the client (client-side) or attempt server-side ragdoll creation.
---On client: returns the created viewmodel/animating object. On server: returns true/false success.
---@return CBaseAnimating|boolean
function CHL2MP_Player:BecomeRagdollOnClient() end

---Recalculate inverse-kinematics bone locks for animation smoothing.
---@param flTime number Time delta or frame time used for IK calculations
function CHL2MP_Player:CalculateIKLocks(flTime) end

---Calculate the player's view parameters.
---Fills and returns eye origin, eye angles, near/far clip planes and FOV.
---@return Vector eyeOrigin, QAngle eyeAngles, number zNear, number zFar, number fov
function CHL2MP_Player:CalcView() end

---Returns whether this player is currently allowed to sprint.
---@return boolean
function CHL2MP_Player:CanSprint() end

---Trigger a player animation event (wrapper for engine animation events).
---@param event integer The PlayerAnimEvent_t enum value
---@param data integer? Optional event data (e.g. weapon hold type)
function CHL2MP_Player:DoAnimationEvent(event, data) end

---Metamethod: index lookup for CHL2MP_Player (handled by engine bindings).
---@param key string
---@return any
function CHL2MP_Player:__index(key) end

---Metamethod: newindex (assign) for CHL2MP_Player (stores values in per-entity table).
---@param key string
---@param value any
function CHL2MP_Player:__newindex(key, value) end

---Metamethod: equality check for two CHL2MP_Player objects (same underlying entity).
---@param other CHL2MP_Player
---@return boolean
function CHL2MP_Player:__eq(other) end

---Metamethod: tostring representation for the player.
---@return string
function CHL2MP_Player:__tostring() end

---Static helper: cast a generic entity to CHL2MP_Player (returns nil if not a player).
---@param ent CBaseEntity
---@return CHL2MP_Player
function CHL2MP_Player.ToHL2MPPlayer(ent) end

---Converts a generic entity (CBaseEntity or derived) to CHL2MP_Player
---@param ent CBaseEntity|CBasePlayer
---@return CHL2MP_Player|nil
function ToHL2MPPlayer(ent) end

return CHL2MP_Player