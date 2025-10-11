--======== Copyright (C) 2025-2025, Team HL2SB++, All rights reserved. ========--
--
-- Purpose:
--
--===========================================================================--

if not SERVER then return end -- prevent this from running on client

DEFINE_BASECLASS( "trigger_scripted" )
DEFINE_FACTORY( "CBaseTrigger" )

function ENT:Initialize()
end

function ENT:PassesTriggerFilters( pOther )
end

function ENT:Think( pOther )
end

function ENT:StartTouch( pOther )
end

function ENT:Touch( pOther )
end

function ENT:EndTouch( pOther )
end
