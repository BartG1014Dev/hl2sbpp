---@class CMeshBuilder
CMeshBuilder = {}

---@return CMeshBuilder
function CMeshBuilder.new() end


---@param mesh IMesh
---@param type integer  A `MATERIAL.*` primitive type.
---@param a integer     primitiveCount, or vertexCount
---@param b? integer    indexCount (only when supplying both counts)
---@return CMeshBuilder
function CMeshBuilder:Begin(mesh, type, a, b) end

--- Closes the build and optionally draws / spews data
---@param spew? boolean
---@param draw? boolean
function CMeshBuilder:End(spew, draw) end

--- Rewinds the cursor to the beginning of the locked region
---@return CMeshBuilder
function CMeshBuilder:Reset() end


---@return integer
function CMeshBuilder:VertexCount() end

---@return integer
function CMeshBuilder:IndexCount() end

---@return integer
function CMeshBuilder:GetCurrentVertex() end

---@return integer
function CMeshBuilder:GetCurrentIndex() end

---@param idx integer
---@return CMeshBuilder
function CMeshBuilder:SelectVertex(idx) end

---@param idx integer
---@return CMeshBuilder
function CMeshBuilder:SelectIndex(idx) end

---@return CMeshBuilder
function CMeshBuilder:AdvanceVertex() end

---@param n integer
---@return CMeshBuilder
function CMeshBuilder:AdvanceVertices(n) end

---@return CMeshBuilder
function CMeshBuilder:AdvanceIndex() end

---@param n integer
---@return CMeshBuilder
function CMeshBuilder:AdvanceIndices(n) end


---@overload fun(self: CMeshBuilder, v: Vector): CMeshBuilder
---@param x number
---@param y number
---@param z number
---@return CMeshBuilder
function CMeshBuilder:Position3f(x, y, z) end

---@overload fun(self: CMeshBuilder, v: Vector): CMeshBuilder
---@param nx number
---@param ny number
---@param nz number
---@return CMeshBuilder
function CMeshBuilder:Normal3f(nx, ny, nz) end


---@param r number
---@param g number
---@param b number
---@return CMeshBuilder
function CMeshBuilder:Color3f(r, g, b) end

---@param r number
---@param g number
---@param b number
---@param a number
---@return CMeshBuilder
function CMeshBuilder:Color4f(r, g, b, a) end

---@param r integer  0-255
---@param g integer  0-255
---@param b integer  0-255
---@return CMeshBuilder
function CMeshBuilder:Color3ub(r, g, b) end

---@param r integer  0-255
---@param g integer  0-255
---@param b integer  0-255
---@param a integer  0-255
---@return CMeshBuilder
function CMeshBuilder:Color4ub(r, g, b, a) end


---@param r number
---@param g number
---@param b number
---@return CMeshBuilder
function CMeshBuilder:Specular3f(r, g, b) end

---@param r integer
---@param g integer
---@param b integer
---@param a integer
---@return CMeshBuilder
function CMeshBuilder:Specular4ub(r, g, b, a) end


---@param stage integer
---@param s number
---@return CMeshBuilder
function CMeshBuilder:TexCoord1f(stage, s) end

---@param stage integer
---@param s number
---@param t number
---@return CMeshBuilder
function CMeshBuilder:TexCoord2f(stage, s, t) end

---@param stage integer
---@param s number
---@param t number
---@param u number
---@return CMeshBuilder
function CMeshBuilder:TexCoord3f(stage, s, t, u) end

---@param stage integer
---@param s number
---@param t number
---@param u number
---@param w number
---@return CMeshBuilder
function CMeshBuilder:TexCoord4f(stage, s, t, u, w) end


---@param idx integer
---@param weight number
---@return CMeshBuilder
function CMeshBuilder:BoneWeight(idx, weight) end

---@param idx integer
---@param matrixIndex integer
---@return CMeshBuilder
function CMeshBuilder:BoneMatrix(idx, matrixIndex) end


---@param x number
---@param y number
---@param z number
---@param w number
---@return CMeshBuilder
function CMeshBuilder:UserData(x, y, z, w) end


---@param index integer  Must fit in unsigned short (0..65535)
---@return CMeshBuilder
function CMeshBuilder:Index(index) end

return CMeshBuilder