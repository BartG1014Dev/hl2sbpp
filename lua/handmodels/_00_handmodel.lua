-- HandModels.lua
local hook = require("hook")

--[[
Here's a little story for ya.
Modifying this file is NOT how you make a handmodel addon.
To create one, just create a file in the same directory,
and just put something like this:

HandModels.hornet = { model = "models/weapons/...", skin = 0, name = "Hornet" }

PUTTING THE MODELS HERE IS NOT AN OPTIMAL CHOICE!!!
]]
HandModels = HandModels or {}

local defaultModels = {
  citizen = { model = "models/weapons/c_arms_citizen.mdl", skin = 0, name = "Citizen" },
  combine = { model = "models/weapons/c_arms_combine.mdl", skin = 0, name = "Combine" },
  refugee = { model = "models/weapons/c_arms_refugee.mdl", skin = 0, name = "Refugee" },
  def_cstrike = { model = "models/weapons/c_arms_cstrike.mdl", skin = 0, name = "Default (CS:S)" },
  urb_cstrike = { model = "models/weapons/c_arms_cstrike.mdl", skin = 7, name = "Urban (CS:S)" },
  german_dod = { model = "models/weapons/c_arms_dod.mdl", skin = 0, name = "German (DOD:S)" },
  american_dod = { model = "models/weapons/c_arms_dod.mdl", skin = 1, name = "American (DOD:S)" },
  zombie = { model = "models/weapons/c_arms_citizen.mdl", skin = 2, name = "Zombie" },
  hev = { model = "models/weapons/c_arms_hev.mdl", skin = 0, name = "HEV" },
  chell = { model = "models/weapons/c_arms_chell.mdl", skin = 0, name = "Chell" },
}

for k, v in pairs(defaultModels) do
  if not HandModels[k] then
    HandModels[k] = v
  end
end

if SERVER then
  hook.add("GetPlayerHandModel", "defaulthandmodel", function(player, handStr, soundType)
    local entry = HandModels[handStr]

    if entry and entry.model and entry.skin then
      _R.CBaseEntity.PrecacheModel(entry.model)
      return entry.model, entry.skin
    else
      local fallback = HandModels.citizen
      _R.CBaseEntity.PrecacheModel(fallback.model)
      return fallback.model, fallback.skin
    end
  end)
end