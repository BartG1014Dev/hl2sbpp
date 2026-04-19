--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

DEFINE_BASECLASS("nextbot_scripted")
DEFINE_FACTORY("CNextBot")

function ENT:Initialize()
  self.Entity:SetModel("models/player/group03/male_07.mdl")
  util.PrecacheModel("models/player/group03/male_07.mdl")
  self.Entity:SetHealth(100)

  self.loco:SetDesiredSpeed(200)
  self.loco:SetStepHeight(18)
  self.loco:SetAcceleration(400)
  self.loco:SetDeceleration(400)
end

---@param self ScriptedNextBot
function ENT:BehaveAct()
  local players = player.GetAll()
  if #players == 0 then
    return
  end

  local target = players[1]
  if not IsValid(target) then
    return
  end

  if not self._path then --- What the hell did I smoke here?
    self._path = Path("Follow")
    self._path:SetMinLookAheadDistance(100)
    self._path:SetGoalTolerance(50)
  end

  self._path:Compute(self, target:GetAbsOrigin())

  if self._path:IsValid() then
    self._path:Update(self)
  end
end

function ENT:Think() end

function ENT:OnKilled(info) end
