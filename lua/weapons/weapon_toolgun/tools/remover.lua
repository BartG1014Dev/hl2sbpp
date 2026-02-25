-- weapons/weapon_toolgun/tools/remover.lua
TOOL.Name = "Remover"
TOOL.Description = "Destroys entities."

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

    --UTIL.Remove(ent)
    effect.Dissolve(ent, "sprites/blueglow1.vmt", gpGlobals.curtime(), 1)
  end
end

function TOOL:SecondaryAttack(swep, player, trace)
  -- TODO:
end
