--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

CONTENTS_EMPTY = 0
CONTENTS_SOLID = 0x1
CONTENTS_WINDOW = 0x2
CONTENTS_AUX = 0x4
CONTENTS_GRATE = 0x8
CONTENTS_SLIME = 0x10
CONTENTS_WATER = 0x20
CONTENTS_BLOCKLOS = 0x40
CONTENTS_OPAQUE = 0x80
LAST_VISIBLE_CONTENTS = 0x80

ALL_VISIBLE_CONTENTS = bitty.bor(LAST_VISIBLE_CONTENTS, LAST_VISIBLE_CONTENTS - 1)

CONTENTS_TESTFOGVOLUME = 0x100
CONTENTS_UNUSED = 0x200
CONTENTS_UNUSED6 = 0x400
CONTENTS_TEAM1 = 0x800
CONTENTS_TEAM2 = 0x1000
CONTENTS_IGNORE_NODRAW_OPAQUE = 0x2000
CONTENTS_MOVEABLE = 0x4000
CONTENTS_AREAPORTAL = 0x8000
CONTENTS_PLAYERCLIP = 0x10000
CONTENTS_MONSTERCLIP = 0x20000
CONTENTS_CURRENT_0 = 0x40000
CONTENTS_CURRENT_90 = 0x80000
CONTENTS_CURRENT_180 = 0x100000
CONTENTS_CURRENT_270 = 0x200000
CONTENTS_CURRENT_UP = 0x400000
CONTENTS_CURRENT_DOWN = 0x800000
CONTENTS_ORIGIN = 0x1000000
CONTENTS_MONSTER = 0x2000000
CONTENTS_DEBRIS = 0x4000000
CONTENTS_DETAIL = 0x8000000
CONTENTS_TRANSLUCENT = 0x10000000
CONTENTS_LADDER = 0x20000000
CONTENTS_HITBOX = 0x40000000

COLLISION_GROUP_NONE = 0
COLLISION_GROUP_DEBRIS = 1
COLLISION_GROUP_DEBRIS_TRIGGER = 2
COLLISION_GROUP_INTERACTIVE_DEBRIS = 3
COLLISION_GROUP_INTERACTIVE = 4
COLLISION_GROUP_PLAYER = 5
COLLISION_GROUP_BREAKABLE_GLASS = 6
COLLISION_GROUP_VEHICLE = 7
COLLISION_GROUP_PLAYER_MOVEMENT = 8
COLLISION_GROUP_NPC = 9
COLLISION_GROUP_IN_VEHICLE = 10
COLLISION_GROUP_WEAPON = 11
COLLISION_GROUP_VEHICLE_CLIP = 12
COLLISION_GROUP_PROJECTILE = 13
COLLISION_GROUP_DOOR_BLOCKER = 14
COLLISION_GROUP_PASSABLE_DOOR = 15
COLLISION_GROUP_DISSOLVING = 16
COLLISION_GROUP_PUSHAWAY = 17
COLLISION_GROUP_NPC_ACTOR = 18
COLLISION_GROUP_NPC_SCRIPTED = 19

LAST_SHARED_COLLISION_GROUP = 20

DMG_GENERIC = 0
DMG_CRUSH = bitty.lshift(1, 0) -- 1 << 0
DMG_BULLET = bitty.lshift(1, 1) -- 1 << 1
DMG_SLASH = bitty.lshift(1, 2) -- 1 << 2
DMG_BURN = bitty.lshift(1, 3) -- 1 << 3
DMG_VEHICLE = bitty.lshift(1, 4) -- 1 << 4
DMG_FALL = bitty.lshift(1, 5) -- 1 << 5
DMG_BLAST = bitty.lshift(1, 6) -- 1 << 6
DMG_CLUB = bitty.lshift(1, 7) -- 1 << 7
DMG_SHOCK = bitty.lshift(1, 8) -- 1 << 8
DMG_SONIC = bitty.lshift(1, 9) -- 1 << 9
DMG_ENERGYBEAM = bitty.lshift(1, 10) -- 1 << 10
DMG_PREVENT_PHYSICS_FORCE = bitty.lshift(1, 11)
DMG_NEVERGIB = bitty.lshift(1, 12)
DMG_ALWAYSGIB = bitty.lshift(1, 13)
DMG_DROWN = bitty.lshift(1, 14)
DMG_PARALYZE = bitty.lshift(1, 15)
DMG_NERVEGAS = bitty.lshift(1, 16)
DMG_POISON = bitty.lshift(1, 17)
DMG_RADIATION = bitty.lshift(1, 18)
DMG_DROWNRECOVER = bitty.lshift(1, 19)
DMG_ACID = bitty.lshift(1, 20)
DMG_SLOWBURN = bitty.lshift(1, 21)
DMG_REMOVENORAGDOLL = bitty.lshift(1, 22)
DMG_PHYSGUN = bitty.lshift(1, 23)
DMG_PLASMA = bitty.lshift(1, 24)
DMG_AIRBOAT = bitty.lshift(1, 25)
DMG_DISSOLVE = bitty.lshift(1, 26)
DMG_BLAST_SURFACE = bitty.lshift(1, 27)
DMG_DIRECT = bitty.lshift(1, 28)
DMG_BUCKSHOT = bitty.lshift(1, 29)

FCVAR = {
  NONE = 0,

  UNREGISTERED = bitty.lshift(1, 0),
  DEVELOPMENTONLY = bitty.lshift(1, 1),
  GAMEDLL = bitty.lshift(1, 2),
  CLIENTDLL = bitty.lshift(1, 3),
  HIDDEN = bitty.lshift(1, 4),

  PROTECTED = bitty.lshift(1, 5),
  SPONLY = bitty.lshift(1, 6),
  ARCHIVE = bitty.lshift(1, 7),
  NOTIFY = bitty.lshift(1, 8),
  USERINFO = bitty.lshift(1, 9),
  PRINTABLEONLY = bitty.lshift(1, 10),
  UNLOGGED = bitty.lshift(1, 11),
  NEVER_AS_STRING = bitty.lshift(1, 12),
  REPLICATED = bitty.lshift(1, 13),
  CHEAT = bitty.lshift(1, 14),
  INTERNAL_USE = bitty.lshift(1, 15),
  DEMO = bitty.lshift(1, 16),
  DONTRECORD = bitty.lshift(1, 17),
  ALLOWED_IN_COMPETITIVE = bitty.lshift(1, 18),
  RELOAD_MATERIALS = bitty.lshift(1, 20),
  RELOAD_TEXTURES = bitty.lshift(1, 21),
  NOT_CONNECTED = bitty.lshift(1, 22),
  MATERIAL_SYSTEM_THREAD = bitty.lshift(1, 23),
  ARCHIVE_XBOX = bitty.lshift(1, 24),
  ACCESSIBLE_FROM_THREADS = bitty.lshift(1, 25),
  SERVER_CAN_EXECUTE = bitty.lshift(1, 28),
  SERVER_CANNOT_QUERY = bitty.lshift(1, 29),
  CLIENTCMD_CAN_EXECUTE = bitty.lshift(1, 30),
  EXEC_DESPITE_DEFAULT = bitty.lshift(1, 31),
}

-- Navmesh
NORTH       = 0
EAST        = 1
SOUTH       = 2
WEST        = 3
NUM_DIRECTIONS = 4

NORTH_WEST  = 0
NORTH_EAST  = 1
SOUTH_EAST  = 2
SOUTH_WEST  = 3
NUM_CORNERS = 4

NAV_MESH_CROUCH         = 0x0001  -- must crouch to use this area
NAV_MESH_JUMP           = 0x0002  -- must jump to traverse this area
NAV_MESH_PRECISE        = 0x0004  -- do not adjust for obstacles, just move along area
NAV_MESH_NO_JUMP        = 0x0008  -- inhibit auto-jump on this area
NAV_MESH_STOP           = 0x0010  -- must stop when entering this area
NAV_MESH_RUN            = 0x0020  -- must run to traverse this area
NAV_MESH_WALK           = 0x0040  -- must walk to traverse this area
NAV_MESH_AVOID          = 0x0080  -- avoid this area unless alternatives are too dangerous
NAV_MESH_TRANSIENT      = 0x0100  -- area may become blocked at times
NAV_MESH_DONT_HIDE      = 0x0200  -- do not use this area for hiding spot generation
NAV_MESH_STAND          = 0x0400  -- bots must stand (not crouch) in this area
NAV_MESH_NO_HOSTAGES    = 0x0800  -- hostages must not use this area
NAV_MESH_STAIRS         = 0x1000  -- area is on stairs
NAV_MESH_HAS_ELEVATOR   = 0x2000  -- area is served by an elevator
NAV_MESH_CLIFF          = 0x4000  -- area is a cliff (edge with a significant drop)

-- Teams
TEAM_ANY = -2
TEAM_INVALID = -1
TEAM_UNASSIGNED = 0	-- not assigned to a team
TEAM_SPECTATOR = 1	-- spectator team
LAST_SHARED_TEAM = TEAM_SPECTATOR

for i = 0, 360 do
  _G["AUTOAIM_" .. i .. "DEGREES"] = math.sin(math.rad(i))
end
