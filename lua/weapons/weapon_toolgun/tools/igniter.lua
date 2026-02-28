--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

TOOL.Name = "Igniter"
TOOL.Description = "Ignites (primary attack) entities."

function TOOL:PrimaryAttack(swep, player, trace)
  local ent = trace.m_pEnt
  if trace:DidHitWorld() then
    return false
  end

  if ent ~= NULL then
    if ent:IsPlayer() then
      Warning("Uhh... No.\n")
      return false
    end

    local baseanimating = ent:GetBaseAnimating()
    if baseanimating == NULL then
      return false
    end

    -- i give up
    if SERVER then
      local fire = CreateEntityByName("env_fire")
      if not IsValid(fire) then
        return false
      end

      local pos = ent:GetAbsOrigin()
      fire:SetAbsOrigin(pos + Vector(0, 0, 10))

      fire:KeyValue("health", "8")
      fire:KeyValue("firesize", "36")
      fire:KeyValue("fireattack", "1")
      fire:KeyValue("damagescale", "45")

      fire:KeyValue("spawnflags", "20")

      fire:Spawn()
      fire:Activate()

      fire:SetParent(ent, 0)

      Timer.Simple(8, function()
        if IsValid(fire) then
          fire:Remove()
        end
      end)
    end
  end
end

function TOOL:SecondaryAttack(swep, player, trace)
end
