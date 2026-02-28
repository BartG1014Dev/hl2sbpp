--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

IN = {
  ATTACK    = 1,
  JUMP      = 2,
  DUCK      = 4,
  FORWARD   = 8,
  BACK      = 16,
  USE       = 32,
  CANCEL    = 64,
  LEFT      = 128,
  RIGHT     = 256,
  MOVELEFT  = 512,
  MOVERIGHT = 1024,
  ATTACK2   = 2048,
  RUN       = 4096,
  RELOAD    = 8192,
  ALT1      = 16384,
  ALT2      = 32768,
  SCORE     = 65536,
  SPEED     = 131072,
  WALK      = 262144,
  ZOOM      = 524288,
  WEAPON1   = 1048576,
  WEAPON2   = 2097152,
  BULLRUSH  = 4194304,
  GRENADE1  = 8388608,
  GRENADE2  = 16777216,
  ATTACK3   = 33554432,
}

function HasFlag(flags, flag)
  return bitty.band(flags, flag) ~= 0
end
