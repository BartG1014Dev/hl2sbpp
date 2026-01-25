-- smlib.lua

-- cant have this running on server!
if SERVER then
  return
end

smlib = smlib or {}

function smlib.CreateHeader(tab, text)
  tab = tab or "Entities"
  text = text or "Header"

  local tab_index = smlib_Private.FindTabByName(tab)
  if not tab_index then
    tab_index = smlib_Private.CreateTab(tab)
  end

  -- yep... another check
  if not tab_index then
    return
  end

  if smlib_Private.HeaderExists(tab_index, text) then
    dbg.Warning('Header "' .. text .. '" exists, cannot proceed.\n')
    return
  end

  smlib_Private.CreateHeader(tab_index, text)
end

function smlib.CreateButtonInHeader(isImageButton, tab, name, image, modelname, command, header)
  isImageButton = isImageButton or true
  modelname = modelname or ""
  image = image or ""
  command = command or "wait"
  tab = tab or "Entities"
  name = name or "Button"
  header = header or "None"

  local tab_index = smlib_Private.FindTabByName(tab)
  if not tab_index then
    tab_index = smlib_Private.CreateTab(tab)
  end

  -- yep... another check
  if not tab_index then
    return
  end

  if isImageButton then
    if smlib_Private.ImageButtonExists(tab_index, name, image) then
      dbg.Warning('Image button "' .. name .. '" exists, cannot proceed.\n')
      return
    end

    smlib_Private.CreateImageButtonInHeader(tab_index, header, name, image, command)
  else
    if smlib_Private.ModelButtonExists(tab_index, name, modelname) then
      dbg.Warning('Model button "' .. name .. '" exists, cannot proceed.\n')
      return
    end

    smlib_Private.CreateModelButtonInHeader(tab_index, header, name, modelname, command)
  end
end

function smlib.CreateButton(isImageButton, tab, name, image, modelname, command)
  isImageButton = isImageButton or true
  modelname = modelname or ""
  image = image or ""
  command = command or "wait"
  tab = tab or "Entities"
  name = name or "Button"

  local tab_index = smlib_Private.FindTabByName(tab)
  if not tab_index then
    tab_index = smlib_Private.CreateTab(tab)

    if tab_index then
      smlib_Private.CreateHeader(tab_index, tab)
    end
  end

  -- yep... another check
  if not tab_index then
    return
  end

  if isImageButton then
    if smlib_Private.ImageButtonExists(tab_index, name, image) then
      dbg.Warning('Image button "' .. name .. '" exists, cannot proceed.\n')
      return
    end

    smlib_Private.CreateImageButton(tab_index, name, image, command)
  else
    if smlib_Private.ModelButtonExists(tab_index, name, modelname) then
      dbg.Warning('Model button "' .. name .. '" exists, cannot proceed.\n')
      return
    end

    smlib_Private.CreateModelButton(tab_index, name, modelname, command)
  end
end
