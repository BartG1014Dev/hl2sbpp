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
HandModels = {
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

if SERVER then
  hook.add("GetPlayerHandModel", "defaulthandmodel", function(player, handStr, soundType)
    local entry = HandModels[handStr]

    if entry then
      if entry.model and entry.skin then
        _R.CBaseEntity.PrecacheModel(entry.model)

        return entry.model, entry.skin
      end

      if soundType == 2 or soundType == 1 then
        _R.CBaseEntity.PrecacheModel(entry.combine.model)

        return entry.combine.model, entry.combine.skin
      else
        _R.CBaseEntity.PrecacheModel(entry.citizen.model)

        return entry.citizen.model, entry.citizen.skin
      end
    else
      return HandModels.citizen.model, HandModels.citizen.skin
    end
  end)
end
