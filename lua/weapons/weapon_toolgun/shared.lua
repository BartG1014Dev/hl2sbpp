--========== Copyright (C) 2025, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose: Initialize the base scripted weapon.
--
--===========================================================================--

TOOL_PATH = "lua/weapons/weapon_toolgun/"

SWEP.PrintName = "TOOLGUN"
SWEP.ViewModel = "models/weapons/c_toolgun.mdl"
SWEP.WorldModel = "models/weapons/w_toolgun.mdl"
SWEP.anim_prefix = "smg2"
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
  single_shot = "Airboat.FireGunRevDown",
}

SWEP.ShowUsageHint = false
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = true
SWEP.BuiltRightHanded = true
SWEP.AllowFlipping = true
SWEP.MeleeWeapon = true -- @ThePixelMoon: hacky hack
SWEP.UseHands = true

SWEP.DrawCrosshair = true
SWEP.DrawAmmo = false

SWEP.ViewModelFOV = 64

SWEP.m_acttable = {
  { ACT.MP_STAND_IDLE, ACT.HL2MP_IDLE_REVOLVER, false },
  { ACT.MP_CROUCH_IDLE, ACT.HL2MP_IDLE_CROUCH_REVOLVER, false },
  { ACT.MP_RUN, ACT.HL2MP_RUN_REVOLVER, false },
  { ACT.MP_CROUCHWALK, ACT.HL2MP_WALK_CROUCH_REVOLVER, false },
  { ACT.MP_ATTACK_STAND_PRIMARYFIRE, ACT.HL2MP_GESTURE_RANGE_ATTACK_REVOLVER, false },
  { ACT.MP_ATTACK_CROUCH_PRIMARYFIRE, ACT.HL2MP_GESTURE_RANGE_ATTACK_REVOLVER, false },
  { ACT.MP_RELOAD_STAND, ACT.HL2MP_GESTURE_RELOAD_REVOLVER, false },
  { ACT.MP_RELOAD_CROUCH, ACT.HL2MP_GESTURE_RELOAD_REVOLVER, false },
  { ACT.MP_JUMP, ACT.HL2MP_JUMP_REVOLVER, false },
  { ACT.MP_SWIM, ACT.HL2MP_SWIM_REVOLVER, false },
  { ACT.MP_SWIM_IDLE, ACT.HL2MP_SWIM_IDLE_REVOLVER, false },
}

SWEP.Tools = {}

function SWEP:RegisterTool(name, tbl)
  self.Tools[name] = tbl
end

function SWEP:GetActiveTool()
  return self.Tools[self.CurrentTool or ""] or nil
end

function SWEP:Initialize()
  self.m_bReloadsSingly = false
  self.m_bFiresUnderwater = true
  self.CurrentTool = nil

  self:LoadTools()
end

function SWEP:Precache() end

function SWEP:PrimaryAttack()
  local pPlayer = self:GetOwner()
  if not IsValid(pPlayer) then
    return
  end

  self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.15

  self:SendWeaponAnim(ACT.VM_PRIMARYATTACK)

  -- @ThePixelMoon: hacky
  self:WeaponSound(WeaponSound.SINGLE)

  ToHL2MPPlayer(pPlayer):DoAnimationEvent(PlayerAnimEvent.ATTACK_PRIMARY)

  local vForward = Vector()
  local vRight = Vector()
  local vUp = Vector()
  local vecEye = pPlayer:EyePosition()
  pPlayer:EyeVectors(vForward, vRight, vUp)

  local tr = trace_t()
  MASK_SHOT = _E.MASK.SHOT
  UTIL.TraceLine(vecEye, vecEye + vForward * 56755, MASK_SHOT, pPlayer, 0, tr)

  -- @ThePixelMoon: GOD FUCKING DAMN IT I HATE YOU SO MUCH LUA I WISH I FUCKING
  -- NEVER DID THAT BUT THIS PIECE OF SHIT DIDNT WORK AND THE ONLY WAY FOR IT TO
  -- WORK IS TO DO THIS FUCKING MONSTROSITY
  if SERVER then
    engine.ServerCommand(
      "ent_create env_spark; ent_fire env_spark SparkOnce; wait; wait; wait; wait; ent_fire env_spark kill\n"
    )
  else
    engine.ClientCmd_Unrestricted(
      "ent_create env_spark; ent_fire env_spark SparkOnce; wait; wait; wait; wait; ent_fire env_spark kill\n"
    )
  end

  local tool = self.Tools[self.CurrentTool]
  if not tool then
    return
  end

  if tool.PrimaryAttack then
    tool:PrimaryAttack(self, pPlayer, tr)
  end
end

function SWEP:CycleTool()
  local keys = {}
  for k, _ in pairs(self.Tools) do
    table.insert(keys, k)
  end
  table.sort(keys)

  if #keys == 0 then
    DevWarning("No tools loaded\n")
    return
  end

  local function KeyFromValue(tbl, value)
    for k, v in pairs(tbl) do
      if v == value then
        return k
      end
    end
    return nil
  end

  local idx = KeyFromValue(keys, self.CurrentTool) or 0
  idx = idx + 1
  if idx > #keys then
    idx = 1
  end

  self.CurrentTool = keys[idx]

  -- Knowing well we only do this on server, we can do this
  engine.ClientCommand(self:GetOwner(), "toolgun_mode " .. self.CurrentTool)
end

function SWEP:SecondaryAttack()
  local pPlayer = self:GetOwner()
  if not IsValid(pPlayer) then
    return
  end

  if not next(self.Tools) then
    DevWarning("Tools not loaded yet\n")
    return
  end

  local vForward = Vector()
  local vRight = Vector()
  local vUp = Vector()
  local vecEye = pPlayer:EyePosition()
  pPlayer:EyeVectors(vForward, vRight, vUp)

  local tr = trace_t()
  MASK_SHOT = _E.MASK.SHOT
  UTIL.TraceLine(vecEye, vecEye + vForward * 56755, MASK_SHOT, pPlayer, 0, tr)

  local tool = self.Tools[self.CurrentTool]
  if not tool then
    return
  end

  if tool.SecondaryAttack then
    tool:SecondaryAttack(self, pPlayer, tr)
  end

  self:CycleTool()

  self.m_flNextSecondaryAttack = gpGlobals.curtime() + 0.5

  return true
end

function SWEP:Reload()
  return true
end

function SWEP:Think() end

function SWEP:CanHolster() end

function SWEP:Deploy() end

function SWEP:LoadTools()
  local toolFiles = {}

  local files, dirs = file.Find(TOOL_PATH .. "tools/*.lua", "MOD")
  for _, filename in ipairs(files) do
    table.insert(toolFiles, "tools/" .. filename)
  end

  for _, path in ipairs(toolFiles) do
    --if filesystem.FileExists("lua/" .. path, "MOD") then
    TOOL = {}
    local ok, err = pcall(function()
      includeC(path)
    end)

    if ok then
      if TOOL.Name then
        self:RegisterTool(TOOL.Name, TOOL)
        print("Loaded tool:", TOOL.Name)
      else
        print("Tool did not set TOOL.Name:", path)
      end
    else
      print("Error loading tool:", path, err)
    end

    TOOL = nil
    --else
    --	print("Cannot open tool file:", path)
    --end
  end

  if not self.CurrentTool or not self.Tools[self.CurrentTool] then
    for k, _ in pairs(self.Tools) do
      self.CurrentTool = k
      break
    end
  end
end

function SWEP:GetDrawActivity()
  return ACT.VM_DRAW
end

function SWEP:Holster(pSwitchingTo) end

function SWEP:ItemPostFrame() end

function SWEP:ItemBusyFrame() end

function SWEP:DoImpactEffect() end
