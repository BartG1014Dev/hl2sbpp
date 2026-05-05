---@class ITexture
ITexture = {}

---@return string
function ITexture:GetName() end

---@return integer
function ITexture:GetActualWidth() end

---@return integer
function ITexture:GetActualHeight() end

---@return integer
function ITexture:GetMappingWidth() end

---@return integer
function ITexture:GetMappingHeight() end

---@return integer
function ITexture:GetNumAnimationFrames() end

---@return boolean
function ITexture:IsTranslucent() end

---@return boolean
function ITexture:IsMipmapped() end

---@return boolean
function ITexture:IsNormalMap() end

---@return boolean
function ITexture:IsCubeMap() end

---@return boolean
function ITexture:IsRenderTarget() end

---@return boolean
function ITexture:IsProcedural() end

---@return boolean True if this is the engine's error/checkerboard texture.
function ITexture:IsError() end

---@return boolean
function ITexture:IsVolumeTexture() end

---@return integer  An `IMAGE_FORMAT.*` value.
function ITexture:GetImageFormat() end

--- Samples the low-resolution thumbnail color at (s,t) in [0,1].
--- Returns 4 numbers: r, g, b, a (each [0,1]).
---@param s number
---@param t number
---@return number r
---@return number g
---@return number b
---@return number a
function ITexture:GetLowResColorSample(s, t) end

function ITexture:IncrementReferenceCount() end
function ITexture:DecrementReferenceCount() end
function ITexture:DeleteIfUnreferenced() end

--- Re-uploads the texture (e.g. after a procedural regenerator has run).
function ITexture:Download() end

--- Swaps the GPU contents of two textures. Useful for double-buffered RTs.
---@param other ITexture
function ITexture:SwapContents(other) end

---@return integer
function ITexture:GetApproximateVidMemBytes() end

return ITexture