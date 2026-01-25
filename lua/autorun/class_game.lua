-- class_game.lua
game = {}

function game.SinglePlayer()
  return gpGlobals.maxClients() == 1
end

function game.MultiPlayer()
  return gpGlobals.maxClients() > 1
end

function game.IsDedicated()
  return SERVER and not gpGlobals.IsClient()
end

function game.MaxPlayers()
  return gpGlobals.maxClients()
end

function game.TickInterval()
  return gpGlobals.interval_per_tick()
end

function game.TickCount()
  return gpGlobals.tickcount()
end

function game.SimTicksThisFrame()
  return gpGlobals.simTicksThisFrame()
end

function game.RealTime()
  return gpGlobals.realtime()
end

function game.FrameTime()
  return gpGlobals.frametime()
end

function game.AbsoluteFrameTime()
  return gpGlobals.absoluteframetime()
end

function game.FrameCount()
  return gpGlobals.framecount()
end

function game.IsClient()
  return gpGlobals.IsClient()
end

game._particleFiles = game._particleFiles or {}
game._precachedParticleSystems = game._precachedParticleSystems or {}

function game.AddParticles(name) end
