
---@class CBasePlayer : CBaseEntity
---@field m_afButtonLast integer
---@field m_afButtonPressed integer
---@field m_afButtonReleased integer
---@field m_flNextAttack number
---@field m_fOnTarget boolean
---@field m_nButtons integer
---@field m_StuckLast integer
---@field m_szAnimExtension string
---@field m_nTableReference integer
CBasePlayer = {}

-- Static helper to cast an entity to a CBasePlayer (returns nil if not CBasePlayer)
---@param ent CBaseEntity
---@return CBasePlayer
function CBasePlayer.ToBasePlayer(ent) end

---Abort weapon reload in progress for this CBasePlayer.
---@return nil
function CBasePlayer:AbortReload() end

---Add an entity to this CBasePlayer's simulation list (for prediction).
---@param ent CBaseEntity
---@return nil
function CBasePlayer:AddToPlayerSimulationList(ent) end

---Cache the vehicle view information for this CBasePlayer.
---@return nil
function CBasePlayer:CacheVehicleView() end

---Clear entities from this CBasePlayer's simulation list.
---@return nil
function CBasePlayer:ClearPlayerSimulationList() end

---Clear the zoom owner (stop zooming) for this CBasePlayer.
---@return nil
function CBasePlayer:ClearZoomOwner() end

---Return the current input command number for this CBasePlayer.
---@return integer
function CBasePlayer:CurrentCommandNumber() end

---Trigger a muzzle flash effect for this CBasePlayer's active weapon.
---@return nil
function CBasePlayer:DoMuzzleFlash() end

---Force the CBasePlayer to exit a ladder if currently on one.
---@return nil
function CBasePlayer:ExitLadder() end

---Sets the armor value of the CBasePlayer.
---@param value integer
function CBasePlayer:SetArmorValue(value) end

---Get the CBasePlayer's eye angles (view orientation).
---@return QAngle
function CBasePlayer:EyeAngles() end

---Get the CBasePlayer's eye position (camera origin).
---@return Vector
function CBasePlayer:EyePosition() end

---Fill provided vectors with eye pos and direction vectors.
---@param forward Vector
---@param right Vector
---@param up Vector
---@param origin Vector
function CBasePlayer:EyePositionAndVectors(forward, right, up, origin) end

---Fill forward/right/up eye direction vectors into provided vectors.
---@param forward Vector
---@param right? Vector
---@param up? Vector
function CBasePlayer:EyeVectors(forward, right, up) end

---Return the entity this CBasePlayer is currently "using" (looking at/use target).
---@return CBaseEntity
function CBasePlayer:FindUseEntity() end

---Return the CBasePlayer's currently active weapon (combat weapon).
---@return CBaseCombatWeapon
function CBasePlayer:GetActiveWeapon() end

---Return the amount of ammo the CBasePlayer has for given index or name.
---@overload fun(self:CBasePlayer, ammoIndex:integer):integer
---@overload fun(self:CBasePlayer, ammoName:string):integer
---@param what any
---@return integer
function CBasePlayer:GetAmmoCount(what) end

---Snap the eye angles.
---@param what QAngle
function CBasePlayer:SnapEyeAngles(what) end

---Return an autoaim vector for the CBasePlayer given a maximum distance.
---@param maxDist number
---@return Vector
function CBasePlayer:GetAutoaimVector(maxDist) end

---Return the CBasePlayer's bonus challenge score (game-specific).
---@return integer
function CBasePlayer:GetBonusChallenge() end

---Return the CBasePlayer's bonus progress value.
---@return integer
function CBasePlayer:GetBonusProgress() end

---Return the time the CBasePlayer died (if dead).
---@return number
function CBasePlayer:GetDeathTime() end

---Return the CBasePlayer's default field-of-view.
---@return integer
function CBasePlayer:GetDefaultFOV() end

---Return the CBasePlayer's current field-of-view.
---@return number
function CBasePlayer:GetFOV() end

---Return factor used to adjust FOV over distance.
---@return number
function CBasePlayer:GetFOVDistanceAdjustFactor() end

---Return remaining time for an FOV transition.
---@return number
function CBasePlayer:GetFOVTime() end

---Return the CBasePlayer's current health.
---@return integer
function CBasePlayer:GetHealth() end

---Return the CBasePlayer's current impulse (game-specific).
---@return integer
function CBasePlayer:GetImpulse() end

---Return the CBasePlayer's lagged movement interpolation factor.
---@return number
function CBasePlayer:GetLaggedMovementValue() end

---Return the last known named place the CBasePlayer was in (map-specific).
---@return string
function CBasePlayer:GetLastKnownPlaceName() end

---Return the next time CBasePlayer can attack (server time).
---@return number
function CBasePlayer:GetNextAttack() end

---Return the CBasePlayer's observer mode (if spectating).
---@return integer
function CBasePlayer:GetObserverMode() end

---Return the entity the CBasePlayer is observing (if spectating).
---@return CBaseEntity
function CBasePlayer:GetObserverTarget() end

---Return offset index to the CBasePlayer's local data structure (internal).
---@return integer
function CBasePlayer.GetOffset_m_Local() end

---Return a table describing the CBasePlayer's local prediction data.
---@return PlayerLocalData
function CBasePlayer:GetPlayerLocalData() end

---Return the CBasePlayer's maximum collision bounds (maxs).
---@return Vector
function CBasePlayer:GetPlayerMaxs() end

---Return the CBasePlayer's minimum collision bounds (mins).
---@return Vector
function CBasePlayer:GetPlayerMins() end

---Return the CBasePlayer's name (display name).
---@return string
function CBasePlayer:GetPlayerName() end

---Return the last predicted origin used for movement prediction.
---@return Vector
function CBasePlayer:GetPreviouslyPredictedOrigin() end

---Return the CBasePlayer's current punch angle (view recoil) as a QAngle.
---@return QAngle
function CBasePlayer:GetPunchAngle() end

---Return a table containing the CBasePlayer's step sound cache entries.
---@return table
function CBasePlayer:GetStepSoundCache() end

---Return walk/run velocity thresholds used for step sounds.
---@return number, number
function CBasePlayer:GetStepSoundVelocities() end

---Return the CBasePlayer's swim sound timer value.
---@return number
function CBasePlayer:GetSwimSoundTime() end

---Return the CBasePlayer's timebase used for client predictions.
---@return number
function CBasePlayer:GetTimeBase() end

---Return tracer type string for bullets fired by this CBasePlayer.
---@return string
function CBasePlayer:GetTracerType() end

---Return the entity this CBasePlayer would "use" (secondary concept).
---@return CBaseEntity
function CBasePlayer:GetUseEntity() end

---Return an integer user id for this CBasePlayer (server-assigned).
---@return integer
function CBasePlayer:GetUserID() end

---Return the CBasePlayer's viewmodel instance (client-side object).
---@param index? integer
---@return CBaseAnimating
function CBasePlayer:GetViewModel(index) end

---Return the CBasePlayer's water-jump timer value.
---@return number
function CBasePlayer:GetWaterJumpTime() end

---Return a weapon object by inventory slot.
---@param slot integer
---@return CBaseCombatWeapon
function CBasePlayer:GetWeapon(slot) end

---Send a hint/message string to the CBasePlayer's HUD.
---@param text string
---@return nil
function CBasePlayer:HintMessage(text) end

---Return true if this CBasePlayer is an AI bot.
---@return boolean
function CBasePlayer:IsBot() end

---Return true if this CBasePlayer is an HLTV (spectator) client.
---@return boolean
function CBasePlayer:IsHLTV() end

---Return true if CBasePlayer is in a vehicle.
---@return boolean
function CBasePlayer:IsInAVehicle() end

---Return true if CBasePlayer is in observer mode.
---@return boolean
function CBasePlayer:IsObserver() end

---Return true if object is a CBasePlayer (should always be true here).
---@return boolean
function CBasePlayer:IsPlayer() end

---Return true if CBasePlayer is currently underwater.
---@return boolean
function CBasePlayer:IsPlayerUnderwater() end

---Return true if the CBasePlayer has a suit equipped (game-specific).
---@return boolean
function CBasePlayer:IsSuitEquipped() end

---Return true if the given entity is usable by the CBasePlayer.
---@param ent CBaseEntity
---@param flags integer
---@return boolean
function CBasePlayer:IsUseableEntity(ent, flags) end

---Called each frame for the currently-held item (post-frame hooks).
---@return nil
function CBasePlayer:ItemPostFrame() end

---Called each frame before item logic (pre-frame hooks).
---@return nil
function CBasePlayer:ItemPreFrame() end

---Force the CBasePlayer to leave a vehicle (if in one).
---@return nil
function CBasePlayer:LeaveVehicle() end

---Return the CBasePlayer's local eye angles (client-side variant).
---@return QAngle
function CBasePlayer:LocalEyeAngles() end

---Return the CBasePlayer's maximum allowed movement speed.
---@return number
function CBasePlayer:MaxSpeed() end

---Return a pointer to the CBasePlayer's combat character (if applicable).
---@return CBasePlayer
function CBasePlayer:MyCombatCharacterPointer() end

---Called when the CBasePlayer is restored from a saved game or similar.
---@return nil
function CBasePlayer:OnRestore() end

---Run physics simulation logic for the CBasePlayer (server-side).
---@return nil
function CBasePlayer:PhysicsSimulate() end

---Return the physics solid mask used for this CBasePlayer.
---@return integer
function CBasePlayer:PhysicsSolidMaskForEntity() end

---Trigger CBasePlayer-use action (engine-provided).
---@return nil
function CBasePlayer:PlayerUse() end

---Play a footstep sound for this CBasePlayer (wrapper).
---@return nil
function CBasePlayer:PlayStepSound(...) end

---Called after the CBasePlayer's Think() for final frame updates.
---@return nil
function CBasePlayer:PostThink() end

---Called before the CBasePlayer's Think() to prepare input/state.
---@return nil
function CBasePlayer:PreThink() end

---Remove all ammo types from the CBasePlayer's inventory.
---@return nil
function CBasePlayer:RemoveAllAmmo() end

---Remove a quantity of ammo (by type index or name).
---@overload fun(self:CBasePlayer, amount:integer, typeIndex:integer)
---@overload fun(self:CBasePlayer, amount:integer, typeName:string)
---@param a any
---@param b any
function CBasePlayer:RemoveAmmo(a, b) end

---Remove an entity from the CBasePlayer's simulation list.
---@param ent CBaseEntity
---@return nil
function CBasePlayer:RemoveFromPlayerSimulationList(ent) end

---Reset the CBasePlayer's autoaim state.
---@return nil
function CBasePlayer:ResetAutoaim() end

---Reset observer mode for this CBasePlayer (if spectating).
---@return nil
function CBasePlayer:ResetObserverMode() end

---Select a named item in the CBasePlayer's inventory (by slot optional).
---@param name string
---@param slot? integer
---@return nil
function CBasePlayer:SelectItem(name, slot) end

---Select the last held item (weapon) for this CBasePlayer.
---@return nil
function CBasePlayer:SelectLastItem() end

---Set the CBasePlayer's ammo count for a slot/type.
---@param ammoIndex integer
---@param count integer
---@return nil
function CBasePlayer:SetAmmoCount(ammoIndex, count) end

---Set the CBasePlayer's animation state.
---@param anim integer
---@return nil
function CBasePlayer:SetAnimation(anim) end

---Set an animation extension string used by the CBasePlayer.
---@param ext string
---@return nil
function CBasePlayer:SetAnimationExtension(ext) end

---Set the CBasePlayer's blood color (used for decals/effects).
---@param color integer
---@return nil
function CBasePlayer:SetBloodColor(color) end

---Set the CBasePlayer's FOV targeting a certain entity (returns success).
---@param targetEnt CBaseEntity
---@param fov integer
---@param time number
---@param something? integer
---@return boolean
function CBasePlayer:SetFOV(targetEnt, fov, time, something) end

---Set the normal vector for ladder handling.
---@param normal Vector
---@return nil
function CBasePlayer:SetLadderNormal(normal) end

---Set the maximum movement speed for the CBasePlayer.
---@param speed number
---@return nil
function CBasePlayer:SetMaxSpeed(speed) end

---Set the next time the CBasePlayer can attack.
---@param nextAttack number
---@return nil
function CBasePlayer:SetNextAttack(nextAttack) end

---Set a field on the CBasePlayer's m_Local data (various client-predicted fields).
---@param field string
---@param value any
---@return nil
function CBasePlayer:SetPlayerLocalData(field, value) end

---Toggle whether the CBasePlayer is underwater for logic purposes.
---@param underwater boolean
---@return nil
function CBasePlayer:SetPlayerUnderwater(underwater) end

---Set previously predicted origin (for corrections/prediction).
---@param origin Vector
---@return nil
function CBasePlayer:SetPreviouslyPredictedOrigin(origin) end

---Set the CBasePlayer's view punch (recoil) angle.
---@param ang QAngle
---@return nil
function CBasePlayer:SetPunchAngle(ang) end

---Set or modify a step-sound cache entry for the CBasePlayer.
---@param index integer
---@param field string
---@param value any
---@return integer
function CBasePlayer:SetStepSoundCache(index, field, value) end

---Queue a suit voice update message for the CBasePlayer.
---@param msg string
---@param type integer
---@param delays integer
---@return nil
function CBasePlayer:SetSuitUpdate(msg, type, delays) end

---Set the swim sound timer for the CBasePlayer.
---@param t number
---@return nil
function CBasePlayer:SetSwimSoundTime(t) end

---Set the water-jump timer for the CBasePlayer.
---@param t number
---@return nil
function CBasePlayer:SetWaterJumpTime(t) end

---Shared spawn logic for both client and server initialisation.
---@return nil
function CBasePlayer:SharedSpawn() end

---Return whether the CBasePlayer should see contextual hints.
---@return boolean
function CBasePlayer:ShouldShowHints() end

---Simulate entities flagged as simulated by this CBasePlayer.
---@return nil
function CBasePlayer:SimulatePlayerSimulatedEntities() end

---Smooth the CBasePlayer's view when stepping on stairs.
---@param stairsvec Vector
---@return nil
function CBasePlayer:SmoothViewOnStairs(stairsvec) end

---Spawn the CBasePlayer (server-side spawn logic).
---@return nil
function CBasePlayer:Spawn() end

---Switch to the next best weapon given current state.
---@param weapon CBaseCombatWeapon
---@return boolean
function CBasePlayer:SwitchToNextBestWeapon(weapon) end

---Update client-data structures (for networked clients).
---@return nil
function CBasePlayer:UpdateClientData() end

---Update underwater state and effects for the CBasePlayer.
---@return nil
function CBasePlayer:UpdateUnderwaterState() end

---Return whether standard map weapons are used when in a vehicle.
---@return boolean
function CBasePlayer:UsingStandardWeaponsInVehicle() end

---Apply a view punch (recoil) to the CBasePlayer's view.
---@param ang QAngle
---@return nil
function CBasePlayer:ViewPunch(ang) end

---Reset view punch effects over a period of time.
---@param fl number
---@return nil
function CBasePlayer:ViewPunchReset(fl) end

---Check if the CBasePlayer can switch to the specified weapon.
---@param weapon CBaseCombatWeapon
---@return boolean
function CBasePlayer:Weapon_CanSwitchTo(weapon) end

---Return whether the CBasePlayer owns a weapon of the given type name (or slot).
---@overload fun(self:CBasePlayer, typename:string, slot?:integer):CBaseCombatWeapon
---@param typename string
---@param slot? integer
---@return CBaseCombatWeapon
function CBasePlayer:Weapon_OwnsThisType(typename, slot) end

---Set the last used weapon for the CBasePlayer (internal tracking).
---@param weapon CBaseCombatWeapon
---@return nil
function CBasePlayer:Weapon_SetLast(weapon) end

---Return the position from which the CBasePlayer's weapon fires.
---@return Vector
function CBasePlayer:Weapon_ShootPosition() end

---Return whether this weapon should be selected for the CBasePlayer.
---@param weapon CBaseCombatWeapon
---@return boolean
function CBasePlayer:Weapon_ShouldSelectItem(weapon) end

---Return whether the current weapon should be set as the last weapon.
---@param cur CBaseCombatWeapon
---@param last CBaseCombatWeapon
---@return boolean
function CBasePlayer:Weapon_ShouldSetLast(cur, last) end

---Switch to a weapon (attempt to change active weapon).
---@param weapon CBaseCombatWeapon
---@param something? integer
---@return boolean
function CBasePlayer:Weapon_Switch(weapon, something) end

---Return how many weapons the CBasePlayer currently has.
---@return integer
function CBasePlayer:WeaponCount() end

-- metamethods
---Compare two players for equality (same underlying entity).
---@return boolean
function CBasePlayer.__eq(a, b) end

---Return a human-readable string for the CBasePlayer object.
---@return string
function CBasePlayer.__tostring() end

return CBasePlayer