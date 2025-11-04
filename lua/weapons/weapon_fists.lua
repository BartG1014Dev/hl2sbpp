-- @CopyrightAss

SWEP.PrintName = "FISTS"
SWEP.ViewModel = "models/weapons/c_arms.mdl"
SWEP.WorldModel = ""
SWEP.AnimPrefix = "fist"
SWEP.Slot = 5
SWEP.SlotPos = 1

SWEP.Primary = {
  ClipSize = -1,
  DefaultClip = -1,
  Automatic = false,
  Ammo = "None",
}

SWEP.Secondary = {
  ClipSize = -1,
  DefaultClip = -1,
  Automatic = false,
  Ammo = "None",
}

SWEP.Weight = 10
SWEP.ItemFlags = 0

SWEP.Damage = 42

SWEP.SoundData = {
  reload = "Default.Reload",
  single_shot = "WeaponFrag.Throw",
  special1 = "Flesh.ImpactHard",
}

SWEP.ShowUsageHint = false
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = true
SWEP.BuiltRightHanded = true
SWEP.AllowFlipping = true
SWEP.MeleeWeapon = true
SWEP.UseHands = true

SWEP.DrawCrosshair = true
SWEP.DrawAmmo = false

SWEP.DeploySpeed = 1.0

SWEP.m_acttable = {
  { ACT.MP_STAND_IDLE, ACT.HL2MP_IDLE_FIST, false },
  { ACT.MP_CROUCH_IDLE, ACT.HL2MP_IDLE_CROUCH_FIST, false },
  { ACT.MP_RUN, ACT.HL2MP_RUN_FIST, false },
  { ACT.MP_CROUCHWALK, ACT.HL2MP_WALK_CROUCH_FIST, false },
  { ACT.MP_ATTACK_STAND_PRIMARYFIRE, ACT.HL2MP_GESTURE_RANGE_ATTACK_FIST, false },
  { ACT.MP_ATTACK_CROUCH_PRIMARYFIRE, ACT.HL2MP_GESTURE_RANGE_ATTACK_FIST, false },
  { ACT.MP_RELOAD_STAND, ACT.HL2MP_GESTURE_RELOAD_FIST, false },
  { ACT.MP_RELOAD_CROUCH, ACT.HL2MP_GESTURE_RELOAD_FIST, false },
  { ACT.MP_JUMP, ACT.HL2MP_JUMP_FIST, false },
  { ACT.MP_SWIM, ACT.HL2MP_SWIM_FIST, false },
  { ACT.MP_SWIM_IDLE, ACT.HL2MP_SWIM_IDLE_FIST, false },
}

function SWEP:Initialize()
  self.m_bReloadsSingly = false
  self.m_bFiresUnderwater = true
end

function SWEP:Attack(isRight)
  local pPlayer = self:GetOwner()
  if ToBaseEntity(pPlayer) == NULL then
    return
  end

  local vForward = Vector()
  local vRight = Vector()
  local vUp = Vector()
  local angle = QAngle()
  local vecEye = pPlayer:EyePosition()
  pPlayer:EyeVectors(vForward, vRight, vUp)

  local fRange = 48

  local startPos = pPlayer:Weapon_ShootPosition()
  local endPos = startPos + pPlayer:GetAutoaimVector(AUTOAIM_5DEGREES) * fRange

  self:SendWeaponAnim(ACT.VM_PRIMARYATTACK)
  ToHL2MPPlayer(pPlayer):DoAnimationEvent(PlayerAnimEvent.ATTACK_PRIMARY)

  tr = trace_t()
  MASK_SHOT = _E.MASK.SHOT
  UTIL.TraceLine(startPos, endPos, MASK_SHOT, pPlayer, 0, tr)

  local bDidHit = tr:DidHit()
  local hitEnt = tr.m_pEnt

  local anim
  if isRight then
    anim = "fists_right"
  else
    anim = "fists_left"
  end
  local vm = pPlayer:GetViewModel(0)
  vm:SetSequence(vm:LookupSequence(anim))
  vm:ResetSequenceInfo()
  vm:SetCycle(0)
  vm:StudioFrameAdvance()

  self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.8
  self.m_flNextSecondaryAttack = self.m_flNextPrimaryAttack

  if bDidHit then
    if hitEnt then
      self:WeaponSound(WeaponSound.SPECIAL1)
    end

    local vecSrc = pPlayer:Weapon_ShootPosition()
    local vecAiming = pPlayer:GetAutoaimVector(AUTOAIM_5DEGREES)

    local info = {
      m_iShots = 1,
      m_vecSrc = vecSrc,
      m_vecDirShooting = vecAiming,
      m_vecSpread = vec3_origin,
      m_flDistance = MAX_TRACE_LENGTH,
      m_iAmmoType = 1,
    }
    info.m_pAttacker = pPlayer

    -- Fire the bullets, and force the first shot to be perfectly accuracy
    ToHL2MPPlayer(pPlayer):FireBullets(info)

    --Disorient the player
    local angles = pPlayer:GetLocalAngles()

    angles.x = angles.x + random.RandomInt(0)
    angles.y = angles.y + random.RandomInt(0)
    angles.z = 0

    if not _CLIENT then
      pPlayer:SnapEyeAngles(angles)
    end
  else
    self:WeaponSound(WeaponSound.SINGLE)
  end

  pPlayer:ViewPunch(QAngle(-2, math.random(-1, 1), 0))

  self.NextIdle = self.m_flNextPrimaryAttack - gpGlobals.curtime()
end

function SWEP:PrimaryAttack()
  self:Attack(false)
end

function SWEP:SecondaryAttack()
  self:Attack(true)
end

function SWEP:Deploy()
  self.NextIdle = gpGlobals.curtime()
end

function SWEP:ItemPostFrame()
  local pPlayer = ToHL2MPPlayer(self:GetOwner())
  if not IsValid(pPlayer) then
    return
  end

  local vm = pPlayer:GetViewModel(0)
  if not IsValid(vm) then
    return
  end

  local curtime = gpGlobals.curtime()

  if curtime >= self.m_flNextPrimaryAttack then
    self.NextIdle = self.NextIdle or 0
    local idleInterval = 3

    if curtime > self.NextIdle then
      local anim = "fists_idle_0" .. math.random(1, 2)
      vm:SetSequence(vm:LookupSequence(anim))
      vm:ResetSequenceInfo()
      vm:SetCycle(0)
      vm:StudioFrameAdvance()

      self.NextIdle = curtime + idleInterval
    end
  end
end
