--========== Copyright (C) 2025, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

local concommand = require("concommand")

require("spaint")

cl_showhints = CreateClientConVar("cl_showhints", "1", true, false)

NOTIFY_GENERIC = 0
NOTIFY_ERROR = 1
NOTIFY_UNDO = 2
NOTIFY_CLEANUP = 3
NOTIFY_HINT = 4

NOTIFY_ICONS = {
  [NOTIFY_GENERIC] = "vgui/notices/generic",
  [NOTIFY_ERROR] = "vgui/notices/error",
  [NOTIFY_UNDO] = "vgui/notices/undo",
  [NOTIFY_CLEANUP] = "vgui/notices/cleanup",
  [NOTIFY_HINT] = "vgui/notices/hint",
}

spaint.CreateFont("HintFont", {
  font = "Roboto",
  size = 14,
  weight = 500,
  antialias = true,
})

MAX_HINTS = 7
m_Notices = {}
m_Scheduled = {}
m_Processed = {}

local function NoticePanel_New(text, ntype, length)
  local scrW, scrH = surface.GetScreenSize()

  return {
    text = text,
    ntype = ntype,
    icon = NOTIFY_ICONS[ntype] or NOTIFY_ICONS[NOTIFY_GENERIC],
    length = length,
    startTime = gpGlobals.curtime(),
    w = 300,
    h = 36,
    fx = scrW + 300,
    fy = scrH - 150,
    VelX = 0,
    VelY = 0,
    dead = false,
    progress = false,
    progressFrac = 0,
  }
end

local function Notice_SetProgress(panel, frac)
  panel.progress = true
  panel.progressFrac = frac
end

local function Notice_KillSelf(panel)
  if panel.length < 0 then
    return false
  end
  if panel.startTime + panel.length < gpGlobals.curtime() then
    panel.dead = true
    return true
  end
  return false
end

local materialCache = {}
local function DrawMaterial(mat, x, y, w, h)
  if not materialCache[mat] then
    local texID = surface.CreateNewTextureID()
    surface.DrawSetTextureFile(texID, mat, 0, false)
    materialCache[mat] = texID
  end
  surface.DrawSetColor(255, 255, 255, 255)
  surface.DrawSetTexture(materialCache[mat])
  surface.DrawTexturedRect(x, y, x + w, y + h)
end

local function Notice_Paint(panel)
  local x, y, w, h = panel.fx, panel.fy, panel.w, panel.h

  spaint.Box({
    pos = { x, y },
    width = w,
    height = h,
    color = Color(20, 20, 20, math.floor(255 * 0.6)),
  })

  if panel.icon then
    DrawMaterial(panel.icon, x + 4, y + (h - 32) / 2, 32, 32)
  end

  spaint.TextS({
    text = panel.text,
    pos = { x + 40, y + (h - 14) / 2 },
    color = Color(255, 255, 255, 255),
    font = "HintFont",
  }, 1)

  if panel.progress then
    local bx = x + 20
    local by = y + h - 13
    local bw = w - 20
    local bh = 5

    spaint.Box({ pos = { bx, by }, width = bw, height = bh, color = Color(0, 100, 0, 150) })
    spaint.Box({ pos = { bx + 1, by + 1 }, width = bw - 2, height = bh - 2, color = Color(0, 50, 0, 255) })

    local drawW = math.ceil((bw - 2) * panel.progressFrac)
    spaint.Box({ pos = { bx + 1, by + 1 }, width = drawW, height = bh - 2, color = Color(0, 255, 0, 255) })
  end
end

local lastRealTime = 0

hook.add("PostChildUIPaint", "HudHints_PostChildUIPaint", function()
  -- physics
  if cl_showhints:GetBool() then
    local realtime = gpGlobals.realtime()
    local ft = realtime - lastRealTime
    lastRealTime = realtime

    if ft > 0 and ft < 0.1 then
      local now = gpGlobals.curtime()
      local scrW, scrH = surface.GetScreenSize()

      local i = 1
      while i <= #m_Scheduled do
        local s = m_Scheduled[i]
        if s.fireTime <= now then
          AddNotify(s.name, NOTIFY_HINT, 5.0)
          table.remove(m_Scheduled, i)
        else
          i = i + 1
        end
      end

      local total_h = 0
      for _, p in ipairs(m_Notices) do
        if not p.dead then
          local pw = p.w + 16
          local ph = p.h + 4

          local ideal_y = scrH - 150 - ph - total_h
          local ideal_x = scrW - pw - 20

          local timeleft = (p.startTime + p.length) - now
          if p.length < 0 then
            timeleft = 1.0
          end

          if timeleft < 0.7 then
            ideal_x = ideal_x - 50
          end
          if timeleft < 0.2 then
            ideal_x = ideal_x + pw * 2
          end

          local spd = ft * 15.0

          p.fy = p.fy + p.VelY * spd
          p.fx = p.fx + p.VelX * spd

          local distY = ideal_y - p.fy
          p.VelY = p.VelY + distY * spd
          if math.abs(distY) < 2 and math.abs(p.VelY) < 0.1 then
            p.VelY = 0
          end

          local distX = ideal_x - p.fx
          p.VelX = p.VelX + distX * spd
          if math.abs(distX) < 2 and math.abs(p.VelX) < 0.1 then
            p.VelX = 0
          end

          p.VelX = p.VelX * (0.95 - ft * 8.0)
          p.VelY = p.VelY * (0.95 - ft * 8.0)

          total_h = total_h + ph
        end
      end

      for i = #m_Notices, 1, -1 do
        if m_Notices[i].dead or Notice_KillSelf(m_Notices[i]) then
          table.remove(m_Notices, i)
        end
      end
    end
  end

  -- draw
  for _, panel in ipairs(m_Notices) do
    if not panel.dead then
      Notice_Paint(panel)
    end
  end
end)

function AddHint(name, delay)
  if m_Processed[name] then
    return
  end
  m_Scheduled[#m_Scheduled + 1] = {
    name = name,
    fireTime = gpGlobals.curtime() + delay,
  }
  m_Processed[name] = true
end

function SuppressHint(name)
  for i = #m_Scheduled, 1, -1 do
    if m_Scheduled[i].name == name then
      table.remove(m_Scheduled, i)
    end
  end
end

function AddNotify(text, ntype, length)
  if not cl_showhints:GetBool() then
    return
  end

  ntype = ntype or NOTIFY_GENERIC
  length = length or 5.0

  if #m_Notices >= MAX_HINTS then
    table.remove(m_Notices, 1)
  end

  local p = NoticePanel_New(LocalizeText(text), ntype, length)
  m_Notices[#m_Notices + 1] = p

  if random.RandomInt(1, 2) == 1 then
    surface.PlaySound("ambient/water/drip1.wav")
  else
    surface.PlaySound("ambient/water/drip2.wav")
  end
end

function SetMaxHints(n)
  MAX_HINTS = n
end

concommand.Create("hint_add", function(pPlayer, pCmd, ArgS)
  if not ArgS or ArgS == "" then
    dbg.Warning("Usage: hint_add <text> [duration]\n")
    return
  end

  ArgS = string.gsub(ArgS, '^"(.*)"$', "%1")

  local text, duration = string.match(ArgS, "^(.+)%s+(%d+%.?%d*)$")
  if not text then
    text = ArgS
    duration = 5.0
  else
    duration = tonumber(duration) or 5.0
  end

  AddNotify(text, NOTIFY_GENERIC, duration)
end, "Displays a hint on screen. Usage: hint_add <text> [duration]", FCVAR.CLIENTDLL)
