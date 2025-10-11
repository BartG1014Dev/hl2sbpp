-- class_sound.lua
sound = sound or {}
sound._registered = sound._registered or {}

function sound.Add(t)
    if not t or not t.name then
        return false, "invalid sound table (missing name)"
    end

    local name = tostring(t.name)

    sound._registered[name] = t

    if _G.sound and _G.sound.Add and _G.sound ~= sound then
        local ok, err = pcall(_G.sound.Add, t)
        if not ok then
            return false, "engine sound.Add failed: " .. tostring(err)
        end
    end

    return true
end

function sound.Play(name, pos, level, pitch, volume)
    if CLIENT then
        surface.PlaySound(name)
	else
		local tempEnt = ents.Create("info_target")
		tempEnt:Spawn()
		tempEnt:Activate()
		tempEnt:SetAbsOrigin(Vector(0,0,0))
		tempEnt:EmitSound(name)
	end
end

function sound.Emit(ent, name, level, pitch, volume)
    if not IsValid(ent) then return end
    ent:EmitSound(name, level or 75, pitch or 100, volume or 1)
end