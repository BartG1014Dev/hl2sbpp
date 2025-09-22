-- class_util.lua
util = {}

function util.PrecacheModel(model)
	_R.CBaseEntity.PrecacheModel(model)
end

function util.PrecacheSound(sound)
	_R.CBaseEntity.PrecacheSound(sound)
end