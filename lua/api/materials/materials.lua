---@class materialslib
materials = {}

--- Finds (or loads) a material by name.
---@param name      string                  Material path, e.g. "debug/debugwireframe".
---@param group?    string                  Texture group (default: `TEXTURE_GROUP.OTHER`).
---@param complain? boolean                 Print a warning if not found (default: true).
---@return IMaterial
function materials.FindMaterial(name, group, complain) end

--- Creates a new material from a VMT-style KeyValues string.
---@param name string  Unique name to register the material under.
---@param kv   string  Multiline KeyValues text (the contents of a .vmt).
---@return IMaterial
function materials.CreateMaterial(name, kv) end

--- Returns true if the named material is loaded and is not the error material.
---@param name string
---@return boolean
function materials.IsMaterialLoaded(name) end

--- Frees materials no longer in use.
function materials.UncacheUnusedMaterials() end

--- Reloads materials. If `substring` is given, only those whose names contain it.
---@param substring? string
function materials.ReloadMaterials(substring) end

--- Binds a material to the current render context for subsequent draws.
---@param material IMaterial
function materials.Bind(material) end

--- Sets the render context's color modulation (per-draw tint, each [0..1]).
---@param r number
---@param g number
---@param b number
function materials.SetColorModulation(r, g, b) end

--- Returns the per-frame dynamic mesh
---@param buffered? boolean
---@param material? IMaterial
---@return IMesh
function materials.GetDynamicMesh(buffered, material) end

--- Creates a static mesh you own
---@param vertexFormat integer  Bitmask of `VERTEX_FORMAT.*`
---@param textureGroup? string
---@param material? IMaterial
---@return IMesh
function materials.CreateStaticMesh(vertexFormat, textureGroup, material) end

---@param name              string  Texture path (no extension), e.g. `"vgui/white"`.
---@param textureGroupName? string  Cache group name. Default: `"Other textures"`.
---@param complain?         boolean Warn on failure. Default: `true`.
---@return ITexture
function materials.FindTexture(name, textureGroupName, complain) end

---@param name string Texture path (no extension)
---@return boolean
function materials.IsTextureLoaded(name) end

---@param name               string
---@param width              integer
---@param height             integer
---@param sizeMode           integer  `RT_SIZE.*`
---@param format             integer  `IMAGE_FORMAT.*`
---@param depthMode?         integer  `MATERIAL_RT_DEPTH.*` (default: `SHARED`)
---@param textureFlags?      integer  `TEXTUREFLAGS.*` bitmask (default: `CLAMPS|CLAMPT`)
---@param renderTargetFlags? integer  Default: `0`
---@return ITexture
function materials.CreateNamedRenderTargetTextureEx(
    name, width, height, sizeMode, format,
    depthMode, textureFlags, renderTargetFlags) end

---@param name             string  Internal name (used as a cache key; must be unique).
---@param textureGroupName string  Cache group, e.g. `"Other textures"`.
---@param width            integer
---@param height           integer
---@param format           integer  `IMAGE_FORMAT.*`
---@param flags            integer  `TEXTUREFLAGS.*` bitmask
---@return ITexture
function materials.CreateProceduralTexture(
    name, textureGroupName, width, height, format, flags) end

return materials