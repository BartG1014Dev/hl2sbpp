-- weapons/weapon_toolgun/tools/light.lua
TOOL.Name = "Light"
TOOL.Description = "Create a light prop."

function TOOL:PrimaryAttack(swep, player, trace)
  	local light = CreateEntityByName( "prop_light" )
	if light ~= NULL then
		light:SetAbsOrigin( trace.endpos + Vector(0,0,10) )
		light:SetAbsAngles( QAngle() )
		light:Spawn()
		light:Activate()
	end
end

function TOOL:SecondaryAttack(swep, player, trace)
    -- TODO:
end
