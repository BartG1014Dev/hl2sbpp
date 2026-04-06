---@class CBaseFlex : CBaseAnimatingOverlay
CBaseFlex = {}

---Sets a flex controller weight by name.
---@param name string
---@param value number
function CBaseFlex:SetFlexWeight(name, value) end

---Sets a flex controller weight by index.
---@param index integer
---@param value number
function CBaseFlex:SetFlexWeightByIndex(index, value) end

---Gets a flex controller weight by name.
---@param name string
---@return number
function CBaseFlex:GetFlexWeight(name) end

---Gets a flex controller weight by index.
---@param index integer
---@return number
function CBaseFlex:GetFlexWeightByIndex(index) end

---Finds a flex controller index by name.
---@param name string
---@return integer
function CBaseFlex:FindFlexController(name) end

---Sets the entity's view target.
---@param pos Vector
function CBaseFlex:SetViewtarget(pos) end

---Gets the entity's view target.
---@return Vector
function CBaseFlex:GetViewtarget() end

---Triggers a blink animation.
function CBaseFlex:Blink() end

---Plays a choreographed scene.
---@param scene string
---@param delay number
---@return number
function CBaseFlex:PlayScene(scene, delay) end

---Clears scene events.
---@param removeNow boolean
function CBaseFlex:ClearSceneEvents(removeNow) end

return CBaseFlex
