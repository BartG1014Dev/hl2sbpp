--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose: Dumps a list of all INetworkStringTables
--
--===========================================================================--

local t
local i = 0
repeat
  t = networkstringtable.GetTable(i)
  if t == nil then
    break
  end
  print(t:GetTableName())
  i = i + 1
until t == nil
