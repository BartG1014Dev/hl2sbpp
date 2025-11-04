---@class smlib_Private
smlib_Private = {}

---@param name string
---@param spawnlist? string
---@param icon? string
---@return integer|nil, string? # tab index or nil + error
function smlib_Private.CreateTab(name, spawnlist, icon) end

---@param name string
---@return integer|nil
function smlib_Private.FindTabByName(name) end

---@param name string
---@return boolean
function smlib_Private.TabExists(name) end

---@return integer
function smlib_Private.GetNumTabs() end

---@param index integer
---@return string|nil
function smlib_Private.GetTabName(index) end

---@param index integer
---@return boolean
function smlib_Private.ClearTab(index) end

---@param tab integer
---@param text string
---@return boolean
function smlib_Private.CreateHeader(tab, text) end

---@param tab integer
---@param displayName string
---@param modelPath string
---@param command? string
---@return boolean
function smlib_Private.CreateModelButton(tab, displayName, modelPath, command) end

---@param tab integer
---@param displayName string
---@param imagePath string
---@param command? string
---@return boolean
function smlib_Private.CreateImageButton(tab, displayName, imagePath, command) end

---@param tab integer
---@param text string
---@return boolean
function smlib_Private.HeaderExists(tab, text) end

---@param tab integer
---@param displayName string
---@param modelPath string
---@return boolean
function smlib_Private.ModelButtonExists(tab, displayName, modelPath) end

---@param tab integer
---@param displayName string
---@param imagePath string
---@return boolean
function smlib_Private.ImageButtonExists(tab, displayName, imagePath) end

---@param tab integer
---@param entry integer
---@return boolean
function smlib_Private.RemoveEntry(tab, entry) end

---@param tabIndex integer
---@param headerName string Header text to place the button under.
---@param displayName string
---@param modelPath string
---@param command? string|nil
---@return boolean success
function smlib_Private.CreateModelButtonInHeader(tabIndex, headerName, displayName, modelPath, command) end

---@param tabIndex integer
---@param headerName string Header text to place the button under.
---@param displayName string
---@param imagePath string
---@param command? string|nil
---@return boolean success
function smlib_Private.CreateImageButtonInHeader(tabIndex, headerName, displayName, imagePath, command) end

---Base class for Scripted Weapons (SWEPs)
return smlib_Private
