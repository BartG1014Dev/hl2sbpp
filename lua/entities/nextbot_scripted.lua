--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

DEFINE_BASECLASS("prop_scripted")
DEFINE_FACTORY("CNextBot")

if not true then
  -- This part is for VSCode.
  -- Remove if you want.
  ---@class ScriptedNextBot : CNextBot
  ENT = {}
end

function ENT:Initialize() end

function ENT:Think() end

function ENT:BehaveAct() end

function ENT:OnKilled(info) end

function ENT:OnStuck() end

function ENT:OnUnStuck() end

function ENT:OnLeaveGround() end

function ENT:OnLandOnGround() end
