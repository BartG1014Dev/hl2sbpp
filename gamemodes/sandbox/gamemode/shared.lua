--========== Copyright (C) 2025, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

local bit = require("bit")

GM.Name = "Sandbox"
GM.Homepage = ""
GM.Developer = "Team HL2SB++"
GM.Manual = nil

function GM:Initialize()
  if not _CLIENT then
    engine.ServerCommand("mp_falldamage 0\n")
    engine.ServerCommand("mp_flashlight 1\n")
    engine.ServerCommand("sv_friction 8\n")
    engine.ServerCommand("sv_stopspeed 10\n")
    engine.ServerCommand("sv_infinite_aux_power 1\n") -- @ThePixelMoon: why aren't these on by default?
    engine.ServerCommand("sv_spawnmenu_allowed 1\n")
	engine.ServerCommand("sv_allow_noclip 1\n")
  else
    -- Andrew; not the right place to put this, but oh well.
    self:CreateDefaultPanels()

    hintlib.AddHint("OpeningMenu", 20)
  end
end

-- Let HL1 weapons be a Sandbox-specific thing!
---@param def CAmmoDef
function GM:GetAmmoDef(def)
  def:AddAmmoType(
    "9mmRound",
    bit.bor(DMG_BULLET, DMG_NEVERGIB),
    AmmoTracer.LINE,
    "sk_plr_dmg_9mm_bullet",
    "sk_npc_dmg_9mm_bullet",
    "sk_max_9mm_bullet",
    BULLET_IMPULSE(500, 1325),
    0
  )

  def:AddAmmoType(
    "357Round",
    bit.bor(DMG_BULLET, DMG_NEVERGIB),
    AmmoTracer.NONE,
    "sk_plr_dmg_357_bullet",
    nil,
    "sk_max_357_bullet",
    BULLET_IMPULSE(650, 6000),
    0
  )

  def:AddAmmoType(
    "MP5_Grenade",
    bit.bor(DMG_BURN, DMG_BLAST),
    AmmoTracer.NONE,
    "sk_plr_dmg_mp5_grenade",
    nil,
    "sk_max_mp5_grenade",
    0,
    0
  )

  def:AddAmmoType(
    "RPG_Rocket",
    DMG_BURN,
    AmmoTracer.NONE,
    nil,
    180, -- npc damage
    3, -- max carry
    0,
    0
  )

  def:AddAmmoType("Uranium", DMG_ENERGYBEAM, AmmoTracer.NONE, nil, nil, "sk_max_uranium", 0, 0)

  def:AddAmmoType(
    "Hornet",
    DMG_BULLET,
    AmmoTracer.NONE,
    "sk_plr_dmg_hornet",
    "sk_npc_dmg_hornet",
    "sk_max_hornet",
    BULLET_IMPULSE(100, 1200),
    0
  )

  def:AddAmmoType("Snark", DMG_SLASH, AmmoTracer.NONE, "sk_snark_dmg_bite", nil, "sk_max_snark", 0, 0)

  def:AddAmmoType(
    "TripMine",
    bit.bor(DMG_BURN, DMG_BLAST),
    AmmoTracer.NONE,
    "sk_plr_dmg_tripmine",
    nil,
    "sk_max_tripmine",
    0,
    0
  )

  def:AddAmmoType(
    "Satchel",
    bit.bor(DMG_BURN, DMG_BLAST),
    AmmoTracer.NONE,
    "sk_plr_dmg_satchel",
    nil,
    "sk_max_satchel",
    0,
    0
  )

  def:AddAmmoType(
    "12mmRound",
    bit.bor(DMG_BULLET, DMG_NEVERGIB),
    AmmoTracer.LINE,
    nil,
    "sk_npc_dmg_12mm_bullet",
    nil,
    BULLET_IMPULSE(300, 1200),
    0
  )

  def:AddAmmoType(
    "BuckshotHL1",
    bit.bor(DMG_BULLET, DMG_BUCKSHOT),
    AmmoTracer.LINE,
    "sk_plr_dmg_buckshot",
    nil,
    "sk_max_buckshot",
    BULLET_IMPULSE(200, 1200),
    0
  )

  def:AddAmmoType(
    "XBowBoltHL1",
    bit.bor(DMG_BULLET, DMG_NEVERGIB),
    AmmoTracer.LINE,
    "sk_plr_dmg_xbow_bolt_plr",
    nil,
    "sk_max_xbow_bolt",
    BULLET_IMPULSE(200, 1200),
    0
  )

  def:AddAmmoType(
    "GrenadeHL1",
    bit.bor(DMG_BURN, DMG_BLAST),
    AmmoTracer.NONE,
    "sk_plr_dmg_grenade",
    nil,
    "sk_max_grenade",
    0,
    0
  )

  -- SWEP-specific ammotypes
  def:AddAmmoType("Medkit", DMG_GENERIC, AmmoTracer.NONE, 0, nil, 30, BULLET_IMPULSE(650, 1650), 0)
end

function GM:FlWeaponRespawnTime(pWeapon)
  return -1
end

function GM:FlWeaponTryRespawn(pWeapon)
  return 0
end

function GM:WeaponShouldRespawn(pItem)
  pItem:AddSpawnFlags(2 ^ 30)
  -- return 2
end
