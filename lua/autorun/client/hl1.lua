--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

if not GetConVar("hl1_mounted") or GetConVar("hl1_mounted"):GetInt() == 0 then
  return
end

smlib.CreateHeader("NPCs", "Half-Life: Source")
smlib.CreateHeader("Weapons", "Half-Life: Source")

local hl1npcs = {
  {
    name = "Alien Grunt (HL1)",
    image = "materials/entities/monster_alien_grunt.png",
    command = "npc_create monster_alien_grunt",
  },
  {
    name = "Vortigaunt (HL1)",
    image = "materials/entities/monster_alien_slave.png",
    command = "npc_create monster_alien_slave",
  },
  {
    name = "Apache (HL1)",
    image = "materials/entities/monster_apache.png",
    command = "npc_create monster_apache",
  },
  {
    name = "Babycrab (HL1)",
    image = "materials/entities/monster_babycrab.png",
    command = "npc_create monster_babycrab",
  },
  {
    name = "Barnacle (HL1)",
    image = "materials/entities/monster_barnacle.png",
    command = "npc_create monster_barnacle",
  },
  {
    name = "Barney (HL1)",
    image = "materials/entities/monster_barney.png",
    command = "npc_create monster_barney",
  },
  {
    name = "Gonarch (HL1)",
    image = "materials/entities/monster_bigmomma.png",
    command = "npc_create monster_bigmomma",
  },
  {
    name = "Bullchicken (HL1)",
    image = "materials/entities/monster_bullchicken.png",
    command = "npc_create monster_bullchicken",
  },
  {
    name = "Cockroach (HL1)",
    image = "materials/entities/monster_cockroach.png",
    command = "npc_create monster_cockroach",
  },
  {
    name = "Flyer (HL1)",
    image = "materials/entities/monster_flyer.png",
    command = "npc_create monster_flyer",
  },
  {
    name = "Gargantua (HL1)",
    image = "materials/entities/monster_gargantua.png",
    command = "npc_create monster_gargantua",
  },
  {
    name = "G-Man (HL1)",
    image = "materials/entities/monster_gman.png",
    command = "npc_create monster_gman",
  },
  {
    name = "Headcrab (HL1)",
    image = "materials/entities/monster_headcrab.png",
    command = "npc_create monster_headcrab",
  },
  {
    name = "Houndeye (HL1)",
    image = "materials/entities/monster_houndeye.png",
    command = "npc_create monster_houndeye",
  },
  {
    name = "Human Assassin (HL1)",
    image = "materials/entities/monster_human_assassin.png",
    command = "npc_create monster_human_assassin",
  },
  {
    name = "Human Grunt (HL1)",
    image = "materials/entities/monster_human_grunt.png",
    command = "npc_create monster_human_grunt",
  },
  {
    name = "Ichthyosaur (HL1)",
    image = "materials/entities/monster_ichthyosaur.png",
    command = "npc_create monster_ichthyosaur",
  },
  {
    name = "Miniturret (HL1)",
    image = "materials/entities/monster_miniturret.png",
    command = "npc_create monster_miniturret",
  },
  {
    name = "Nihilanth (HL1)",
    image = "materials/entities/monster_nihilanth.png",
    command = "npc_create monster_nihilanth",
  },
  {
    name = "Scientist (HL1)",
    image = "materials/entities/monster_scientist.png",
    command = "npc_create monster_scientist",
  },
  {
    name = "Sentry (HL1)",
    image = "materials/entities/monster_sentry.png",
    command = "npc_create monster_sentry",
  },
  {
    name = "Snark (HL1)",
    image = "materials/entities/monster_snark.png",
    command = "npc_create monster_snark",
  },
  {
    name = "Tentacle (HL1)",
    image = "materials/entities/monster_tentacle.png",
    command = "npc_create monster_tentacle",
  },
  {
    name = "Turret (HL1)",
    image = "materials/entities/monster_turret.png",
    command = "npc_create monster_turret",
  },
  {
    name = "Zombie (HL1)",
    image = "materials/entities/monster_zombie.png",
    command = "npc_create monster_zombie",
  },
}

local hl1weapons = {
  {
    name = "Crowbar (HL1)",
    image = "materials/entities/weapon_crowbar_hl1.png",
    command = "give weapon_crowbar_hl1",
  },
  {
    name = "9mm Handgun (HL1)",
    image = "materials/entities/weapon_glock_hl1.png",
    command = "give weapon_glock_hl1",
  },
  {
    name = ".357 (HL1)",
    image = "materials/entities/weapon_357_hl1.png",
    command = "give weapon_357_hl1",
  },
  {
    name = "Shotgun (HL1)",
    image = "materials/entities/weapon_shotgun_hl1.png",
    command = "give weapon_shotgun_hl1",
  },
  {
    name = "Crossbow (HL1)",
    image = "materials/entities/weapon_crossbow_hl1.png",
    command = "give weapon_crossbow_hl1",
  },
  {
    name = "RPG (HL1)",
    image = "materials/entities/weapon_rpg_hl1.png",
    command = "give weapon_rpg_hl1",
  },
  {
    name = "Tau Cannon (HL1)",
    image = "materials/entities/weapon_gauss.png",
    command = "give weapon_gauss_hl1",
  },
  {
    name = "Gluon Gun (Egon) (HL1)",
    image = "materials/entities/weapon_egon.png",
    command = "give weapon_egon_hl1",
  },
  {
    name = "Hivehand (Hornet Gun) (HL1)",
    image = "materials/entities/weapon_hornetgun.png",
    command = "give weapon_hornetgun_hl1",
  },
  {
    name = "Hand Grenade (HL1)",
    image = "materials/entities/weapon_handgrenade.png",
    command = "give weapon_handgrenade_hl1",
  },
  {
    name = "Satchel (HL1)",
    image = "materials/entities/weapon_satchel.png",
    command = "give weapon_satchel_hl1",
  },
  {
    name = "Tripmine (HL1)",
    image = "materials/entities/weapon_tripmine.png",
    command = "give weapon_tripmine_hl1",
  },
  {
    name = "Snark (HL1)",
    image = "materials/entities/weapon_snark.png",
    command = "give weapon_snark_hl1",
  },
}

for _, btn in ipairs(hl1weapons) do
  smlib.CreateButtonInHeader(true, "Weapons", btn.name, btn.image, "", btn.command, "Half-Life: Source")
end

for _, btn in ipairs(hl1npcs) do
  smlib.CreateButtonInHeader(true, "NPCs", btn.name, btn.image, "", btn.command, "Half-Life: Source")
end
