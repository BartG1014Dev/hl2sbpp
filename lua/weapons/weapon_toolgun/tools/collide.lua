-- weapons/weapon_toolgun/tools/collide.lua
TOOL.Name = "No Collision"
TOOL.Description = "Disables/enables collision of entities."

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

    vphys:EnableCollisions( not vphys:IsCollisionEnabled() )
  end
end

function TOOL:SecondaryAttack(swep, player, trace)
  -- TODO:
end
