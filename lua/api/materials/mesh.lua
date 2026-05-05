
---@class IMesh
---@operator eq(IMesh): boolean
IMesh = {}

--- Draws the mesh. Pass no arguments to draw the whole thing.
---@param firstIndex? integer
---@param numIndices? integer
function IMesh:Draw(firstIndex, numIndices) end

---@param type integer
function IMesh:SetPrimitiveType(type) end

---@return boolean
function IMesh:HasColorMesh() end

---@return boolean
function IMesh:IsDynamic() end

---@return integer
function IMesh:VertexCount() end

---@return integer
function IMesh:IndexCount() end

--- Manually destroys a static mesh. No-op for dynamic meshes
function IMesh:Destroy() end

return IMesh