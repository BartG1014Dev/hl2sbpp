--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose: Bit but better
--
--===========================================================================--

bitty = bitty or {}

local function to32(x)
  return x % 2 ^ 32
end

function bitty.band(a, b)
  local result = 0
  local bitval = 1
  a = to32(a)
  b = to32(b)

  while a > 0 or b > 0 do
    local abit = a % 2
    local bbit = b % 2
    if abit == 1 and bbit == 1 then
      result = result + bitval
    end
    a = math.floor(a / 2)
    b = math.floor(b / 2)
    bitval = bitval * 2
  end

  return to32(result)
end

function bitty.bor(a, b)
  local result = 0
  local bitval = 1
  a = to32(a)
  b = to32(b)

  while a > 0 or b > 0 do
    local abit = a % 2
    local bbit = b % 2
    if abit == 1 or bbit == 1 then
      result = result + bitval
    end
    a = math.floor(a / 2)
    b = math.floor(b / 2)
    bitval = bitval * 2
  end

  return to32(result)
end

function bitty.bxor(a, b)
  return bitty.band(bitty.bor(a, b), bitty.bnot(bitty.band(a, b)))
end

function bitty.bnot(a)
  return to32(2 ^ 32 - 1 - a)
end

function bitty.lshift(a, n)
  return to32(a * 2 ^ n)
end

function bitty.rshift(a, n)
  return math.floor(a / 2 ^ n)
end

return bitty
