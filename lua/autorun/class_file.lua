--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

file = {}

FILESYSTEM_INVALID_HANDLE = nil

-- write a string to a file (overwrite)
function file.Write(name, content)
  local f = filesystem.Open(name, "w", "MOD")
  if not f then
    return false
  end
  local success = filesystem.Write(content, f) == #content
  filesystem.Close(f)
  return success
end

-- append a string to a file
function file.Append(name, content)
  local f = filesystem.Open(name, "a", "MOD")
  if not f then
    return false
  end
  local success = filesystem.Write(content, f) == #content
  filesystem.Close(f)
  return success
end

-- read a file
function file.Read(name)
  local f = filesystem.Open(name, "r", "MOD")
  if not f or f == FILESYSTEM_INVALID_HANDLE then
    return nil
  end
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
  local f = filesystem.Open(name, "r", gamePath or "MOD")
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
  return filesystem.FileExists(name, gamePath or "MOD")
end

-- check if a directory
function file.IsDir(name, gamePath)
  return filesystem.IsDirectory(name, gamePath or "MOD")
end

-- create a directory
function file.CreateDir(name)
  filesystem.CreateDirHierarchy(name, "MOD")
end

-- delete a file
function file.Delete(name)
  return filesystem.RemoveFile(name, "MOD")
end

-- rename a file
function file.Rename(oldName, newName)
  return filesystem.RenameFile(oldName, newName, "MOD")
end

-- get file size
function file.Size(name)
  local f = filesystem.Open(name, "r", "MOD")
  if not f or f == FILESYSTEM_INVALID_HANDLE then
    return 0
  end
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
  return filesystem.Find(pattern, path or "MOD")
end
