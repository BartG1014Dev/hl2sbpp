---@class CSoundParameters
---@field channel integer # The sound channel (e.g., CHAN_STATIC, CHAN_VOICE)
---@field volume number # Volume multiplier (0.0–1.0, but can exceed 1.0 for amplification)
---@field pitch integer # Default pitch (100 = normal, <100 = lower, >100 = higher)
---@field pitchlow integer # Minimum randomized pitch value
---@field pitchhigh integer # Maximum randomized pitch value
---@field soundlevel integer # Attenuation / sound level (see soundlevel_t enum)
---@field play_to_owner_only boolean # If true, only the owner hears the sound
---@field count integer # Number of sounds available (for randomization)
---@field soundname string # Name/path of the sound file
---@field delay_msec integer # Delay before playback in milliseconds
CSoundParameters = {}

return CSoundParameters
