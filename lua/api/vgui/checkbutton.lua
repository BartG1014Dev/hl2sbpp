
--- @class CheckButton : Button
--- Check button control (toggleable checkbox).
CheckButton = {}

--- Chains to animation map.
function CheckButton:ChainToAnimationMap() end

--- Chains to map.
function CheckButton:ChainToMap() end

--- Gets disabled background color.
--- @return Color
function CheckButton:GetDisabledBgColor() end

--- Gets disabled foreground color.
--- @return Color
function CheckButton:GetDisabledFgColor() end

--- Gets panel base class name.
--- @return string
function CheckButton:GetPanelBaseClassName() end

--- Gets panel class name.
--- @return string
function CheckButton:GetPanelClassName() end

--- Gets reference table for Lua.
--- @return table|nil
function CheckButton:GetRefTable() end

--- Adds bound key.
--- @param key string Key name.
--- @param code number Key code.
--- @param modifier number Modifier.
function CheckButton:KB_AddBoundKey(key, code, modifier) end

--- Chains keyboard to map.
function CheckButton:KB_ChainToMap() end

--- Sets whether the check button is checkable.
--- @param checkable boolean Whether checkable.
function CheckButton:SetCheckButtonCheckable(checkable) end

--- Sets the selected (checked) state.
--- @param selected boolean Whether selected.
function CheckButton:SetSelected(selected) end

--- Called when the check button is checked (override in Lua).
function CheckButton:OnCheckButtonChecked() end

return CheckButton