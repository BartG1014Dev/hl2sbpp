-- HandModels.lua
local hook = require("hook")

HandModels = {
    citizen     = { model = "models/weapons/c_arms_citizen.mdl", skin = 0, name = "Citizen" },
    combine     = { model = "models/weapons/c_arms_combine.mdl", skin = 0, name = "Combine" },
    refugee     = { model = "models/weapons/c_arms_refugee.mdl", skin = 0, name = "Refugee" },
    cstrike     = { model = "models/weapons/c_arms_cstrike.mdl", skin = 0, name = "CS:S" },
    dod         = { model = "models/weapons/c_arms_dod.mdl", skin = 0, name = "DOD:S" },
    zombie      = { model = "models/weapons/c_arms_citizen.mdl", skin = 2, name = "Zombie" },
	hev			= { model = "models/weapons/c_arms_hev.mdl", skin = 0, name = "HEV" },
	chell		= { model = "models/weapons/c_arms_chell.mdl", skin = 0, name = "Chell" }
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