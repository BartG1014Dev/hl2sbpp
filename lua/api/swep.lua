---Base class for Scripted Weapons (SWEPs)
---@class SWEP : CBaseCombatWeapon
---@field printname string        # Display name (can be a localization token, e.g. "#HL2_357Handgun")
---@field viewmodel string        # Path to the first-person view model
---@field playermodel string      # Path to the third-person/world model
---@field anim_prefix string      # Animation prefix (defines which animations are used)
---@field bucket integer          # Weapon slot group (for weapon selection)
---@field bucket_position integer # Position inside the bucket
---@field clip_size integer       # Max ammo in primary clip
---@field clip2_size integer      # Max ammo in secondary clip (-1 = no secondary)
---@field default_clip integer    # Default ammo in primary clip
---@field default_clip2 integer   # Default ammo in secondary clip
---@field primary_ammo string     # Ammo type for primary fire
---@field secondary_ammo string   # Ammo type for secondary fire
---@field weight integer          # Weapon weight (affects auto switch)
---@field item_flags integer      # Internal engine flags
---@field damage number           # Base weapon damage
---@field SoundData table         # Table of sounds (keys like "empty", "single_shot")
---@field showusagehint integer   # Show usage hint (0/1)
---@field autoswitchto integer    # Auto-switch to this weapon (0/1)
---@field autoswitchfrom integer  # Auto-switch away from this weapon (0/1)
---@field BuiltRightHanded integer # 1 if built for right-handed use
---@field AllowFlipping integer   # 1 if flipping/mirroring is allowed
---@field MeleeWeapon integer     # 1 if melee weapon
---@field m_acttable table        # Activity translation table
SWEP = {}

---Called when the weapon is first initialized.
function SWEP:Initialize() end

---Think logic, called every frame while weapon is active. Use for per-frame updates.
function SWEP:Think() end

---Called when the weapon is holstered (put away). Return true if holster allowed.
---@param pSwitchingTo any Weapon being switched to
---@return boolean success
function SWEP:Holster(pSwitchingTo) end

return SWEP