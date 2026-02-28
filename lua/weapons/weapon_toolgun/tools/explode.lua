--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

TOOL.Name = "Explode"
TOOL.Description = "Cause an explosion."

function TOOL:PrimaryAttack(swep, player, trace)
  local grenade = CreateEntityByName("grenade_ar2")
  if grenade ~= NULL then
    --grenade.PrecacheModel( "grenade_ar2" )
    --grenade:SetModel( "grenade_ar2" )
    grenade:SetAbsOrigin(trace.endpos)
    grenade:SetAbsAngles(QAngle())
    grenade:Spawn()
    grenade:Activate()
  end
end

function TOOL:SecondaryAttack(swep, player, trace)
  -- TODO:
end
