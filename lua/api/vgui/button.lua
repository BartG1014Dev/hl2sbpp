
--- @class Button : Panel
--- Basic button control.
local Button = {}

--- Checks if the button can be the default button.
--- @return boolean
function Button:CanBeDefaultButton() end

--- Chains the button to the animation map.
function Button:ChainToAnimationMap() end

--- Chains the button to the map.
function Button:ChainToMap() end

--- Performs a click action on the button.
function Button:DoClick() end

--- Draws the focus box.
--- @param enabled boolean Whether to enable the focus box.
function Button:DrawFocusBox(enabled) end

--- Fires the action signal.
function Button:FireActionSignal() end

--- Forces the button to be depressed.
--- @param depressed boolean Whether to depress the button.
function Button:ForceDepressed(depressed) end

--- Gets the background color of the button.
--- @return Color
function Button:GetButtonBgColor() end

--- Gets the foreground color of the button.
--- @return Color
function Button:GetButtonFgColor() end

--- Gets the base class name of the panel.
--- @return string
function Button:GetPanelBaseClassName() end

--- Gets the class name of the panel.
--- @return string
function Button:GetPanelClassName() end

--- Gets the reference table for Lua scripting.
--- @return table|nil
function Button:GetRefTable() end

--- Checks if the button is armed (hovered/ready).
--- @return boolean
function Button:IsArmed() end

--- Checks if the button is blinking.
--- @return boolean
function Button:IsBlinking() end

--- Checks if the button is depressed (pressed down).
--- @return boolean
function Button:IsDepressed() end

--- Checks if the focus box is being drawn.
--- @return boolean
function Button:IsDrawingFocusBox() end

--- Checks if mouse click is enabled for a code.
--- @param code MouseCode The mouse code.
--- @return boolean
function Button:IsMouseClickEnabled(code) end

--- Checks if the button is selected.
--- @return boolean
function Button:IsSelected() end

--- Checks if use-capture-mouse is enabled.
--- @return boolean
function Button:IsUseCaptureMouseEnabled() end

--- Adds a bound key for keyboard input.
--- @param key string The key name.
--- @param code number The key code.
--- @param modifier number Modifier (e.g., shift).
function Button:KB_AddBoundKey(key, code, modifier) end

--- Chains keyboard input to the map.
function Button:KB_ChainToMap() end

--- Called when cursor enters.
function Button:OnCursorEntered() end

--- Called when cursor exits.
function Button:OnCursorExited() end

--- Called on hotkey press.
function Button:OnHotkey() end

--- Called when focus is killed.
function Button:OnKillFocus() end

--- Called when focus is set.
function Button:OnSetFocus() end

--- Performs layout.
function Button:PerformLayout() end

--- Recalculates the depressed state.
function Button:RecalculateDepressedState() end

--- Sets the armed state.
--- @param armed boolean Whether armed.
function Button:SetArmed(armed) end

--- Sets the armed colors.
--- @param fg Color Foreground color.
--- @param bg Color Background color.
function Button:SetArmedColor(fg, bg) end

--- Sets the armed sound.
--- @param sound string Sound file.
function Button:SetArmedSound(sound) end

--- Sets as current default button.
--- @param value number Value (int).
function Button:SetAsCurrentDefaultButton(value) end

--- Sets as default button.
--- @param value number Value (int).
function Button:SetAsDefaultButton(value) end

--- Sets blinking state.
--- @param blink boolean Whether blinking.
function Button:SetBlink(blink) end

--- Sets the blink color.
--- @param color Color The color.
function Button:SetBlinkColor(color) end

--- Sets the button activation type.
--- @param type ActivationType The type.
function Button:SetButtonActivationType(type) end

--- Enables/disables button border.
--- @param enabled boolean Whether enabled.
function Button:SetButtonBorderEnabled(enabled) end

--- Sets default colors.
--- @param fg Color Foreground color.
--- @param bg Color Background color.
function Button:SetDefaultColor(fg, bg) end

--- Sets depressed colors.
--- @param fg Color Foreground color.
--- @param bg Color Background color.
function Button:SetDepressedColor(fg, bg) end

--- Sets the depressed sound.
--- @param sound string Sound file.
function Button:SetDepressedSound(sound) end

--- Enables/disables mouse click for code.
--- @param code MouseCode The code.
--- @param enabled boolean Whether enabled.
function Button:SetMouseClickEnabled(code, enabled) end

--- Sets the released sound.
--- @param sound string Sound file.
function Button:SetReleasedSound(sound) end

--- Sets the selected state.
--- @param selected boolean Whether selected.
function Button:SetSelected(selected) end

--- Sets whether the button should paint.
--- @param paint boolean Whether to paint.
function Button:SetShouldPaint(paint) end

--- Sets use-capture-mouse.
--- @param capture boolean Whether to capture.
function Button:SetUseCaptureMouse(capture) end

--- Checks if the button should paint.
--- @return boolean
function Button:ShouldPaint() end

--- Sizes the button to its contents.
function Button:SizeToContents() end

return Button