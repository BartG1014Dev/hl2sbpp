--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

TOOL.Name = "Explode"
TOOL.Description = "Cause an explosion."

function TOOL:PrimaryAttack(swep, player, trace)
  effect.ExplosionCreate(
    trace.endpos,
    QAngle(0,0,0),
    player,
    15,
    15, true
  )
end

function TOOL:SecondaryAttack(swep, player, trace)
  -- TODO:
end
