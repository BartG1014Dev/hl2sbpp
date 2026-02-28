--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

MoveType = {
  NONE = 0,
  ISOMETRIC = 1,
  WALK = 2,
  STEP = 3,
  FLY = 4,
  FLYGRAVITY = 5,
  VPHYSICS = 6,
  PUSH = 7,
  NOCLIP = 8,
  LADDER = 9,
  OBSERVER = 10,
  CUSTOM = 11,
  LAST = 11,
  MAX_BITS = 4,
}

MoveCollide = {
  DEFAULT = 0,
  FLY_BOUNCE = 1,
  FLY_CUSTOM = 2,
  FLY_SLIDE = 3,
  COUNT = 4,
  MAX_BITS = 3,
}

SolidType = {
  NONE = 0,
  BSP = 1,
  BBOX = 2,
  OBB = 3,
  OBB_YAW = 4,
  CUSTOM = 5,
  VPHYSICS = 6,
  LAST = 7,
}

SolidFlags = {
  CUSTOMRAYTEST = 0x0001,
  CUSTOMBOXTEST = 0x0002,
  NOT_SOLID = 0x0004,
  TRIGGER = 0x0008,
  NOT_STANDABLE = 0x0010,
  VOLUME_CONTENTS = 0x0020,
  FORCE_WORLD_ALIGNED = 0x0040,
  USE_TRIGGER_BOUNDS = 0x0080,
  ROOT_PARENT_ALIGNED = 0x0100,
  TRIGGER_TOUCH_DEBRIS = 0x0200,
  MAX_BITS = 10,
}

WeaponSound = {
  EMPTY = 0,
  SINGLE = 1,
  SINGLE_NPC = 2,
  WPN_DOUBLE = 3,
  DOUBLE_NPC = 4,
  BURST = 5,
  RELOAD = 6,
  RELOAD_NPC = 7,
  MELEE_MISS = 8,
  MELEE_HIT = 9,
  MELEE_HIT_WORLD = 10,
  SPECIAL1 = 11,
  SPECIAL2 = 12,
  SPECIAL3 = 13,
  TAUNT = 14,
  DEPLOY = 15,

  NUM_SHOOT_SOUND_TYPES = 16,
}

PlayerAnimEvent = {
  ATTACK_PRIMARY = 0,
  ATTACK_SECONDARY = 1,
  ATTACK_GRENADE = 2,
  RELOAD = 3,
  RELOAD_LOOP = 4,
  RELOAD_END = 5,
  JUMP = 6,
  SWIM = 7,
  DIE = 8,
  FLINCH_CHEST = 9,
  FLINCH_HEAD = 10,
  FLINCH_LEFTARM = 11,
  FLINCH_RIGHTARM = 12,
  FLINCH_LEFTLEG = 13,
  FLINCH_RIGHTLEG = 14,
  DOUBLEJUMP = 15,

  CANCEL = 16,
  SPAWN = 17,
  SNAP_YAW = 18,

  CUSTOM = 19,
  CUSTOM_GESTURE = 20,
  CUSTOM_SEQUENCE = 21,
  CUSTOM_GESTURE_SEQUENCE = 22,

  ATTACK_PRE = 23,
  ATTACK_POST = 24,
  GRENADE1_DRAW = 25,
  GRENADE2_DRAW = 26,
  GRENADE1_THROW = 27,
  GRENADE2_THROW = 28,
  VOICE_COMMAND_GESTURE = 29,
  DOUBLEJUMP_CROUCH = 30,
  STUN_BEGIN = 31,
  STUN_MIDDLE = 32,
  STUN_END = 33,

  ATTACK_PRIMARY_SUPER = 34,

  COUNT = 35,
}

GestureSlot = {
  ATTACK_AND_RELOAD = 0,
  GRENADE = 1,
  JUMP = 2,
  SWIM = 3,
  FLINCH = 4,
  VCD = 5,
  CUSTOM = 6,

  COUNT = 7,
}

AmmoTracer = {
  NONE = 0,
  LINE = 1,
  RAIL = 2,
  BEAM = 2,
  LINE_AND_WHIZ = 4,
}

PassengerRole = {
  NONE = -1,
  DRIVER = 0,
  LAST_SHARED_ROLE = 1,
}
