
--- CBaseAnimating library providing methods for manipulating animating entities.
--- @class CBaseAnimating : CBaseEntity
CBaseAnimating = {}

--- Adds a glow effect to the animating entity.
---@param self CBaseAnimating The entity to add the glow to
function CBaseAnimating:AddGlowEffect() end

--- Removes the glow effect from the animating entity.
---@param self CBaseAnimating The entity to remove the glow from
function CBaseAnimating:RemoveGlowEffect() end

--- Sets the color of the glow effect.
---@param self CBaseAnimating The entity to set the glow color on
---@param r integer Red component (0-255)
---@param g integer Green component (0-255)
---@param b integer Blue component (0-255)
function CBaseAnimating:SetGlowEffectColor(r, g, b) end

--- Checks if the glow effect is currently active on the entity.
---@param self CBaseAnimating The entity to check
---@return boolean True if the glow is active, false otherwise
function CBaseAnimating:IsGlowEffectActive() end

--- Adds the entity to the game world.
function CBaseAnimating:AddEntity() end

--- Gets the BaseFlex of the entity
---@return CBaseFlex
function CBaseAnimating:GetBaseFlex() end 

--- Adds the entity to the client-side animation list.
function CBaseAnimating:AddToClientSideAnimationList() end

--- Converts the entity to a ragdoll on the client.
--- @return CBaseAnimating ragdoll The resulting ragdoll entity.
function CBaseAnimating:BecomeRagdollOnClient() end

--- Calculates inverse kinematics (IK) locks for the entity at a given time.
--- @param currentTime number The current time for IK calculations.
function CBaseAnimating:CalculateIKLocks(currentTime) end

--- Clamps the animation cycle value.
--- @param cycle number The cycle value to clamp.
--- @param isLooping boolean Whether the sequence is looping.
--- @return number clampedCycle The clamped cycle value.
function CBaseAnimating:ClampCycle(cycle, isLooping) end

--- Clears the entity's animation state.
function CBaseAnimating:Clear() end

--- Clears the entity's ragdoll state.
function CBaseAnimating:ClearRagdoll() end

--- Notifies the entity of a client-side animation change.
function CBaseAnimating:ClientSideAnimationChanged() end

--- Computes flags for client-side animation.
--- @return integer flags The computed animation flags.
function CBaseAnimating:ComputeClientSideAnimationFlags() end

--- Computes the entity-space hitbox surrounding box.
--- @return boolean success Whether the computation was successful.
--- @return Vector mins The minimum bounds of the hitbox.
--- @return Vector maxs The maximum bounds of the hitbox.
function CBaseAnimating:ComputeEntitySpaceHitboxSurroundingBox() end

--- Computes the world-space hitbox surrounding box.
--- @return boolean success Whether the computation was successful.
--- @return Vector mins The minimum bounds of the hitbox.
--- @return Vector maxs The maximum bounds of the hitbox.
function CBaseAnimating:ComputeHitboxSurroundingBox() end

--- Creates a copy of the entity as a ragdoll.
--- @return CBaseAnimating ragdoll The created ragdoll entity.
function CBaseAnimating:CreateRagdollCopy() end

--- Creates unragdoll information from another animating entity.
--- @param other CBaseAnimating The source animating entity.
function CBaseAnimating:CreateUnragdollInfo(other) end

--- Disables the muzzle flash effect.
function CBaseAnimating:DisableMuzzleFlash() end

--- Dispatches a muzzle effect.
--- @param effectName string The name of the muzzle effect.
--- @param isFirstPerson boolean Whether the effect is in first-person view.
--- @return boolean success Whether the effect was dispatched successfully.
function CBaseAnimating:DispatchMuzzleEffect(effectName, isFirstPerson) end

--- Triggers a muzzle flash effect.
function CBaseAnimating:DoMuzzleFlash() end

--- Draws client-side hitboxes for debugging.
--- @param duration? number Duration to display hitboxes (default: 0.0).
--- @param monoColor? boolean Whether to use a single color (default: false).
function CBaseAnimating:DrawClientHitboxes(duration, monoColor) end

--- Draws the entity's model with specified flags.
--- @param flags integer The draw flags.
--- @return integer result The result of the draw operation.
function CBaseAnimating:DrawModel(flags) end

--- Finds a bodygroup by its name.
--- @param name string The name of the bodygroup.
--- @return integer bodygroupId The ID of the bodygroup, or -1 if not found.
function CBaseAnimating:FindBodygroupByName(name) end

--- Finds the entity being followed by this entity.
--- @return CBaseAnimating entity The followed entity, or nil if none.
function CBaseAnimating:FindFollowedEntity() end

--- Finds a transition sequence between two sequences.
--- @param currentSequence integer The current sequence ID.
--- @param goalSequence integer The target sequence ID.
--- @return integer sequenceId The transition sequence ID.
--- @return integer direction The direction of the transition.
function CBaseAnimating:FindTransitionSequence(currentSequence, goalSequence) end

--- Fires an event with specified parameters.
--- @param origin Vector The origin of the event.
--- @param angles QAngle The angles of the event.
--- @param event integer The event ID.
--- @param options string The event options.
function CBaseAnimating:FireEvent(origin, angles, event, options) end

--- Fires an obsolete event with specified parameters.
--- @param origin Vector The origin of the event.
--- @param angles QAngle The angles of the event.
--- @param event integer The event ID.
--- @param options string The event options.
function CBaseAnimating:FireObsoleteEvent(origin, angles, event, options) end

--- Forces client-side animation to be enabled.
function CBaseAnimating:ForceClientSideAnimationOn() end

--- Advances the animation frame.
--- @param frameTime? number The time to advance (default: 0.0).
--- @return number frameTime The actual time advanced.
function CBaseAnimating:FrameAdvance(frameTime) end

--- Gets the aim entity's origin and angles.
--- @param aimEntity CBaseEntity The entity to aim at.
--- @param origin Vector The output origin.
--- @param angles QAngle The output angles.
function CBaseAnimating:GetAimEntOrigin(aimEntity, origin, angles) end

--- Gets the time interval for animations.
--- @return number interval The animation time interval.
function CBaseAnimating:GetAnimTimeInterval() end

--- Gets the position (and optionally angles) of an attachment by index or name.
--- @param attachment string|integer The attachment name or index.
--- @param origin Vector The output position.
--- @param angles? QAngle The output angles (optional).
--- @return boolean success Whether the attachment was found.
function CBaseAnimating:GetAttachment(attachment, origin, angles) end

--- Gets the local position and angles of an attachment by index.
--- @param attachmentIndex integer The attachment index.
--- @param origin Vector The output local position.
--- @param angles QAngle The output local angles.
--- @return boolean success Whether the attachment was found.
function CBaseAnimating:GetAttachmentLocal(attachmentIndex, origin, angles) end

--- Gets the velocity of an attachment.
--- @param attachmentIndex integer The attachment index.
--- @param originVel Vector The output origin velocity.
--- @return boolean success Whether the velocity was retrieved.
function CBaseAnimating:GetAttachmentVelocity(attachmentIndex, originVel) end

--- Gets the base animating entity.
--- @return CBaseAnimating entity The base animating entity.
function CBaseAnimating:GetBaseAnimating() end

--- Gets the blended linear velocity of the entity.
--- @return Vector velocity The blended linear velocity.
function CBaseAnimating:GetBlendedLinearVelocity() end

--- Gets the body index of the entity.
--- @return integer body The body index.
function CBaseAnimating:GetBody() end

--- Gets the bodygroup value for a specific group.
--- @param group integer The bodygroup index.
--- @return integer value The bodygroup value.
function CBaseAnimating:GetBodygroup(group) end

--- Gets the number of sub-bodygroups in a bodygroup.
--- @param group integer The bodygroup index.
--- @return integer count The number of sub-bodygroups.
function CBaseAnimating:GetBodygroupCount(group) end

--- Gets the name of a bodygroup.
--- @param group integer The bodygroup index.
--- @return string name The name of the bodygroup.
function CBaseAnimating:GetBodygroupName(group) end

--- Gets the bone controllers' values.
--- @return number[] controllers An array of up to 4 bone controller values.
function CBaseAnimating:GetBoneControllers() end

--- Gets the position and angles of a bone.
--- @param boneIndex integer The bone index.
--- @param origin Vector The output position.
--- @param angles QAngle The output angles.
function CBaseAnimating:GetBonePosition(boneIndex, origin, angles) end

--- Gets the client-side fade value.
--- @return integer fade The fade value.
function CBaseAnimating:GetClientSideFade() end

--- Gets the collision type of the entity.
--- @return integer collideType The collision type.
function CBaseAnimating:GetCollideType() end

--- Gets the current animation cycle.
--- @return number cycle The current cycle value (0.0 to 1.0).
function CBaseAnimating:GetCycle() end

--- Gets the name of a flex controller.
--- @param controllerIndex integer The flex controller index.
--- @return string name The name of the flex controller.
function CBaseAnimating:GetFlexControllerName(controllerIndex) end

--- Gets the type of a flex controller.
--- @param controllerIndex integer The flex controller index.
--- @return string type The type of the flex controller.
function CBaseAnimating:GetFlexControllerType(controllerIndex) end

--- Gets the flex descriptor factors.
--- @param flexIndex integer The flex descriptor index.
--- @return string factors The flex descriptor factors.
function CBaseAnimating:GetFlexDescFacs(flexIndex) end

--- Gets the current hitbox set index.
--- @return integer hitboxSet The hitbox set index.
function CBaseAnimating:GetHitboxSet() end

--- Gets the number of hitbox sets.
--- @return integer count The number of hitbox sets.
function CBaseAnimating:GetHitboxSetCount() end

--- Gets the name of the current hitbox set.
--- @return string name The name of the hitbox set.
function CBaseAnimating:GetHitboxSetName() end

--- Gets the number of bodygroups.
--- @return integer count The number of bodygroups.
function CBaseAnimating:GetNumBodyGroups() end

--- Gets the number of flex controllers.
--- @return integer count The number of flex controllers.
function CBaseAnimating:GetNumFlexControllers() end

--- Gets the current playback rate.
--- @return number rate The playback rate.
function CBaseAnimating:GetPlaybackRate() end

--- Gets the value of a pose parameter by index.
--- @param paramIndex integer The pose parameter index.
--- @return number value The pose parameter value.
function CBaseAnimating:GetPoseParameter(paramIndex) end

--- Gets the range of a pose parameter.
--- @param paramIndex integer The pose parameter index.
--- @return boolean success Whether the range was retrieved.
--- @return number minValue The minimum value of the pose parameter.
--- @return number maxValue The maximum value of the pose parameter.
function CBaseAnimating:GetPoseParameterRange(paramIndex) end

--- Gets the render angles of the entity.
--- @return QAngle angles The render angles.
function CBaseAnimating:GetRenderAngles() end

--- Gets the render bounds of the entity.
--- @return Vector mins The minimum bounds.
--- @return Vector maxs The maximum bounds.
function CBaseAnimating:GetRenderBounds() end

--- Gets the render origin of the entity.
--- @return Vector origin The render origin.
function CBaseAnimating:GetRenderOrigin() end

--- Gets the current sequence index.
--- @return integer sequence The sequence index.
function CBaseAnimating:GetSequence() end

--- Gets the activity of a sequence.
--- @param sequence integer The sequence index.
--- @return integer activity The activity ID.
function CBaseAnimating:GetSequenceActivity(sequence) end

--- Gets the name of the activity for a sequence.
--- @param sequence integer The sequence index.
--- @return string name The activity name.
function CBaseAnimating:GetSequenceActivityName(sequence) end

--- Gets the ground speed of a sequence.
--- @param sequence integer The sequence index.
--- @return number speed The ground speed.
function CBaseAnimating:GetSequenceGroundSpeed(sequence) end

--- Gets the linear motion of a sequence.
--- @param sequence integer The sequence index.
--- @return Vector motion The linear motion vector.
function CBaseAnimating:GetSequenceLinearMotion(sequence) end

--- Gets the name of a sequence.
--- @param sequence integer The sequence index.
--- @return string name The sequence name.
function CBaseAnimating:GetSequenceName(sequence) end

--- Gets the server-intended animation cycle.
--- @return number cycle The server-intended cycle value.
function CBaseAnimating:GetServerIntendedCycle() end

--- Gets the current skin index.
--- @return integer skin The skin index.
function CBaseAnimating:GetSkin() end

--- Ignites a ragdoll entity.
--- @param ragdoll CBaseAnimating The ragdoll entity to ignite.
function CBaseAnimating:IgniteRagdoll(ragdoll) end

--- Initializes the bone setup thread pool (static method).
function CBaseAnimating:InitBoneSetupThreadPool() end

--- Initializes model effects for the entity.
function CBaseAnimating:InitModelEffects() end

--- Draws the entity's model internally with specified flags.
--- @param flags integer The draw flags.
--- @return integer result The result of the draw operation.
function CBaseAnimating:InternalDrawModel(flags) end

--- Interpolates the entity for the given time.
--- @param currentTime number The current time for interpolation.
--- @return boolean success Whether interpolation was successful.
function CBaseAnimating:Interpolate(currentTime) end

--- Invalidates the bone cache for the entity.
function CBaseAnimating:InvalidateBoneCache() end

--- Invalidates the bone caches for all entities (static method).
function CBaseAnimating:InvalidateBoneCaches() end

--- Invalidates the model cache for the entity.
function CBaseAnimating:InvalidateMdlCache() end

--- Checks if the current activity is finished.
--- @return boolean finished Whether the activity is finished.
function CBaseAnimating:IsActivityFinished() end

--- Checks if the bone cache is valid.
--- @return boolean valid Whether the bone cache is valid.
function CBaseAnimating:IsBoneCacheValid() end

--- Checks if the entity is on fire.
--- @return boolean onFire Whether the entity is on fire.
function CBaseAnimating:IsOnFire() end

--- Checks if the entity is a ragdoll.
--- @return boolean isRagdoll Whether the entity is a ragdoll.
function CBaseAnimating:IsRagdoll() end

--- Checks if the entity is self-animating.
--- @return boolean selfAnimating Whether the entity is self-animating.
function CBaseAnimating:IsSelfAnimating() end

--- Checks if the current sequence is finished.
--- @return boolean finished Whether the sequence is finished.
function CBaseAnimating:IsSequenceFinished() end

--- Checks if a sequence is looping.
--- @param sequence integer The sequence index.
--- @return boolean looping Whether the sequence is looping.
function CBaseAnimating:IsSequenceLooping(sequence) end

--- Checks if the entity is a view model.
--- @return boolean isViewModel Whether the entity is a view model.
function CBaseAnimating:IsViewModel() end

--- Looks up an activity by name.
--- @param name string The activity name.
--- @return integer activityId The activity ID, or -1 if not found.
function CBaseAnimating:LookupActivity(name) end

--- Looks up an attachment by name.
--- @param name string The attachment name.
--- @return integer attachmentId The attachment ID, or -1 if not found.
function CBaseAnimating:LookupAttachment(name) end

--- Looks up a bone by name.
--- @param name string The bone name.
--- @return integer boneId The bone ID, or -1 if not found.
function CBaseAnimating:LookupBone(name) end

--- Looks up a pose parameter by name.
--- @param name string The pose parameter name.
--- @return integer paramId The pose parameter ID, or -1 if not found.
function CBaseAnimating:LookupPoseParameter(name) end

--- Looks up a random attachment by name.
--- @param name string The attachment name.
--- @return integer attachmentId The random attachment ID, or -1 if not found.
function CBaseAnimating:LookupRandomAttachment(name) end

--- Looks up a sequence by name.
--- @param name string The sequence name.
--- @return integer sequenceId The sequence ID, or -1 if not found.
function CBaseAnimating:LookupSequence(name) end

--- Notifies the entity of its transmission state.
--- @param state integer The transmission state (ShouldTransmitState_t).
function CBaseAnimating:NotifyShouldTransmit(state) end

--- Handles data changes for the entity.
--- @param updateType integer The data update type (DataUpdateType_t).
function CBaseAnimating:OnDataChanged(updateType) end

--- Prepares the entity for data changes.
--- @param updateType integer The data update type (DataUpdateType_t).
function CBaseAnimating:OnPreDataChanged(updateType) end

--- Pops bone access permissions (static method).
--- @param context string The context for bone access.
function CBaseAnimating:PopBoneAccess(context) end

--- Post-processes data updates for the entity.
--- @param updateType integer The data update type (DataUpdateType_t).
function CBaseAnimating:PostDataUpdate(updateType) end

--- Pre-processes data updates for the entity.
--- @param updateType integer The data update type (DataUpdateType_t).
function CBaseAnimating:PreDataUpdate(updateType) end

--- Processes a muzzle flash event.
function CBaseAnimating:ProcessMuzzleFlashEvent() end

--- Pushes bone access permissions (static method).
--- @param allow boolean Whether to allow bone access.
--- @param strict boolean Whether access is strict.
--- @param context string The context for bone access.
function CBaseAnimating:PushAllowBoneAccess(allow, strict, context) end

--- Notifies that the ragdoll has moved.
function CBaseAnimating:RagdollMoved() end

--- Releases the entity.
function CBaseAnimating:Release() end

--- Removes the entity from the client-side animation list.
function CBaseAnimating:RemoveFromClientSideAnimationList() end

--- Resets latched animation data.
function CBaseAnimating:ResetLatched() end

--- Resets the sequence to a specific index.
--- @param sequence integer The sequence index.
function CBaseAnimating:ResetSequence(sequence) end

--- Resets sequence information.
function CBaseAnimating:ResetSequenceInfo() end

--- Retrieves ragdoll information.
--- @return boolean success Whether the information was retrieved.
--- @return Vector position The ragdoll position.
function CBaseAnimating:RetrieveRagdollInfo() end

--- Selects a weighted sequence for an activity.
--- @param activity integer The activity ID (Activity).
--- @return integer sequenceId The selected sequence ID.
function CBaseAnimating:SelectWeightedSequence(activity) end

--- Gets the duration of a sequence or the current sequence.
--- @param sequence? integer The sequence index (optional).
--- @return number duration The sequence duration.
function CBaseAnimating:SequenceDuration(sequence) end

--- Checks if the current sequence loops.
--- @return boolean looping Whether the sequence loops.
function CBaseAnimating:SequenceLoops() end

--- Sets the bodygroup value for a specific group.
--- @param group integer The bodygroup index.
--- @param value integer The bodygroup value.
function CBaseAnimating:SetBodygroup(group, value) end

--- Sets a bone controller value.
--- @param controllerIndex integer The bone controller index.
--- @param value number The controller value.
--- @return number result The set value.
function CBaseAnimating:SetBoneController(controllerIndex, value) end

--- Sets the animation cycle.
--- @param cycle number The cycle value (0.0 to 1.0).
function CBaseAnimating:SetCycle(cycle) end

--- Sets the hitbox set by index.
--- @param setIndex integer The hitbox set index.
function CBaseAnimating:SetHitboxSet(setIndex) end

--- Sets the hitbox set by name.
--- @param setName string The hitbox set name.
function CBaseAnimating:SetHitboxSetByName(setName) end

--- Sets the playback rate.
--- @param rate number The playback rate.
function CBaseAnimating:SetPlaybackRate(rate) end

--- Sets a pose parameter by index or name.
--- @param param string|integer The pose parameter name or index.
--- @param value number The pose parameter value.
--- @return number value The set value.
function CBaseAnimating:SetPoseParameter(param, value) end

--- Sets whether the entity is predictable.
--- @param predictable boolean Whether the entity is predictable.
function CBaseAnimating:SetPredictable(predictable) end

--- Sets whether the entity is eligible for prediction.
--- @param eligible boolean Whether the entity is prediction-eligible.
function CBaseAnimating:SetPredictionEligible(eligible) end

--- Sets the prediction player.
--- @param player CBasePlayer The player for prediction.
function CBaseAnimating:SetPredictionPlayer(player) end

--- Sets the received sequence.
function CBaseAnimating:SetReceivedSequence() end

--- Sets the current sequence.
--- @param sequence integer The sequence index.
function CBaseAnimating:SetSequence(sequence) end

--- Sets the server-intended animation cycle.
--- @param cycle number The cycle value.
function CBaseAnimating:SetServerIntendedCycle(cycle) end

--- Gets the shadow cast type.
--- @return integer shadowType The shadow cast type.
function CBaseAnimating:ShadowCastType() end

--- Checks if the entity should display a muzzle flash.
--- @return boolean shouldFlash Whether a muzzle flash should be displayed.
function CBaseAnimating:ShouldMuzzleFlash() end

--- Checks if the sequence should reset on a new model.
--- @return boolean shouldReset Whether the sequence should reset.
function CBaseAnimating:ShouldResetSequenceOnNewModel() end

--- Shuts down the bone setup thread pool (static method).
function CBaseAnimating:ShutdownBoneSetupThreadPool() end

--- Simulates the entity.
function CBaseAnimating:Simulate() end

--- Advances the animation frame in studio mode.
function CBaseAnimating:StudioFrameAdvance() end

--- Performs threaded bone setup (static method).
function CBaseAnimating:ThreadedBoneSetup() end

--- Transfers dissolve effect from another entity.
--- @param other CBaseAnimating The source entity.
function CBaseAnimating:TransferDissolveFrom(other) end

--- Uncorrects a view model attachment.
--- @param attachment Vector The attachment to uncorrect.
function CBaseAnimating:UncorrectViewModelAttachment(attachment) end

--- Updates client-side animation.
function CBaseAnimating:UpdateClientSideAnimation() end

--- Updates client-side animations for all entities (static method).
function CBaseAnimating:UpdateClientSideAnimations() end

--- Updates IK locks for the entity.
--- @param currentTime number The current time for IK updates.
function CBaseAnimating:UpdateIKLocks(currentTime) end

--- Enables client-side animation.
function CBaseAnimating:UseClientSideAnimation() end

--- Checks if the entity uses a power-of-two framebuffer texture.
--- @return boolean usesPowerOfTwo Whether a power-of-two texture is used.
function CBaseAnimating:UsesPowerOfTwoFrameBufferTexture() end

--- Gets the list of physics objects associated with the entity.
--- @return integer count The number of physics objects.
--- @return table objects A table of IPhysicsObject instances.
function CBaseAnimating:VPhysicsGetObjectList() end

--- Updates the physics state with a physics object.
--- @param physicsObject IPhysicsObject The physics object to update with.
function CBaseAnimating:VPhysicsUpdate(physicsObject) end

--- Custom index metamethod for accessing fields and methods.
--- Supports fields: m_bClientSideAnimation, m_bLastClientSideFrameReset, m_nBody, m_nHitboxSet, m_nSkin.
--- Falls back to CBaseEntity metatable if field not found.
--- @param key string The field or method name.
--- @return any value The value or method associated with the key.
function CBaseAnimating:__index(key) end

--- Custom newindex metamethod for setting fields.
--- Supports fields: m_bClientSideAnimation (boolean), m_bLastClientSideFrameReset (boolean), m_nBody (integer), m_nHitboxSet (integer), m_nSkin (integer).
--- Other fields are stored in a custom Lua table.
--- @param key string The field name.
--- @param value any The value to set.
function CBaseAnimating:__newindex(key, value) end

--- Checks if two CBaseAnimating entities are equal.
--- @param other CBaseAnimating The other entity to compare.
--- @return boolean equal Whether the entities are equal.
function CBaseAnimating:__eq(other) end

--- Returns a string representation of the entity.
--- @return string str Format: "CBaseAnimating: <entindex> \"<classname>\"" or "NULL" if invalid.
function CBaseAnimating:__tostring() end

--- Entity scripting interface for CBaseScripted and CBaseScriptedTrigger entities.
--- @class ENT : CBaseAnimating
ENT = {}

return CBaseAnimating