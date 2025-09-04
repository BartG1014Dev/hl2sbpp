-- compat.lua
-- a partial GMod compatibility layer,
-- alongside some useful stuff for coding

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

if not FILESYSTEM_INVALID_HANDLE then
	FILESYSTEM_INVALID_HANDLE = nil
end

function AddCSLuaFile( file )
	-- TODO: add stuff
	if file == "" then
	else
	end
end

function DEFINE_BASECLASS( name )
	if ENT then
		ENT.__base = name
	elseif SWEP then
		SWEP.__base = name
	else
		Warning("Not a SWEP nor a Entity!")
	end
end

function DEFINE_FACTORY( name )
	if ENT then
		ENT.__factory = name
	elseif SWEP then
		SWEP.__factory = name
	else
		Warning("Not a SWEp nor a Entity!")
	end
end



file = {}

-- write a string to a file (overwrite)
function file.Write(name, content)
    local f = filesystem.Open(name, "w", "DATA")
    if not f then return false end
    local success = filesystem.Write(content, f) == #content
    filesystem.Close(f)
    return success
end

-- append a string to a file
function file.Append(name, content)
    local f = filesystem.Open(name, "a", "DATA")
    if not f then return false end
    local success = filesystem.Write(content, f) == #content
    filesystem.Close(f)
    return success
end

-- read a file
function file.Read(name)
    local f = filesystem.Open(name, "r", "DATA")
    if not f or f == FILESYSTEM_INVALID_HANDLE then return nil end
    local size = filesystem.Size(f)
    if size <= 0 then
        filesystem.Close(f)
        return nil
    end
    local _, content = filesystem.Read(size, f)
    filesystem.Close(f)
    return content
end

-- async read (calls callback with content)
function file.AsyncRead(name, gamePath, callback, sync)
    local f = filesystem.Open(name, "r", gamePath or "DATA")
    if not f then
        callback(nil)
        return
    end
    local size = filesystem.Size(f)
    
    local function readFunc()
        local _, content = filesystem.Read(size, f)
        filesystem.Close(f)
        callback(content)
    end

    if sync then
        readFunc()
    else
        -- TODO: run async
        readFunc()
    end
end

-- check if a file exists
function file.Exists(name, gamePath)
    return filesystem.FileExists(name, gamePath or "DATA")
end

-- check if a directory
function file.IsDir(name, gamePath)
    return filesystem.IsDirectory(name, gamePath or "DATA")
end

-- create a directory
function file.CreateDir(name)
    filesystem.CreateDirHierarchy(name, "DATA")
end

-- delete a file
function file.Delete(name)
    return filesystem.RemoveFile(name, "DATA")
end

-- rename a file
function file.Rename(oldName, newName)
    return filesystem.RenameFile(oldName, newName, "DATA")
end

-- get file size
function file.Size(name)
    local f = filesystem.Open(name, "r", "DATA")
    if not f or f == FILESYSTEM_INVALID_HANDLE then return 0 end
    local size = filesystem.Size(f)
    filesystem.Close(f)
    return size
end

-- get file modification time
function file.Time(name)
	-- TODO: fix
    return 0
end

-- find files/folders in a directory
function file.Find(pattern, path, sorting)
	-- TODO: fix
    return nil, nil
end
