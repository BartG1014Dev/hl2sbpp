---@class IMaterial
local IMaterial = {}

--- Increase reference count (prevent unloading).
function IMaterial:AddRef() end

--- Modulates the material alpha (transparency).
---@param alpha number # Alpha multiplier (0–1)
function IMaterial:AlphaModulate(alpha) end

--- Modulates the material color.
---@param r number
---@param g number
---@param b number
function IMaterial:ColorModulate(r, g, b) end

--- Decreases reference count by one.
function IMaterial:DecrementReferenceCount() end

--- Deletes material if no references remain.
function IMaterial:DeleteIfUnreferenced() end

--- Returns current alpha modulation value.
---@return number
function IMaterial:GetAlphaModulation() end

--- Returns current color modulation values.
---@return number r, number g, number b
function IMaterial:GetColorModulation() end

--- Returns enumeration ID (engine internal).
---@return integer
function IMaterial:GetEnumerationID() end

--- Returns texture mapping height in pixels.
---@return integer
function IMaterial:GetMappingHeight() end

--- Returns texture mapping width in pixels.
---@return integer
function IMaterial:GetMappingWidth() end

--- Returns the material page this is part of.
---@return IMaterial
function IMaterial:GetMaterialPage() end

--- Checks if a specific material flag is set.
---@param flag integer # MaterialVarFlags_t
---@return boolean
function IMaterial:GetMaterialVarFlag(flag) end

--- Returns morph format enum.
---@return integer
function IMaterial:GetMorphFormat() end

--- Returns the material’s name.
---@return string
function IMaterial:GetName() end

--- Returns number of animation frames.
---@return integer
function IMaterial:GetNumAnimationFrames() end

--- Returns number of render passes.
---@return integer
function IMaterial:GetNumPasses() end

--- Checks a material property flag.
---@param prop integer # MaterialPropertyTypes_t
---@return boolean
function IMaterial:GetPropertyFlag(prop) end

--- Returns reflectivity vector.
---@return Vector
function IMaterial:GetReflectivity() end

--- Returns the shader name used.
---@return string
function IMaterial:GetShaderName() end

--- Returns the texture group name.
---@return string
function IMaterial:GetTextureGroupName() end

--- Returns memory usage in bytes.
---@return integer
function IMaterial:GetTextureMemoryBytes() end

--- Returns true if the material has a proxy.
---@return boolean
function IMaterial:HasProxy() end

--- Increases reference count by one.
function IMaterial:IncrementReferenceCount() end

--- Returns true if material belongs to a material page.
---@return boolean
function IMaterial:InMaterialPage() end

--- Returns true if material uses alpha testing.
---@return boolean
function IMaterial:IsAlphaTested() end

--- Returns true if this is the error material.
---@return boolean
function IMaterial:IsErrorMaterial() end

--- Returns true if material is a sprite card.
---@return boolean
function IMaterial:IsSpriteCard() end

--- Returns true if material is translucent.
---@return boolean
function IMaterial:IsTranslucent() end

--- Returns true if material is two-sided.
---@return boolean
function IMaterial:IsTwoSided() end

--- Returns true if material is vertex lit.
---@return boolean
function IMaterial:IsVertexLit() end

--- Returns whether it needs full framebuffer texture.
---@param checkHardwareCaps? boolean
---@return boolean
function IMaterial:NeedsFullFrameBufferTexture(checkHardwareCaps) end

--- Returns true if material needs lightmap blend alpha.
---@return boolean
function IMaterial:NeedsLightmapBlendAlpha() end

--- Returns whether it needs power-of-two framebuffer texture.
---@param checkHardwareCaps? boolean
---@return boolean
function IMaterial:NeedsPowerOfTwoFrameBufferTexture(checkHardwareCaps) end

--- Returns true if material needs software lighting.
---@return boolean
function IMaterial:NeedsSoftwareLighting() end

--- Returns true if material needs software skinning.
---@return boolean
function IMaterial:NeedsSoftwareSkinning() end

--- Returns true if material requires tangent space.
---@return boolean
function IMaterial:NeedsTangentSpace() end

--- Recomputes state snapshots.
function IMaterial:RecomputeStateSnapshots() end

--- Refreshes the material.
function IMaterial:Refresh() end

--- Refreshes while preserving material vars.
function IMaterial:RefreshPreservingMaterialVars() end

--- Releases the material (decrement + free).
function IMaterial:Release() end

--- Sets a material var flag.
---@param flag integer
---@param on boolean
function IMaterial:SetMaterialVarFlag(flag, on) end

--- Sets the shader by name.
---@param shader string
function IMaterial:SetShader(shader) end

--- Enables/disables baked lighting.
---@param enable boolean
function IMaterial:SetUseFixedFunctionBakedLighting(enable) end

--- Returns number of shader parameters.
---@return integer
function IMaterial:ShaderParamCount() end

--- Returns true if material uses env cubemap.
---@return boolean
function IMaterial:UsesEnvCubemap() end

--- Returns true if material was reloaded from whitelist.
---@return boolean
function IMaterial:WasReloadedFromWhitelist() end

---@param name      string
---@param complain? boolean Default true. Logs a warning if the var doesn't exist.
---@return IMaterialVar var
---@return boolean      found
function IMaterial:FindVar(name, complain) end

--- Returns string representation.
---@return string
function IMaterial:__tostring() end

return IMaterial
