---@class UTIL
UTIL = {}

--- Convert a vector to a yaw angle (in degrees).
---@param vec Vector Input vector
---@return number Yaw angle
function UTIL.VecToYaw(vec) end

--- Convert a vector to a pitch angle (in degrees).
---@param vec Vector Input vector
---@return number Pitch angle
function UTIL.VecToPitch(vec) end

--- Convert a yaw angle (in degrees) to a normalized direction vector.
---@param yaw number Yaw angle
---@return Vector Direction vector
function UTIL.YawToVector(yaw) end

--- Generate a random float between min and max with a given seed name.
---@param seedName string Seed identifier for consistent random results
---@param min number Minimum value
---@param max number Maximum value
---@param seed integer? Optional seed value (default: 0)
---@return number Random float
function UTIL.SharedRandomFloat(seedName, min, max, seed) end

--- Generate a random integer between min and max with a given seed name.
---@param seedName string Seed identifier for consistent random results
---@param min integer Minimum value
---@param max integer Maximum value
---@param seed integer? Optional seed value (default: 0)
---@return integer Random integer
function UTIL.SharedRandomInt(seedName, min, max, seed) end

--- Generate a random vector with components between min and max with a given seed name.
---@param seedName string Seed identifier for consistent random results
---@param min number Minimum value for vector components
---@param max number Maximum value for vector components
---@param seed integer? Optional seed value (default: 0)
---@return Vector Random vector
function UTIL.SharedRandomVector(seedName, min, max, seed) end

--- Generate a random QAngle with components between min and max with a given seed name.
---@param seedName string Seed identifier for consistent random results
---@param min number Minimum value for angle components
---@param max number Maximum value for angle components
---@param seed integer? Optional seed value (default: 0)
---@return QAngle Random angle
function UTIL.SharedRandomAngle(seedName, min, max, seed) end

--- Perform a line trace from start to end with specified mask and collision group.
---@param startPos Vector Start position of the trace
---@param endPos Vector End position of the trace
---@param mask integer Trace mask (bit flags)
---@param ignoreEnt CBaseEntity Entity to ignore during the trace
---@param collisionGroup integer Collision group for filtering
---@param trace trace_t Output trace result
function UTIL.TraceLine(startPos, endPos, mask, ignoreEnt, collisionGroup, trace) end

--- Perform a hull trace from start to end with specified bounds, mask, and collision group.
---@param startPos Vector Start position of the trace
---@param endPos Vector End position of the trace
---@param mins Vector Minimum bounds of the hull
---@param maxs Vector Maximum bounds of the hull
---@param mask integer Trace mask (bit flags)
---@param ignoreEnt CBaseEntity Entity to ignore during the trace
---@param collisionGroup integer Collision group for filtering
---@param trace trace_t Output trace result
function UTIL.TraceHull(startPos, endPos, mins, maxs, mask, ignoreEnt, collisionGroup, trace) end

--- Perform a trace for a specific entity from start to end with mask and collision group.
---@param ent CBaseEntity Entity to trace
---@param startPos Vector Start position of the trace
---@param endPos Vector End position of the trace
---@param mask integer Trace mask (bit flags)
---@param ignoreEnt CBaseEntity Entity to ignore during the trace
---@param collisionGroup integer Collision group for filtering
---@param trace trace_t Output trace result
function UTIL.TraceEntity(ent, startPos, endPos, mask, ignoreEnt, collisionGroup, trace) end

--- Check if two entities share the same root parent in the movement hierarchy.
---@param ent1 CBaseEntity First entity
---@param ent2 CBaseEntity Second entity
---@return boolean True if they share the same root parent
function UTIL.EntityHasMatchingRootParent(ent1, ent2) end

--- Get the contents (e.g., solid, water) at a specific point in the world.
---@param point Vector World position to check
---@return integer Contents bitmask
function UTIL.PointContents(point) end

--- Perform a model trace from start to end with specified angles and entity.
---@param startPos Vector Start position of the trace
---@param endPos Vector End position of the trace
---@param angles Vector Model orientation angles
---@param axis Vector Model axis
---@param ent CBaseEntity Entity whose model is traced
---@param collisionGroup integer Collision group for filtering
---@param trace trace_t Output trace result
function UTIL.TraceModel(startPos, endPos, angles, axis, ent, collisionGroup, trace) end

--- Create a particle tracer effect from start to end.
---@param effectName string Name of the particle effect
---@param startPos Vector Start position of the tracer
---@param endPos Vector End position of the tracer
---@param entIndex integer? Entity index (default: 0)
---@param attachment integer? Attachment point index (default: 0)
---@param doWhiz boolean? Play whiz sound (default: false)
function UTIL.ParticleTracer(effectName, startPos, endPos, entIndex, attachment, doWhiz) end

--- Create a tracer effect from start to end with customizable parameters.
---@param startPos Vector Start position of the tracer
---@param endPos Vector End position of the tracer
---@param entIndex integer? Entity index (default: 0)
---@param attachment integer? Attachment point index (default: -1)
---@param velocity number? Tracer velocity (default: 0)
---@param doWhiz boolean? Play whiz sound (default: false)
---@param effectName string? Particle effect name (default: nil)
---@param force integer? Force value (default: 0)
function UTIL.Tracer(startPos, endPos, entIndex, attachment, velocity, doWhiz, effectName, force) end

--- Create a blood drip effect at a specific location with direction and color.
---@param origin Vector Position of the blood drip
---@param direction Vector Direction of the drip
---@param color integer Blood color index
---@param amount integer Amount of blood
function UTIL.BloodDrips(origin, direction, color, amount) end

--- Check if the game is in low-violence mode (e.g., for regional settings).
---@return boolean True if low-violence mode is active
function UTIL.IsLowViolence() end

--- Check if blood should be shown for a given blood color.
---@param color integer Blood color index
---@return boolean True if blood should be shown
function UTIL.ShouldShowBlood(color) end

--- Create a blood impact effect at a specific location.
---@param origin Vector Position of the impact
---@param direction Vector Direction of the impact
---@param color integer Blood color index
---@param amount integer Amount of blood
function UTIL.BloodImpact(origin, direction, color, amount) end

--- Apply a blood decal based on a trace result and blood color.
---@param trace trace_t Trace result
---@param color integer Blood color index
function UTIL.BloodDecalTrace(trace, color) end

--- Apply a decal based on a trace result and decal name.
---@param trace trace_t Trace result
---@param decalName string Name of the decal
function UTIL.DecalTrace(trace, decalName) end

--- Check if a space defined by a bounding box is empty (no collisions).
---@param ent CBaseEntity Entity to ignore (or nil)
---@param mins Vector Minimum bounds of the box
---@param maxs Vector Maximum bounds of the box
---@return boolean True if the space is empty
function UTIL.IsSpaceEmpty(ent, mins, maxs) end

--- Get a player by their index.
---@param index integer Player index
---@return CBasePlayer Player entity or nil if not found
function UTIL.PlayerByIndex(index) end

---Check if a certain entity class can be created.
---@param className string
---@return boolean
function UTIL.CanCreateEntityClass(className) end

---Get the entity index of a CBaseEntity.
---@param ent CBaseEntity
---@return integer
function UTIL.ENTINDEX(ent) end

---Get the entity object from an index.
---@param index integer
---@return CBaseEntity
function UTIL.INDEXENT(index) end

---Check if the given entity is null.
---@param ent CBaseEntity
---@return boolean
function UTIL.FNullEnt(ent) end

---Compare two strings for equality.
---@param str1 string
---@param str2 string
---@return boolean
function UTIL.FStrEq(str1, str2) end

---Set entity size (bounding box).
---@param ent CBaseEntity
---@param mins Vector
---@param maxs Vector
function UTIL.SetSize(ent, mins, maxs) end

---Clear a trace result.
---@param tr trace_t
function UTIL.ClearTrace(tr) end

---Precache a decal by name.
---@param decalName string
---@param bClientOnly boolean?
---@return integer
function UTIL.PrecacheDecal(decalName, bClientOnly) end

---Get simulation interval (frame time).
---@return number
function UTIL.GetSimulationInterval() end

---Get a player entity by index.
---@param index integer
---@return CBasePlayer
function UTIL.PlayerByIndex(index) end

---Get the local player.
---@return CBasePlayer
function UTIL.GetLocalPlayer() end

---Get the listen server host player.
---@return CBasePlayer
function UTIL.GetListenServerHost() end

---Get a player by user ID.
---@param userid integer
---@return CBasePlayer
function UTIL.PlayerByUserId(userid) end

---Get a player by name.
---@param name string
---@return CBasePlayer
function UTIL.PlayerByName(name) end

---Check if the last command was issued by a server admin.
---@return boolean
function UTIL.IsCommandIssuedByServerAdmin() end

---Get entity by index.
---@param index integer
---@return CBaseEntity
function UTIL.EntityByIndex(index) end

---Get player connection info (ping, packet loss).
---@param index integer
---@return integer ping
---@return integer packetloss
function UTIL.GetPlayerConnectionInfo(index) end

---Check if client PVS (potentially visible set) is expanded.
---@return boolean
function UTIL.ClientPVSIsExpanded() end

---Find a client in PVS from min and max vectors.
---@param mins Vector
---@param maxs Vector
---@return CBasePlayer
function UTIL.FindClientInPVS(mins, maxs) end

---Get all entities inside a box.
---@param maxEntities integer Max number of entities to retrieve
---@param mins Vector
---@param maxs Vector
---@param mask integer
---@return integer count
---@return CBaseEntity[] entities
function UTIL.EntitiesInBox(maxEntities, mins, maxs, mask) end

---Get all entities inside a sphere.
---@param maxEntities integer Max number of entities to retrieve
---@param center Vector
---@param radius number
---@param mask integer
---@return integer count
---@return CBaseEntity[] entities
function UTIL.EntitiesInSphere(maxEntities, center, radius, mask) end

---Remove an entity.
---@param ent CBaseEntity
function UTIL.Remove(ent) end

---Disable immediate removal.
function UTIL.DisableRemoveImmediate() end

---Enable immediate removal.
function UTIL.EnableRemoveImmediate() end

---Immediately remove an entity.
---@param ent CBaseEntity
function UTIL.RemoveImmediate(ent) end

---Drop an entity to the floor.
---@param ent CBaseEntity
---@param flags integer
---@param groundEnt CBaseEntity?
---@return integer
function UTIL.DropToFloor(ent, flags, groundEnt) end

---Set an entity's origin.
---@param ent CBaseEntity
---@param pos Vector
---@param bNoPhysics boolean?
function UTIL.SetOrigin(ent, pos, bNoPhysics) end

---Emit an ambient sound.
---@param entIndex integer
---@param pos Vector
---@param soundName string
---@param volume number
---@param level integer
---@param flags integer
---@param pitch integer
---@param delay number?
---@return number duration
function UTIL.EmitAmbientSound(entIndex, pos, soundName, volume, level, flags, pitch, delay) end

---Screen shake effect at a position.
---@param origin Vector
---@param amplitude number
---@param frequency number
---@param duration number
---@param radius number
---@param command integer
---@param bAirborne boolean?
function UTIL.ScreenShake(origin, amplitude, frequency, duration, radius, command, bAirborne) end

---Screen shake effect on an object.
---@param ent CBaseEntity
---@param origin Vector
---@param amplitude number
---@param frequency number
---@param duration number
---@param radius number
---@param command integer
---@param bAirborne boolean?
function UTIL.ScreenShakeObject(ent, origin, amplitude, frequency, duration, radius, command, bAirborne) end

---View punch effect on a player.
---@param origin Vector
---@param angle QAngle
---@param magnitude number
---@param bClamp boolean
function UTIL.ViewPunch(origin, angle, magnitude, bClamp) end

---Show message to a player.
---@param msg string
---@param ply CBasePlayer
function UTIL.ShowMessage(msg, ply) end

---Show message to all players.
---@param msg string
function UTIL.ShowMessageAll(msg) end

---Create muzzle flash effect.
---@param origin Vector
---@param angle QAngle
---@param entIndex integer
---@param attachment integer
function UTIL.MuzzleFlash(origin, angle, entIndex, attachment) end

---Check if an entity is valid.
---@param ent CBaseEntity
---@return boolean
function UTIL.IsValid(ent) end

return UTIL
