---@class physenv
physenv = {}

--- Clean up the list of physics objects marked for deletion.
function physenv.CleanupDeleteList() end

--- Clear physics performance statistics.
function physenv.ClearStats() end

--- Debug check for physics contacts.
function physenv.DebugCheckContacts() end

--- Get the number of active physics objects.
---@return number Count of active objects
function physenv.GetActiveObjectCount() end

--- Get the current air density in the physics environment.
---@return number Air density
function physenv.GetAirDensity() end

--- Get the gravity vector of the physics environment.
---@return Vector Gravity vector
function physenv.GetGravity() end

--- Get the time of the next physics simulation frame.
---@return number Frame time
function physenv.GetNextFrameTime() end

--- Get performance settings for the physics environment.
---@return table Physics performance parameters
function physenv.GetPerformanceSettings() end

--- Get the current simulation time.
---@return number Simulation time
function physenv.GetSimulationTime() end

--- Get the time step used for physics simulation.
---@return number Simulation time step
function physenv.GetSimulationTimestep() end

--- Check if the physics environment is currently simulating.
---@return boolean True if in simulation
function physenv.IsInSimulation() end

--- Perform post-restore operations for the physics environment.
function physenv.PostRestore() end

--- Reset the simulation clock.
function physenv.ResetSimulationClock() end

--- Set the air density for the physics environment.
---@param density number Air density value
function physenv.SetAirDensity(density) end

--- Set the gravity vector for the physics environment.
---@param gravity Vector Gravity vector
function physenv.SetGravity(gravity) end

--- Set performance settings for the physics environment.
---@param settings table Performance settings
function physenv.SetPerformanceSettings(settings) end

--- Enable or disable quick deletion of physics objects.
---@param enable boolean True to enable quick deletion
function physenv.SetQuickDelete(enable) end

--- Set the time step for physics simulation.
---@param timestep number Simulation time step
function physenv.SetSimulationTimestep(timestep) end

--- Run a physics simulation for a specified time.
---@param deltaTime number Time to simulate
function physenv.Simulate(deltaTime) end

--- Interface for manipulating physics objects (e.g., props, entities).
--- **Warning**: Physics objects in Lua are unsafe as they may reference entities that no longer exist.
--- Store and use with caution.
return physenv
