--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

includeC("shared.lua")
includeC("anims.lua")

local ATTACK_RADIUS = 100
local MAX_TARGETS = 3
local ATTACK_INTERVAL = 0.5
local MOVE_SPEED = 500

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
  local eyePos = self:GetAbsOrigin() + Vector(0, 0, 40)

  local ang = self:GetAbsAngles()
  local forward = Vector(math.cos(math.rad(ang.y)), math.sin(math.rad(ang.y)), 0)

  local tr = trace_t()
  local maskShot = _E.MASK.SHOT

  UTIL.TraceLine(eyePos, eyePos + forward * 60, maskShot, self, 0, tr)

  return tr.Hit
end

function ENT:IsOnGround()
  local startPos = self:GetAbsOrigin()
  local tr = trace_t()
  UTIL.TraceLine(startPos, startPos - Vector(0, 0, 5), _E.MASK.SOLID, self, 0, tr)
  return tr.Hit
end

function ENT:Jump()
  local phys = self:VPhysicsGetObject()
  if phys ~= NULL and self:IsOnGround() then
    phys:ApplyForceCenter(Vector(0, 0, 1) * 4000)
  end
end

function ENT:DoFootstep()
  if not self:IsOnGround() then
    return
  end

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
    local interval = math.clamp(self.FootstepIntervalBase * (130 / math.max(speed, 1)), 0.18, 0.6)
    if curtime >= (self.NextFootstepTime or 0) then
      self:DoFootstep()
      self.NextFootstepTime = curtime + interval
    end
  else
    self.NextFootstepTime = curtime
  end
end

local function GetNearestPlayers(pos, radius)
  local players = player.GetAll()
  local candidates = {}

  for _, ply in ipairs(players) do
    if IsValid(ply) and ply:IsAlive() then
      local d = (ply:GetAbsOrigin() - pos):Length()
      if d <= radius then
        table.insert(candidates, { ply = ply, dist = d })
      end
    end
  end

  table.sort(candidates, function(a, b)
    return a.dist < b.dist
  end)
  return candidates
end

function ENT:AttackNearestPlayers()
  local now = gpGlobals.curtime()
  if self._NextAttackTime and now < self._NextAttackTime then
    return
  end
  self._NextAttackTime = now + ATTACK_INTERVAL

  local pos = self:GetAbsOrigin()
  local candidates = GetNearestPlayers(pos, ATTACK_RADIUS)
  if #candidates == 0 then
    return
  end

  local toAttack = math.min(MAX_TARGETS, #candidates)
  for i = 1, toAttack do
    local target = candidates[i].ply
    if IsValid(target) and target:IsAlive() then
      effect.Dissolve(target, "sprites/blueglow1.vmt", gpGlobals.curtime(), 0)

      self.PrecacheSound("npc/fast_zombie/fz_scream1.wav")
      self:EmitSound("npc/fast_zombie/fz_scream1.wav")
    end
  end
end

local function GetNextAreaToward(fromArea, targetPos)
  local bestArea = nil
  local bestDist = math.huge

  for dir = 0, 3 do
    local count = fromArea:GetAdjacentCount(dir)
    for i = 0, count - 1 do
      local adj = fromArea:GetAdjacentArea(dir, i)
      if adj then
        local d = (adj:GetCenter() - targetPos):Length()
        if d < bestDist then
          bestDist = d
          bestArea = adj
        end
      end
    end
  end

  return bestArea
end

function ENT:MoveThink()
  local pos = self:GetAbsOrigin()
  local target = self:GetNearestPlayer()

  if target and self.DoMove then
    local currentArea = navmesh.GetNearestNavArea(pos)
    if currentArea then
      local nextArea = GetNextAreaToward(currentArea, target:GetAbsOrigin())
      if nextArea then
        self.TargetPos = nextArea:GetRandomPoint()
      else
        self.TargetPos = target:GetAbsOrigin()
      end
    else
      Warning("ENT:MoveThink - no nav area at NPC position\n")
      self.TargetPos = target:GetAbsOrigin()
    end
  end

  if self:IsObstacleAhead() and self:IsOnGround() then
    self.TargetPos = nil
    local phys = self:VPhysicsGetObject()
    if phys and phys ~= NULL then
      phys:ApplyForceCenter(Vector(0, 0, 1) * 2000)
    else
      local cur = self:GetAbsVelocity()
      self:SetAbsVelocity(Vector(cur.x, cur.y, math.max(cur.z, 100)))
    end
    return
  end

  if self.FollowPlayer and target then
    local headPos = self:GetBonePosition(self:LookupBone("ValveBiped.Bip01_Head1"), Vector(0, 0, 0), QAngle(0, 0, 0))
      or pos

    local delta = target:GetAbsOrigin() + Vector(0, 0, 40) - headPos
    local targetYaw = math.deg(math.atan2(delta.y, delta.x))
    local targetPitch = math.deg(math.atan2(-delta.z, math.sqrt(delta.x ^ 2 + delta.y ^ 2)))

    local yawIdx = self:LookupPoseParameter("eyes_leftright")
    local pitchIdx = self:LookupPoseParameter("eyes_updown")

    if yawIdx >= 0 then
      local cur = self:GetPoseParameter(yawIdx)
      local desired = math.clamp(targetYaw / 90, -1, 1)
      self:SetPoseParameter(yawIdx, cur + (desired - cur) * 0.1)
    end
    if pitchIdx >= 0 then
      local cur = self:GetPoseParameter(pitchIdx)
      local desired = math.clamp(targetPitch / 90, -1, 1)
      self:SetPoseParameter(pitchIdx, cur + (desired - cur) * 0.1)
    end
  end

  if self.TargetPos and self.DoMove then
    local dir = self.TargetPos - pos
    local len = dir:Length()

    if len > 0 then
      dir = dir / len

      local trGround = trace_t()
      UTIL.TraceLine(pos, pos - Vector(0, 0, 32), _E.MASK.SOLID, self, 0, trGround)

      local groundNormal = (trGround.Hit and trGround.PlaneNormal) or Vector(0, 0, 1)
      local dot = dir.x * groundNormal.x + dir.y * groundNormal.y + dir.z * groundNormal.z
      local forward = Vector(dir.x - groundNormal.x * dot, dir.y - groundNormal.y * dot, dir.z - groundNormal.z * dot)

      if forward:Length() <= 0.001 then
        forward = Vector(dir.x, dir.y, 0):GetNormalized()
      else
        forward = forward:GetNormalized()
      end

      local desiredVel = forward * MOVE_SPEED

      local phys = self:VPhysicsGetObject()
      if phys and phys ~= NULL then
        local curZ = phys:GetVelocity().z or 0
        phys:SetVelocity(Vector(desiredVel.x, desiredVel.y, curZ), Vector(desiredVel.x, desiredVel.y, curZ))
        self:SetAbsVelocity(Vector(desiredVel.x, desiredVel.y, curZ))
      else
        local curZ = (self:GetAbsVelocity() or Vector(0, 0, 0)).z or 0
        self:SetAbsVelocity(Vector(desiredVel.x, desiredVel.y, curZ))
      end

      local desiredYaw = math.deg(math.atan2(forward.y, forward.x))
      local curAng = self:GetAbsAngles()
      curAng.y = curAng.y + AngleDifference(desiredYaw, curAng.y) * 0.1
      self:SetAbsAngles(curAng)
    end
  end
end

function ENT:LookAtTarget(targetPos)
  local headPos = self:GetBonePosition(self:LookupBone("ValveBiped.Bip01_Head1"), Vector(0, 0, 0), QAngle(0, 0, 0))
    or self:GetAbsOrigin()
  local delta = targetPos - headPos

  local yaw = math.deg(math.atan2(delta.y, delta.x))
  local pitch = math.deg(math.atan2(-delta.z, math.sqrt(delta.x ^ 2 + delta.y ^ 2)))
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
  if dt <= 0 then
    dt = 0.001
  end
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
  local myPos = self:GetAbsOrigin()

  for _, ply in ipairs(player.GetAll()) do
    if IsValid(ply) and ply:IsAlive() then
      local dist = (ply:GetAbsOrigin() - myPos):Length()
      if dist < nearestDist then
        nearestDist = dist
        nearest = ply
      end
    end
  end

  return nearest, nearestDist
end

function ENT:Think()
  self:MoveThink()

  self:AttackNearestPlayers()

  if self.isEnemy and self.Weapon ~= NULL and self.Weapon then
    local target, dist = self:GetNearestPlayer()
    if target and dist <= 1000 then
      local shootPos = self:GetBonePosition(self:LookupBone("ValveBiped.Bip01_Head1"), Vector(0, 0, 0), QAngle(0, 0, 0))
        or self:GetAbsOrigin() + Vector(0, 0, 60)
      local dir = (target:GetAbsOrigin() + Vector(0, 0, 40) - shootPos):NormalizeInPlace()

      self:LookAtTarget(target:GetAbsOrigin())

      if self.Weapon then
        self.Weapon:SetOwnerEntity(self)
        self.IsFiring = true
        self.Weapon:PrimaryAttack()
        self.IsFiring = false
      end
    end
  end

  self:HandleFootsteps()

  self:UpdateAnimation()

  self:SetNextThink(gpGlobals.curtime())

  return true
end
