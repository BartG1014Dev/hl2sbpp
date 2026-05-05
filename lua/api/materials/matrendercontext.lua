---@class IMatRenderContext
IMatRenderContext = {}

--- Binds a material as the current render state for subsequent draw calls.
---@param material IMaterial
---@return IMatRenderContext self
function IMatRenderContext:Bind(material) end

--- Acquires a dynamic mesh from the render context
---@param buffered? boolean   Default `true`. If false, draws are flushed immediately.
---@param material? IMaterial Optional material to derive vertex format from.
---@return IMesh
function IMatRenderContext:GetDynamicMesh(buffered, material) end

--- Selects which matrix stack subsequent matrix ops affect
---@param mode integer  One of `MATERIAL_MODEL`, `MATERIAL_VIEW`, `MATERIAL_PROJECTION`.
---@return IMatRenderContext self
function IMatRenderContext:MatrixMode(mode) end

---@return IMatRenderContext self
function IMatRenderContext:PushMatrix() end

---@return IMatRenderContext self
function IMatRenderContext:PopMatrix() end

---@return IMatRenderContext self
function IMatRenderContext:LoadIdentity() end

--- Translate the current matrix. Two overloads: `(Vector)` and `(x, y, z)`
---@param xOrVec number|Vector
---@param y?     number
---@param z?     number
---@return IMatRenderContext self
function IMatRenderContext:Translate(xOrVec, y, z) end

--- Rotate around an axis by `angle` degrees
---@param angle number  Degrees.
---@param x     number
---@param y     number
---@param z     number
---@return IMatRenderContext self
function IMatRenderContext:Rotate(angle, x, y, z) end

---@param x number
---@param y number
---@param z number
---@return IMatRenderContext self
function IMatRenderContext:Scale(x, y, z) end


--- Pushes the current RT/viewport onto a stack
--- Three overloads:
---   * `()` 
---   * `(rt)` 
---   * `(rt, x, y, w, h)`
---@param rt? ITexture
---@param x?  integer
---@param y?  integer
---@param w?  integer
---@param h?  integer
---@return IMatRenderContext self
function IMatRenderContext:PushRenderTargetAndViewport(rt, x, y, w, h) end

---@return IMatRenderContext self
function IMatRenderContext:PopRenderTargetAndViewport() end

--- Set the current render target (no stack push). Pass `nil` for the back buffer.
---@param rt? ITexture
---@return IMatRenderContext self
function IMatRenderContext:SetRenderTarget(rt) end

---@return ITexture? rt  `nil` if currently rendering to the back buffer.
function IMatRenderContext:GetRenderTarget() end

---@return integer width
---@return integer height
function IMatRenderContext:GetRenderTargetDimensions() end


---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@return IMatRenderContext self
function IMatRenderContext:Viewport(x, y, w, h) end

---@return integer x
---@return integer y
---@return integer w
---@return integer h
function IMatRenderContext:GetViewport() end

---@param r integer 0-255
---@param g integer 0-255
---@param b integer 0-255
---@return IMatRenderContext self
function IMatRenderContext:ClearColor3ub(r, g, b) end

---@param r integer 0-255
---@param g integer 0-255
---@param b integer 0-255
---@param a integer 0-255
---@return IMatRenderContext self
function IMatRenderContext:ClearColor4ub(r, g, b, a) end

---@param color   boolean
---@param depth   boolean
---@param stencil? boolean Default false.
---@return IMatRenderContext self
function IMatRenderContext:ClearBuffers(color, depth, stencil) end


---@param enable     boolean  Apply the override?
---@param depthWrite boolean  Allow depth writes when override active?
---@return IMatRenderContext self
function IMatRenderContext:OverrideDepthEnable(enable, depthWrite) end

---@param enable     boolean
---@param alphaWrite boolean
---@return IMatRenderContext self
function IMatRenderContext:OverrideAlphaWriteEnable(enable, alphaWrite) end

---@param enable     boolean
---@param colorWrite boolean
---@return IMatRenderContext self
function IMatRenderContext:OverrideColorWriteEnable(enable, colorWrite) end

---@param enable boolean
---@return IMatRenderContext self
function IMatRenderContext:SetStencilEnable(enable) end

--- Set face culling mode
---@param mode integer  `MATERIAL_CULLMODE_CCW` or `MATERIAL_CULLMODE_CW`.
---@return IMatRenderContext self
function IMatRenderContext:CullMode(mode) end


---@class renderlib
render = render or {}

--- Gets the current material-system render context
---@return IMatRenderContext
function render.GetRenderContext() end

return IMatRenderContext, render