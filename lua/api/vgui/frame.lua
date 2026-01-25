
--- @class Frame : Panel
--- Frame window control.
local Frame = {}

--- Activates the frame.
function Frame:Activate() end

--- Activates the frame minimized.
function Frame:ActivateMinimized() end

--- Checks if keys can chain to parent.
--- @return boolean
function Frame:CanChainKeysToParent() end

--- Checks if dragging can start.
--- @param x1 number X1.
--- @param y1 number Y1.
--- @param x2 number X2.
--- @param y2 number Y2.
--- @return boolean
function Frame:CanStartDragging(x1, y1, x2, y2) end

--- Chains to animation map.
function Frame:ChainToAnimationMap() end

--- Chains to map.
function Frame:ChainToMap() end

--- Closes the frame.
function Frame:Close() end

--- Closes the modal frame.
function Frame:CloseModal() end

--- Deletes the panel.
function Frame:DeletePanel() end

--- Disables fade effect.
function Frame:DisableFadeEffect() end

--- Makes the frame modal.
function Frame:DoModal() end

--- Flashes the window.
function Frame:FlashWindow() end

--- Stops flashing the window.
function Frame:FlashWindowStop() end

--- Gets bottom-right size.
--- @return number
function Frame:GetBottomRightSize() end

--- Gets caption height.
--- @return number
function Frame:GetCaptionHeight() end

--- Gets clip-to-parent state.
--- @return boolean
function Frame:GetClipToParent() end

--- Gets corner size.
--- @return number
function Frame:GetCornerSize() end

--- Gets dragger size.
--- @return number
function Frame:GetDraggerSize() end

--- Gets panel base class name.
--- @return string
function Frame:GetPanelBaseClassName() end

--- Gets panel class name.
--- @return string
function Frame:GetPanelClassName() end

--- Gets reference table for Lua.
--- @return table|nil
function Frame:GetRefTable() end

--- Checks if minimized.
--- @return boolean
function Frame:IsMinimized() end

--- Checks if moveable.
--- @return boolean
function Frame:IsMoveable() end

--- Checks if sizeable.
--- @return boolean
function Frame:IsSizeable() end

--- Checks if small caption.
--- @return boolean
function Frame:IsSmallCaption() end

--- Adds bound key.
--- @param key string Key name.
--- @param code number Key code.
--- @param modifier number Modifier.
function Frame:KB_AddBoundKey(key, code, modifier) end

--- Chains keyboard to map.
function Frame:KB_ChainToMap() end

--- Loads control settings from resource.
--- @param path string Resource path.
--- @param opt1 string? Optional param.
--- @param opt2 KeyValues? Optional keyvalues.
function Frame:LoadControlSettings(path, opt1, opt2) end

--- Moves to center of screen.
function Frame:MoveToCenterOfScreen() end

--- Called on command.
--- @param command string The command.
function Frame:OnCommand(command) end

--- Places under cursor.
function Frame:PlaceUnderCursor() end

--- Sets chain keys to parent.
--- @param chain boolean Whether to chain.
function Frame:SetChainKeysToParent(chain) end

--- Sets clip to parent.
--- @param clip boolean Whether to clip.
function Frame:SetClipToParent(clip) end

--- Sets close button visibility.
--- @param visible boolean Whether visible.
function Frame:SetCloseButtonVisible(visible) end

--- Sets delete self on close.
--- @param delete boolean Whether to delete.
function Frame:SetDeleteSelfOnClose(delete) end

--- Sets images.
--- @param img1 string Image 1.
--- @param img2 string? Image 2 (optional).
function Frame:SetImages(img1, img2) end

--- Sets maximize button visibility.
--- @param visible boolean Whether visible.
function Frame:SetMaximizeButtonVisible(visible) end

--- Sets menu button responsive.
--- @param responsive boolean Whether responsive.
function Frame:SetMenuButtonResponsive(responsive) end

--- Sets menu button visibility.
--- @param visible boolean Whether visible.
function Frame:SetMenuButtonVisible(visible) end

--- Sets minimize button visibility.
--- @param visible boolean Whether visible.
function Frame:SetMinimizeButtonVisible(visible) end

--- Sets minimize-to-systray button visibility.
--- @param visible boolean Whether visible.
function Frame:SetMinimizeToSysTrayButtonVisible(visible) end

--- Sets moveable state.
--- @param moveable boolean Whether moveable.
function Frame:SetMoveable(moveable) end

--- Sets sizeable state.
--- @param sizeable boolean Whether sizeable.
function Frame:SetSizeable(sizeable) end

--- Sets small caption.
--- @param small boolean Whether small.
function Frame:SetSmallCaption(small) end

--- Sets the title.
--- @param title string The title text.
--- @param unknown boolean? Unknown param (from code).
function Frame:SetTitle(title, unknown) end

--- Sets title bar visibility.
--- @param visible boolean Whether visible.
function Frame:SetTitleBarVisible(visible) end


return Frame