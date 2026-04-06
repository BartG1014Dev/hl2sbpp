---@class CBaseAnimatingOverlay : CBaseAnimating
CBaseAnimatingOverlay = {}

---Adds a gesture animation.
---@overload fun(self:CBaseAnimatingOverlay, activity:integer, duration:number, autokill:boolean):integer
---@param activity integer
---@param autokill boolean
---@return integer layer
function CBaseAnimatingOverlay:AddGesture(activity, autokill) end

---Checks if a gesture is currently playing.
---@param activity integer
---@return boolean
function CBaseAnimatingOverlay:IsPlayingGesture(activity) end

---Restarts a gesture.
---@overload fun(self:CBaseAnimatingOverlay, activity:integer, autokill:boolean, restart:boolean)
---@param activity integer
function CBaseAnimatingOverlay:RestartGesture(activity) end

---Removes all gesture layers.
function CBaseAnimatingOverlay:RemoveAllGestures() end

---Returns whether any animation layers are active.
---@return boolean
function CBaseAnimatingOverlay:HasActiveLayer() end

return CBaseAnimatingOverlay
