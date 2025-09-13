-- weapons/weapon_toolgun/tools/balloon.lua
TOOL.Name = "Balloon"
TOOL.Description = "Create a balloon prop."

function TOOL:PrimaryAttack(swep, player, trace)
  	local balloon = CreateEntityByName( "prop_balloon" )
	if balloon ~= NULL then
		balloon:SetAbsOrigin( trace.endpos + Vector(0,0,5) )
		balloon:SetAbsAngles( QAngle() )
		balloon:Spawn()
		balloon:Activate()
	end
end

function TOOL:SecondaryAttack(swep, player, trace)
    -- TODO:
end
