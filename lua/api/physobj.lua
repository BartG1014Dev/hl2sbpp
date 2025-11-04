
--- Interface for manipulating physics objects (e.g., props, entities).
--- **Warning**: Physics objects in Lua are unsafe as they may reference entities that no longer exist.
--- Store and use with caution.
---@class IPhysicsObject
IPhysicsObject = {}

--- Add velocity and angular velocity to the physics object.
---@param velocity Vector Linear velocity to add
---@param angularVelocity Vector Angular velocity to add
function IPhysicsObject:AddVelocity(velocity, angularVelocity) end

--- Apply a force at the object's center of mass.
---@param force Vector Force to apply
function IPhysicsObject:ApplyForceCenter(force) end

--- Apply a force at a specific point on the object.
---@param force Vector Force to apply
---@param point Vector Point of application
function IPhysicsObject:ApplyForceOffset(force, point) end

--- Apply a torque at the object's center of mass.
---@param torque Vector Torque to apply
function IPhysicsObject:ApplyTorqueCenter(torque) end

--- Make the object hinged along a specified axis.
---@param axis integer Axis index (0 = x, 1 = y, 2 = z)
function IPhysicsObject:BecomeHinged(axis) end

--- Make the object a trigger (non-colliding, event-driven).
function IPhysicsObject:BecomeTrigger() end

--- Calculate angular drag for a given force vector.
---@param force Vector Force vector
---@return number Angular drag
function IPhysicsObject:CalculateAngularDrag(force) end

--- Calculate force and torque from a force applied at a point.
---@param force Vector Force to apply
---@param point Vector Point of application
---@return Vector centerForce Resulting force at center
---@return Vector centerTorque Resulting torque at center
function IPhysicsObject:CalculateForceOffset(force, point) end

--- Calculate linear drag for a given force vector.
---@param force Vector Force vector
---@return number Linear drag
function IPhysicsObject:CalculateLinearDrag(force) end

--- Calculate velocity and angular velocity from a force at a point.
---@param force Vector Force to apply
---@param point Vector Point of application
---@return Vector centerVelocity Resulting linear velocity
---@return Vector centerAngularVelocity Resulting angular velocity
function IPhysicsObject:CalculateVelocityOffset(force, point) end

--- Enable or disable collisions for the object.
---@param enable boolean True to enable collisions
function IPhysicsObject:EnableCollisions(enable) end

--- Enable or disable drag for the object.
---@param enable boolean True to enable drag
function IPhysicsObject:EnableDrag(enable) end

--- Enable or disable gravity for the object.
---@param enable boolean True to enable gravity
function IPhysicsObject:EnableGravity(enable) end

--- Enable or disable motion for the object.
---@param enable boolean True to enable motion
function IPhysicsObject:EnableMotion(enable) end

--- Get the callback flags for the object.
---@return integer Callback flags
function IPhysicsObject:GetCallbackFlags() end

--- Get the contact point and object from the last collision.
---@return boolean Success True if contact exists
---@return Vector contactPoint Contact point
---@return IPhysicsObject contactObject Contacted object
function IPhysicsObject:GetContactPoint() end

--- Get the contents mask of the object.
---@return integer Contents mask
function IPhysicsObject:GetContents() end

--- Get the damping values for speed and rotation.
---@return number speed Damping for linear speed
---@return number rot Damping for rotation
function IPhysicsObject:GetDamping() end

--- Get the total energy of the object.
---@return number Energy
function IPhysicsObject:GetEnergy() end

--- Get the game-specific flags for the object.
---@return integer Game flags
function IPhysicsObject:GetGameFlags() end

--- Get the game-specific index for the object.
---@return integer Game index
function IPhysicsObject:GetGameIndex() end

--- Get the implicit velocity and angular velocity of the object.
---@return Vector velocity Linear velocity
---@return Vector angularVelocity Angular velocity
function IPhysicsObject:GetImplicitVelocity() end

--- Get the inertia vector of the object.
---@return Vector Inertia
function IPhysicsObject:GetInertia() end

--- Get the inverse inertia vector of the object.
---@return Vector Inverse inertia
function IPhysicsObject:GetInvInertia() end

--- Get the inverse mass of the object.
---@return number Inverse mass
function IPhysicsObject:GetInvMass() end

--- Get the mass of the object.
---@return number Mass
function IPhysicsObject:GetMass() end

--- Get the center of mass in local space.
---@return Vector Mass center
function IPhysicsObject:GetMassCenterLocalSpace() end

--- Get the material index of the object.
---@return integer Material index
function IPhysicsObject:GetMaterialIndex() end

--- Get the name of the object.
---@return string Object name
function IPhysicsObject:GetName() end

--- Get the position and orientation of the object.
---@return Vector worldPosition World position
---@return QAngle angles Orientation
function IPhysicsObject:GetPosition() end

--- Get the shadow controller position and orientation.
---@return integer success Success code
---@return Vector position Shadow position
---@return QAngle angles Shadow orientation
function IPhysicsObject:GetShadowPosition() end

--- Get the radius of the object if it is a sphere.
---@return number Sphere radius
function IPhysicsObject:GetSphereRadius() end

--- Get the current velocity and angular velocity of the object.
---@return Vector velocity Linear velocity
---@return Vector angularVelocity Angular velocity
function IPhysicsObject:GetVelocity() end

--- Get the velocity at a specific point on the object.
---@param point Vector Point to check
---@return Vector Velocity at point
function IPhysicsObject:GetVelocityAtPoint(point) end

--- Check if the object is asleep (not simulating).
---@return boolean True if asleep
function IPhysicsObject:IsAsleep() end

--- Check if the object is attached to a constraint.
---@param allowFixed boolean True to include fixed constraints
---@return boolean True if attached
function IPhysicsObject:IsAttachedToConstraint(allowFixed) end

--- Check if collisions are enabled for the object.
---@return boolean True if collisions are enabled
function IPhysicsObject:IsCollisionEnabled() end

--- Check if drag is enabled for the object.
---@return boolean True if drag is enabled
function IPhysicsObject:IsDragEnabled() end

--- Check if the object is in a fluid environment.
---@return boolean True if in fluid
function IPhysicsObject:IsFluid() end

--- Check if gravity is enabled for the object.
---@return boolean True if gravity is enabled
function IPhysicsObject:IsGravityEnabled() end

--- Check if the object is hinged.
---@return boolean True if hinged
function IPhysicsObject:IsHinged() end

--- Check if motion is enabled for the object.
---@return boolean True if motion is enabled
function IPhysicsObject:IsMotionEnabled() end

--- Check if the object is moveable.
---@return boolean True if moveable
function IPhysicsObject:IsMoveable() end

--- Check if the object is static (non-moveable).
---@return boolean True if static
function IPhysicsObject:IsStatic() end

--- Check if the object is a trigger.
---@return boolean True if a trigger
function IPhysicsObject:IsTrigger() end

--- Convert a local position to world space.
---@param localPos Vector Local position
---@return Vector World position
function IPhysicsObject:LocalToWorld(localPos) end

--- Convert a local vector to world space.
---@param localVec Vector Local vector
---@return Vector World vector
function IPhysicsObject:LocalToWorldVector(localVec) end

--- Output debug information about the object.
function IPhysicsObject:OutputDebugInfo() end

--- Recheck the collision filter for the object.
function IPhysicsObject:RecheckCollisionFilter() end

--- Recheck contact points for the object.
function IPhysicsObject:RecheckContactPoints() end

--- Remove the hinged state from the object.
function IPhysicsObject:RemoveHinged() end

--- Remove the shadow controller from the object.
function IPhysicsObject:RemoveShadowController() end

--- Remove the trigger state from the object.
function IPhysicsObject:RemoveTrigger() end

--- Set the buoyancy ratio for the object.
---@param ratio number Buoyancy ratio
function IPhysicsObject:SetBuoyancyRatio(ratio) end

--- Set callback flags for the object.
---@param flags integer Callback flags
function IPhysicsObject:SetCallbackFlags(flags) end

--- Set the contents mask for the object.
---@param contents integer Contents mask
function IPhysicsObject:SetContents(contents) end

--- Set drag coefficients for linear and angular motion.
---@param drag number Linear drag coefficient
---@param angularDrag number Angular drag coefficient
function IPhysicsObject:SetDragCoefficient(drag, angularDrag) end

--- Set game-specific flags for the object.
---@param flags integer Game flags
function IPhysicsObject:SetGameFlags(flags) end

--- Set the game-specific index for the object.
---@param index integer Game index
function IPhysicsObject:SetGameIndex(index) end

--- Set the mass of the object.
---@param mass number Mass
function IPhysicsObject:SetMass(mass) end

--- Set the material index for the object.
---@param index integer Material index
function IPhysicsObject:SetMaterialIndex(index) end

--- Set shadow controller parameters for the object.
---@param maxSpeed number Maximum speed
---@param maxAngular number Maximum angular speed
---@param allowPhysicsMovement boolean Allow physics-based movement
---@param allowPhysicsRotation boolean Allow physics-based rotation
function IPhysicsObject:SetShadow(maxSpeed, maxAngular, allowPhysicsMovement, allowPhysicsRotation) end

--- Set the velocity and angular velocity of the object.
---@param velocity Vector Linear velocity
---@param angularVelocity Vector Angular velocity
function IPhysicsObject:SetVelocity(velocity, angularVelocity) end

--- Set the velocity and angular velocity instantly (no interpolation).
---@param velocity Vector Linear velocity
---@param angularVelocity Vector Angular velocity
function IPhysicsObject:SetVelocityInstantaneous(velocity, angularVelocity) end

--- Put the object to sleep (stop simulation).
function IPhysicsObject:Sleep() end

--- Wake the object (resume simulation).
function IPhysicsObject:Wake() end

--- Convert a world position to local space.
---@param worldPos Vector World position
---@return Vector Local position
function IPhysicsObject:WorldToLocal(worldPos) end

--- Convert a world vector to local space.
---@param worldVec Vector World vector
---@return Vector Local vector
function IPhysicsObject:WorldToLocalVector(worldVec) end

--- String representation of the IPhysicsObject.
---@return string
function IPhysicsObject:__tostring() end

return IPhysicsObject