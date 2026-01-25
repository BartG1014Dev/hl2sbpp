
--- Panel handle (VPANEL in C++, userdata in Lua).
--- @class Panel
local Panel = {}

--- Called when the screen size changes.
--- @param oldWide number Old screen width.
--- @param oldTall number Old screen height.
function Panel:OnScreenSizeChanged(oldWide, oldTall) end

--- Paints the border of the panel.
function Panel:PaintBorder() end

--- Paints the background of the panel.
function Panel:PaintBackground() end

--- Paints the main content of the panel.
function Panel:Paint() end

--- Paints after children have been painted.
function Panel:PostChildPaint() end

--- Paints a build-mode overlay (e.g., black rectangle around panel).
function Panel:PaintBuildOverlay() end

--- Called when a child panel is added.
--- @param child Panel The added child panel.
function Panel:OnChildAdded(child) end

--- Called when the panel's size changes.
--- @param newWide number New width.
--- @param newTall number New height.
function Panel:OnSizeChanged(newWide, newTall) end

--- Called every frame when the panel is visible.
function Panel:OnThink() end

--- Called when the cursor moves over the panel.
--- @param x number Cursor X position.
--- @param y number Cursor Y position.
function Panel:OnCursorMoved(x, y) end

--- Called when the cursor enters the panel.
function Panel:OnCursorEntered() end

--- Called when the cursor exits the panel.
function Panel:OnCursorExited() end

--- Called when a mouse button is pressed.
--- @param code MouseCode The mouse button code.
function Panel:OnMousePressed(code) end

--- Called when a mouse button is double-pressed.
--- @param code MouseCode The mouse button code.
function Panel:OnMouseDoublePressed(code) end

--- Called when a mouse button is triple-pressed.
--- @param code MouseCode The mouse button code.
function Panel:OnMouseTriplePressed(code) end

--- Called when a mouse button is released.
--- @param code MouseCode The mouse button code.
function Panel:OnMouseReleased(code) end

--- Called when the mouse wheel is scrolled.
--- @param delta number Scroll delta (positive/negative).
function Panel:OnMouseWheeled(delta) end

--- Called when a key is pressed.
--- @param code KeyCode The key code.
function Panel:OnKeyCodePressed(code) end

--- Called when a key is typed (including repeats).
--- @param code KeyCode The key code.
function Panel:OnKeyCodeTyped(code) end

--- Called when a key is released.
--- @param code KeyCode The key code.
function Panel:OnKeyCodeReleased(code) end

--- Called every frame while the panel has key focus.
function Panel:OnKeyFocusTicked() end

--- Called every frame while the panel has mouse focus.
function Panel:OnMouseFocusTicked() end

--- Called when focus is requested.
--- @param subFocus Panel The sub-panel requesting focus.
--- @param defaultPanel Panel The default panel to focus.
function Panel:OnRequestFocus(subFocus, defaultPanel) end

--- Called when mouse capture is lost.
function Panel:OnMouseCaptureLost() end

--- Performs layout on the panel.
function Panel:PerformLayout() end

--- Called when a command is received from another panel.
--- @param command string The command string.
function Panel:OnCommand(command) end

--- Called when the panel gains focus.
function Panel:OnSetFocus() end

--- Called when the panel loses focus.
function Panel:OnKillFocus() end

--- Applies scheme settings to the panel.
--- @param pScheme any The scheme object (IScheme in C++).
function Panel:ApplySchemeSettings(pScheme) end

--- Applies settings from resource data.
--- @param inResourceData KeyValues The resource data.
function Panel:ApplySettings(inResourceData) end

--- Called when the panel moves.
function Panel:OnMove() end

--- Called every tick (frame).
function Panel:OnTick() end

--- Handles a message from another panel.
--- @param params KeyValues The message parameters.
--- @param ifromPanel Panel The sending panel.
function Panel:OnMessage(params, ifromPanel) end

--- Called when the panel is deleted.
function Panel:OnDelete() end

--- Adds a key binding.
--- @param binding string The binding.
--- @param key number Key code.
--- @param modifier number Modifier.
function Panel:AddKeyBinding(binding, key, modifier) end

--- Adds an action signal target.
--- @param target Panel The target panel.
function Panel:AddActionSignalTarget(target) end

--- Checks if can start dragging.
--- @param x1 number X1.
--- @param y1 number Y1.
--- @param x2 number X2.
--- @param y2 number Y2.
--- @return boolean
function Panel:CanStartDragging(x1, y1, x2, y2) end

--- Chains to animation map.
function Panel:ChainToAnimationMap() end

--- Chains to map.
function Panel:ChainToMap() end

--- Deletes the panel.
function Panel:DeletePanel() end

--- Disables mouse input for this panel.
--- @param disable boolean Whether to disable.
function Panel:DisableMouseInputForThisPanel(disable) end

--- Draws a box.
--- @param x number X.
--- @param y number Y.
--- @param wide number Width.
--- @param tall number Height.
--- @param color Color The color.
--- @param alpha number Alpha.
--- @param unknown boolean? Unknown param.
function Panel:DrawBox(x, y, wide, tall, color, alpha, unknown) end

--- Draws a box fade.
--- @param x number X.
--- @param y number Y.
--- @param wide number Width.
--- @param tall number Height.
--- @param color Color The color.
--- @param alpha number Alpha.
--- @param startAlpha number Start alpha.
--- @param endAlpha number End alpha.
--- @param horizontal boolean Horizontal fade.
--- @param unknown boolean? Unknown param.
function Panel:DrawBoxFade(x, y, wide, tall, color, alpha, startAlpha, endAlpha, horizontal, unknown) end

--- Draws a hollow box.
--- @param x number X.
--- @param y number Y.
--- @param wide number Width.
--- @param tall number Height.
--- @param color Color The color.
--- @param alpha number Alpha.
function Panel:DrawHollowBox(x, y, wide, tall, color, alpha) end

--- Draws a textured box.
--- @param x number X.
--- @param y number Y.
--- @param wide number Width.
--- @param tall number Height.
--- @param color Color The color.
--- @param alpha number Alpha.
function Panel:DrawTexturedBox(x, y, wide, tall, color, alpha) end

--- Edits key bindings.
function Panel:EditKeyBindings() end

--- Fills rect skipping panel.
--- @param color Color The color.
--- @param x number X.
--- @param y number Y.
--- @param wide number Width.
--- @param tall number Height.
--- @param skip Panel Panel to skip.
function Panel:FillRectSkippingPanel(color, x, y, wide, tall, skip) end

--- Finds child by name.
--- @param name string Name.
--- @param recursive boolean? Recursive search.
--- @return Panel
function Panel:FindChildByName(name, recursive) end

--- Finds child index by name.
--- @param name string Name.
--- @return number
function Panel:FindChildIndexByName(name) end

--- Finds sibling by name.
--- @param name string Name.
--- @return Panel
function Panel:FindSiblingByName(name) end

--- Gets alpha.
--- @return number
function Panel:GetAlpha() end

--- Gets background color.
--- @return Color
function Panel:GetBgColor() end

--- Gets bounds.
--- @return number, number, number, number x, y, wide, tall
function Panel:GetBounds() end

--- Gets child panel.
--- @param index number Index.
--- @return Panel
function Panel:GetChild(index) end

--- Gets child count.
--- @return number
function Panel:GetChildCount() end

--- Gets class name.
--- @return string
function Panel:GetClassName() end

--- Gets clip rect.
--- @return number, number, number, number x0, y0, x1, y1
function Panel:GetClipRect() end

--- Gets corner texture size.
--- @return number, number w, h
function Panel:GetCornerTextureSize() end

--- Gets description.
--- @return string
function Panel:GetDescription() end

--- Gets drag frame color.
--- @return Color
function Panel:GetDragFrameColor() end

--- Gets drag panel.
--- @return Panel
function Panel:GetDragPanel() end

--- Gets drag start tolerance.
--- @return number
function Panel:GetDragStartTolerance() end

--- Gets drop frame color.
--- @return Color
function Panel:GetDropFrameColor() end

--- Gets foreground color.
--- @return Color
function Panel:GetFgColor() end

--- Gets inset.
--- @return number, number, number, number left, top, right, bottom
function Panel:GetInset() end

--- Gets key bindings file.
--- @return string
function Panel:GetKeyBindingsFile() end

--- Gets key bindings file path ID.
--- @return string
function Panel:GetKeyBindingsFilePathID() end

--- Gets key mapping count.
--- @return number
function Panel:GetKeyMappingCount() end

--- Gets minimum size.
--- @return number, number wide, tall
function Panel:GetMinimumSize() end

--- Gets module name.
--- @return string
function Panel:GetModuleName() end

--- Gets name.
--- @return string
function Panel:GetName() end

--- Gets paint background type.
--- @return number
function Panel:GetPaintBackgroundType() end

--- Gets paint size.
--- @return number, number wide, tall
function Panel:GetPaintSize() end

--- Gets panel base class name.
--- @return string
function Panel:GetPanelBaseClassName() end

--- Gets panel class name.
--- @return string
function Panel:GetPanelClassName() end

--- Gets parent.
--- @return Panel
function Panel:GetParent() end

--- Gets pin corner.
--- @return number
function Panel:GetPinCorner() end

--- Gets pin offset.
--- @return number, number dx, dy
function Panel:GetPinOffset() end

--- Gets position.
--- @return number, number x, y
function Panel:GetPos() end

--- Gets reference table (Lua-specific).
--- @return table|nil
function Panel:GetRefTable() end

--- Gets resize offset.
--- @return number, number dx, dy
function Panel:GetResizeOffset() end

--- Gets size.
--- @return number, number wide, tall
function Panel:GetSize() end

--- Gets tab position.
--- @return number
function Panel:GetTabPosition() end

--- Gets tall.
--- @return number
function Panel:GetTall() end

--- Gets VPanel.
--- @return VPanel
function Panel:GetVPanel() end

--- Gets VParent.
--- @return VPanel
function Panel:GetVParent() end

--- Gets wide.
--- @return number
function Panel:GetWide() end

--- Gets Z position.
--- @return number
function Panel:GetZPos() end

--- Checks if has focus.
--- @return boolean
function Panel:HasFocus() end

--- Checks if has user config settings.
--- @return boolean
function Panel:HasUserConfigSettings() end

--- Initializes property converters.
function Panel:InitPropertyConverters() end

--- Invalidates layout.
--- @param force boolean? Force.
--- @param immediate boolean? Immediate.
function Panel:InvalidateLayout(force, immediate) end

--- Checks if auto delete set.
--- @return boolean
function Panel:IsAutoDeleteSet() end

--- Checks if being dragged.
--- @return boolean
function Panel:IsBeingDragged() end

--- Checks if blocking drag chaining.
--- @return boolean
function Panel:IsBlockingDragChaining() end

--- Checks if bottom aligned.
--- @return boolean
function Panel:IsBottomAligned() end

--- Checks if build group enabled.
--- @return boolean
function Panel:IsBuildGroupEnabled() end

--- Checks if build mode active.
--- @return boolean
function Panel:IsBuildModeActive() end

--- Checks if build mode deletable.
--- @return boolean
function Panel:IsBuildModeDeletable() end

--- Checks if build mode editable.
--- @return boolean
function Panel:IsBuildModeEditable() end

--- Checks if child of modal sub tree.
--- @return boolean
function Panel:IsChildOfModalSubTree() end

--- Checks if child of surface modal panel.
--- @return boolean
function Panel:IsChildOfSurfaceModalPanel() end

--- Checks if cursor none.
--- @return boolean
function Panel:IsCursorNone() end

--- Checks if cursor over.
--- @return boolean
function Panel:IsCursorOver() end

--- Checks if drag enabled.
--- @return boolean
function Panel:IsDragEnabled() end

--- Checks if drop enabled.
--- @return boolean
function Panel:IsDropEnabled() end

--- Checks if enabled.
--- @return boolean
function Panel:IsEnabled() end

--- Checks if key binding chain to parent allowed.
--- @return boolean
function Panel:IsKeyBindingChainToParentAllowed() end

--- Checks if keyboard input enabled.
--- @return boolean
function Panel:IsKeyBoardInputEnabled() end

--- Checks if key overridden.
--- @param code KeyCode Code.
--- @param modifier number Modifier.
--- @return boolean
function Panel:IsKeyOverridden(code, modifier) end

--- Checks if key rebound.
--- @param code KeyCode Code.
--- @param modifier number Modifier.
--- @return boolean
function Panel:IsKeyRebound(code, modifier) end

--- Checks if layout invalid.
--- @return boolean
function Panel:IsLayoutInvalid() end

--- Checks if mouse input disabled for this panel.
--- @return boolean
function Panel:IsMouseInputDisabledForThisPanel() end

--- Checks if mouse input enabled.
--- @return boolean
function Panel:IsMouseInputEnabled() end

--- Checks if opaque.
--- @return boolean
function Panel:IsOpaque() end

--- Checks if popup.
--- @return boolean
function Panel:IsPopup() end

--- Checks if proportional.
--- @return boolean
function Panel:IsProportional() end

--- Checks if right aligned.
--- @return boolean
function Panel:IsRightAligned() end

--- Checks if start drag when mouse exits panel.
--- @return boolean
function Panel:IsStartDragWhenMouseExitsPanel() end

--- Checks if triple press allowed.
--- @return boolean
function Panel:IsTriplePressAllowed() end

--- Checks if valid key bindings context.
--- @return boolean
function Panel:IsValidKeyBindingsContext() end

--- Checks if visible.
--- @return boolean
function Panel:IsVisible() end

--- Checks if within.
--- @param x number X.
--- @param y number Y.
--- @return boolean
function Panel:IsWithin(x, y) end

--- Checks if within traverse.
--- @param x number X.
--- @param y number Y.
--- @param unknown boolean Unknown.
--- @return boolean
function Panel:IsWithinTraverse(x, y, unknown) end

--- Adds bound key (KB_ prefix likely keyboard).
--- @param key string Key.
--- @param code number Code.
--- @param modifier number Modifier.
function Panel:KB_AddBoundKey(key, code, modifier) end

--- Chains keyboard to map.
function Panel:KB_ChainToMap() end

--- Converts key code to string.
--- @param code KeyCode Code.
--- @return string
function Panel:KeyCodeToString(code) end

--- Converts local to screen.
--- @return number, number x, y
function Panel:LocalToScreen() end

--- Makes popup.
--- @param unknown1 boolean? Unknown.
--- @param unknown2 boolean? Unknown.
function Panel:MakePopup(unknown1, unknown2) end

--- Makes ready for use.
function Panel:MakeReadyForUse() end

--- Marks for deletion.
function Panel:MarkForDeletion() end

--- Moves to front.
function Panel:MoveToFront() end

--- Called on command.
--- @param command string Command.
function Panel:OnCommand(command) end

--- Called on cursor entered.
function Panel:OnCursorEntered() end

--- Called on cursor exited.
function Panel:OnCursorExited() end

--- Called on cursor moved.
--- @param x number X.
--- @param y number Y.
function Panel:OnCursorMoved(x, y) end

--- Called on delete.
function Panel:OnDelete() end

--- Called on draggable panel paint.
function Panel:OnDraggablePanelPaint() end

--- Called on key code pressed.
--- @param code KeyCode Code.
function Panel:OnKeyCodePressed(code) end

--- Called on key code typed.
--- @param code KeyCode Code.
function Panel:OnKeyCodeTyped(code) end

--- Called on key focus ticked.
function Panel:OnKeyFocusTicked() end

--- Called on kill focus.
function Panel:OnKillFocus() end

--- Called on mouse capture lost.
function Panel:OnMouseCaptureLost() end

--- Called on mouse double pressed.
--- @param code MouseCode Code.
function Panel:OnMouseDoublePressed(code) end

--- Called on mouse focus ticked.
function Panel:OnMouseFocusTicked() end

--- Called on mouse pressed.
--- @param code MouseCode Code.
function Panel:OnMousePressed(code) end

--- Called on mouse released.
--- @param code MouseCode Code.
function Panel:OnMouseReleased(code) end

--- Called on mouse triple pressed.
--- @param code MouseCode Code.
function Panel:OnMouseTriplePressed(code) end

--- Called on mouse wheeled.
--- @param delta number Delta.
function Panel:OnMouseWheeled(delta) end

--- Called on move.
function Panel:OnMove() end

--- Called on set focus.
function Panel:OnSetFocus() end

--- Called on size changed.
--- @param wide number Wide.
--- @param tall number Tall.
function Panel:OnSizeChanged(wide, tall) end

--- Called on think.
function Panel:OnThink() end

--- Called on tick.
function Panel:OnTick() end

--- Paints the panel.
function Panel:Paint() end

--- Paints background.
function Panel:PaintBackground() end

--- Paints border.
function Panel:PaintBorder() end

--- Paints build overlay.
function Panel:PaintBuildOverlay() end

--- Converts parent local to screen.
--- @return number, number x, y
function Panel:ParentLocalToScreen() end

--- Performs layout.
function Panel:PerformLayout() end

--- Paints post child.
function Panel:PostChildPaint() end

--- Reloads key bindings.
function Panel:ReloadKeyBindings() end

--- Removes action signal target.
--- @param target Panel Target.
function Panel:RemoveActionSignalTarget(target) end

--- Removes all key bindings.
function Panel:RemoveAllKeyBindings() end

--- Repaints.
function Panel:Repaint() end

--- Requests focus.
--- @param unknown number? Unknown.
function Panel:RequestFocus(unknown) end

--- Reverts key bindings to default.
function Panel:RevertKeyBindingsToDefault() end

--- Converts screen to local.
--- @return number, number x, y
function Panel:ScreenToLocal() end

--- Sets allow key binding chain to parent.
--- @param allow boolean Allow.
function Panel:SetAllowKeyBindingChainToParent(allow) end

--- Sets alpha.
--- @param alpha number Alpha.
function Panel:SetAlpha(alpha) end

--- Sets auto delete.
--- @param auto boolean Auto.
function Panel:SetAutoDelete(auto) end

--- Sets auto resize.
--- @param pin PinCorner Pin corner.
--- @param resize AutoResize Resize.
--- @param minWide number Min wide.
--- @param minTall number Min tall.
--- @param maxWide number Max wide.
--- @param maxTall number Max tall.
function Panel:SetAutoResize(pin, resize, minWide, minTall, maxWide, maxTall) end

--- Sets background color.
--- @param color Color Color.
function Panel:SetBgColor(color) end

--- Sets block drag chaining.
--- @param block boolean Block.
function Panel:SetBlockDragChaining(block) end

--- Sets bounds.
--- @param x number X.
--- @param y number Y.
--- @param wide number Wide.
--- @param tall number Tall.
function Panel:SetBounds(x, y, wide, tall) end

--- Sets build mode deletable.
--- @param deletable boolean Deletable.
function Panel:SetBuildModeDeletable(deletable) end

--- Sets build mode editable.
--- @param editable boolean Editable.
function Panel:SetBuildModeEditable(editable) end

--- Sets drag enabled.
--- @param enabled boolean Enabled.
function Panel:SetDragEnabled(enabled) end

--- Sets drag start tolerance.
--- @param tolerance number Tolerance.
function Panel:SetDragSTartTolerance(tolerance) end

--- Sets drop enabled.
--- @param enabled boolean Enabled.
--- @param unknown number? Unknown.
function Panel:SetDropEnabled(enabled, unknown) end

--- Sets enabled.
--- @param enabled boolean Enabled.
function Panel:SetEnabled(enabled) end

--- Sets foreground color.
--- @param color Color Color.
function Panel:SetFgColor(color) end

--- Sets content alignment.
--- @param int number int.
function Panel:SetContentAlignment(int) end

--- Sets keyboard input enabled.
--- @param enabled boolean Enabled.
function Panel:SetKeyBoardInputEnabled(enabled) end

--- Sets minimum size.
--- @param wide number Wide.
--- @param tall number Tall.
function Panel:SetMinimumSize(wide, tall) end

--- Sets mouse input enabled.
--- @param enabled boolean Enabled.
function Panel:SetMouseInputEnabled(enabled) end

--- Sets name.
--- @param name string Name.
function Panel:SetName(name) end

--- Sets paint background enabled.
--- @param enabled boolean Enabled.
function Panel:SetPaintBackgroundEnabled(enabled) end

--- Sets paint background type.
--- @param type number Type.
function Panel:SetPaintBackgroundType(type) end

--- Sets paint border enabled.
--- @param enabled boolean Enabled.
function Panel:SetPaintBorderEnabled(enabled) end

--- Sets paint enabled.
--- @param enabled boolean Enabled.
function Panel:SetPaintEnabled(enabled) end

--- Sets parent.
--- @param parent Panel Parent.
function Panel:SetParent(parent) end

--- Sets pin corner.
--- @param corner PinCorner Corner.
--- @param x number X.
--- @param y number Y.
function Panel:SetPinCorner(corner, x, y) end

--- Sets position.
--- @param x number X.
--- @param y number Y.
function Panel:SetPos(x, y) end

--- Sets post child paint enabled.
--- @param enabled boolean Enabled.
function Panel:SetPostChildPaintEnabled(enabled) end

--- Sets proportional.
--- @param prop boolean Proportional.
function Panel:SetProportional(prop) end

--- Sets scheme.
--- @param scheme string Scheme.
function Panel:SetScheme(scheme) end

--- Sets silent mode.
--- @param silent boolean Silent.
function Panel:SetSilentMode(silent) end

--- Sets size.
--- @param wide number Wide.
--- @param tall number Tall.
function Panel:SetSize(wide, tall) end

--- Sets skip child during painting.
--- @param child Panel Child.
function Panel:SetSkipChildDuringPainting(child) end

--- Sets start drag when mouse exits panel.
--- @param start boolean Start.
function Panel:SetStartDragWhenMouseExitsPanel(start) end

--- Sets tab position.
--- @param pos number Position.
function Panel:SetTabPosition(pos) end

--- Sets tall.
--- @param tall number Tall.
function Panel:SetTall(tall) end

--- Sets triple press allowed.
--- @param allowed boolean Allowed.
function Panel:SetTriplePressAllowed(allowed) end

--- Sets visible.
--- @param visible boolean Visible.
function Panel:SetVisible(visible) end

--- Sets wide.
--- @param wide number Wide.
function Panel:SetWide(wide) end

--- Sets Z position.
--- @param z number Z.
function Panel:SetZPos(z) end

--- Checks if should handle input message.
--- @return boolean
function Panel:ShouldHandleInputMessage() end

--- Converts string to key code.
--- @param str string String.
--- @return number
function Panel:StringToKeyCode(str) end

return Panel