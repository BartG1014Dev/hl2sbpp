---@class CBaseEntity
---@field m_bAllowPrecache boolean
---@field m_flAnimTime number
---@field m_flSimulationTime number
---@field m_flSpeed number
---@field m_iClassname string
---@field m_iHealth integer
---@field m_nLastThinkTick integer
---@field m_nModelIndex integer
---@field touchStamp integer
CBaseEntity = {}

---Return the DLL type string (module type).
---@return string
function CBaseEntity.GetDLLType() end

---Try to find parameters for a sound name (fills CSoundParameters).
---@param soundName string
---@param soundParams CSoundParameters
---@return boolean, CSoundParameters
function CBaseEntity.GetParametersForSound(soundName, soundParams) end

---Return the prediction player used by the engine (internal).
---@return CBasePlayer
function CBaseEntity.GetPredictionPlayer() end

---Return the prediction RNG seed (internal).
---@return integer
function CBaseEntity.GetPredictionRandomSeed() end

---Return whether absolute position queries are valid globally.
---@return boolean
function CBaseEntity.IsAbsQueriesValid() end

---Return whether precaching is allowed in global context.
---@return boolean
function CBaseEntity.IsPrecacheAllowed() end

---Return whether simulation alternates ticks (platform detail).
---@return boolean
function CBaseEntity.IsSimulatingOnAlternateTicks() end

---Return true if running in server context.
---@return boolean
function CBaseEntity.IsServer() end

---Activate the CBaseEntity (call spawn/initialization hooks).
---@return nil
function CBaseEntity:Activate() end

---Add a data object type to the CBaseEntity (game-specific).
---@param t integer
function CBaseEntity:AddDataObjectType(t) end

---Add rendering / simulation effects flags to the CBaseEntity.
---@param effects integer
function CBaseEntity:AddEffects(effects) end

---Add CBaseEntity flags (EFlags) to this CBaseEntity.
---@param eflags integer
function CBaseEntity:AddEFlags(eflags) end

---Add a boolean flag to the CBaseEntity bitmask.
---@param flag integer
function CBaseEntity:AddFlag(flag) end

---Add solid flags that change collision behaviour.
---@param flags integer
function CBaseEntity:AddSolidFlags(flags) end

---Apply an absolute velocity impulse (instant velocity change).
---@param impulse Vector
function CBaseEntity:ApplyAbsVelocityImpulse(impulse) end

---Apply a local angular velocity impulse to the CBaseEntity.
---@param angVel QAngle
function CBaseEntity:ApplyLocalAngularVelocityImpulse(angVel) end

---Return true if the CBaseEntity blocks line-of-sight.
---@return boolean
function CBaseEntity:BlocksLOS() end

---Return the CBaseEntity's blood color (for decal/particle logic).
---@return integer
function CBaseEntity:BloodColor() end

---Return a bounding radius used for various proximity checks.
---@return number
function CBaseEntity:BoundingRadius() end

---Change the team ID for this CBaseEntity.
---@param team integer
function CBaseEntity:ChangeTeam(team) end

---Clear all effects from the CBaseEntity.
---@return nil
function CBaseEntity:ClearEffects() end

---Clear CBaseEntity flags.
---@return nil
function CBaseEntity:ClearFlags() end

---Notify engine that collision rules have changed for this CBaseEntity.
---@return nil
function CBaseEntity:CollisionRulesChanged() end

---Compute absolute direction from local vector and store in dst.
---@param src Vector
---@param dst Vector
function CBaseEntity:ComputeAbsDirection(src, dst) end

---Compute absolute position from local pos and store in dst.
---@param src Vector
---@param dst Vector
function CBaseEntity:ComputeAbsPosition(src, dst) end

---Compute world-space bounding box for this CBaseEntity.
---@param mins Vector
---@param maxs Vector
function CBaseEntity:ComputeWorldSpaceSurroundingBox(mins, maxs) end

---Create a data object of the specified type for this CBaseEntity.
---@param type integer
function CBaseEntity:CreateDataObject(type) end

---Create a predicted CBaseEntity by classname (prediction helper).
---@param name string
---@param spawnname string
---@param flags integer
---@param predicted boolean
---@return CBaseEntity
function CBaseEntity.CreatePredictedEntityByName(name, spawnname, flags, predicted) end

---Initialize VPhysics for dynamic behaviours.
---@return boolean
function CBaseEntity:CreateVPhysics() end

---Return a decal name appropriate for a damage hitgroup/model.
---@param hitgroup integer
---@param modelIndex integer
---@return string
function CBaseEntity:DamageDecal(hitgroup, modelIndex) end

---Apply a decal trace to this CBaseEntity.
---@param tr trace_t
---@param decalName string
function CBaseEntity:DecalTrace(tr, decalName) end

---Destroy all data objects attached to this CBaseEntity.
---@return nil
function CBaseEntity:DestroyAllDataObjects() end

---Destroy a specific data object by id.
---@param id integer
function CBaseEntity:DestroyDataObject(id) end

---Dispatch a trace-based damage attack to the CBaseEntity.
---@param dmg CTakeDamageInfo
---@param dir Vector
---@param tr trace_t
function CBaseEntity:DispatchTraceAttack(dmg, dir, tr) end

---Run impact effects for a trace hit on the CBaseEntity.
---@param tr trace_t
---@param impactType integer
---@return nil
function CBaseEntity:DoImpactEffect(tr, impactType) end

---Return the CBaseEntity's ear position (sound/listening origin).
---@return Vector
function CBaseEntity:EarPosition() end

-- EmitSound overloads: CBaseEntity:EmitSound(name[, duration]) -> optionally returns duration
---@overload fun(self:CBaseEntity, soundName:string, duration?:number):number|nil
---@param ... any
function CBaseEntity:EmitSound(...) end

-- Static-style emit functions for filters and recipients
---@overload fun(filter:CRecipientFilter, channel:integer, name:string)
---@overload fun(filter:CRecipientFilter, channel:integer, ep:EmitSound_t)
function CBaseEntity.EmitSound(...) end

---Notify this CBaseEntity it stopped contacting another CBaseEntity's ground.
---@param other CBaseEntity
function CBaseEntity:EndGroundContact(other) end

---Notify this CBaseEntity it stopped touching another CBaseEntity.
---@param other CBaseEntity
function CBaseEntity:EndTouch(other) end

---Return this CBaseEntity's engine entindex().
---@return integer
function CBaseEntity:entindex() end

---Convert a local-space vector to world space using the CBaseEntity transform.
---@param inVec Vector
---@param outVec Vector
function CBaseEntity:EntityToWorldSpace(inVec, outVec) end

---Get the CBaseEntity's eye angles (if it has eyes).
---@return QAngle
function CBaseEntity:EyeAngles() end

---Get the CBaseEntity's eye position (if applicable).
---@return Vector
function CBaseEntity:EyePosition() end

---Fire bullets according to a FireBulletsInfo struct.
---@param info FireBulletsInfo
function CBaseEntity:FireBullets(info) end

---Return the first child in the movement hierarchy for this CBaseEntity.
---@return CBaseEntity
function CBaseEntity:FirstMoveChild() end

---Start following another CBaseEntity (attach following behaviour).
---@param other CBaseEntity
---@param follow boolean
function CBaseEntity:FollowEntity(other, follow) end

---Expand a string for gendered variations (game-specific text macro).
---@param str string
---@return string
function CBaseEntity:GenderExpandString(str) end

---Get absolute orientation angles.
---@return QAngle
function CBaseEntity:GetAbsAngles() end

---Get absolute origin position.
---@return Vector
function CBaseEntity:GetAbsOrigin() end

---Get absolute velocity vector.
---@return Vector
function CBaseEntity:GetAbsVelocity() end

---Get the current animation time for this CBaseEntity.
---@return number
function CBaseEntity:GetAnimTime() end

---Get the base animating interface for advanced animation control.
---@return CBaseAnimating
function CBaseEntity:GetBaseAnimating() end

---Return this CBaseEntity's underlying CBaseEntity (self).
---@return CBaseEntity
function CBaseEntity:GetBaseEntity() end

---Return the base velocity applied to the CBaseEntity.
---@return Vector
function CBaseEntity:GetBaseVelocity() end

---Return whether the CBaseEntity checks untouch events.
---@return boolean
function CBaseEntity:GetCheckUntouch() end

---Return the classname string for this CBaseEntity type.
---@return string
function CBaseEntity:GetClassname() end

---Return the collision group the CBaseEntity belongs to.
---@return integer
function CBaseEntity:GetCollisionGroup() end

---Access a data object by id (implementation-specific).
---@param id integer
function CBaseEntity:GetDataObject(id) end

---Return a debug-friendly name for this CBaseEntity.
---@return string
function CBaseEntity:GetDebugName() end

---Return the DLL type (static helper).
---@return string
function CBaseEntity:GetDLLType() end

---Return an associated effect CBaseEntity (if set).
---@return CBaseEntity
function CBaseEntity:GetEffectEntity() end

---Return current effect flags.
---@return integer
function CBaseEntity:GetEffects() end

---Return current CBaseEntity flags (EFlags).
---@return integer
function CBaseEntity:GetEFlags() end

---Return elasticity used in physics bounces.
---@return number
function CBaseEntity:GetElasticity() end

---Return first think tick for scheduled think functions.
---@return integer
function CBaseEntity:GetFirstThinkTick() end

---Return current flags bitmask.
---@return integer
function CBaseEntity:GetFlags() end

---Return the CBaseEntity being followed by this CBaseEntity (if any).
---@return CBaseEntity
function CBaseEntity:GetFollowedEntity() end

---Return gravity multiplier used by this CBaseEntity.
---@return number
function CBaseEntity:GetGravity() end

---Return the last ground change time for this CBaseEntity.
---@return number
function CBaseEntity:GetGroundChangeTime() end

---Return CBaseEntity currently considered ground for this CBaseEntity.
---@return CBaseEntity
function CBaseEntity:GetGroundEntity() end

---Return the CBaseEntity's current health (if applicable).
---@return integer
function CBaseEntity:GetHealth() end

---Retrieve a keyvalue by name from the CBaseEntity; returns success and the value.
---@param key string
---@return boolean, string
function CBaseEntity:GetKeyValue(key) end

---Get the time of the last think call (optionally specific named think).
---@param name? string
---@return number
function CBaseEntity:GetLastThink(name) end

---Get the tick number of the last think for a named context.
---@param name string
---@return integer
function CBaseEntity:GetLastThinkTick(name) end

---Return local-space orientation angles.
---@return QAngle
function CBaseEntity:GetLocalAngles() end

---Return local-space angular velocity.
---@return QAngle
function CBaseEntity:GetLocalAngularVelocity() end

---Return local origin position.
---@return Vector
function CBaseEntity:GetLocalOrigin() end

---Return local-space linear velocity.
---@return Vector
function CBaseEntity:GetLocalVelocity() end

---Get the maximum health for the CBaseEntity (if applicable).
---@return integer
function CBaseEntity:GetMaxHealth() end

---Get the model index used by the CBaseEntity.
---@return integer
function CBaseEntity:GetModelIndex() end

---Get the model name (string) used by the CBaseEntity.
---@return string
function CBaseEntity:GetModelName() end

---Return the CBaseEntity this one is parented to (if any).
---@return CBaseEntity
function CBaseEntity:GetMoveParent() end

---Return the type of movement for the CBaseEntity (MoveType enum).
---@return integer
function CBaseEntity:GetMoveType() end

---Return the owner CBaseEntity (who spawned/owns this CBaseEntity).
---@return CBaseEntity
function CBaseEntity:GetOwnerEntity() end

---Helper to get parameters for a sound name (wraps internal lookup).
---@param soundName string
---@param outType? string
---@return boolean, CSoundParameters
function CBaseEntity.GetParametersForSound(soundName, outType) end

---Return the player used for prediction (if any).
---@return CBasePlayer
function CBaseEntity:GetPredictionPlayer() end

---Return the integer RNG seed used for prediction.
---@return integer
function CBaseEntity:GetPredictionRandomSeed() end

---If the CBaseEntity has a Lua ref table attached, return it (or nil).
---@return table|nil
function CBaseEntity:GetRefTable() end

---If this CBaseEntity is simulated by a player, return that player.
---@return CBasePlayer
function CBaseEntity:GetSimulatingPlayer() end

---Return the simulation time for the CBaseEntity (seconds).
---@return number
function CBaseEntity:GetSimulationTime() end

---Return the solid type for this CBaseEntity.
---@return integer
function CBaseEntity:GetSolid() end

---Return the solid flags mask for this CBaseEntity.
---@return integer
function CBaseEntity:GetSolidFlags() end

---Return duration of a sound name (helper).
---@param sound string
---@param sound2 string
---@return number
function CBaseEntity.GetSoundDuration(sound, sound2) end

---Return the index used as sound source for this CBaseEntity.
---@return integer
function CBaseEntity:GetSoundSourceIndex() end

---Return the team number assigned to this CBaseEntity.
---@return integer
function CBaseEntity:GetTeamNumber() end

---Return the texture frame index for animated textures.
---@return integer
function CBaseEntity:GetTextureFrameIndex() end

---Return the last touch trace for this CBaseEntity (engine stored).
---@return trace_t
function CBaseEntity:GetTouchTrace() end

---Return the tracer attachment number used for shooting effects.
---@return integer
function CBaseEntity:GetTracerAttachment() end

---Return the tracer type string used by the CBaseEntity.
---@return string
function CBaseEntity:GetTracerType() end

---Return the forward/right/up vectors for the CBaseEntity's orientation.
---@return Vector, Vector, Vector
function CBaseEntity:GetVectors() end

---Return the view offset (camera offset) for this CBaseEntity.
---@return Vector
function CBaseEntity:GetViewOffset() end

---Return water immersion level for this CBaseEntity.
---@return integer
function CBaseEntity:GetWaterLevel() end

---Return type of water the CBaseEntity is in (game-specific).
---@return integer
function CBaseEntity:GetWaterType() end

---Return true if CBaseEntity has a given data object type attached.
---@param type integer
---@return boolean
function CBaseEntity:HasDataObjectType(type) end

---Return true if there are NPCs standing on this CBaseEntity.
---@return boolean
function CBaseEntity:HasNPCsOnIt() end

---Perform impact trace handling for a weapon/attack.
---@param tr trace_t
---@param type integer
function CBaseEntity:ImpactTrace(tr, type) end

---Return whether two entities are on the same team.
---@param other CBaseEntity
---@return boolean
function CBaseEntity:InSameTeam(other) end

---Return whether absolute position queries are valid for entities.
---@return boolean
function CBaseEntity:IsAbsQueriesValid() end

---Return whether the CBaseEntity is walkable by AI.
---@return boolean
function CBaseEntity:IsAIWalkable() end

---Return whether the CBaseEntity is alive (has health > 0).
---@return boolean
function CBaseEntity:IsAlive() end

---Return whether the CBaseEntity animates every tick (client-side).
---@return boolean
function CBaseEntity:IsAnimatedEveryTick() end

---Return whether the CBaseEntity is a base object (map/generic object).
---@return boolean
function CBaseEntity:IsBaseObject() end

---Return whether the CBaseEntity is a train CBaseEntity base type.
---@return boolean
function CBaseEntity:IsBaseTrain() end

---Return whether the CBaseEntity is a BSP (world) model.
---@return boolean
function CBaseEntity:IsBSPModel() end

---Return whether context is client.
---@return boolean
function CBaseEntity:IsClient() end

---Return whether this CBaseEntity is currently touching something.
---@return boolean
function CBaseEntity:IsCurrentlyTouching() end

---Return whether the CBaseEntity is dormant (not being networked).
---@return boolean
function CBaseEntity:IsDormant() end

---Return whether a particular effect flag is active.
---@param effect integer
---@return boolean
function CBaseEntity:IsEffectActive(effect) end

---Return whether a specific EFlag bit is set.
---@param eflag integer
---@return boolean
function CBaseEntity:IsEFlagSet(eflag) end

---Return whether the CBaseEntity is floating (physics).
---@return boolean
function CBaseEntity:IsFloating() end

---Return whether the CBaseEntity is following another CBaseEntity.
---@return boolean
function CBaseEntity:IsFollowingEntity() end

---Return whether the CBaseEntity is inside world bounds.
---@return boolean
function CBaseEntity:IsInWorld() end

---Return whether the CBaseEntity is marked for deletion.
---@return boolean
function CBaseEntity:IsMarkedForDeletion() end

---Return whether the CBaseEntity is an NPC.
---@return boolean
function CBaseEntity:IsNPC() end

---Return whether the CBaseEntity is a player.
---@return boolean
function CBaseEntity:IsPlayer() end

---Return whether the CBaseEntity is simulated by player code.
---@return boolean
function CBaseEntity:IsPlayerSimulated() end

---Return whether the CBaseEntity is point-sized (no volume).
---@return boolean
function CBaseEntity:IsPointSized() end

---Return whether the CBaseEntity is allowed precache (static global).
---@return boolean
function CBaseEntity:IsPrecacheAllowed() end

---Return whether the server context is active.
---@return boolean
function CBaseEntity:IsServer() end

---Return whether CBaseEntity is simulated every tick (physics).
---@return boolean
function CBaseEntity:IsSimulatedEveryTick() end

---Return whether simulation alternates ticks globally.
---@return boolean
function CBaseEntity:IsSimulatingOnAlternateTicks() end

---Return whether CBaseEntity is considered solid.
---@return boolean
function CBaseEntity:IsSolid() end

---Return whether a specific solid flag is set.
---@param flag integer
---@return boolean
function CBaseEntity:IsSolidFlagSet(flag) end

---Return whether the CBaseEntity can be stood upon.
---@return boolean
function CBaseEntity:IsStandable() end

---Return whether the CBaseEntity is transparent for rendering.
---@return boolean
function CBaseEntity:IsTransparent() end

---Return whether the CBaseEntity is considered a weapon.
---@return boolean
function CBaseEntity:IsWeapon() end

---Generic KeyValue setter/reader helper exposed to Lua.
---@param key string
---@param value any
---@return boolean
function CBaseEntity:KeyValue(key, value) end

---Return the eye angles relative to the CBaseEntity's local space.
---@return QAngle
function CBaseEntity:LocalEyeAngles() end

---Get the next move peer (movement link) for this CBaseEntity.
---@return CBaseEntity
function CBaseEntity:NextMovePeer() end

---Return capability flags that describe the object.
---@return integer
function CBaseEntity:ObjectCaps() end

---Hook called when CBaseEntity is restored from save / map load.
---@return nil
function CBaseEntity:OnRestore() end

---Run any checks related to physics untouch events.
---@return nil
function CBaseEntity:PhysicsCheckForEntityUntouch() end

---Check for water physics conditions (returns boolean).
---@return boolean
function CBaseEntity:PhysicsCheckWater() end

---Handle water transition notifications for physics.
---@return nil
function CBaseEntity:PhysicsCheckWaterTransition() end

---Handle a physics impact event against another CBaseEntity.
---@param other CBaseEntity
---@param tr trace_t
function CBaseEntity:PhysicsImpact(other, tr) end

---Mark two entities as touching in physics.
---@param other CBaseEntity
---@param tr trace_t
function CBaseEntity:PhysicsMarkEntitiesAsTouching(other, tr) end

---Notify other systems that ground was removed from an CBaseEntity (static helper).
---@param ent CBaseEntity
function CBaseEntity.PhysicsNotifyOtherOfGroundRemoval(ent, other) end

---Notify other systems that an untouch occured (static helper).
---@param ent CBaseEntity
function CBaseEntity.PhysicsNotifyOtherOfUntouch(ent, other) end

---Remove the physics ground list for an CBaseEntity (static helper).
---@param ent CBaseEntity
function CBaseEntity.PhysicsRemoveGroundList(ent) end

---Remove the physics touched list for an CBaseEntity (static helper).
---@param ent CBaseEntity
function CBaseEntity.PhysicsRemoveTouchedList(ent) end

---Perform per-CBaseEntity physics simulation step.
---@return nil
function CBaseEntity:PhysicsSimulate() end

---Get the physics mask used for collision for this CBaseEntity.
---@return integer
function CBaseEntity:PhysicsSolidMaskForEntity() end

---Begin ground contact simulation with another CBaseEntity.
---@param other CBaseEntity
function CBaseEntity:PhysicsStartGroundContact(other) end

---Precache assets referenced by this CBaseEntity.
---@return nil
function CBaseEntity:Precache() end

---Precache a model and return its index.
---@param model string
---@return integer
function CBaseEntity.PrecacheModel(model) end

---Precache a script-defined sound and return its id.
---@param sound string
---@return integer
function CBaseEntity.PrecacheScriptSound(sound) end

---Precache a sound file (returns success).
---@param sound string
---@return boolean
function CBaseEntity.PrecacheSound(sound) end

---Hint the engine to prefetch a script sound (no return).
---@param sound string
---@return nil
function CBaseEntity.PrefetchScriptSound(sound) end

---Hint the engine to prefetch a sound file (no return).
---@param sound string
---@return nil
function CBaseEntity.PrefetchSound(sound) end

---Register a named think context and return its id.
---@param name string
---@return integer
function CBaseEntity:RegisterThinkContext(name) end

---Remove this CBaseEntity from the world (despawn/destruct).
---@return nil
function CBaseEntity:Remove() end

---Remove all decals applied to this CBaseEntity.
---@return nil
function CBaseEntity:RemoveAllDecals() end

---Remove a data object type assignment.
---@param type integer
function CBaseEntity:RemoveDataObjectType(type) end

---Remove effect flags from this CBaseEntity.
---@param effects integer
function CBaseEntity:RemoveEffects(effects) end

---Remove EFlags bits from this CBaseEntity.
---@param eflags integer
function CBaseEntity:RemoveEFlags(eflags) end

---Remove a flag bit from the CBaseEntity.
---@param flag integer
function CBaseEntity:RemoveFlag(flag) end

---Remove solid flags from the CBaseEntity's collision mask.
---@param flags integer
function CBaseEntity:RemoveSolidFlags(flags) end

---Set absolute orientation angles for this CBaseEntity.
---@param ang QAngle
function CBaseEntity:SetAbsAngles(ang) end

---Set absolute origin position for this CBaseEntity.
---@param pos Vector
function CBaseEntity:SetAbsOrigin(pos) end

---Globally enable/disable absolute query validity.
---@param allow boolean
function CBaseEntity.SetAbsQueriesValid(allow) end

---Set absolute linear velocity for the CBaseEntity.
---@param vel Vector
function CBaseEntity:SetAbsVelocity(vel) end

---Enable or disable AI walkability on the CBaseEntity.
---@param walkable boolean
function CBaseEntity:SetAIWalkable(walkable) end

---Globally allow or disallow precaching.
---@param allow boolean
function CBaseEntity.SetAllowPrecache(allow) end

---Force this CBaseEntity to animate every tick.
---@param ticked boolean
function CBaseEntity:SetAnimatedEveryTick(ticked) end

---Set the animation playback time for this CBaseEntity.
---@param t number
function CBaseEntity:SetAnimTime(t) end

---Set a base velocity applied to the CBaseEntity each physics step.
---@param vel Vector
function CBaseEntity:SetBaseVelocity(vel) end

---Set whether this CBaseEntity blocks line-of-sight.
---@param blocks boolean
function CBaseEntity:SetBlocksLOS(blocks) end

---Set whether the CBaseEntity checks untouch events.
---@param check boolean
function CBaseEntity:SetCheckUntouch(check) end

---Set an arbitrary classname string for this CBaseEntity (rarely used).
---@param name string
function CBaseEntity:SetClassname(name) end

---Set custom collision bounds (mins/maxs) for this CBaseEntity.
---@param mins Vector
---@param maxs Vector
function CBaseEntity:SetCollisionBounds(mins, maxs) end

---Set the collision group for this CBaseEntity.
---@param group integer
function CBaseEntity:SetCollisionGroup(group) end

---Assign an CBaseEntity to be used for special effects.
---@param ent CBaseEntity
function CBaseEntity:SetEffectEntity(ent) end

---Set effect flags (rendering/behaviour) to this CBaseEntity.
---@param effects integer
function CBaseEntity:SetEffects(effects) end

---Set CBaseEntity flags (EFlags).
---@param eflags integer
function CBaseEntity:SetEFlags(eflags) end

---Set friction coefficient for physics interactions.
---@param friction number
function CBaseEntity:SetFriction(friction) end

---Set gravity multiplier for this CBaseEntity.
---@param gravity number
function CBaseEntity:SetGravity(gravity) end

---Set the time when the CBaseEntity last changed ground.
---@param t number
function CBaseEntity:SetGroundChangeTime(t) end

---Set which CBaseEntity counts as ground beneath this CBaseEntity.
---@param groundEnt CBaseEntity
function CBaseEntity:SetGroundEntity(groundEnt) end

---Set the current health for this CBaseEntity.
---@param hp integer
function CBaseEntity:SetHealth(hp) end

---Set local-space orientation angles.
---@param ang QAngle
function CBaseEntity:SetLocalAngles(ang) end

---Set local angular velocity.
---@param vel QAngle
function CBaseEntity:SetLocalAngularVelocity(vel) end

---Set local origin position.
---@param pos Vector
function CBaseEntity:SetLocalOrigin(pos) end

---Set local linear velocity.
---@param vel Vector
function CBaseEntity:SetLocalVelocity(vel) end

---Set the model for this CBaseEntity; client returns success boolean.
---@param model string
---@return boolean|nil
function CBaseEntity:SetModel(model) end

---Set the CBaseEntity's model index manually.
---@param idx integer
function CBaseEntity:SetModelIndex(idx) end

---Set the CBaseEntity's model name string (internal representation).
---@param name string
function CBaseEntity:SetModelName(name) end

---Set move-collide behaviour (how the CBaseEntity collides while moving).
---@param movecollide integer
function CBaseEntity:SetMoveCollide(movecollide) end

---Set move type and optional move-collide for this CBaseEntity.
---@param movetype integer
---@param movecollide? integer
function CBaseEntity:SetMoveType(movetype, movecollide) end

---Schedule the next think time for the CBaseEntity.
---@param t number
function CBaseEntity:SetNextThink(t) end

---Set owner CBaseEntity for ownership tracking.
---@param owner CBaseEntity
function CBaseEntity:SetOwnerEntity(owner) end

---Parent this CBaseEntity to another CBaseEntity (attachment index optional).
---@param parent CBaseEntity
---@param attachment integer
function CBaseEntity:SetParent(parent, attachment) end

---Mark this CBaseEntity as simulated by the given player.
---@param player CBasePlayer
function CBaseEntity:SetPlayerSimulated(player) end

---Make this CBaseEntity eligible for prediction.
---@param eligible boolean
function CBaseEntity:SetPredictionEligible(eligible) end

---Set the prediction player for static contexts (global).
---@param player CBasePlayer
function CBaseEntity.SetPredictionPlayer(player) end

--- Fires an input on this CBaseEntity.
---
---@param inputName string The name of the input to fire (matches `DEFINE_INPUT` names)
---@param value string|nil Optional string value to pass to the input (default `""`)
---@param delay number|nil Optional delay in seconds before the input is processed (default `0`)
---@param activator CBaseEntity|nil Optional CBaseEntity that triggered this input (default `nil`)
---@param caller CBaseEntity|nil Optional CBaseEntity that is considered the caller of this input (default `nil`)
---@return boolean True if the input was handled successfully, false otherwise
function CBaseEntity:Fire(inputName, value, delay, activator, caller) end

---Set the G channel of the render color.
---@param g number
function CBaseEntity:SetRenderColorG(g) end

---Set the R channel of the render color.
---@param r number
function CBaseEntity:SetRenderColorR(r) end

---Toggle whether this CBaseEntity is simulated every physics tick.
---@param simEveryTick boolean
function CBaseEntity:SetSimulatedEveryTick(simEveryTick) end

---Set the simulation time value for this CBaseEntity.
---@param t number
function CBaseEntity:SetSimulationTime(t) end

---Set the collision size (mins/maxs) for this CBaseEntity.
---@param mins Vector
---@param maxs Vector
function CBaseEntity:SetSize(mins, maxs) end

---Set the CBaseEntity's solid type enumeration.
---@param solidType integer
function CBaseEntity:SetSolid(solidType) end

---Set the integer solid flags mask on the CBaseEntity.
---@param flags integer
function CBaseEntity:SetSolidFlags(flags) end

---Set the frame index used for texture animation on the model.
---@param idx integer
function CBaseEntity:SetTextureFrameIndex(idx) end

---Set the view offset used by players/AI for camera height.
---@param offset Vector
function CBaseEntity:SetViewOffset(offset) end

---Set the view CBaseEntity
---@param CBaseEntity CBaseEntity
function CBaseEntity:SetViewEntity(CBaseEntity) end

---Set the water immersion level for the CBaseEntity.
---@param level integer
function CBaseEntity:SetWaterLevel(level) end

---Set the water type the CBaseEntity is in (game-specific id).
---@param waterType integer
function CBaseEntity:SetWaterType(waterType) end

---Check whether two collision groups should collide.
---@param a integer
---@param b integer
---@return boolean
function CBaseEntity:ShouldCollide(a, b) end

---Return whether the CBaseEntity's physics should be saved.
---@return boolean
function CBaseEntity:ShouldSavePhysics() end

---Spawn the CBaseEntity into the world (call spawn hooks).
---@return nil
function CBaseEntity:Spawn() end

---Notify start of ground contact with another CBaseEntity.
---@param other CBaseEntity
function CBaseEntity:StartGroundContact(other) end

---Notify start of touch with another CBaseEntity.
---@param other CBaseEntity
function CBaseEntity:StartTouch(other) end

---Stop following any CBaseEntity (clear parent/following state).
---@return nil
function CBaseEntity:StopFollowingEntity() end

---Call the CBaseEntity's SUB_Remove() method (engine removal helper).
---@return nil
function CBaseEntity:SUB_Remove() end

---Entity think callback (per-frame logical update).
---@return nil
function CBaseEntity:Think() end

---Toggle a single flag bit on/off.
---@param flag integer
function CBaseEntity:ToggleFlag(flag) end

---Generic touch handler called when CBaseEntity collides/contacts others.
---@param other CBaseEntity
function CBaseEntity:Touch(other) end

---Apply blood/decal effects from a damage trace (trace bleed helper).
---@param dmg number
---@param dir Vector
---@param tr trace_t
---@param hitgroup integer
function CBaseEntity:TraceBleed(dmg, dir, tr, hitgroup) end

---Unset any player-simulated flag on the CBaseEntity.
---@return nil
function CBaseEntity:UnsetPlayerSimulated() end

---Update cleanup or network state when the CBaseEntity is removed/updated.
---@return nil
function CBaseEntity:UpdateOnRemove() end

---Destroy any VPhysics object associated with this CBaseEntity.
---@return nil
function CBaseEntity:VPhysicsDestroyObject() end

---Return the VPhysics object attached to this CBaseEntity if any.
---@return IPhysicsObject
function CBaseEntity:VPhysicsGetObject() end

---Return a table and count of physics objects attached to this CBaseEntity.
---@return integer, table<number, IPhysicsObject>
function CBaseEntity:VPhysicsGetObjectList() end

---Initialize normal vphysics object (dynamic) for the CBaseEntity.
---@param solidType integer
---@param key integer
---@param static boolean
---@return IPhysicsObject
function CBaseEntity:VPhysicsInitNormal(solidType, key, static) end

---Initialize a static vphysics object.
---@return IPhysicsObject
function CBaseEntity:VPhysicsInitStatic() end

---Return true if this CBaseEntity's vphysics material is flesh-like.
---@return boolean
function CBaseEntity:VPhysicsIsFlesh() end

---Attach an IPhysicsObject to this CBaseEntity.
---@param obj IPhysicsObject
function CBaseEntity:VPhysicsSetObject(obj) end

---Update the attached physics object with new state from Lua.
---@param obj IPhysicsObject
function CBaseEntity:VPhysicsUpdate(obj) end

---Wake any objects resting on this CBaseEntity (physics).
---@return nil
function CBaseEntity:WakeRestingObjects() end

---Return the world-aligned maximum extents for this CBaseEntity's model.
---@return Vector
function CBaseEntity:WorldAlignMaxs() end

---Return the world-aligned minimum extents for this CBaseEntity's model.
---@return Vector
function CBaseEntity:WorldAlignMins() end

---Return the world-aligned size (maxs - mins) for this CBaseEntity.
---@return Vector
function CBaseEntity:WorldAlignSize() end

---Return the world-space center point of this CBaseEntity's model.
---@return Vector
function CBaseEntity:WorldSpaceCenter() end

---Transform a vector from world space into CBaseEntity local space.
---@param inVec Vector
---@param outVec Vector
function CBaseEntity:WorldToEntitySpace(inVec, outVec) end

-- metamethods (for completeness)
---Equality metamethod for entities (same underlying pointer).
---@return boolean
function CBaseEntity.__eq(a, b) end

---Tostring metamethod: human-friendly CBaseEntity description.
---@return string
function CBaseEntity.__tostring() end

---Set the render color (r,g,b,a) for this CBaseEntity.
---@param r integer
---@param g integer
---@param b integer
---@param a integer
function CBaseEntity:SetRenderColor(r, g, b, a) end

---Set the render alpha (a) channel.
---@param a number
function CBaseEntity:SetRenderColorA(a) end

---Set the B channel of the render color.
---@param b number
function CBaseEntity:SetRenderColorB(b) end

---Create an CBaseEntity instance by class name (factory).
---@param name string
---@return CBaseEntity
function CreateEntityByName(name) end

return CBaseEntity
