--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

local tLocalize = {}
local bLocLoaded = false

local function ends_with(str, ending)
  if ending == "" then
    return true
  end
  return str:sub(-#ending) == ending
end

local function loadKeyValuesFileIntoTable(fullpath, tableOut)
  local kv = KeyValues("lang")
  if not kv:LoadFromFile(fullpath, "GAME") then
    kv:deleteThis()
    return false
  end

  local tokens = kv:FindKey("Tokens")
  if not tokens or tokens == NULL_KEYVALUES then
    kv:deleteThis()
    return false
  end

  local sub = tokens:GetFirstSubKey()
  while sub and sub ~= NULL_KEYVALUES do
    local name = sub:GetName()
    if name and name ~= "" then
      tLocalize[string.lower(name)] = sub:GetString() or ""
    end
    sub = sub:GetNextKey()
  end

  kv:deleteThis()
  return true
end

function LoadLocalization()
  if bLocLoaded then
    return
  end
  bLocLoaded = true

  tLocalize = {}

  local lang = GetConVar("cl_language"):GetString() or "english"
  lang = string.lower(lang)

  local userPattern = "resource/lua/*_" .. lang .. ".txt"
  local files = {}
  if file then
    files = file.Find(userPattern, "GAME") or {}
  end

  local loadedAny = false

  for _, fname in ipairs(files) do
    local fullpath = "resource/lua/" .. fname
    if loadKeyValuesFileIntoTable(fullpath, tLocalize) then
      loadedAny = true
    end
  end

  if not loadedAny then
    local fallbackFiles = {}
    if file then
      fallbackFiles = file.Find("resource/lua/*_english.txt", "GAME") or {}
    end
    for _, fname in ipairs(fallbackFiles) do
      local fullpath = "resource/lua/" .. fname
      if loadKeyValuesFileIntoTable(fullpath, tLocalize) then
        loadedAny = true
      end
    end
  end

  if not loadedAny then
    local anyFiles = {}
    if file then
      anyFiles = file.Find("resource/lua/*.txt", "GAME") or {}
    end
    for _, fname in ipairs(anyFiles) do
      if not ends_with(fname, "_" .. lang .. ".txt") and not ends_with(fname, "_english.txt") then
        local fullpath = "resource/lua/" .. fname
        if loadKeyValuesFileIntoTable(fullpath, tLocalize) then
          loadedAny = true
        end
      end
    end
  end
end

function LocalizeText(text)
  LoadLocalization()

  if string.sub(text, 1, 5) == "Hint_" then
    return tLocalize[string.lower(text)] or text
  end

  if string.sub(text, 1, 1) == "#" then
    local token = string.lower(string.sub(text, 2))
    return tLocalize[token] or string.sub(text, 2)
  end

  return text
end
