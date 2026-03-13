--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

if not GetConVar("hl1_mounted") or GetConVar("hl1_mounted"):GetInt() == 0 then
  return
end

smlib.CreateHeader("NPCs", "Half-Life: Source")

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

for _, btn in ipairs(hl1npcs) do
  smlib.CreateButtonInHeader(true, "NPCs", btn.name, btn.image, "", btn.command, "Half-Life: Source")
end
