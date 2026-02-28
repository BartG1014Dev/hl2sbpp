--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

TOOL.Name = "Igniter"
TOOL.Description = "Ignites entities."

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
      engine.ServerCommand("ent_fire !picker ignite\n")
    else
      engine.ClientCmd_Unrestricted("ent_fire !picker ignite\n")
    end
  end
end

function TOOL:SecondaryAttack(swep, player, trace)
  -- TODO:
end
