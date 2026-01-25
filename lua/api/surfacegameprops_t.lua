---@class surfacegameprops_t
---@field maxSpeedFactor number Factor affecting maximum movement speed
---@field jumpFactor number Factor affecting jump height
---@field material integer Material identifier
---@field climbable integer Indicates if the surface is climbable (0 or 1)
---@field pad integer Padding field (unused)
surfacegameprops_t = {}

--- Represents complete surface data, combining physics, audio, and game properties.
return surfacegameprops_t
