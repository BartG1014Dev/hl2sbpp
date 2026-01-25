---@class filesystem
---Library for managing files, search paths, and resources.
filesystem = {}

--[[
    Adds a .pak or zip pack file to the search paths.
    @param filename string Path to the pack file
    @param pathID string Path identifier (optional)
    @return boolean success
]]
function filesystem.AddPackFile(filename, pathID) end

--[[
    Adds a directory to the search path.
    @param path string Directory path
    @param pathID string Path identifier
    @param addToTail? integer Optional; defaults to PATH_ADD_TO_TAIL
]]
function filesystem.AddSearchPath(path, pathID, addToTail) end

---Begins access to map files.
function filesystem.BeginMapAccess() end

function filesystem.Find(str, str) end

---Ends access to map files.
function filesystem.EndMapAccess() end

---Cancels waiting for resources.
---@param timeout integer Timeout in milliseconds
function filesystem.CancelWaitForResources(timeout) end

---Closes an open file handle.
---@param file FileHandle The file to close
function filesystem.Close(file) end

---Creates a directory hierarchy.
---@param path string Base path
---@param pathID? string Optional path identifier
function filesystem.CreateDirHierarchy(path, pathID) end

---Discards preloaded data.
function filesystem.DiscardPreloadData() end

---Disconnects from the filesystem.
function filesystem.Disconnect() end

---Enables or disables whitelist file tracking.
---@param enable boolean
---@param report boolean
---@param strict boolean
function filesystem.EnableWhitelistFileTracking(enable, report, strict) end

---Checks if a file exists.
---@param filename string File path
---@param pathID? string Optional path identifier
---@return boolean
function filesystem.FileExists(filename, pathID) end

---Flushes file buffers for a file handle.
---@param file FileHandle
function filesystem.Flush(file) end

---Gets the DVD mode of the filesystem.
---@return integer
function filesystem.GetDVDMode() end

---Retrieves a local copy of a file.
---@param filename string File path
function filesystem.GetLocalCopy(filename) end

---Gets whitelist debug flags.
---@return integer
function filesystem.GetWhitelistSpewFlags() end

---Hints that a resource is needed.
---@param resource string Resource path
---@param flags integer Flags controlling the resource hint
---@return integer result
function filesystem.HintResourceNeed(resource, flags) end

---Checks if a path is a directory.
---@param path string
---@param pathID? string Optional path identifier
---@return boolean
function filesystem.IsDirectory(path, pathID) end

---Checks if a file is immediately available.
---@param filename string
---@return boolean
function filesystem.IsFileImmediatelyAvailable(filename) end

---Checks if a file is writable.
---@param filename string
---@param pathID? string Optional
---@return boolean
function filesystem.IsFileWritable(filename, pathID) end

---Checks if a file handle is valid.
---@param file FileHandle
---@return boolean
function filesystem.IsOk(file) end

---Checks if the filesystem is using Steam content.
---@return boolean
function filesystem.IsSteam() end

---Loads precompiled KeyValues data.
---@param preloadType integer Preload type
---@param filename string Path to KeyValues file
function filesystem.LoadCompiledKeyValues(preloadType, filename) end

---Marks all CRCs as unverified.
function filesystem.MarkAllCRCsUnverified() end

---Marks a pathID as request-only.
---@param pathID string
---@param requestOnly boolean
function filesystem.MarkPathIDByRequestOnly(pathID, requestOnly) end

---Mounts Steam content.
---@param appID? integer Optional Steam app ID
---@return integer mountResult
function filesystem.MountSteamContent(appID) end

---Opens a file for reading/writing.
---@param filename string
---@param mode string File mode
---@param pathID? string Optional
---@return FileHandle
function filesystem.Open(filename, mode, pathID) end

---Precaches a file.
---@param filename string
---@param pathID? string Optional
---@return boolean
function filesystem.Precache(filename, pathID) end

---Prints a list of opened files to the console.
function filesystem.PrintOpenedFiles() end

---Prints the search paths to the console.
function filesystem.PrintSearchPaths() end

---Reads bytes from a file.
---@param size integer Number of bytes to read
---@param file FileHandle File to read from
---@return integer bytesRead
---@return string data
function filesystem.Read(size, file) end

---Removes all search paths.
function filesystem.RemoveAllSearchPaths() end

---Removes a specific file.
---@param filename string
---@param pathID? string Optional
function filesystem.RemoveFile(filename, pathID) end

---Removes a search path.
---@param path string
---@param pathID? string Optional
---@return boolean
function filesystem.RemoveSearchPath(path, pathID) end

---Removes all search paths matching a pathID.
---@param pathID string
function filesystem.RemoveSearchPaths(pathID) end

---Renames a file.
---@param oldName string
---@param newName string
---@param pathID? string Optional
---@return boolean
function filesystem.RenameFile(oldName, newName, pathID) end

---Sets a file as writable or read-only.
---@param filename string
---@param writable boolean
---@param pathID? string Optional
---@return boolean
function filesystem.SetFileWritable(filename, writable, pathID) end

---Prepares preload data for the filesystem.
function filesystem.SetupPreloadData() end

---Sets the warning level for filesystem operations.
---@param level integer Warning level
function filesystem.SetWarningLevel(level) end

---Sets whitelist debug flags.
---@param flags integer
function filesystem.SetWhitelistSpewFlags(flags) end

---Shuts down the filesystem.
function filesystem.Shutdown() end

---Gets the size of a file or handle.
---@param fileOrPath FileHandle|string File handle or file path
---@param pathID? string Optional
---@return integer
function filesystem.Size(fileOrPath, pathID) end

---Unzips a file to a directory.
---@param zipFile string Path to the zip file
---@param destDir string Destination directory
---@param pathID string Path identifier
---@return boolean
function filesystem.UnzipFile(zipFile, destDir, pathID) end

---Waits for required resources to be available.
---@param pathID string Path identifier
---@return integer
function filesystem.WaitForResources(pathID) end

---Writes a string to a file.
---@param data string Data to write
---@param file FileHandle File handle
---@return integer bytesWritten
function filesystem.Write(data, file) end
return filesystem
