-- _00_utils.lua

if CLIENT == nil then
  if _CLIENT then
    CLIENT = true
    SERVER = false
  end
end

if SERVER == nil then
  if _GAME then
    SERVER = true
    CLIENT = false
  end
end

Warning = dbg.Warning
DevMsg = dbg.DevMsg
DevWarning = dbg.DevWarning
Msg = dbg.Msg

function AddCSLuaFile(file)
  -- TODO: add stuff
  if file == "" then
  else
  end
end

function DEFINE_BASECLASS(name)
  if ENT then
    ENT.__base = name
  elseif SWEP then
    SWEP.__base = name
  else
    Warning("Not a SWEP nor a Entity!")
  end
end

function DEFINE_FACTORY(name)
  if ENT then
    ENT.__factory = name
  elseif SWEP then
    SWEP.__factory = name
  else
    Warning("Not a SWEp nor a Entity!")
  end
end

function IsValid(object)
  if object == nil then
    return false
  end
  if object == NULL then
    return false
  end

  return true
end

function CurTime()
  return gpGlobals.curtime()
end

function LocalPlayer()
  if SERVER then
    return UTIL.GetLocalPlayer()
  else
    return _R.CBasePlayer.GetLocalPlayer()
  end
end

function CreateClientConVar(strName, strDefault, bSave, bUserData)
  local flags = FCVAR.CLIENTDLL

  if bSave then
    flags = bit.bor(flags, FCVAR.ARCHIVE)
  end

  if bUserData then
    flags = bit.bor(flags, FCVAR.USERINFO)
  end

  local convar = ConVar(strName, strDefault, flags)
  return convar
end

function GetConVar(name)
  return cvar.FindVar(name)
end

function PrecacheParticleSystem(name) end
