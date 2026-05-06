---@class matrix3x4_t
matrix3x4_t = {}

---@class VMatrix
---@operator add(VMatrix): VMatrix
---@operator sub(VMatrix): VMatrix
---@operator mul(VMatrix): VMatrix
---@operator unm: VMatrix
VMatrix = {}

--- Overloads:
---   * `VMatrix()`
---   * `VMatrix(matrix3x4_t)`
---   * `VMatrix(forward: Vector, left: Vector, up: Vector)`
---   * `VMatrix(m00, m01, m02, m03, m10, ..., m33)`
---@param a? matrix3x4_t|Vector|number
---@param b? Vector|number
---@param c? Vector|number
---@param ... number
---@return VMatrix
function VMatrix(a, b, c, ...) end


--- Rotates `v` by the matrix's rotation portion (no translation)
---@param v Vector
---@return Vector
function VMatrix:ApplyRotation(v) end

--- Returns this matrix as a 3x4 (drops the bottom row)
---@return matrix3x4_t
function VMatrix:As3x4() end

--- Returns the first matrix element. (Roughly `&m[0][0]` semantics)
---@return number
function VMatrix:Base() end

--- Copies the rotation+translation portion from a 3x4 matrix
---@param m matrix3x4_t
function VMatrix:CopyFrom3x4(m) end

--- Writes the three basis vectors into the supplied vectors (mutated in-place)
---@param forward Vector
---@param left    Vector
---@param up      Vector
function VMatrix:GetBasisVectors(forward, left, up) end

---@return Vector
function VMatrix:GetForward() end

---@return Vector
function VMatrix:GetLeft() end

--- Returns per-axis scale extracted from the matrix
---@return Vector
function VMatrix:GetScale() end

---@return Vector
function VMatrix:GetTranslation() end

---@return Vector
function VMatrix:GetUp() end

--- Sets this matrix to the identity (in-place)
function VMatrix:Identity() end

--- Overloads:
---   * `Init(matrix3x4_t)`
---   * `Init(m00, m01, ..., m33)` — 16 row-major components
---@param a matrix3x4_t|number
---@param ... number
function VMatrix:Init(a, ...) end

--- Computes a general inverse and writes it into `out`.
---@param out VMatrix Receives the inverse
---@return boolean success
function VMatrix:InverseGeneral(out) end

--- Cheap inverse for translation+rotation matrices (assumes orthonormal basis)
---@return VMatrix
function VMatrix:InverseTR() end

---@return boolean
function VMatrix:IsIdentity() end

---@return boolean
function VMatrix:IsRotationMatrix() end

--- Computes `self = a * b` (in-place on the receiver)
---@param a VMatrix
---@param b VMatrix
function VMatrix:MatrixMul(a, b) end

--- Returns a copy with all basis vectors normalized
---@return VMatrix
function VMatrix:NormalizeBasisVectors() end

--- Adds `v` to the translation column (post-translate)
---@param v Vector
function VMatrix:PostTranslate(v) end

--- Pre-multiplies a translation by `v`
---@param v Vector
function VMatrix:PreTranslate(v) end

--- Returns this matrix scaled by component-wise `scale`
---@param scale Vector
---@return VMatrix
function VMatrix:Scale(scale) end

--- Replaces the rotation+translation portion with that of a 3x4
---@param m matrix3x4_t
function VMatrix:Set3x4(m) end

---@param forward Vector
---@param left    Vector
---@param up      Vector
function VMatrix:SetBasisVectors(forward, left, up) end

---@param forward Vector
function VMatrix:SetForward(forward) end

---@param left Vector
function VMatrix:SetLeft(left) end

---@param translation Vector
function VMatrix:SetTranslation(translation) end

---@param up Vector
function VMatrix:SetUp(up) end

--- Builds a transform matrix from origin + Euler angles (in-place)
---@param origin Vector
---@param angles QAngle
function VMatrix:SetupMatrixOrgAngles(origin, angles) end

--- Returns the full 4x4 transpose.
---@return VMatrix
function VMatrix:Transpose() end

--- Returns a copy with only the upper-left 3x3 transposed
---@return VMatrix
function VMatrix:Transpose3x3() end

--- Computes `out = self * in` for a 3-component vector (writes into `out`)
---@param vIn  Vector
---@param vOut Vector
function VMatrix:V3Mul(vIn, vOut) end

--- Multiplies the upper-left 3x3 by `v`
---@param v Vector
---@return Vector
function VMatrix:VMul3x3(v) end

--- Multiplies the transposed upper-left 3x3 by `v`
---@param v Vector
---@return Vector
function VMatrix:VMul3x3Transpose(v) end

--- Treats the matrix as 4x3 and multiplies by `v`
---@param v Vector
---@return Vector
function VMatrix:VMul4x3(v) end

--- Treats the transposed matrix as 4x3 and multiplies by `v`
---@param v Vector
---@return Vector
function VMatrix:VMul4x3Transpose(v) end



---@class vmatrixlib
vmatrix = vmatrix or {}


---@return VMatrix
function vmatrix.SetupMatrixIdentity() end

---@param scale Vector
---@return VMatrix
function vmatrix.SetupMatrixScale(scale) end

---@param translation Vector
---@return VMatrix
function vmatrix.SetupMatrixTranslation(translation) end

---@param axis  Vector
---@param angle number  Degrees.
---@return VMatrix
function vmatrix.SetupMatrixAxisRot(axis, angle) end

---@param angles QAngle
---@return VMatrix
function vmatrix.SetupMatrixAngles(angles) end

---@param origin Vector
---@param angles QAngle
---@return VMatrix
function vmatrix.SetupMatrixOrgAngles(origin, angles) end


---@param m VMatrix
---@return string
function vmatrix.VMatToString(m) end


---@param m VMatrix
function vmatrix.MatrixSetIdentity(m) end

--- Computes `dst = transpose(src)`
---@param src VMatrix
---@param dst VMatrix
function vmatrix.MatrixTranspose(src, dst) end

--- Copies `src` into `dst`
---@param src VMatrix
---@param dst VMatrix
function vmatrix.MatrixCopy(src, dst) end

--- Computes `dst = a * b`
---@param a   VMatrix
---@param b   VMatrix
---@param dst VMatrix
function vmatrix.MatrixMultiply(a, b, dst) end

--- Reads column `i` into `out` (mutated in-place)
---@param m   VMatrix
---@param i   integer 0-3
---@param out Vector
function vmatrix.MatrixGetColumn(m, i, out) end

---@param m VMatrix
---@param i integer 0-3
---@param v Vector
function vmatrix.MatrixSetColumn(m, i, v) end

---@param m   VMatrix
---@param i   integer 0-3
---@param out Vector
function vmatrix.MatrixGetRow(m, i, out) end

---@param m VMatrix
---@param i integer 0-3
---@param v Vector
function vmatrix.MatrixSetRow(m, i, v) end


---@param m   VMatrix
---@param vIn Vector
---@param out Vector
function vmatrix.Vector3DMultiply(m, vIn, out) end

---@param m   VMatrix
---@param vIn Vector
---@param out Vector
function vmatrix.Vector3DMultiplyPositionProjective(m, vIn, out) end

---@param m   VMatrix
---@param vIn Vector
---@param out Vector
function vmatrix.Vector3DMultiplyProjective(m, vIn, out) end

---@param m   VMatrix
---@param vIn Vector
---@param out Vector
function vmatrix.Vector3DMultiplyTranspose(m, vIn, out) end


--- Two overloads:
---   * `MatrixBuildTranslation(m, x, y, z)`
---   * `MatrixBuildTranslation(m, Vector)`
---@param m   VMatrix
---@param xOrVec number|Vector
---@param y? number
---@param z? number
function vmatrix.MatrixBuildTranslation(m, xOrVec, y, z) end

---@param m VMatrix
---@param v Vector
function vmatrix.MatrixTranslate(m, v) end

---@param m     VMatrix
---@param axis  Vector
---@param angle number  Degrees.
function vmatrix.MatrixBuildRotationAboutAxis(m, axis, angle) end

---@param m     VMatrix
---@param angle number  Degrees.
function vmatrix.MatrixBuildRotateZ(m, angle) end

---@param m     VMatrix
---@param axis  Vector
---@param angle number  Degrees.
function vmatrix.MatrixRotate(m, axis, angle) end

--- Builds a rotation that maps `from` onto `to`.
---@param m    VMatrix
---@param from Vector
---@param to   Vector
function vmatrix.MatrixBuildRotation(m, from, to) end

--- Two overloads:
---   * `MatrixBuildScale(m, x, y, z)`
---   * `MatrixBuildScale(m, Vector)`
---@param m      VMatrix
---@param xOrVec number|Vector
---@param y?     number
---@param z?     number
function vmatrix.MatrixBuildScale(m, xOrVec, y, z) end

--- Builds a perspective-projection matrix.
---@param m       VMatrix
---@param fov     number  Vertical FOV in degrees.
---@param aspect  number  Width / height.
---@param zNear   number
---@param zFar    number
function vmatrix.MatrixBuildPerspective(m, fov, aspect, zNear, zFar) end


--- Computes an axis-aligned bounding box in world space from a projection matrix.
--- `mins` and `maxs` are mutated in place
---@param projection VMatrix
---@param mins       Vector
---@param maxs       Vector
function vmatrix.CalculateAABBFromProjectionMatrix(projection, mins, maxs) end

--- Computes a bounding sphere (center + returned radius) from a projection matrix
---@param projection VMatrix
---@param center     Vector  Mutated in-place.
---@return number radius
function vmatrix.CalculateSphereFromProjectionMatrix(projection, center) end


--- `out = matrix from angles`.
---@param angles QAngle
---@param out    VMatrix
function vmatrix.MatrixFromAngles(angles, out) end

--- Extracts Euler angles from a rotation matrix
---@param m   VMatrix
---@param out QAngle  Mutated in-place.
function vmatrix.MatrixToAngles(m, out) end


---@param src VMatrix
---@param dst VMatrix
function vmatrix.MatrixInverseTR(src, dst) end

---@param src VMatrix
---@param dst VMatrix
function vmatrix.MatrixInverseGeneral(src, dst) end

---@param src VMatrix
---@param dst VMatrix
function vmatrix.MatrixInverseTranspose(src, dst) end


return VMatrix, vmatrix