---@meta

---@class IMaterialVar
local IMaterialVar = {}

---@return string
function IMaterialVar:GetName() end

--- One of the `MATERIAL_VAR_TYPE_*` consts
---@return integer
function IMaterialVar:GetType() end

---@return boolean
function IMaterialVar:IsDefined() end

---@return IMaterialVar self
function IMaterialVar:SetUndefined() end

---@return number
function IMaterialVar:GetFloatValue() end
---@param value number
---@return IMaterialVar self
function IMaterialVar:SetFloatValue(value) end

---@return integer
function IMaterialVar:GetIntValue() end
---@param value integer
---@return IMaterialVar self
function IMaterialVar:SetIntValue(value) end

---@return string
function IMaterialVar:GetStringValue() end
---@param value string
---@return IMaterialVar self
function IMaterialVar:SetStringValue(value) end

--- Returns `VectorSize()` numbers
---@return number x
---@return number? y
---@return number? z
---@return number? w
function IMaterialVar:GetVecValue() end

--- Two overloads:
---   * `SetVecValue(x, y[, z[, w]])`
---   * `SetVecValue(Vector)`
---@param xOrVec number|Vector
---@param y? number
---@param z? number
---@param w? number
---@return IMaterialVar self
function IMaterialVar:SetVecValue(xOrVec, y, z, w) end

---@return integer
function IMaterialVar:VectorSize() end

---@return ITexture?
function IMaterialVar:GetTextureValue() end
---@param tex ITexture?
---@return IMaterialVar self
function IMaterialVar:SetTextureValue(tex) end

---@return IMaterial?
function IMaterialVar:GetMaterialValue() end
---@param mat IMaterial?
---@return IMaterialVar self
function IMaterialVar:SetMaterialValue(mat) end

---@return VMatrix
function IMaterialVar:GetMatrixValue() end
---@param m VMatrix
---@return IMaterialVar self
function IMaterialVar:SetMatrixValue(m) end

---@return boolean
function IMaterialVar:IsTextureMatrix() end

return IMaterialVar