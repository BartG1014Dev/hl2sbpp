---@class CAmmoDef
CAmmoDef = {}

--- Returns the internal ammo index for a given ammo name.
---@param name string The name of the ammo type (e.g. `"9mmRound"`).
---@return integer index The internal index, or -1 if not found.
function CAmmoDef:Index(name) end

--- Returns the damage dealt by the player using this ammo type.
---@param ammoIndex integer Ammo type index, usually from `CAmmoDef:Index()`.
---@return number damage The damage value for the player.
function CAmmoDef:PlrDamage(ammoIndex) end

--- Returns the damage dealt by NPCs using this ammo type.
---@param ammoIndex integer Ammo type index.
---@return number damage The damage value for NPCs.
function CAmmoDef:NPCDamage(ammoIndex) end

--- Returns the max amount of this ammo type the player can carry.
---@param ammoIndex integer Ammo type index.
---@return number maxCarry The maximum carry count.
function CAmmoDef:MaxCarry(ammoIndex) end

--- Registers a new ammo type.
--- Example:
--- ```lua
--- def:AddAmmoType(
---     "357Round",
---     bit.bor(DMG_BULLET, DMG_NEVERGIB), -- damage type
---     AmmoTracer.NONE,                   -- tracer type
---     "sk_plr_dmg_357_bullet",           -- player damage (ConVar or number)
---     nil,                               -- NPC damage (optional)
---     "sk_max_357_bullet",               -- max carry (ConVar or number)
---     BULLET_IMPULSE(650, 6000),         -- impulse force
---     0                                  -- flags
--- )
--- ```
---@param name string Name of the ammo type (unique identifier).
---@param dmgType integer|string Damage type constant or expression (e.g. `DMG_BULLET` or `bit.bor(DMG_BULLET, DMG_SHOCK)`).
---@param tracerType integer|string Tracer type constant (e.g. `AmmoTracer.NONE`).
---@param plrDmg number|string Player damage amount or skill cvar name.
---@param npcDmg? number|string NPC damage amount or skill cvar name (optional).
---@param maxCarry number|string Maximum carry amount or cvar name.
---@param impulse number|string Impulse force or cvar name.
---@param flags? integer|string Optional flags bitmask.
---@param minSplash? integer Minimum splash radius (default: 4).
---@param maxSplash? integer Maximum splash radius (default: 8).
function CAmmoDef:AddAmmoType(
  name,
  dmgType,
  tracerType,
  plrDmg,
  npcDmg,
  maxCarry,
  impulse,
  flags,
  minSplash,
  maxSplash
)
end

--- Returns a string representation for debugging.
---@return string
function CAmmoDef:__tostring() end

--- Global function that returns the singleton CAmmoDef instance.
---@return CAmmoDef
function AmmoDef() end

return CAmmoDef
