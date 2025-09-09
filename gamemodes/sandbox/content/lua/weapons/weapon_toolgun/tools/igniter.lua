-- weapons/weapon_toolgun/tools/igniter.lua
TOOL.Name = "Igniter"
TOOL.Description = "Ignites entities."

function TOOL:PrimaryAttack(swep, player, trace)
    local ent = trace.m_pEnt
	if trace:DidHitWorld() then return false end

    if ent ~= NULL then
		if ent:IsPlayer() then
			Warning("Uhh... No.\n")
			return false
		end
		
		local baseanimating = ent:GetBaseAnimating()
		if baseanimating == NULL then return false end

		-- HACKHACK, don't know if this will work
		local startTime = gpGlobals.curtime()
		local fireEffect = CreateEntityByName("env_fire")
		fireEffect:GetAbsOrigin(ent:GetAbsOrigin())
		fireEffect:SetParent(ent, 0)
		fireEffect:KeyValue("health", "5")
		fireEffect:KeyValue("firesize", "20")
		fireEffect:SetOwnerEntity(ent)
		fireEffect:Spawn()
		fireEffect:Activate()
		if SERVER then
			fireEffect:AcceptInput("StartFire", nil, nil, 0)
		end
    end
end

function TOOL:SecondaryAttack(swep, player, trace)
    -- TODO:
end
