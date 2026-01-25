-- weapons/weapon_toolgun/tools/weld.lua
TOOL.Name = "Weld"
TOOL.Description = "Weld 2 entities together."
TOOL.firstEnt = nil

function TOOL:PrimaryAttack(swep, player, trace)
  local ent = trace.m_pEnt
  if trace:DidHitWorld() then
    return false
  end

  if self.firstEnt ~= nil then
    if ent ~= NULL then
      if ent:IsPlayer() then
        Warning("Uhh... No.\n")
        return false
      end

      --ent:SetParent(self.firstEnt)

      local name1 = tostring(ent:entindex() .. "_weld")
      local name2 = tostring(self.firstEnt:entindex() .. "_weld")

      ent:KeyValue("targetname", tostring(name1))
      self.firstEnt:KeyValue("targetname", tostring(name2))

      local c = CreateEntityByName("phys_constraint")
      c:KeyValue("attach1", tostring(name1))
      c:KeyValue("attach2", tostring(name2))
      c:Spawn()
      c:Activate()

      self.firstEnt = nil
    end
  else
    if ent ~= NULL then
      if ent:IsPlayer() then
        Warning("Uhh... No.\n")
        return false
      end

      self.firstEnt = ent
    end
  end
end

function TOOL:SecondaryAttack(swep, player, trace)
  -- TODO:
end
