
--- VGUI namespace for constructors.
--- @class vgui
vgui = {}

--- Creates a Panel.
--- @param parent Panel? Optional parent panel.
--- @param panelName string? Optional name.
--- @return Panel
function vgui.Panel(parent, panelName) end

--- Creates a Button.
--- @param parent Panel? Optional parent.
--- @param panelName string Name.
--- @param text string Button text.
--- @param pActionSignalTarget Panel? Action target.
--- @param pCmd string? Command.
--- @return Button
function vgui.Button(parent, panelName, text, pActionSignalTarget, pCmd) end

--- Creates a CheckButton.
--- @param parent Panel? Optional parent.
--- @param panelName string? Optional name.
--- @param text string? Optional text.
--- @return CheckButton
function vgui.CheckButton(parent, panelName, text) end

--- Creates a Frame.
--- @param parent Panel? Optional parent.
--- @param panelName string? Optional name.
--- @param showTaskbarIcon boolean? Show taskbar icon (default true).
--- @return Frame
function vgui.Frame(parent, panelName, showTaskbarIcon) end

--- Creates a PropertyDialog.
--- @param parent Panel? Optional parent.
--- @param panelName string Name.
--- @return PropertyDialog
function vgui.PropertyDialog(parent, panelName) end

--- Creates a PropertyPage.
--- @param parent Panel? Optional parent.
--- @param panelName string Name.
--- @return PropertyPage
function vgui.PropertyPage(parent, panelName) end

--- Gets the GameUI panel.
--- @return VPanel
function VGui_GetGameUIPanel() end

--- Mouse code enum (use as number in Lua).
--- @alias MouseCode number

--- Key code enum (use as number in Lua).
--- @alias KeyCode number

--- Activation type enum for buttons (use as number in Lua).
--- @alias ActivationType number

--- Scheme handle (HScheme in C++, number/userdata in Lua).
--- @alias HScheme number

--- Font handle (HFont in C++, number/userdata in Lua).
--- @alias HFont number

--- VPanel handle (VPANEL in C++, userdata in Lua).
--- @alias VPanel any

--- Pin corner enum for panels.
--- @alias PinCorner number

--- Auto resize enum for panels.
--- @alias AutoResize number

--- Font draw type enum.
--- @alias FontDrawType number

--- Surface feature enum.
--- @alias SurfaceFeature number

return vgui