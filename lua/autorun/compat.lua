-- compat.lua
-- a partial GMod compatibility layer,
-- alongside some useful stuff for coding

bit = require("bit")

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

CONTENTS_EMPTY            = 0
CONTENTS_SOLID            = 0x1
CONTENTS_WINDOW           = 0x2
CONTENTS_AUX              = 0x4
CONTENTS_GRATE            = 0x8
CONTENTS_SLIME            = 0x10
CONTENTS_WATER            = 0x20
CONTENTS_BLOCKLOS         = 0x40
CONTENTS_OPAQUE           = 0x80
LAST_VISIBLE_CONTENTS     = 0x80

ALL_VISIBLE_CONTENTS = bit.bor(LAST_VISIBLE_CONTENTS, LAST_VISIBLE_CONTENTS - 1)

CONTENTS_TESTFOGVOLUME    = 0x100
CONTENTS_UNUSED            = 0x200
CONTENTS_UNUSED6           = 0x400
CONTENTS_TEAM1             = 0x800
CONTENTS_TEAM2             = 0x1000
CONTENTS_IGNORE_NODRAW_OPAQUE = 0x2000
CONTENTS_MOVEABLE          = 0x4000
CONTENTS_AREAPORTAL        = 0x8000
CONTENTS_PLAYERCLIP        = 0x10000
CONTENTS_MONSTERCLIP       = 0x20000
CONTENTS_CURRENT_0         = 0x40000
CONTENTS_CURRENT_90        = 0x80000
CONTENTS_CURRENT_180       = 0x100000
CONTENTS_CURRENT_270       = 0x200000
CONTENTS_CURRENT_UP        = 0x400000
CONTENTS_CURRENT_DOWN      = 0x800000
CONTENTS_ORIGIN            = 0x1000000
CONTENTS_MONSTER           = 0x2000000
CONTENTS_DEBRIS            = 0x4000000
CONTENTS_DETAIL            = 0x8000000
CONTENTS_TRANSLUCENT       = 0x10000000
CONTENTS_LADDER            = 0x20000000
CONTENTS_HITBOX            = 0x40000000

COLLISION_GROUP_NONE                = 0
COLLISION_GROUP_DEBRIS              = 1
COLLISION_GROUP_DEBRIS_TRIGGER      = 2
COLLISION_GROUP_INTERACTIVE_DEBRIS  = 3
COLLISION_GROUP_INTERACTIVE         = 4
COLLISION_GROUP_PLAYER              = 5
COLLISION_GROUP_BREAKABLE_GLASS     = 6
COLLISION_GROUP_VEHICLE             = 7
COLLISION_GROUP_PLAYER_MOVEMENT     = 8
COLLISION_GROUP_NPC                 = 9
COLLISION_GROUP_IN_VEHICLE          = 10
COLLISION_GROUP_WEAPON              = 11
COLLISION_GROUP_VEHICLE_CLIP        = 12
COLLISION_GROUP_PROJECTILE          = 13
COLLISION_GROUP_DOOR_BLOCKER        = 14
COLLISION_GROUP_PASSABLE_DOOR       = 15
COLLISION_GROUP_DISSOLVING          = 16
COLLISION_GROUP_PUSHAWAY            = 17
COLLISION_GROUP_NPC_ACTOR           = 18
COLLISION_GROUP_NPC_SCRIPTED        = 19

LAST_SHARED_COLLISION_GROUP          = 20

DMG_GENERIC            = 0
DMG_CRUSH              = bit.lshift(1, 0)   -- 1 << 0
DMG_BULLET             = bit.lshift(1, 1)   -- 1 << 1
DMG_SLASH              = bit.lshift(1, 2)   -- 1 << 2
DMG_BURN               = bit.lshift(1, 3)   -- 1 << 3
DMG_VEHICLE            = bit.lshift(1, 4)   -- 1 << 4
DMG_FALL               = bit.lshift(1, 5)   -- 1 << 5
DMG_BLAST              = bit.lshift(1, 6)   -- 1 << 6
DMG_CLUB               = bit.lshift(1, 7)   -- 1 << 7
DMG_SHOCK              = bit.lshift(1, 8)   -- 1 << 8
DMG_SONIC              = bit.lshift(1, 9)   -- 1 << 9
DMG_ENERGYBEAM         = bit.lshift(1, 10)  -- 1 << 10
DMG_PREVENT_PHYSICS_FORCE = bit.lshift(1, 11)
DMG_NEVERGIB           = bit.lshift(1, 12)
DMG_ALWAYSGIB          = bit.lshift(1, 13)
DMG_DROWN              = bit.lshift(1, 14)
DMG_PARALYZE           = bit.lshift(1, 15)
DMG_NERVEGAS           = bit.lshift(1, 16)
DMG_POISON             = bit.lshift(1, 17)
DMG_RADIATION          = bit.lshift(1, 18)
DMG_DROWNRECOVER       = bit.lshift(1, 19)
DMG_ACID               = bit.lshift(1, 20)
DMG_SLOWBURN           = bit.lshift(1, 21)
DMG_REMOVENORAGDOLL    = bit.lshift(1, 22)
DMG_PHYSGUN            = bit.lshift(1, 23)
DMG_PLASMA             = bit.lshift(1, 24)
DMG_AIRBOAT            = bit.lshift(1, 25)
DMG_DISSOLVE           = bit.lshift(1, 26)
DMG_BLAST_SURFACE      = bit.lshift(1, 27)
DMG_DIRECT             = bit.lshift(1, 28)
DMG_BUCKSHOT           = bit.lshift(1, 29)

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
