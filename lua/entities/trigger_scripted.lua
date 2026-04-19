--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

DEFINE_BASECLASS("trigger_scripted")
DEFINE_FACTORY("CBaseTrigger")

function ENT:Initialize() end

function ENT:PassesTriggerFilters(pOther) end

function ENT:Think(pOther) end

function ENT:StartTouch(pOther) end

function ENT:Touch(pOther) end

function ENT:EndTouch(pOther) end
