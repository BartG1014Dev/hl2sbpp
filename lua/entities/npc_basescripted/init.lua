--======== Copyleft � 2010-2011, Team Sandbox, Some rights reserved. ========--
--
-- Purpose:
--
--===========================================================================--

includeC( "shared.lua" )
includeC( "anims.lua" )

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

function ENT:DoFootstep()
    if not self:IsOnGround() then return end

	-- i hate this
	if self.FootstepLeft then
		self:EmitSound("Default.StepLeft")
    else
		self:EmitSound("Default.StepRight")
	end

    self.FootstepLeft = not self.FootstepLeft
end

function ENT:HandleFootsteps()
    local curtime = gpGlobals.curtime()

    local phys = self:VPhysicsGetObject()
	local velocity = self:GetAbsVelocity():Length()
	if phys and phys ~= NULL then
		velocity = phys:GetVelocity():Length()
	end

    local speed = velocity or 0
    local walkingThreshold = 20

    if speed > walkingThreshold and self:IsOnGround() then
        local interval = math.clamp(self.FootstepIntervalBase * (130 / math.max(speed,1)), 0.18, 0.6)
        if curtime >= (self.NextFootstepTime or 0) then
            self:DoFootstep()
            self.NextFootstepTime = curtime + interval
        end
    else
        self.NextFootstepTime = curtime
    end
end

function ENT:MoveThink()
    local pos = self:GetAbsOrigin()

    if not self.TargetPos or (pos - self.TargetPos):Length() < 40 and self.DoMove then
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
            --Warning("Unable to find nearest area. Do you have a navigation mesh?\n")
            newTarget = pos + Vector(random.RandomInt(-200,200), random.RandomInt(-200,200), 0)
        end

        if newTarget then
            self.TargetPos = newTarget
        end
    end

	-- quite a hacky hack
    if self.FollowPlayer and self.DoMove then
        local nearestPlayer, dist = self:GetNearestPlayer()
        if nearestPlayer then
            self.TargetPos = nearestPlayer:GetAbsOrigin()

			local headPos = self:GetBonePosition(self:LookupBone("ValveBiped.Bip01_Head1"), Vector(0,0,0), QAngle(0,0,0)) or self:GetAbsOrigin()
			local delta = nearestPlayer:GetAbsOrigin() + Vector(0,0,40) - headPos -- look at player head
			local targetYaw = math.deg(math.atan2(delta.y, delta.x))
			local targetPitch = math.deg(math.atan2(-delta.z, math.sqrt(delta.x^2 + delta.y^2)))

			local yawIndex = self:LookupPoseParameter("eyes_leftright")
			local pitchIndex = self:LookupPoseParameter("eyes_updown")

			if yawIndex >= 0 then
				local currentYaw = self:GetPoseParameter(yawIndex)
				local desiredYaw = math.clamp(targetYaw / 90, -1, 1)
				local smoothYaw = currentYaw + (desiredYaw - currentYaw) * 0.1
				self:SetPoseParameter(yawIndex, smoothYaw)
			end

			if pitchIndex >= 0 then
				local currentPitch = self:GetPoseParameter(pitchIndex)
				local desiredPitch = math.clamp(targetPitch / 90, -1, 1)
				local smoothPitch = currentPitch + (desiredPitch - currentPitch) * 0.1
				self:SetPoseParameter(pitchIndex, smoothPitch)
			end
        end
    end

    if self.TargetPos and self.DoMove then
        local dir = self.TargetPos - pos
        local len = dir:Length()
        if len > 0 then
            dir = dir / len
			dir.z = 0
            self:SetAbsVelocity(dir * 130)

            local phys = self:VPhysicsGetObject()
			if phys and phys ~= NULL then
				phys:SetVelocity(dir * 130, dir * 130)
			end

            -- smooth rotation lol
            local desiredYaw = math.deg(math.atan2(dir.y, dir.x))
            local curAng = self:GetAbsAngles()
            local smoothYaw = curAng.y + AngleDifference(desiredYaw, curAng.y) * 0.1
            curAng.y = smoothYaw
            self:SetAbsAngles(curAng)

            --[[local headYawIndex = self:LookupPoseParameter("head_yaw")
            if headYawIndex >= 0 then
                local headYaw = math.deg(math.atan2(dir.y, dir.x)) - curAng.y
                self:SetPoseParameter(headYawIndex, headYaw)
            end]]--
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
    local curtime = gpGlobals.curtime()
    local pos = self:GetAbsOrigin()

    local dt = curtime - (self._LastAnimPosTime or curtime)
    if dt <= 0 then dt = 0.001 end
    local lastPos = self._LastAnimPos or pos
    local moved = pos - lastPos
    local displacementSpeed = moved:Length() / dt

    local physSpeed = 0
    local phys = self:VPhysicsGetObject()
    if phys and phys ~= NULL and phys.GetVelocity then
        physSpeed = phys:GetVelocity():Length()
    end
    local absSpeed = self:GetAbsVelocity() and self:GetAbsVelocity():Length() or 0

    local speed = displacementSpeed

    if self.DebugAnim and (curtime - (self._LastDebugPrintTime or 0) > 0.25) then
        print(string.format("AnimVel: disp=%.2f phys=%.2f abs=%.2f", displacementSpeed, physSpeed, absSpeed))
        self._LastDebugPrintTime = curtime
    end

    local movingThreshold = 2.0

    local weaponName = (self.Weapon and self.Weapon.GetName) and self.Weapon:GetName() or "None"
    local activity
    if speed > movingThreshold then
        if self.Weapon then
            activity = GetRunActivity(weaponName)
        else
            activity = ACT.HL2MP_RUN
        end
    else
        if self.Weapon then
            activity = GetIdleActivity(weaponName)
        else
            activity = ACT.HL2MP_IDLE
        end
    end

    local seq = self:SelectWeightedSequence(activity)
    if seq >= 0 then
        if self:GetSequence() ~= seq then
            self:ResetSequence(seq)
        end
        self:StudioFrameAdvance()
        self.LastAnimTime = curtime
    end

    self._LastAnimPos = pos
    self._LastAnimPosTime = curtime
end

function ENT:GetNearestPlayer()
	local nearest = nil
	local nearestDist = math.huge

	-- TODO: do shit 
	local ply = UTIL.GetLocalPlayer()

	local dist = (ply:GetAbsOrigin() - self:GetAbsOrigin()):Length()
	if dist < nearestDist then
		nearestDist = dist
		nearest = ply
	end

	return nearest, nearestDist
end

function ENT:Think()
    self:MoveThink()

    if self.isEnemy and self.Weapon ~= NULL and self.Weapon then
        local target, dist = self:GetNearestPlayer()
        if target and dist <= 1000 then
            local shootPos = self:GetBonePosition(self:LookupBone("ValveBiped.Bip01_Head1"), Vector(0, 0, 0), QAngle(0, 0, 0)) or self:GetAbsOrigin() + Vector(0,0,60)
            local dir = (target:GetAbsOrigin() + Vector(0,0,40) - shootPos):NormalizeInPlace()

            self:LookAtTarget(target:GetAbsOrigin())

            self.Weapon:SetOwnerEntity(self)
			self.IsFiring = true
            self.Weapon:PrimaryAttack()
			self.IsFiring = false
        end
    end

	self:HandleFootsteps()

	self:UpdateAnimation()
	
    self:SetNextThink(gpGlobals.curtime())

    return true
end
