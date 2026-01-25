
--- @class EditablePanel : Panel
--- Editable panel control.
local EditablePanel = {}

--- Activates build mode.
function EditablePanel:ActivateBuildMode() end

--- Applies settings.
--- @param settings KeyValues Settings.
function EditablePanel:ApplySettings(settings) end

--- Chains to animation map.
function EditablePanel:ChainToAnimationMap() end

--- Chains to map.
function EditablePanel:ChainToMap() end

--- Creates control by name.
--- @param name string Name.
--- @return Panel
function EditablePanel:CreateControlByName(name) end

--- Gets control int.
--- @param name string Name.
--- @param default number Default.
--- @return number
function EditablePanel:GetControlInt(name, default) end

--- Gets control string.
--- @param name string Name.
--- @param default string Default.
--- @return string
function EditablePanel:GetControlString(name, default) end

--- Gets current key focus.
--- @return Panel
function EditablePanel:GetCurrentKeyFocus() end

--- Gets dialog variables.
--- @return KeyValues
function EditablePanel:GetDialogVariables() end

--- Gets panel base class name.
--- @return string
function EditablePanel:GetPanelBaseClassName() end

--- Gets panel class name.
--- @return string
function EditablePanel:GetPanelClassName() end

--- Checks if has hotkey.
--- @param hotkey string Hotkey.
--- @return Panel
function EditablePanel:HasHotkey(hotkey) end

--- Adds bound key.
--- @param key string Key.
--- @param code number Code.
--- @param modifier number Modifier.
function EditablePanel:KB_AddBoundKey(key, code, modifier) end

--- Chains keyboard to map.
function EditablePanel:KB_ChainToMap() end

--- Converts key code to string.
--- @param code KeyCode Code.
--- @return string
function EditablePanel:KeyCodeToString(code) end

--- Loads control settings.
--- @param path string Path.
--- @param opt1 string? Optional.
--- @param opt2 KeyValues? Optional.
function EditablePanel:LoadControlSettings(path, opt1, opt2) end

--- Loads control settings and user config.
--- @param path string Path.
--- @param unknown number? Unknown.
function EditablePanel:LoadControlSettingsAndUserConfig(path, unknown) end

--- Loads user config.
--- @param path string Path.
--- @param unknown number? Unknown.
function EditablePanel:LoadUserConfig(path, unknown) end

--- Called on key code typed.
--- @param code KeyCode Code.
function EditablePanel:OnKeyCodeTyped(code) end

--- Called on request focus.
--- @param sub VPanel Sub.
--- @param default VPanel Default.
function EditablePanel:OnRequestFocus(sub, default) end

--- Called on set focus.
function EditablePanel:OnSetFocus() end

--- Registers control settings file.
--- @param file string File.
--- @param opt string? Optional.
function EditablePanel:RegisterControlSettingsFile(file, opt) end

--- Requests focus.
--- @param unknown number? Unknown.
function EditablePanel:RequestFocus(unknown) end

--- Requests focus next.
--- @param vpanel VPanel VPanel.
--- @return boolean
function EditablePanel:RequestFocusNext(vpanel) end

--- Requests focus prev.
--- @param vpanel VPanel VPanel.
--- @return boolean
function EditablePanel:RequestFocusPrev(vpanel) end

--- Requests info.
--- @param kv KeyValues KV.
--- @return boolean
function EditablePanel:RequestInfo(kv) end

--- Requests info from child.
--- @param child string Child.
--- @param kv KeyValues KV.
--- @return boolean
function EditablePanel:RequestInfoFromChild(child, kv) end

--- Saves user config.
function EditablePanel:SaveUserConfig() end

--- Sets control enabled.
--- @param name string Name.
--- @param enabled boolean Enabled.
function EditablePanel:SetControlEnabled(name, enabled) end

--- Sets control int.
--- @param name string Name.
--- @param value number Value.
function EditablePanel:SetControlInt(name, value) end

--- Sets control string.
--- @param name string Name.
--- @param value string Value.
function EditablePanel:SetControlString(name, value) end

--- Sets control visible.
--- @param name string Name.
--- @param visible boolean Visible.
function EditablePanel:SetControlVisible(name, visible) end

--- Sets dialog variable.
--- @param name string Name.
--- @param value string|number Value (string or number).
function EditablePanel:SetDialogVariable(name, value) end

return EditablePanel