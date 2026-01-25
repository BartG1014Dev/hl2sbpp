--- @class surface
surface = {}

--- Adds bitmap font file.
--- @param file string File.
--- @return boolean
function surface.AddBitmapFontFile(file) end

--- Adds custom font file.
--- @param file string File.
--- @param name string Name.
--- @return boolean
function surface.AddCustomFontFile(file, name) end

--- Adds panel.
--- @param vpanel VPanel VPanel.
function surface.AddPanel(vpanel) end

--- Applies changes.
function surface.ApplyChanges() end

--- Brings to front.
--- @param vpanel VPanel VPanel.
function surface.BringToFront(vpanel) end

--- Calculates mouse visible.
function surface.CalculateMouseVisible() end

--- Clears temporary font cache.
function surface.ClearTemporaryFontCache() end

--- Creates font.
--- @return HFont
function surface.CreateFont() end

--- Creates new texture ID.
--- @param unknown boolean? Unknown.
--- @return number
function surface.CreateNewTextureID(unknown) end

--- Creates popup.
--- @param vpanel VPanel VPanel.
--- @param unknown1 boolean Unknown1.
--- @param unknown2 boolean? Unknown2.
--- @param unknown3 boolean? Unknown3.
--- @param unknown4 boolean? Unknown4.
--- @param unknown5 boolean? Unknown5.
function surface.CreatePopup(vpanel, unknown1, unknown2, unknown3, unknown4, unknown5) end

--- Draws filled rect.
--- @param x1 number X1.
--- @param y1 number Y1.
--- @param x2 number X2.
--- @param y2 number Y2.
function surface.DrawFilledRect(x1, y1, x2, y2) end

--- Draws filled rect fade.
--- @param x1 number X1.
--- @param y1 number Y1.
--- @param x2 number X2.
--- @param y2 number Y2.
--- @param startAlpha number Start alpha.
--- @param endAlpha number End alpha.
--- @param horizontal boolean Horizontal.
function surface.DrawFilledRectFade(x1, y1, x2, y2, startAlpha, endAlpha, horizontal) end

--- Draws flush text.
function surface.DrawFlushText() end

--- Draws get alpha multiplier.
--- @return number
function surface.DrawGetAlphaMultiplier() end

--- Draws get text pos.
--- @return number, number x, y
function surface.DrawGetTextPos() end

--- Draws get texture file.
--- @param id number ID.
--- @param size number Size.
--- @return boolean, string success, filename
function surface.DrawGetTextureFile(id, size) end

--- Draws get texture id.
--- @param file string File.
--- @return number
function surface.DrawGetTextureId(file) end

--- Draws get texture size.
--- @param id number ID.
--- @return number, number wide, tall
function surface.DrawGetTextureSize(id) end

--- Draws line.
--- @param x1 number X1.
--- @param y1 number Y1.
--- @param x2 number X2.
--- @param y2 number Y2.
function surface.DrawLine(x1, y1, x2, y2) end

--- Draws outlined circle.
--- @param x number X.
--- @param y number Y.
--- @param radius number Radius.
--- @param segments number Segments.
function surface.DrawOutlinedCircle(x, y, radius, segments) end

--- Draws outlined rect.
--- @param x1 number X1.
--- @param y1 number Y1.
--- @param x2 number X2.
--- @param y2 number Y2.
function surface.DrawOutlinedRect(x1, y1, x2, y2) end

--- Draws print text.
--- @param text string Text.
--- @param unknown number? Unknown (FontDrawType).
function surface.DrawPrintText(text, unknown) end

--- Draws set alpha multiplier.
--- @param alpha number Alpha.
function surface.DrawSetAlphaMultiplier(alpha) end

--- Draws set color.
--- @param r number R.
--- @param g number G.
--- @param b number B.
--- @param a number A.
function surface.DrawSetColor(r, g, b, a) end

--- Draws set text color.
--- @param r number R.
--- @param g number G.
--- @param b number B.
--- @param a number A.
function surface.DrawSetTextColor(r, g, b, a) end

--- Draws set text font.
--- @param font HFont Font.
function surface.DrawSetTextFont(font) end

--- Draws set text pos.
--- @param x number X.
--- @param y number Y.
function surface.DrawSetTextPos(x, y) end

--- Draws set text scale.
--- @param sx number SX.
--- @param sy number SY.
function surface.DrawSetTextScale(sx, sy) end

--- Draws set texture.
--- @param id number ID.
function surface.DrawSetTexture(id) end

--- Draws set texture file.
--- @param id number ID.
--- @param file string File.
--- @param unknown1 number Unknown1.
--- @param unknown2 boolean Unknown2.
function surface.DrawSetTextureFile(id, file, unknown1, unknown2) end

--- Draws textured rect.
--- @param x1 number X1.
--- @param y1 number Y1.
--- @param x2 number X2.
--- @param y2 number Y2.
function surface.DrawTexturedRect(x1, y1, x2, y2) end

--- Draws textured sub rect.
--- @param x1 number X1.
--- @param y1 number Y1.
--- @param x2 number X2.
--- @param y2 number Y2.
--- @param tx1 number TX1.
--- @param ty1 number TY1.
--- @param tx2 number TX2.
--- @param ty2 number TY2.
function surface.DrawTexturedSubRect(x1, y1, x2, y2, tx1, ty1, tx2, ty2) end

--- Enables mouse capture.
--- @param vpanel VPanel VPanel.
--- @param enable boolean Enable.
function surface.EnableMouseCapture(vpanel, enable) end

--- Flashes window.
--- @param vpanel VPanel VPanel.
--- @param flash boolean Flash.
function surface.FlashWindow(vpanel, flash) end

--- Gets absolute window bounds.
--- @return number, number, number, number x, y, wide, tall
function surface.GetAbsoluteWindowBounds() end

--- Gets bitmap font name.
--- @param name string Name.
--- @return string
function surface.GetBitmapFontName(name) end

--- Gets char ABC wide.
--- @param font HFont Font.
--- @param char number Char.
--- @return number, number, number a, b, c
function surface.GetCharABCwide(font, char) end

--- Gets character width.
--- @param font HFont Font.
--- @param char number Char.
--- @return number
function surface.GetCharacterWidth(font, char) end

--- Gets embedded panel.
--- @return Panel
function surface.GetEmbeddedPanel() end

--- Gets font ascent.
--- @param font HFont Font.
--- @param char string Char.
--- @return number
function surface.GetFontAscent(font, char) end

--- Gets font tall.
--- @param font HFont Font.
--- @return number
function surface.GetFontTall(font) end

--- Gets modal panel.
--- @return Panel
function surface.GetModalPanel() end

--- Gets notify panel.
--- @return Panel
function surface.GetNotifyPanel() end

--- Gets popup.
--- @param index number Index.
--- @return Panel
function surface.GetPopup(index) end

--- Gets popup count.
--- @return number
function surface.GetPopupCount() end

--- Gets proportional base.
--- @return number, number width, height
function surface.GetProportionalBase() end

--- Gets resolution key.
--- @return string
function surface.GetResolutionKey() end

--- Gets screen size.
--- @return number, number wide, tall
function surface.GetScreenSize() end

--- Gets text size.
--- @param font HFont Font.
--- @param text string Text.
--- @return number, number wide, tall
function surface.GetTextSize(font, text) end

--- Gets title.
--- @param vpanel VPanel VPanel.
--- @return string
function surface.GetTitle(vpanel) end

--- Gets topmost popup.
--- @return Panel
function surface.GetTopmostPopup() end

--- Gets workspace bounds.
--- @return number, number, number, number x, y, wide, tall
function surface.GetWorkspaceBounds() end

--- Gets Z pos.
--- @return number
function surface.GetZPos() end

--- Checks if has cursor pos functions.
--- @return boolean
function surface.HasCursorPosFunctions() end

--- Checks if has focus.
--- @return boolean
function surface.HasFocus() end

--- Invalidates.
--- @param vpanel VPanel VPanel.
function surface.Invalidate(vpanel) end

--- Checks if cursor locked.
--- @return boolean
function surface.IsCursorLocked() end

--- Checks if cursor visible.
--- @return boolean
function surface.IsCursorVisible() end

--- Checks if font additive.
--- @param font HFont Font.
--- @return boolean
function surface.IsFontAdditive(font) end

--- Checks if minimized.
--- @param vpanel VPanel VPanel.
--- @return boolean
function surface.IsMinimized(vpanel) end

--- Checks if texture ID valid.
--- @param id number ID.
--- @return boolean
function surface.IsTextureIDValid(id) end

--- Checks if within.
--- @param x number X.
--- @param y number Y.
--- @return boolean
function surface.IsWithin(x, y) end

--- Locks cursor.
function surface.LockCursor() end

--- Moves popup to back.
--- @param vpanel VPanel VPanel.
function surface.MovePopupToBack(vpanel) end

--- Moves popup to front.
--- @param vpanel VPanel VPanel.
function surface.MovePopupToFront(vpanel) end

--- Needs KB input.
--- @return boolean
function surface.NeedKBInput() end

--- Called on screen size changed.
--- @param wide number Wide.
--- @param tall number Tall.
function surface.OnScreenSizeChanged(wide, tall) end

--- Paints traverse.
--- @param vpanel VPanel VPanel.
function surface.PaintTraverse(vpanel) end

--- Paints traverse ex.
--- @param vpanel VPanel VPanel.
--- @param unknown boolean? Unknown.
function surface.PaintTraverseEx(vpanel, unknown) end

--- Plays sound.
--- @param sound string Sound.
function surface.PlaySound(sound) end

--- Pops make current.
--- @param vpanel VPanel VPanel.
function surface.PopMakeCurrent(vpanel) end

--- Runs frame.
function surface.RunFrame() end

--- Sets allow HTML JavaScript.
--- @param allow boolean Allow.
function surface.SetAllowHTMLJavaScript(allow) end

--- Sets bitmap font name.
--- @param name string Name.
--- @param file string File.
function surface.SetBitmapFontName(name, file) end

--- Sets embedded panel.
--- @param vpanel VPanel VPanel.
function surface.SetEmbeddedPanel(vpanel) end

--- Sets font glyph set.
--- @param font HFont Font.
--- @param name string Name.
--- @param tall number Tall.
--- @param weight number Weight.
--- @param blur number Blur.
--- @param scanlines number Scanlines.
--- @param flags number Flags.
--- @param rangeMin number? Range min.
--- @param rangeMax number? Range max.
--- @return boolean
function surface.SetFontGlyphSet(font, name, tall, weight, blur, scanlines, flags, rangeMin, rangeMax) end

--- Sets translate extended keys.
--- @param translate boolean Translate.
function surface.SetTranslateExtendedKeys(translate) end

--- Sets workspace insets.
--- @param left number Left.
--- @param top number Top.
--- @param right number Right.
--- @param bottom number Bottom.
function surface.SetWorkspaceInsets(left, top, right, bottom) end

--- Supports feature.
--- @param feature SurfaceFeature Feature.
function surface.SupportsFeature(feature) end

--- Surface get cursor pos.
--- @return number, number x, y
function surface.SurfaceGetCursorPos() end

--- Surface set cursor pos.
--- @param x number X.
--- @param y number Y.
function surface.SurfaceSetCursorPos(x, y) end

--- Unlocks cursor.
function surface.UnlockCursor() end

return surface