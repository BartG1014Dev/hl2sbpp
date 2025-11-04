
--- @class PropertyDialog : Frame
--- Property dialog control.
local PropertyDialog = {}

--- Adds a page to the dialog.
--- @param page Panel The page panel.
--- @param title string The page title.
function PropertyDialog:AddPage(page, title) end

--- Applies changes in the dialog.
function PropertyDialog:ApplyChanges() end

--- Chains to animation map.
function PropertyDialog:ChainToAnimationMap() end

--- Chains to map.
function PropertyDialog:ChainToMap() end

--- Enables/disables the apply button.
--- @param enable boolean Whether to enable.
function PropertyDialog:EnableApplyButton(enable) end

--- Gets the active page.
--- @return Panel
function PropertyDialog:GetActivePage() end

--- Gets panel base class name.
--- @return string
function PropertyDialog:GetPanelBaseClassName() end

--- Gets panel class name.
--- @return string
function PropertyDialog:GetPanelClassName() end

--- Gets reference table for Lua.
--- @return table|nil
function PropertyDialog:GetRefTable() end

--- Adds bound key.
--- @param key string Key name.
--- @param code number Key code.
--- @param modifier number Modifier.
function PropertyDialog:KB_AddBoundKey(key, code, modifier) end

--- Chains keyboard to map.
function PropertyDialog:KB_ChainToMap() end

--- Resets all data.
function PropertyDialog:ResetAllData() end

--- Sets apply button text.
--- @param text string The text.
function PropertyDialog:SetApplyButtonText(text) end

--- Sets apply button visibility.
--- @param visible boolean Whether visible.
function PropertyDialog:SetApplyButtonVisible(visible) end

--- Sets cancel button text.
--- @param text string The text.
function PropertyDialog:SetCancelButtonText(text) end

--- Sets cancel button visibility.
--- @param visible boolean Whether visible.
function PropertyDialog:SetCancelButtonVisible(visible) end

--- Sets OK button text.
--- @param text string The text.
function PropertyDialog:SetOKButtonText(text) end

--- Sets OK button visibility.
--- @param visible boolean Whether visible.
function PropertyDialog:SetOKButtonVisible(visible) end

--- Called when cancel button is pressed (override in Lua).
function PropertyDialog:OnCancel() end

--- Called on OK/Apply (override in Lua).
--- @param applyOnly boolean Whether apply only.
--- @return boolean
function PropertyDialog:OnOK(applyOnly) end

--- @class PropertyPage : Panel
--- Property page control.
local PropertyPage = {}

--- Chains to animation map.
function PropertyPage:ChainToAnimationMap() end

--- Chains to map.
function PropertyPage:ChainToMap() end

--- Gets panel base class name.
--- @return string
function PropertyPage:GetPanelBaseClassName() end

--- Gets panel class name.
--- @return string
function PropertyPage:GetPanelClassName() end

--- Gets reference table for Lua.
--- @return table|nil
function PropertyPage:GetRefTable() end

--- Checks if has user config settings.
--- @return boolean
function PropertyPage:HasUserConfigSettings() end

--- Adds bound key.
--- @param key string Key name.
--- @param code number Key code.
--- @param modifier number Modifier.
function PropertyPage:KB_AddBoundKey(key, code, modifier) end

--- Chains keyboard to map.
function PropertyPage:KB_ChainToMap() end

--- Called to apply changes (override in Lua).
function PropertyPage:OnApplyChanges() end

--- Called on key code typed.
--- @param code KeyCode The code.
function PropertyPage:OnKeyCodeTyped(code) end

--- Called when page hides (override in Lua).
function PropertyPage:OnPageHide() end

--- Called when page shows (override in Lua).
function PropertyPage:OnPageShow() end

--- Called to reset data (override in Lua).
function PropertyPage:OnResetData() end

--- Sets visibility.
--- @param visible boolean Whether visible.
function PropertyPage:SetVisible(visible) end

--- Called when page tab is activated.
--- @param pageTab Panel The page tab.
function PropertyPage:OnPageTabActivated(pageTab) end

return PropertyPage