-- weapons/weapon_toolgun/tools/gravity.lua
TOOL.Name = "No Gravity"
TOOL.Description = "Disables gravity of entities."

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

    local vphys = ent:VPhysicsGetObject()
    if vphys == NULL then
      return false
    end

    vphys:EnableGravity( not vphys:IsGravityEnabled() )
  end
end

function TOOL:SecondaryAttack(swep, player, trace)
  -- TODO:
end
