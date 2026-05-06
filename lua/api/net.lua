---@class netlib
net = {}

--- Begin a new outgoing network message. The name must have been registered
--- with `util.AddNetworkString` on the server
---@param name string
function net.Start(name) end

--- Server only. Sends the current message reliably to one player or a list
---@param target CBasePlayer|CBasePlayer[]
function net.Send(target) end

--- Server only. Sends the current message reliably to every connected client
function net.Broadcast() end

--- Client only. Sends the current message to the server
function net.SendToServer() end


---@param value integer
---@param bits  integer  2..32
function net.WriteInt(value, bits) end

---@param value integer  Unsigned (0..2^bits - 1).
---@param bits  integer  1..32
function net.WriteUInt(value, bits) end

---@param value number
function net.WriteFloat(value) end

---@param value number
function net.WriteDouble(value) end

---@param value boolean
function net.WriteBool(value) end

---@param value string  NUL-terminated.
function net.WriteString(value) end

---@param data    string
---@param length? integer  Defaults to `#data`.
function net.WriteData(data, length) end

---@param v Vector
function net.WriteVector(v) end

---@param a QAngle
function net.WriteAngle(a) end

--- Writes an entity index (or 0 if nil/invalid)
---@param ent CBaseEntity?
function net.WriteEntity(ent) end


---@param bits integer  2..32
---@return integer
function net.ReadInt(bits) end

---@param bits integer  1..32
---@return integer
function net.ReadUInt(bits) end

---@return number
function net.ReadFloat() end

---@return number
function net.ReadDouble() end

---@return boolean
function net.ReadBool() end

---@return string
function net.ReadString() end

---@param length integer
---@return string
function net.ReadData(length) end

---@return Vector
function net.ReadVector() end

---@return QAngle
function net.ReadAngle() end

---@return CBaseEntity?
function net.ReadEntity() end


---@return integer
function net.BytesWritten() end

---@return integer
function net.BitsWritten() end


---@param name string
---@param fn   fun(bits: integer, sender: CBasePlayer?)
function net.Receive(name, fn) end

return net