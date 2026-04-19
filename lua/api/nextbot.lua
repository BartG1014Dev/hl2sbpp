---@class CNextBot : CBaseFlex
---@field loco NextBotLocomotion
CNextBot = {}

---Returns distance to entity or vector
---@param target CBaseEntity|Vector
---@return number
function CNextBot:GetRangeTo(target) end

---Returns squared distance to entity or vector
---@param target CBaseEntity|Vector
---@return number
function CNextBot:GetRangeSquaredTo(target) end

---Start animation activity
---@param activity integer
function CNextBot:StartActivity(activity) end

---Get current activity
---@return integer
function CNextBot:GetActivity() end

---Turn bot into ragdoll
function CNextBot:BecomeRagdoll() end

---@class NextBotLocomotion
NextBotLocomotion = {}

---@param speed number
function NextBotLocomotion:SetDesiredSpeed(speed) end

---@return number
function NextBotLocomotion:GetDesiredSpeed() end

---@param pos Vector
---@param weight? number
function NextBotLocomotion:Approach(pos, weight) end

---@param pos Vector
function NextBotLocomotion:FaceTowards(pos) end

---@return boolean
function NextBotLocomotion:IsClimbingOrJumping() end

function NextBotLocomotion:Jump() end

---@return Vector
function NextBotLocomotion:GetVelocity() end

---@return Vector
function NextBotLocomotion:GetCurrentAcceleration() end

---@return boolean
function NextBotLocomotion:IsAttemptingToMove() end

---@return boolean
function NextBotLocomotion:IsStuck() end

---@param accel number
function NextBotLocomotion:SetAcceleration(accel) end

---@return number
function NextBotLocomotion:GetAcceleration() end

---@param decel number
function NextBotLocomotion:SetDeceleration(decel) end

---@return number
function NextBotLocomotion:GetDeceleration() end

---@param height number
function NextBotLocomotion:SetStepHeight(height) end

---@return number
function NextBotLocomotion:GetStepHeight() end

---@param height number
function NextBotLocomotion:SetJumpHeight(height) end

---@return number
function NextBotLocomotion:GetJumpHeight() end

---@param height number
function NextBotLocomotion:SetDeathDropHeight(height) end

---@return number
function NextBotLocomotion:GetDeathDropHeight() end

function NextBotLocomotion:ClearStuck() end

---@return Vector
function NextBotLocomotion:GetGroundMotionVector() end

---@class NextBotPathFollower
local NextBotPathFollower = {}

---Create path
---@param type '"Follow"'|'"Chase"'
---@return NextBotPathFollower
function Path(type) end

---Compute path
---@param bot CNextBot
---@param goal Vector
---@param costFunc? fun(area:any, from:any):number
function NextBotPathFollower:Compute(bot, goal, costFunc) end

---@param bot CNextBot
function NextBotPathFollower:Update(bot) end

---@return boolean
function NextBotPathFollower:IsValid() end

function NextBotPathFollower:Invalidate() end

---@return number
function NextBotPathFollower:GetLength() end

---@return number
function NextBotPathFollower:GetAge() end

---@return Vector|nil
function NextBotPathFollower:GetStart() end

---@return Vector|nil
function NextBotPathFollower:GetEnd() end

---@param dist number
function NextBotPathFollower:SetMinLookAheadDistance(dist) end

---@param tolerance number
function NextBotPathFollower:SetGoalTolerance(tolerance) end

---@param pos Vector
---@return Vector
function NextBotPathFollower:GetClosestPosition(pos) end

---@return Vector
function NextBotPathFollower:GetCursorPosition() end

function NextBotPathFollower:Draw() end

---@param bot CNextBot
---@param target CBaseEntity
function NextBotPathFollower:Chase(bot, target) end

return CNextBot, NextBotPathFollower, NextBotLocomotion