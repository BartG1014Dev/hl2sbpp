--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

SWEP.PrintName = "FLECHETTE GUN"
SWEP.ViewModel = "models/weapons/c_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"
SWEP.AnimPrefix = "smg2"
SWEP.Slot = 2
SWEP.SlotPos = 2

SWEP.Primary = {
  ClipSize = -1,
  DefaultClip = -1,
  Automatic = true,
  Ammo = "None",
}

SWEP.Secondary = {
  ClipSize = -1,
  DefaultClip = -1,
  Automatic = true,
  Ammo = "None",
}

SWEP.Weight = 7
SWEP.ItemFlags = 0

SWEP.Damage = 0

SWEP.SoundData = {
  empty = "",
  single_shot = "NPC_Hunter.FlechetteShoot",
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

SWEP.m_acttable = {
  { ACT.MP_STAND_IDLE, ACT.HL2MP_IDLE_SMG1, false },
  { ACT.MP_CROUCH_IDLE, ACT.HL2MP_IDLE_CROUCH_SMG1, false },

  { ACT.MP_RUN, ACT.HL2MP_RUN_SMG1, false },
  { ACT.MP_CROUCHWALK, ACT.HL2MP_WALK_CROUCH_SMG1, false },

  { ACT.MP_ATTACK_STAND_PRIMARYFIRE, ACT.HL2MP_GESTURE_RANGE_ATTACK_SMG1, false },
  { ACT.MP_ATTACK_CROUCH_PRIMARYFIRE, ACT.HL2MP_GESTURE_RANGE_ATTACK_SMG1, false },

  { ACT.MP_RELOAD_STAND, ACT.HL2MP_GESTURE_RELOAD_SMG1, false },
  { ACT.MP_RELOAD_CROUCH, ACT.HL2MP_GESTURE_RELOAD_SMG1, false },

  { ACT.MP_JUMP, ACT.HL2MP_JUMP_SMG1, false },
}

function SWEP:Initialize()
  self.m_bReloadsSingly = false
  self.m_bFiresUnderwater = true
end

function SWEP:PrimaryAttack()
  local pPlayer = self:GetOwner()

  self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.07
  self.m_flNextSecondaryAttack = gpGlobals.curtime() + 0.07

  self:SendWeaponAnim(ACT.VM_PRIMARYATTACK)

  ToHL2MPPlayer(pPlayer):DoAnimationEvent(PlayerAnimEvent.ATTACK_PRIMARY)

  self:WeaponSound(WeaponSound.SINGLE)

  -- fire the pooting bullets
  local eye = pPlayer:EyeAngles()
  local shootpos = pPlayer:EyePosition()

  local forward, right, up = pPlayer:GetVectors()

  local ent = CreateEntityByName("hunter_flechette")
  ent:SetAbsOrigin(shootpos + forward * 32)
  ent:SetAbsAngles(eye)
  ent:SetOwnerEntity(pPlayer)
  ent:Spawn()
  ent:Activate()

  ent:SetAbsVelocity(forward * 2000)
end

function SWEP:Reload()
  return true
end
