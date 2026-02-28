--- Copyright © 2026, YourLocalCappy, all rights deserved ---

if not CLIENT then
  return
end

if not table.Copy and table.copy then
  table.Copy = table.copy
end

-- just use "package.seeall" if you need!!!
module("spaint", package.seeall)

local surface = surface
local bit = bit
local table = table
local string = string
local type = type
local setmetatable = setmetatable
local ipairs = ipairs
local Color = Color

-- these are for the rounded box
local tCorners = {
  { "vgui/hud/800corner1", surface.CreateNewTextureID() },
  { "vgui/hud/800corner2", surface.CreateNewTextureID() },
  { "vgui/hud/800corner3", surface.CreateNewTextureID() },
  { "vgui/hud/800corner4", surface.CreateNewTextureID() },
}

local tFontHandle = {}

local tFontFlags = {
  ITALIC = 0x001,
  UNDERLINE = 0x002,
  STRIKEOUT = 0x004,
  SYMBOL = 0x008,
  ANTIALIAS = 0x010,
  GAUSSIANBLUR = 0x020,
  ROTARY = 0x040,
  SHADOW = 0x080,
  ADDITIVE = 0x100,
  OUTLINE = 0x200,
  CUSTOM = 0x400,
  BITMAP = 0x800,
}

local pFont = {}
pFont.__index = pFont

function pFont:new(name, hfont)
  return setmetatable({
    Name = name,
    Instance = hfont,
    data = {},
    flags = 0,
  }, self)
end

function pFont:setupData(data)
  self.data.font = data.font or "Tahoma"
  self.data.size = data.size or 13
  self.data.weight = data.weight or 500
  self.data.blursize = data.blursize or 0
  self.data.scanlines = data.scanlines or 0
end

function pFont:setupFlags(data)
  local flags = 0

  if data.antialias then
    flags = bit.bor(flags, tFontFlags.ANTIALIAS)
  end
  if data.underline then
    flags = bit.bor(flags, tFontFlags.UNDERLINE)
  end
  if data.italic then
    flags = bit.bor(flags, tFontFlags.ITALIC)
  end
  if data.strikeout then
    flags = bit.bor(flags, tFontFlags.STRIKEOUT)
  end
  if data.shadow then
    flags = bit.bor(flags, tFontFlags.SHADOW)
  end
  if data.outline then
    flags = bit.bor(flags, tFontFlags.OUTLINE)
  end

  self.flags = flags
end

function pFont:register()
  surface.SetFontGlyphSet(
    self.Instance,
    self.data.font,
    self.data.size,
    self.data.weight,
    self.data.blursize,
    self.data.scanlines,
    self.flags
  )
end

local function unpackColor(col)
  return col:r(), col:g(), col:b(), col:a()
end

local function register_font(name, data)
  local hFont = surface.CreateFont()
  local fontObj = pFont:new(name, hFont)

  fontObj:setupData(data)
  fontObj:setupFlags(data)
  fontObj:register()

  tFontHandle[string.lower(name)] = fontObj
end

local function getFont(name)
  return tFontHandle[string.lower(name)]
end

-- you can make a custom font with this
function CreateFont(name, data)
  if type(name) ~= "string" then
    error("spaint.CreateFont: expected string (1)", 2)
  end

  if type(data) ~= "table" then
    error("spaint.CreateFont: expected table (2)", 2)
  end

  register_font(name, data)
end

function GetFont(name)
  local font = getFont(name)
  if not font then
    font = getFont("default")
  end

  return font and font.Instance
end

function Box(data, outline)
  local x = data.pos[1] or 0
  local y = data.pos[2] or 0
  local w = data.width or 100
  local h = data.height or 100
  local col = data.color or Color(255, 255, 255)
  local outlineCol = data.outline_color or Color(0, 0, 0)

  surface.DrawSetColor(unpackColor(col))
  surface.DrawFilledRect(x, y, x + w, y + h)

  if outline then
    surface.DrawSetColor(unpackColor(outlineCol))
    surface.DrawOutlinedRect(x, y, x + w, y + h)
  end
end

function RoundedBox(data)
  local x = data.pos[1] or 0
  local y = data.pos[2] or 0
  local w = data.width or 100
  local h = data.height or 100
  local r = data.radius or 16
  local col = data.color or Color(255, 255, 255)

  surface.DrawSetColor(unpackColor(col))

  surface.DrawFilledRect(x + r, y, x + w - r, y + r)
  surface.DrawFilledRect(x, y + r, x + w, y + h - r)
  surface.DrawFilledRect(x + r, y + h - r, x + w - r, y + h)

  for i = 1, 4 do
    local corner = tCorners[i]
    surface.DrawSetTextureFile(corner[2], corner[1], 0, true)

    if i == 1 then
      surface.DrawTexturedRect(x, y, x + r, y + r)
    elseif i == 2 then
      surface.DrawTexturedRect(x + w - r, y, x + w, y + r)
    elseif i == 3 then
      surface.DrawTexturedRect(x + w - r, y + h - r, x + w, y + h)
    elseif i == 4 then
      surface.DrawTexturedRect(x, y + h - r, x + r, y + h)
    end
  end
end

-- normal text
function Text(data)
  local text = data.text or "Label"
  local x = data.pos[1] or 0
  local y = data.pos[2] or 0
  local col = data.color or Color(255, 255, 255)

  local font = GetFont(data.font or "Default")
  if not font then
    return
  end

  surface.DrawSetTextColor(unpackColor(col))
  surface.DrawSetTextFont(font)
  surface.DrawSetTextPos(x, y)
  surface.DrawPrintText(text)
end

-- text with shadow
function TextS(data, dist)
  dist = dist or 1
  local col = data.color or Color(255, 255, 255)

  local sData = table.Copy(data)
  sData.color = Color(0, 0, 0, col:a())
  sData.pos = { data.pos[1] + dist, data.pos[2] + dist }

  Text(sData)
  Text(data)
end

local tTextureCache = {}

local function getTexture(path)
  path = string.lower(path)

  if not tTextureCache[path] then
    local texID = surface.CreateNewTextureID()
    surface.DrawSetTextureFile(texID, path, 0, true)

    tTextureCache[path] = texID
  end

  return tTextureCache[path]
end

-- best one yet, paint texture
function Texture(data)
  if not data.texture then
    return
  end

  local x = data.pos[1] or 0
  local y = data.pos[2] or 0
  local w = data.width or 100
  local h = data.height or 100
  local col = data.color or Color(255, 255, 255)

  local tex = getTexture(data.texture)

  if not surface.IsTextureIDValid(tex) then
    return
  end

  surface.DrawSetColor(col:r(), col:g(), col:b(), col:a())
  surface.DrawSetTexture(tex)
  surface.DrawTexturedRect(x, y, x + w, y + h)
end

-- default fonts
CreateFont("Default", {
  font = "Tahoma",
  size = 13,
  weight = 500,
  antialias = true,
})

CreateFont("DefaultBold", {
  font = "Tahoma",
  size = 13,
  weight = 800,
  antialias = true,
})

CreateFont("DefaultLarge", {
  font = "Roboto",
  size = 32,
  weight = 500,
  antialias = true,
})

CreateFont("DefaultEvenLarger", {
  font = "Roboto",
  size = 78,
  weight = 500,
  antialias = true,
})

CreateFont("DefaultLargeButSmaller", {
  font = "Roboto",
  size = 24,
  weight = 500,
  antialias = true,
})
