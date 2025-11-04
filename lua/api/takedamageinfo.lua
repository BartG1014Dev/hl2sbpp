---@class CTakeDamageInfo
--- Represents a damage event with associated properties such as damage amount, type, and entities involved.
--- This class is used to manage damage calculations and interactions in the game.
CTakeDamageInfo = {}

--- Create a new CTakeDamageInfo instance with varying parameters based on input count.
--- Overloads:
--- - CTakeDamageInfo() -- Empty constructor, default values.
--- - CTakeDamageInfo(inflictor: CBaseEntity, attacker: CBaseEntity, damage: number, damageType: integer, [custom: integer])
--- - CTakeDamageInfo(inflictor: CBaseEntity, attacker: CBaseEntity, weapon: CBaseEntity, damage: number, damageType: integer, [custom: integer])
--- - CTakeDamageInfo(inflictor: CBaseEntity, attacker: CBaseEntity, force: Vector, damagePos: Vector, damage: number, damageType: integer, [custom: integer], [ammoType: Vector])
--- - CTakeDamageInfo(inflictor: CBaseEntity, attacker: CBaseEntity, weapon: CBaseEntity, force: Vector, damagePos: Vector, damage: number, damageType: integer, [custom: integer], [ammoType: Vector])
---@param ... any
---@return CTakeDamageInfo
function CTakeDamageInfo.CTakeDamageInfo(...) end

--- Add a specified amount to the current damage value.
---@param damage number Amount to add to the damage
function CTakeDamageInfo:AddDamage(damage) end

--- Add a damage type flag to the existing damage types.
---@param damageType integer Damage type to add (bitflag)
function CTakeDamageInfo:AddDamageType(damageType) end

--- Adjust damage inflicted by a player based on the skill level.
function CTakeDamageInfo:AdjustPlayerDamageInflictedForSkillLevel() end

--- Adjust damage taken by a player based on the skill level.
function CTakeDamageInfo:AdjustPlayerDamageTakenForSkillLevel() end

--- Check if the base damage value is valid (finite and non-negative).
---@return boolean
function CTakeDamageInfo:BaseDamageIsValid() end

--- Copy the current damage value to the base damage field.
function CTakeDamageInfo:CopyDamageToBaseDamage() end

--- Get a debug string describing the damage type(s).
---@param damageType integer The damage type to describe
---@return string
function CTakeDamageInfo:DebugGetDamageTypeString(damageType) end

--- Get the name of the ammo type associated with this damage.
---@return string
function CTakeDamageInfo:GetAmmoName() end

--- Get the ammo type index associated with this damage.
---@return integer
function CTakeDamageInfo:GetAmmoType() end

--- Get the entity that caused the damage (attacker).
---@return CBaseEntity
function CTakeDamageInfo:GetAttacker() end

--- Get the base damage value (before modifications).
---@return number
function CTakeDamageInfo:GetBaseDamage() end

--- Get the current damage value.
---@return number
function CTakeDamageInfo:GetDamage() end

--- Get the custom damage identifier (game-specific).
---@return integer
function CTakeDamageInfo:GetDamageCustom() end

--- Get the force vector applied by this damage event.
---@return Vector
function CTakeDamageInfo:GetDamageForce() end

--- Get the position where the damage occurred.
---@return Vector
function CTakeDamageInfo:GetDamagePosition() end

--- Get the damage stats (additional flags or metadata).
---@return integer
function CTakeDamageInfo:GetDamageStats() end

--- Get the damage type flags.
---@return integer
function CTakeDamageInfo:GetDamageType() end

--- Get the entity that inflicted the damage (e.g., a projectile).
---@return CBaseEntity
function CTakeDamageInfo:GetInflictor() end

--- Get the maximum damage allowed for this event.
---@return number
function CTakeDamageInfo:GetMaxDamage() end

--- Get the reported position of the damage (may differ from actual position).
---@return Vector
function CTakeDamageInfo:GetReportedPosition() end

--- Get the weapon entity responsible for this damage, if any.
---@return CBaseEntity
function CTakeDamageInfo:GetWeapon() end

--- Scale the damage amount by a factor.
---@param scale number Scaling factor
function CTakeDamageInfo:ScaleDamage(scale) end

--- Scale the damage force vector by a factor.
---@param scale number Scaling factor
function CTakeDamageInfo:ScaleDamageForce(scale) end

--- Set the ammo type index for this damage event.
---@param ammoType integer Ammo type index
function CTakeDamageInfo:SetAmmoType(ammoType) end

--- Set the attacker entity for this damage event.
---@param attacker CBaseEntity The attacking entity
function CTakeDamageInfo:SetAttacker(attacker) end

--- Set the damage amount for this event.
---@param damage number Damage amount
function CTakeDamageInfo:SetDamage(damage) end

--- Set a custom damage identifier (game-specific).
---@param custom integer Custom damage identifier
function CTakeDamageInfo:SetDamageCustom(custom) end

--- Set the force vector for this damage event.
---@param force Vector Force vector
function CTakeDamageInfo:SetDamageForce(force) end

--- Set the position where the damage occurred.
---@param position Vector Damage position
function CTakeDamageInfo:SetDamagePosition(position) end

--- Set damage stats (additional flags or metadata).
---@param stats integer Damage stats
function CTakeDamageInfo:SetDamageStats(stats) end

--- Set the damage type flags for this event.
---@param damageType integer Damage type (bitflag)
function CTakeDamageInfo:SetDamageType(damageType) end

--- Set the inflictor entity (e.g., a projectile).
---@param inflictor CBaseEntity The inflicting entity
function CTakeDamageInfo:SetInflictor(inflictor) end

--- Set the maximum damage allowed for this event.
---@param maxDamage number Maximum damage
function CTakeDamageInfo:SetMaxDamage(maxDamage) end

--- Set the reported position for this damage event.
---@param position Vector Reported position
function CTakeDamageInfo:SetReportedPosition(position) end

--- Set the weapon entity responsible for this damage.
---@param weapon CBaseEntity The weapon entity
function CTakeDamageInfo:SetWeapon(weapon) end

--- Subtract a specified amount from the current damage value.
---@param damage number Amount to subtract
function CTakeDamageInfo:SubtractDamage(damage) end

--- String representation of the CTakeDamageInfo object.
---@return string
function CTakeDamageInfo:__tostring() end

--- Clear the accumulated multi-damage queue.
function ClearMultiDamage() end

--- Apply all queued multi-damage events to their targets.
function ApplyMultiDamage() end

--- Add a damage event to the multi-damage queue for an entity.
---@param info CTakeDamageInfo The damage information
---@param target CBaseEntity The target entity
function AddMultiDamage(info, target) end

--- Calculate the impulse scale for a given mass and desired speed.
---@param mass number Mass of the object
---@param desiredSpeed number Desired speed
---@return number
function ImpulseScale(mass, desiredSpeed) end

--- Calculate the damage force for an explosive attack.
---@param info CTakeDamageInfo Damage information
---@param dir Vector Direction of the force
---@param origin Vector Origin of the explosion
---@param scale number Scaling factor (default: 1.0)
function CalculateExplosiveDamageForce(info, dir, origin, scale) end

--- Calculate the damage force for a bullet attack.
---@param info CTakeDamageInfo Damage information
---@param bulletType integer Bullet type index
---@param dir Vector Direction of the bullet
---@param origin Vector Origin of the shot
---@param scale number Scaling factor (default: 1.0)
function CalculateBulletDamageForce(info, bulletType, dir, origin, scale) end

--- Calculate the damage force for a melee attack.
---@param info CTakeDamageInfo Damage information
---@param dir Vector Direction of the force
---@param origin Vector Origin of the melee hit
---@param scale number Scaling factor (default: 1.0)
function CalculateMeleeDamageForce(info, dir, origin, scale) end

--- Guess the damage force based on provided parameters.
---@param info CTakeDamageInfo Damage information
---@param dir Vector Direction of the force
---@param origin Vector Origin of the damage
---@param scale number Scaling factor (default: 1.0)
function GuessDamageForce(info, dir, origin, scale) end

return CTakeDamageInfo
