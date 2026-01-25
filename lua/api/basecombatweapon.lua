
---@class CBaseCombatWeapon : CBaseEntity
---@field m_bAltFiresUnderwater boolean       # True if alt-fire works underwater
---@field m_bFireOnEmpty boolean              # True if weapon tries to fire when empty
---@field m_bFiresUnderwater boolean          # True if primary fire works underwater
---@field m_bInReload boolean                 # True while reloading
---@field m_bReloadsSingly boolean            # True if reloads one round at a time
---@field m_fFireDuration number              # Time the weapon is considered "firing"
---@field m_flNextEmptySoundTime number       # Next time to play empty-clip sound
---@field m_flNextPrimaryAttack number        # Next allowed primary attack time
---@field m_flNextSecondaryAttack number      # Next allowed secondary attack time
---@field m_flTimeWeaponIdle number           # Time when weapon will next be idle
---@field m_flUnlockTime number               # Time until weapon is unlocked
---@field m_fMaxRange1 number                 # Max range for primary fire (engine use)
---@field m_fMaxRange2 number                 # Max range for secondary fire (engine use)
---@field m_fMinRange1 number                 # Min range for primary fire (engine use)
---@field m_fMinRange2 number                 # Min range for secondary fire (engine use)
---@field m_iClip1 integer                    # Current primary clip count
---@field m_iClip2 integer                    # Current secondary clip count
---@field m_iPrimaryAmmoType integer          # Primary ammo type index
---@field m_iSecondaryAmmoType integer        # Secondary ammo type index
---@field m_iState integer                    # Internal weapon state
---@field m_iSubType integer                  # Weapon subtype (game-specific)
---@field m_iViewModelIndex integer           # Viewmodel index
---@field m_iWorldModelIndex integer          # World model index
---@field m_nViewModelIndex integer           # Alternate cached viewmodel index
CBaseCombatWeapon = {}

---Abort any reload in progress for this weapon.
function CBaseCombatWeapon:AbortReload() end

---Activate the weapon (called when given to a player).
function CBaseCombatWeapon:Activate() end

---Return the number of animations in the activity list for this weapon.
---@return integer
function CBaseCombatWeapon:ActivityListCount() end

---Return an activity override for a requested activity. Also sets `required` to whether the override is strict.
---@param activity integer
---@param required boolean|nil
---@return integer
function CBaseCombatWeapon:ActivityOverride(activity, required) end

---Apply view kick (recoil view punch) for this weapon.
function CBaseCombatWeapon:AddViewKick() end

---Return whether auto-switching away from this weapon is allowed.
---@return boolean
function CBaseCombatWeapon:AllowsAutoSwitchFrom() end

---Return whether auto-switching to this weapon is allowed.
---@return boolean
function CBaseCombatWeapon:AllowsAutoSwitchTo() end

---Calculate viewmodel bob amount for this weapon.
---@return number
function CBaseCombatWeapon:CalcViewmodelBob() end

---Return whether NPCs can pick this weapon up.
---@return boolean
function CBaseCombatWeapon:CanBePickedUpByNPCs() end

---Return whether the weapon can be selected by a player.
---@return boolean
function CBaseCombatWeapon:CanBeSelected() end

---Return whether weapon can be deployed right now.
---@return boolean
function CBaseCombatWeapon:CanDeploy() end

---Return whether weapon can be holstered right now.
---@return boolean
function CBaseCombatWeapon:CanHolster() end

---Return whether weapon can be lowered.
---@return boolean
function CBaseCombatWeapon:CanLower() end

---Internal check/restart reload logic (engine binding).
function CBaseCombatWeapon:CheckReload() end

---Return current primary clip count.
---@return integer
function CBaseCombatWeapon:Clip1() end

---Return current secondary clip count.
---@return integer
function CBaseCombatWeapon:Clip2() end

---Default deploy helper (sets models/animations).
---@param viewModel string
---@param worldModel string
---@param position integer
---@param animPrefix string
---@return boolean
function CBaseCombatWeapon:DefaultDeploy(viewModel, worldModel, position, animPrefix) end

---Default reload helper. Returns true if reload started/succeeded.
---@param maxClip1 integer
---@param maxClip2 integer
---@param anim integer
---@return boolean
function CBaseCombatWeapon:DefaultReload(maxClip1, maxClip2, anim) end

---Default touch handler when dropped in the world.
---@param ent CBaseEntity
function CBaseCombatWeapon:DefaultTouch(ent) end

---Deploy (draw) this weapon.
---@return boolean
function CBaseCombatWeapon:Deploy() end

---Show an alt-fire HUD hint (engine-managed).
function CBaseCombatWeapon:DisplayAltFireHudHint() end

---Show a reload HUD hint.
function CBaseCombatWeapon:DisplayReloadHudHint() end

---Drop the weapon into the world at the given velocity.
---@param velocity Vector
function CBaseCombatWeapon:Drop(velocity) end

---Finish reload (complete animation/effects).
function CBaseCombatWeapon:FinishReload() end

---Return current activity (animation state).
---@return integer
function CBaseCombatWeapon:GetActivity() end

---Return the animation prefix string used by this weapon.
---@return string
function CBaseCombatWeapon:GetAnimPrefix() end

---Return the bullet type index used by this weapon.
---@return integer
function CBaseCombatWeapon:GetBulletType() end

---Compute damage for a given range and damage type/index.
---@param range number
---@param someIndex integer
---@return number
function CBaseCombatWeapon:GetDamage(range, someIndex) end

---Return the name used in death notices for this weapon.
---@return string
function CBaseCombatWeapon:GetDeathNoticeName() end

---Return the default animation speed for this weapon.
---@return number
function CBaseCombatWeapon:GetDefaultAnimSpeed() end

---Return default clip count for primary ammo.
---@return integer
function CBaseCombatWeapon:GetDefaultClip1() end

---Return default clip count for secondary ammo.
---@return integer
function CBaseCombatWeapon:GetDefaultClip2() end

---Return draw animation activity id.
---@return integer
function CBaseCombatWeapon:GetDrawActivity() end

---Return weapon fire rate (rounds per second or engine-specific unit).
---@return number
function CBaseCombatWeapon:GetFireRate() end

---Return the ideal activity id for the current state.
---@return integer
function CBaseCombatWeapon:GetIdealActivity() end

---Return the ideal sequence id for the current activity.
---@return integer
function CBaseCombatWeapon:GetIdealSequence() end

---Return maximum auto-aim deflection allowed for this weapon.
---@return number
function CBaseCombatWeapon:GetMaxAutoAimDeflection() end

---Return maximum burst size for burst-fire weapons.
---@return integer
function CBaseCombatWeapon:GetMaxBurst() end

---Return maximum primary clip size.
---@return integer
function CBaseCombatWeapon:GetMaxClip1() end

---Return maximum secondary clip size.
---@return integer
function CBaseCombatWeapon:GetMaxClip2() end

---Return the maximum rest time between bursts.
---@return number
function CBaseCombatWeapon:GetMaxRestTime() end

---Return the minimum burst size.
---@return integer
function CBaseCombatWeapon:GetMinBurst() end

---Return the minimum rest time between bursts.
---@return number
function CBaseCombatWeapon:GetMinRestTime() end

---Return internal weapon name/classname.
---@return string
function CBaseCombatWeapon:GetName() end

---Return owner (player) of this weapon.
---@return CBasePlayer
function CBaseCombatWeapon:GetOwner() end

---Return weapon inventory/slot position.
---@return integer
function CBaseCombatWeapon:GetPosition() end

---Return current primary ammo count carried by the owner/player.
---@return integer
function CBaseCombatWeapon:GetPrimaryAmmoCount() end

---Return primary ammo type index.
---@return integer
function CBaseCombatWeapon:GetPrimaryAmmoType() end

---Return primary attack activity id.
---@return integer
function CBaseCombatWeapon:GetPrimaryAttackActivity() end

---Return the printed display name for the weapon.
---@return string
function CBaseCombatWeapon:GetPrintName() end

---Return a random burst count for burst-fire logic.
---@return integer
function CBaseCombatWeapon:GetRandomBurst() end

---Return rumble/vibration effect id for this weapon.
---@return integer
function CBaseCombatWeapon:GetRumbleEffect() end

---Return secondary ammo count carried by the owner.
---@return integer
function CBaseCombatWeapon:GetSecondaryAmmoCount() end

---Return secondary ammo type index.
---@return integer
function CBaseCombatWeapon:GetSecondaryAmmoType() end

---Return secondary attack activity id.
---@return integer
function CBaseCombatWeapon:GetSecondaryAttackActivity() end

---Get shoot sound for the given index/type.
---@param idx integer
---@return string
function CBaseCombatWeapon:GetShootSound(idx) end

---Return weapon slot index (UI grouping).
---@return integer
function CBaseCombatWeapon:GetSlot() end

---Return subtype value (game/mod specific).
---@return integer
function CBaseCombatWeapon:GetSubType() end

---Return viewmodel path for the weapon (optionally for a particular index).
---@param index integer?
---@return string
function CBaseCombatWeapon:GetViewModel(index) end

---Return duration of current viewmodel sequence.
---@return number
function CBaseCombatWeapon:GetViewModelSequenceDuration() end

---Return engine/internal weapon flags mask.
---@return integer
function CBaseCombatWeapon:GetWeaponFlags() end

---Return next idle time for this weapon.
---@return number
function CBaseCombatWeapon:GetWeaponIdleTime() end

---Return weight (selection priority) for this weapon.
---@return integer
function CBaseCombatWeapon:GetWeight() end

---Return world model path for this weapon.
---@return string
function CBaseCombatWeapon:GetWorldModel() end

---Return a table of weapon info (file-weapon info structure).
---@return table
function CBaseCombatWeapon:GetWpnData() end

---Give the weapon its default starting ammo.
function CBaseCombatWeapon:GiveDefaultAmmo() end

---Handle press/fire when clip is empty.
function CBaseCombatWeapon:HandleFireOnEmpty() end

---Return whether the weapon currently has any usable ammo.
---@return boolean
function CBaseCombatWeapon:HasAmmo() end

---Return whether the player has any ammo for this weapon at all.
---@return boolean
function CBaseCombatWeapon:HasAnyAmmo() end

---Return whether primary ammo is available.
---@return boolean
function CBaseCombatWeapon:HasPrimaryAmmo() end

---Return whether secondary ammo is available.
---@return boolean
function CBaseCombatWeapon:HasSecondaryAmmo() end

---Returns true if weapon idle timer has elapsed.
---@return boolean
function CBaseCombatWeapon:HasWeaponIdleTimeElapsed() end

---Periodic think used while weapon hidden.
function CBaseCombatWeapon:HideThink() end

---Return whether weapon is allowed to switch (internal rules).
---@return boolean
function CBaseCombatWeapon:IsAllowedToSwitch() end

---Return whether this weapon is locked against the given entity (owner/locker).
---@param ent CBaseEntity
---@return boolean
function CBaseCombatWeapon:IsLocked(ent) end

---Return whether this weapon is a melee weapon.
---@return boolean
function CBaseCombatWeapon:IsMeleeWeapon() end

---Return whether this weapon is predicted (client-side prediction).
---@return boolean
function CBaseCombatWeapon:IsPredicted() end

---Return whether this weapon is a scripted SWEP (scripted by game/mod).
---@return boolean
function CBaseCombatWeapon:IsScripted() end

---Return whether the current viewmodel sequence finished playing.
---@return boolean
function CBaseCombatWeapon:IsViewModelSequenceFinished() end

---Return whether the weapon is visible (owner has it shown).
---@return boolean
function CBaseCombatWeapon:IsWeaponVisible() end

---Return whether the weapon is zoomed (scoped).
---@return boolean
function CBaseCombatWeapon:IsWeaponZoomed() end

---Called while the item is busy (reloading, etc.).
function CBaseCombatWeapon:ItemBusyFrame() end

---Called each frame while the weapon is holstering.
function CBaseCombatWeapon:ItemHolsterFrame() end

---Called each frame the weapon is active.
function CBaseCombatWeapon:ItemPostFrame() end

---Called each pre-frame for the weapon.
function CBaseCombatWeapon:ItemPreFrame() end

---Lock the weapon for `time` and optionally associate `ent` as the locker.
---@param time number
---@param ent CBaseEntity
function CBaseCombatWeapon:Lock(time, ent) end

---Lower the weapon (put it away) if allowed.
---@return boolean
function CBaseCombatWeapon:Lower() end

---Maintain internal ideal activity transitions.
function CBaseCombatWeapon:MaintainIdealActivity() end

---Called when an active state changes (engine notifications).
---@param state integer
function CBaseCombatWeapon:OnActiveStateChanged(state) end

---Restore weapon state after a save/load.
function CBaseCombatWeapon:OnRestore() end

---Precache models/sounds for this weapon.
function CBaseCombatWeapon:Precache() end

---Primary fire behavior (engine binding / override point).
function CBaseCombatWeapon:PrimaryAttack() end

---Return whether the weapon is ready to fire/use.
---@return boolean
function CBaseCombatWeapon:Ready() end

---Attempt to reload the weapon.
---@return boolean
function CBaseCombatWeapon:Reload() end

---Reload or switch weapons depending on ammo (helper).
---@return boolean
function CBaseCombatWeapon:ReloadOrSwitchWeapons() end

---Rescind alt-fire HUD hint.
function CBaseCombatWeapon:RescindAltFireHudHint() end

---Rescind reload HUD hint.
function CBaseCombatWeapon:RescindReloadHudHint() end

---Secondary fire behavior (engine binding / override point).
function CBaseCombatWeapon:SecondaryAttack() end

---Send a viewmodel animation id to the viewmodel.
---@param anim integer
function CBaseCombatWeapon:SendViewModelAnim(anim) end

---Send a weapon animation and return success.
---@param anim integer
---@return boolean
function CBaseCombatWeapon:SendWeaponAnim(anim) end

---Set the current activity.
---@param activity integer
function CBaseCombatWeapon:SetActivity(activity) end

---Set the ideal activity and return whether it changed.
---@param activity integer
---@return boolean
function CBaseCombatWeapon:SetIdealActivity(activity) end

---Enable pickup touch so players can pick it up.
function CBaseCombatWeapon:SetPickupTouch() end

---Set primary ammo count in the clip.
---@param count integer
function CBaseCombatWeapon:SetPrimaryAmmoCount(count) end

---Set secondary ammo count in the clip.
---@param count integer
function CBaseCombatWeapon:SetSecondaryAmmoCount(count) end

---Set weapon subtype value.
---@param subtype integer
function CBaseCombatWeapon:SetSubType(subtype) end

---Set viewmodel path (engine-managed).
function CBaseCombatWeapon:SetViewModel() end

---Set active viewmodel index (for multiple viewmodels).
---@param index integer
function CBaseCombatWeapon:SetViewModelIndex(index) end

---Set the next time the weapon will be idle.
---@param t number
function CBaseCombatWeapon:SetWeaponIdleTime(t) end

---Show or hide weapon visuals for the owner.
---@param visible boolean
function CBaseCombatWeapon:SetWeaponVisible(visible) end

---Return whether alt-fire HUD hint should be displayed.
---@return boolean
function CBaseCombatWeapon:ShouldDisplayAltFireHUDHint() end

---Return whether reload HUD hint should be displayed.
---@return boolean
function CBaseCombatWeapon:ShouldDisplayReloadHUDHint() end

---Return whether control panels should be shown for this weapon.
---@return boolean
function CBaseCombatWeapon:ShouldShowControlPanels() end

---Spawn/respawn the weapon (world entity).
function CBaseCombatWeapon:Spawn() end

---Request the weapon to start sprinting (if it supports sprint).
---@return boolean
function CBaseCombatWeapon:StartSprinting() end

---Stop sprinting.
---@return boolean
function CBaseCombatWeapon:StopSprinting() end

---Stop a weapon sound of the given type.
---@param soundType integer
function CBaseCombatWeapon:StopWeaponSound(soundType) end

---Return whether primary ammo uses clips.
---@return boolean
function CBaseCombatWeapon:UsesClipsForAmmo1() end

---Return whether secondary ammo uses clips.
---@return boolean
function CBaseCombatWeapon:UsesClipsForAmmo2() end

---Return whether weapon uses primary ammo at all.
---@return boolean
function CBaseCombatWeapon:UsesPrimaryAmmo() end

---Return whether weapon uses secondary ammo at all.
---@return boolean
function CBaseCombatWeapon:UsesSecondaryAmmo() end

---Return whether the weapon should be visible in weapon selection UI.
---@return boolean
function CBaseCombatWeapon:VisibleInWeaponSelection() end

---Return weapon auto-aim scale.
---@return number
function CBaseCombatWeapon:WeaponAutoAimScale() end

---Per-frame weapon idle logic.
function CBaseCombatWeapon:WeaponIdle() end

---Play/trigger a weapon sound; variant with optional time argument.
---@param soundID integer
---@param time number?
function CBaseCombatWeapon:WeaponSound(soundID, time) end

---Return integer representing internal weapon state.
---@return integer
function CBaseCombatWeapon:WeaponState() end

-- metamethods
---@return boolean
function CBaseCombatWeapon.__eq(a, b) end

---@return string
function CBaseCombatWeapon.__tostring() end

---Check if the weapon has ironsights capability
---@return boolean
function CBaseCombatWeapon:HasIronsights() end

---Check if the weapon is currently ironsighted
---@return boolean
function CBaseCombatWeapon:IsIronsighted() end

---Toggle ironsights on/off
function CBaseCombatWeapon:ToggleIronsights() end

---Enable ironsights
function CBaseCombatWeapon:EnableIronsights() end

---Disable ironsights
function CBaseCombatWeapon:DisableIronsights() end

---Set the ironsight transition time (usually from hip to ADS)
function CBaseCombatWeapon:SetIronsightTime() end

---Check if ironsights can currently be used
---@return boolean
function CBaseCombatWeapon:CanUseIronsight() end

return CBaseCombatWeapon