hook.add("Initialize", "Death1", function()
	_R.CBaseEntity.PrecacheSound( "player/PlayerDeathSound.wav" );
end)

if SERVER then
	hook.add("PlayerDeathSound", "Death2", function( pPlayer, info )
  		_R.CBaseEntity.EmitSound( pPlayer, "player/PlayerDeathSound.wav");
	end)
end