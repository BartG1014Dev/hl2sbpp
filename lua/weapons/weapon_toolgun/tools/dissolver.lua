-- weapons/weapon_toolgun/tools/dissolver.lua
TOOL.Name = "Dissolver"
TOOL.Description = "Dissolves entities."

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

    effect.Dissolve(ent, "sprites/blueglow1.vmt", gpGlobals.curtime(), 0)
  end
end

function TOOL:SecondaryAttack(swep, player, trace)
  -- TODO:
end
