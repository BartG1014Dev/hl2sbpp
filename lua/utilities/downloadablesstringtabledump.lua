--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose: Dumps a list of all userdata in the downloadables string table
--
--===========================================================================--

local t = networkstringtable.FindTable("downloadables")
print(t)
for i = 1, t:GetNumStrings() do
  print("\t" .. i .. ": " .. tostring(t:GetString(i)))
end
