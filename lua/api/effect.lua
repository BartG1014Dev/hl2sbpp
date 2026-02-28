---@class effect
---Library for creating game effects like explosions and dissolves.
effect = {}

---Dissolves an entity with a specific Effects.
---@param entity any The entity to dissolve.
---@param effectName string The name of the dissolve Effects.
---@param curtime number The current time. Use gpGlobals.curtime() for that.
---@param flags integer Flags controlling dissolve behavior.
---@return any The created dissolve entity.
function effect.Dissolve(entity, effectName, life, flags) end

---Creates an explosion at a given position.
---@param position Vector
---@param angle QAngle
---@param owner any Entity that caused the explosion.
---@param magnitude integer Explosion magnitude.
---@param radius integer Explosion radius.
---@param doDamage boolean Whether the explosion deals damage.
---@param ignoreLOS? boolean Optional. If true, ignores line-of-sight checks. Default: false
---@param customEffect? boolean Optional. If true, uses a custom visual Effects. Default: false
---@param soundType? integer Optional. Type of explosion sound. Default: -1
function effect.ExplosionCreate(
  position,
  angle,
  owner,
  magnitude,
  radius,
  doDamage,
  ignoreLOS,
  customEffect,
  soundType
)
end
return effect
