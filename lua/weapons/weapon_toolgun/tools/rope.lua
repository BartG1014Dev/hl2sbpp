--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

TOOL.Name = "Rope"
TOOL.Description = "Connect 2 entities with a rope."
TOOL.firstEnt = nil
TOOL.firstPos = nil

local function make_unique_name(prefix, ent)
  return string.format("%s_%d_%d", prefix or "rope", ent and ent:entindex() or 0, os.time())
end

local function CreateAnchor(ent, pos)
    local anchorName = make_unique_name("rope_anchor", ent)

    local anchor = CreateEntityByName("info_target")
    if not anchor then return nil end

    anchor:SetAbsOrigin(pos)
    anchor:KeyValue("targetname", anchorName)
    anchor:SetParent(ent, 0)
    anchor:Spawn()
    anchor:Activate()

    anchor._rope_anchor_parent = ent
    anchor._rope_anchor_name = anchorName

    return anchor
end

local function CreateRopeAndConstraint(anchorA, anchorB, slack, width, material, startEnt, endEnt)
    if not anchorA or not anchorB then return nil end

    local nameA = anchorA._rope_anchor_name or make_unique_name("ra")
    local nameB = anchorB._rope_anchor_name or make_unique_name("rb")

    local posA = anchorA:GetAbsOrigin()
    local posB = anchorB:GetAbsOrigin()

    slack = slack or 30
    width = width or 2
    material = material or "cable/cable.vmt"

    -- length constraint
    local lengthConstr = CreateEntityByName("phys_lengthconstraint")
    if lengthConstr then
        lengthConstr:SetAbsOrigin(posA)
        lengthConstr:KeyValue("attachpoint", tostring(posB.x) .. " " .. tostring(posB.y) .. " " .. tostring(posB.z))
        lengthConstr:KeyValue("attach1", startEnt.name)
        lengthConstr:KeyValue("attach2", endEnt.name)
        lengthConstr:KeyValue("addlength", tostring(slack))
        lengthConstr:KeyValue("minlength", "0")
        lengthConstr:Spawn()
        lengthConstr:Activate()
    end

    -- move_rope like start
    local ropeStart = CreateEntityByName("move_rope")
    if ropeStart then
        ropeStart:SetAbsOrigin(posA)
        ropeStart:KeyValue("targetname", nameA .. "_ropeStart")
        ropeStart:KeyValue("NextKey", nameB .. "_ropeEnd")
        ropeStart:KeyValue("Slack", tostring(slack))
        ropeStart:KeyValue("Width", tostring(width))
        ropeStart:KeyValue("RopeMaterial", material)
        ropeStart:SetParent(anchorA, 0)
        ropeStart:Spawn()
        ropeStart:Activate()
    end

    -- keyframe_rope like end
    local ropeEnd = CreateEntityByName("keyframe_rope")
    if ropeEnd then
        ropeEnd:SetAbsOrigin(posB)
        ropeEnd:KeyValue("targetname", nameB .. "_ropeEnd")
        ropeEnd:KeyValue("NextKey", nameA .. "_ropeStart")
        ropeEnd:KeyValue("Slack", tostring(slack))
        ropeEnd:KeyValue("Width", tostring(width))
        ropeEnd:KeyValue("RopeMaterial", material)
        ropeEnd:SetParent(anchorB, 0)
        ropeEnd:Spawn()
        ropeEnd:Activate()
    end

    return {
        anchorA = anchorA,
        anchorB = anchorB,
        ropeStart = ropeStart,
        ropeEnd = ropeEnd,
        lengthConstraint = lengthConstr
    }
end

function TOOL:PrimaryAttack(swep, player, trace)
    if trace:DidHitWorld() then
        return false
    end

    local ent = trace.m_pEnt
    if not ent or ent == NULL or ent:IsPlayer() then
        return false
    end

    if ent:GetMoveType() ~= MoveType.VPHYSICS then
        return false
    end

    if self.firstEnt == nil then
        self.firstEnt = ent
        self.firstPos = trace.m_vecEndPos or trace.endpos or ent:GetAbsOrigin()
        return true
    end

    local endEnt = ent
    local endPos = trace.m_vecEndPos or trace.endpos or endEnt:GetAbsOrigin()
    local startEnt = self.firstEnt
    local startPos = self.firstPos or startEnt:GetAbsOrigin()

    if SERVER then
        local name1 = make_unique_name("startent", startEnt)
        local name2 = make_unique_name("endent", endEnt)

        startEnt:KeyValue("targetname", name1)
        startEnt.name = name1
        endEnt:KeyValue("targetname", name2)
        endEnt.name = name2

        local anchorA = CreateAnchor(startEnt, startPos)
        local anchorB = CreateAnchor(endEnt, endPos)

        if not anchorA or not anchorB then
            if anchorA and anchorA.Remove then anchorA:Remove() end
            if anchorB and anchorB.Remove then anchorB:Remove() end
            self.firstEnt = nil
            self.firstPos = nil
            return false
        end

        local ropeTbl = CreateRopeAndConstraint(anchorA, anchorB, 30, 2, "cable/cable.vmt", startEnt, endEnt)

        if not self._createdRopes then self._createdRopes = {} end
        table.insert(self._createdRopes, ropeTbl)
    end

    self.firstEnt = nil
    self.firstPos = nil

    return true
end

function TOOL:SecondaryAttack(swep, player, trace) end
