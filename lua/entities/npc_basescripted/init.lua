--======== Copyleft � 2010-2011, Team Sandbox, Some rights reserved. ========--
--
-- Purpose:
--
--===========================================================================--

includeC( "shared.lua" )

local function AngleDifference(a, b)
    local diff = (a - b) % 360
    if diff > 180 then
        diff = diff - 360
    end
    return diff
end

function ENT:DeathThink()
	local pos = self:GetAbsOrigin()
    local ang = self:GetAbsAngles()
    local model = self:GetModelName()

    -- spawn ragdoll
    local ragdoll = CreateEntityByName("prop_ragdoll")
    if ragdoll ~= nil then
        ragdoll:SetModel(model)
        ragdoll:SetAbsOrigin(pos)
        ragdoll:SetAbsAngles(ang)

        ragdoll:Spawn()
        ragdoll:Activate()
    end

    self:Remove()
end

function ENT:IsObstacleAhead()
    local eyePos = self:GetAbsOrigin() + Vector(0,0,40)

    local ang = self:GetAbsAngles()
    local forward = Vector(math.cos(math.rad(ang.y)), math.sin(math.rad(ang.y)), 0)

    local tr = trace_t()
    local maskShot = _E.MASK.SHOT

    UTIL.TraceLine(
        eyePos,
        eyePos + forward * 60,
        maskShot,
        self,
        0,
        tr
    )

    return tr.Hit
end

function ENT:IsOnGround()
    local startPos = self:GetAbsOrigin()
    local tr = trace_t()
    UTIL.TraceLine(
        startPos, 
        startPos - Vector(0,0,5),
        _E.MASK.SOLID,
        self,
        0,
        tr
    )
    return tr.Hit
end
function ENT:Jump()
    local phys = self:VPhysicsGetObject()
    if phys ~= NULL and self:IsOnGround() then
        phys:ApplyForceCenter(Vector(0,0,1) * 4000)
    end
end

function ENT:MoveThink()
    local pos = self:GetAbsOrigin()

    if not self.TargetPos or (pos - self.TargetPos):Length() < 40 then
        local currentPos = self:GetAbsOrigin()
        local nearestArea = navmesh.GetNearestNavArea(currentPos)

        local newTarget = nil
        if nearestArea then
            local adjacentCount = nearestArea:GetAdjacentCount(0)
            if adjacentCount > 0 then
                local randomIndex = random.RandomInt(0, adjacentCount - 1)
                local nextArea = nearestArea:GetAdjacentArea(0, randomIndex)
                if nextArea then
                    newTarget = nextArea:GetRandomPoint()
                end
            end

            if not newTarget then
                newTarget = nearestArea:GetRandomPoint()
            end
        else
            Warning("Unable to find nearest area. Do you have a navigation mesh?\n")
            newTarget = pos + Vector(random.RandomInt(-200,200), random.RandomInt(-200,200), 0)
        end

        if newTarget then
            self.TargetPos = newTarget
        end
    end

    if self.TargetPos then
        local dir = self.TargetPos - pos
        local len = dir:Length()
        if len > 0 then
            dir = dir / len
            self:SetAbsVelocity(dir * 130)

            -- smooth rotation lol
            local desiredYaw = math.deg(math.atan2(dir.y, dir.x))
            local curAng = self:GetAbsAngles()
            local smoothYaw = curAng.y + AngleDifference(desiredYaw, curAng.y) * 0.1
            curAng.y = smoothYaw
            self:SetAbsAngles(curAng)

            local headYawIndex = self:LookupPoseParameter("head_yaw")
            if headYawIndex >= 0 then
                local headYaw = math.deg(math.atan2(dir.y, dir.x)) - curAng.y
                self:SetPoseParameter(headYawIndex, headYaw)
            end
        end
    end

    if self:IsObstacleAhead() and self:IsOnGround() then
        self:Jump()
    end
end

function ENT:LookAtTarget(targetPos)
    local headPos = self:GetBonePosition(self:LookupBone("ValveBiped.Bip01_Head1"), Vector(0, 0, 0), QAngle(0, 0, 0)) or self:GetAbsOrigin()
    local delta = targetPos - headPos

    local yaw = math.deg(math.atan2(delta.y, delta.x))
    local pitch = math.deg(math.atan2(-delta.z, math.sqrt(delta.x^2 + delta.y^2)))
    local ang = QAngle(pitch, yaw, 0)

    local yawIndex = self:LookupPoseParameter("eyes_leftright")
    local pitchIndex = self:LookupPoseParameter("eyes_updown")

    if yawIndex >= 0 then
        local yawVal = math.clamp(ang.y / 90, -1, 1)
        self:SetPoseParameter(yawIndex, yawVal)
    end
    if pitchIndex >= 0 then
        local pitchVal = math.clamp(ang.x / 90, -1, 1)
        self:SetPoseParameter(pitchIndex, pitchVal)
    end
end

function ENT:UpdateAnimation()
    local vel = self:GetAbsVelocity():Length()

    local activity
    if vel > 10 then
		if self.Weapon then
			activity = ACT.HL2MP_RUN_SMG1
        else
			--activity = ACT.WALK
			activity = ACT.HL2MP_RUN
		end
    else
		if self.Weapon then
			activity = ACT.HL2MP_IDLE_SMG1
        else
			--activity = ACT.IDLE
			activity = ACT.HL2MP_IDLE
		end
    end

    local seq = self:SelectWeightedSequence(activity)
    if seq >= 0 then
        if self:GetSequence() ~= seq then
            self:ResetSequence(seq)
        end

        local dt = gpGlobals.curtime() - (self.LastAnimTime or gpGlobals.curtime())
        self:StudioFrameAdvance()
        self.LastAnimTime = gpGlobals.curtime()
    end
end

function ENT:GetNearestPlayer()
	local nearest = nil
	local nearestDist = math.huge

	-- TODO: do shit 
	local ply = UTIL.GetListenServerHost()

	local dist = (ply:GetAbsOrigin() - self:GetAbsOrigin()):Length()
	if dist < nearestDist then
		nearestDist = dist
		nearest = ply
	end

	return nearest, nearestDist
end

function ENT:Think()
    if SERVER then
        self:MoveThink()

        if self.isEnemy and self.Weapon ~= NULL and self.Weapon then
            local target, dist = self:GetNearestPlayer()
            if target and dist <= 1000 then
                local shootPos = self:GetBonePosition(self:LookupBone("ValveBiped.Bip01_Head1"), Vector(0, 0, 0), QAngle(0, 0, 0)) or self:GetAbsOrigin() + Vector(0,0,60)
                local dir = (target:GetAbsOrigin() + Vector(0,0,40) - shootPos):NormalizeInPlace()

                self:LookAtTarget(target:GetAbsOrigin())

                self.Weapon:SetOwnerEntity(self)
                self.Weapon:PrimaryAttack()
            end
        end
    end

	self:UpdateAnimation()
	
    self:SetNextThink(gpGlobals.curtime())

    return true
end
