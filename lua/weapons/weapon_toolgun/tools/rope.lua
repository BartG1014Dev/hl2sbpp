-- weapons/weapon_toolgun/tools/rope.lua
TOOL.Name = "Rope"
TOOL.Description = "Connect 2 entities with a rope."
TOOL.firstEnt = nil
TOOL.firstPos = nil

function TOOL:PrimaryAttack(swep, player, trace)
  local ent = trace.m_pEnt
  if trace:DidHitWorld() then
    return false
  end
  if not ent or ent == NULL or ent:IsPlayer() then
    return false
  end
  if ent:GetMoveType() ~= MoveType.VPHYSICS then
    return false
  end

  if self.firstEnt == nil then
    self.firstEnt = ent
    self.firstPos = trace.m_vecEndPos
  else
    local endPos = trace.endpos or ent:GetAbsOrigin()
    local startPos = self.firstPos or self.firstEnt:GetAbsOrigin()

    local name1 = tostring(ent:entindex() .. "_ropeA")
    local name2 = tostring(self.firstEnt:entindex() .. "_ropeB")

    ent:KeyValue("targetname", name1)
    self.firstEnt:KeyValue("targetname", name2)

    local ropeConstraint = CreateEntityByName("phys_lengthconstraint")
    ropeConstraint:KeyValue("attach1", name1)
    ropeConstraint:KeyValue("attach2", name2)
    ropeConstraint:KeyValue("length", tostring((startPos - endPos):Length()))
    ropeConstraint:Spawn()
    ropeConstraint:Activate()

    local ropeStart = CreateEntityByName("move_rope")
    ropeStart:SetAbsOrigin(startPos)
    ropeStart:KeyValue("targetname", name2 .. "_ropeStart")
    ropeStart:KeyValue("NextKey", name1 .. "_ropeEnd")
    ropeStart:KeyValue("Slack", "30")
    ropeStart:KeyValue("Width", "2")
    ropeStart:KeyValue("RopeMaterial", "cable/cable.vmt")
    ropeStart:SetParent(self.firstEnt, 0)
    ropeStart:Spawn()
    ropeStart:Activate()

    local ropeEnd = CreateEntityByName("keyframe_rope")
    ropeEnd:SetAbsOrigin(endPos)
    ropeEnd:KeyValue("targetname", name1 .. "_ropeEnd")
    ropeEnd:KeyValue("NextKey", name2 .. "_ropeStart")
    ropeEnd:KeyValue("Slack", "30")
    ropeEnd:KeyValue("Width", "2")
    ropeEnd:KeyValue("RopeMaterial", "cable/cable.vmt")
    ropeEnd:SetParent(ent, 0)
    ropeEnd:Spawn()
    ropeEnd:Activate()

    self.firstEnt = nil
    self.firstPos = nil
  end
end

function TOOL:SecondaryAttack(swep, player, trace) end
