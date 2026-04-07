--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

include("includes/extensions/panel.lua")

PANELS = PANELS or {}
vgui = vgui or {}
CONTROLS = CONTROLS or {}

local BaseConstructors = {
  -- 1.0
  ["Panel"] = vgui.Panel,
  ["Button"] = vgui.Button,
  ["CheckButton"] = vgui.CheckButton,
  ["Frame"] = vgui.Frame,
  ["PropertyDialog"] = vgui.PropertyDialog,
  ["PropertyPage"] = vgui.PropertyPage,
  ["Label"] = vgui.Label,

  -- 1.1
  ["Menu"] = vgui.Menu,
  ["MenuButton"] = vgui.MenuButton,
  ["RadioButton"] = vgui.RadioButton,
  ["TextEntry"] = vgui.TextEntry,
  ["ComboBox"] = vgui.ComboBox,
  ["ImagePanel"] = vgui.ImagePanel,
  ["Slider"] = vgui.Slider,
}

function CONTROLS.Add(name, control)
  assert(type(name) == "string", "CONTROLS.Add: name must be a string")
  assert(type(control) == "table", "CONTROLS.Add: control must be a table")
  CONTROLS[name] = control
end

function CONTROLS.Create(name, parent, ...)
  local def = CONTROLS[name]
  if not def then
    error("CONTROLS.Create: unknown control '" .. tostring(name) .. "'")
  end

  local panelName = tostring(name) .. "_" .. tostring(math.random(1000000))
  dbg.DevMsg("Creating panel " .. panelName .. "\n")

  local base
  if BaseConstructors[def.base] then
    -- base's a built-in constructor
    base = BaseConstructors[def.base](parent, panelName, ...)
  elseif CONTROLS[def.base] then
    -- base's a custom control - recursively create it
    base = CONTROLS.Create(def.base, parent, ...)
  else
    -- default to Panel
    base = vgui.Panel(parent, panelName)
  end

  if parent and base.SetParent then
    base:SetParent(parent)
  end

  for k, v in pairs(def) do
    if type(v) == "function" then
      base[k] = v
    else
      base[k] = v
    end
  end

  if base.Init then
    base:Init(parent, ...)
  end

  return base
end

function vgui.Create(name, parent, ...)
  if not parent then
    parent = VGui_GetGameUIPanel()
  end

  if PANELS[name] then
    return PANELS.Create(name, parent, ...)
  elseif CONTROLS[name] then
    return CONTROLS.Create(name, parent, ...)
  end

  local ctor = BaseConstructors[name]
  if ctor then
    -- generate a unique panel name
    local panelName = tostring(name) .. "_" .. tostring(math.random(1000000))
    local pnl = ctor(parent, panelName, ...)
    if parent and pnl and pnl.SetParent then
      pnl:SetParent(parent)
    end
    return pnl
  end

  dbg.Warning("vgui.Create: unknown element '" .. tostring(name) .. "'\n")
end

function PANELS.Add(name, panel)
  assert(type(name) == "string", "PANELS.Add: name must be string")
  assert(type(panel) == "table", "PANELS.Add: panel must be a table")
  PANELS[name] = panel
end

function PANELS.Create(name, parent, ...)
  local def = PANELS[name]
  if not def then
    error("PANELS.Create: unknown panel '" .. tostring(name) .. "'")
  end

  if def.New then
    local pnl = def:New(parent, ...)
    -- ensure parent is set
    if parent and pnl and pnl.SetParent then
      pnl:SetParent(parent)
    end
    return pnl
  end

  local base = vgui.Create("PPanel", parent)
  if not base then
    return
  end

  if parent and base.SetParent then
    base:SetParent(parent)
  end

  for k, v in pairs(def) do
    if type(v) == "function" then
      base[k] = v
    else
      base[k] = v
    end
  end

  if base.Init then
    base:Init(parent, ...)
  end

  return base
end

-- CreateFromTable: creates a panel hierarchy from a table definition
-- example usage:
-- local frame = vgui.CreateFromTable({
--     type = "Frame",
--     x = 100, y = 100, w = 400, h = 300,
--     title = "My Frame",
--     children = {
--         {
--             type = "Button",
--             x = 10, y = 10, w = 100, h = 30,
--             text = "Click Me"
--         }
--     }
-- })
function vgui.CreateFromTable(tbl, parent)
  assert(type(tbl) == "table", "vgui.CreateFromTable: tbl must be a table")
  assert(tbl.type, "vgui.CreateFromTable: tbl must have a 'type' field")

  local panelName = tbl.name or (tostring(tbl.type) .. "_" .. tostring(math.random(1000000)))

  local panel = vgui.Create(tbl.type, parent, panelName)
  if not panel then
    dbg.Warning("vgui.CreateFromTable: failed to create panel of type '" .. tostring(tbl.type) .. "'\n")
    return nil
  end

  if parent and panel.SetParent then
    panel:SetParent(parent)
  end

  for k, v in pairs(tbl) do
    if k ~= "type" and k ~= "children" then
      if k == "x" and panel.SetX then
        panel:SetX(v)
      elseif k == "y" and panel.SetY then
        panel:SetY(v)
      elseif k == "w" or k == "width" then
        if panel.SetWidth then
          panel:SetWidth(v)
        end
        if panel.SetWide then
          panel:SetWide(v)
        end
      elseif k == "h" or k == "height" then
        if panel.SetHeight then
          panel:SetHeight(v)
        end
        if panel.SetTall then
          panel:SetTall(v)
        end
      elseif k == "pos" and type(v) == "table" and panel.SetPos then
        panel:SetPos(v[1] or v.x or 0, v[2] or v.y or 0)
      elseif k == "size" and type(v) == "table" and panel.SetSize then
        panel:SetSize(v[1] or v.w or 0, v[2] or v.h or 0)
      elseif k == "text" and panel.SetText then
        panel:SetText(v)
      elseif k == "title" and panel.SetTitle then
        panel:SetTitle(v)
      elseif k == "visible" and panel.SetVisible then
        panel:SetVisible(v)
      elseif k == "enabled" and panel.SetEnabled then
        panel:SetEnabled(v)
        -- generic setter
      elseif type(v) ~= "function" and type(v) ~= "table" then
        panel[k] = v
      elseif type(v) == "function" then
        panel[k] = v
      end
    end
  end

  if tbl.children and type(tbl.children) == "table" then
    for i, childTbl in ipairs(tbl.children) do
      local child = vgui.CreateFromTable(childTbl, panel)
      if child and tbl.onChildCreated then
        tbl.onChildCreated(panel, child, i)
      end
    end
  end

  --call post-init if provided
  if tbl.onInit and type(tbl.onInit) == "function" then
    tbl.onInit(panel)
  end

  return panel
end

local old_vgui_register = vgui.register
function vgui.register(tbl, name, base)
  if type(name) == "string" and type(tbl) == "table" then
    PANELS.Add(name, tbl)
  end
  return old_vgui_register(tbl, name, base)
end

Alignment = {
  a_northwest = 0,
  a_north = 1,
  a_northeast = 2,
  a_west = 3,
  a_center = 4,
  a_east = 5,
  a_southwest = 6,
  a_south = 7,
  a_southeast = 8,
}

--- @class FONTFLAG
FONTFLAG = {}
FONTFLAG.NONE = 0
FONTFLAG.ITALIC = 1
FONTFLAG.UNDERLINE = 2
FONTFLAG.STRIKEOUT = 3
FONTFLAG.SYMBOL = 4
FONTFLAG.ANTIALIAS = 5
FONTFLAG.GAUSSIANBLUR = 6
FONTFLAG.ROTARY = 7
FONTFLAG.DROPSHADOW = 8
FONTFLAG.ADDITIVE = 9
FONTFLAG.OUTLINE = 10
FONTFLAG.CUSTOM = 11
FONTFLAG.BITMAP = 12

function IsValid(object)
  if object == nil then
    return false
  end
  if object == NULL then
    return false
  end
  if object == INVALID_PANEL then
    return false
  end
  return true
end

includeC("inc.lua")
