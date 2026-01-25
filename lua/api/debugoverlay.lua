---@class debugoverlay
debugoverlay = {}

--- Draws a 3D box overlay in the world.
---@param origin Vector # Center of the box
---@param mins Vector # Minimum extents (local space)
---@param maxs Vector # Maximum extents (local space)
---@param angles QAngle # Box rotation
---@param r integer # Red (0–255)
---@param g integer # Green (0–255)
---@param b integer # Blue (0–255)
---@param a integer # Alpha (0–255)
---@param duration number # Duration in seconds
function debugoverlay.AddBoxOverlay(origin, mins, maxs, angles, r, g, b, a, duration) end

--- Draws a 3D box overlay with per-corner colors.
---@param origin Vector
---@param mins Vector
---@param maxs Vector
---@param angles QAngle
---@param faceColor Color # Face color (RGBA)
---@param edgeColor Color # Edge color (RGBA)
---@param duration number
function debugoverlay.AddBoxOverlay2(origin, mins, maxs, angles, faceColor, edgeColor, duration) end

--- Adds a grid overlay at the given position.
---@param origin Vector
function debugoverlay.AddGridOverlay(origin) end

--- Draws a 3D line overlay.
---@param startPos Vector
---@param endPos Vector
---@param r integer
---@param g integer
---@param b integer
---@param noDepthTest boolean # If true, ignores depth buffer
---@param duration number
function debugoverlay.AddLineOverlay(startPos, endPos, r, g, b, noDepthTest, duration) end

--- Draws a 3D line overlay with alpha support.
---@param startPos Vector
---@param endPos Vector
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---@param noDepthTest boolean
---@param duration number
function debugoverlay.AddLineOverlayAlpha(startPos, endPos, r, g, b, a, noDepthTest, duration) end

--- Adds a screen-space text overlay.
---@param x number # X position (0–1 normalized or pixels depending on engine)
---@param y number # Y position
---@param line number # Text line index
---@param r integer
---@param g integer
---@param b integer
---@param centered boolean
---@param text string
function debugoverlay.AddScreenTextOverlay(x, y, line, r, g, b, centered, text) end

--- Adds a swept box overlay (moving box).
---@param start Vector # Start position
---@param endPos Vector # End position
---@param mins Vector
---@param maxs Vector
---@param angles QAngle
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---@param duration number
function debugoverlay.AddSweptBoxOverlay(start, endPos, mins, maxs, angles, r, g, b, a, duration) end

--- Draws a triangle overlay.
---@param p1 Vector
---@param p2 Vector
---@param p3 Vector
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---@param noDepthTest boolean
---@param duration number
function debugoverlay.AddTriangleOverlay(p1, p2, p3, r, g, b, a, noDepthTest, duration) end

--- Removes all active overlays.
function debugoverlay.ClearAllOverlays() end

--- Removes overlays that have expired.
function debugoverlay.ClearDeadOverlays() end

--- Converts a 3D world position to 2D screen coordinates.
---@param worldPos Vector # Input world position
---@param screenPos Vector # Output screen position
---@return integer # 0 on success, non-zero if off-screen
function debugoverlay.ScreenPosition(worldPos, screenPos) end

--- Debugging library providing functions for logging and spew control.
--- @class dbg
dbg = {}

--- Activates spew output for a specific group with a given level.
--- @param group string The name of the spew group to activate.
--- @param level integer The verbosity level for spew output.
function dbg.SpewActivate(group, level) end

--- Checks if spew is active for a specific group and level.
--- @param group string The name of the spew group to check.
--- @param level integer The verbosity level to check.
--- @return boolean active Whether spew is active for the given group and level.
function dbg.IsSpewActive(group, level)
  return true
end

--- Outputs a message to the console.
--- @param message string The message to output.
function dbg.Msg(message) end

--- Outputs a debug message to the console if the specified level is active.
--- @param group string The name of the spew group.
--- @param level integer The verbosity level for the message.
--- @param message string The debug message to output.
function dbg.DMsg(group, level, message) end

--- Outputs a warning message to the console.
--- @param message string The warning message to output.
function dbg.Warning(message) end

--- Outputs a debug warning message to the console if the specified level is active.
--- @param group string The name of the spew group.
--- @param level integer The verbosity level for the warning.
--- @param message string The warning message to output.
function dbg.DWarning(group, level, message) end

--- Outputs a log message to the console.
--- @param message string The log message to output.
function dbg.Log(message) end

--- Outputs a debug log message to the console if the specified level is active.
--- @param group string The name of the spew group.
--- @param level integer The verbosity level for the log.
--- @param message string The log message to output.
function dbg.DLog(group, level, message) end

--- Outputs an error message to the console and potentially halts execution.
--- @param message string The error message to output.
function dbg.Error(message) end

--- Outputs a developer message to the console.
--- @param message string The developer message to output.
function dbg.DevMsg(message) end

--- Outputs a developer warning message to the console.
--- @param message string The developer warning message to output.
function dbg.DevWarning(message) end

--- Outputs a developer log message to the console.
--- @param message string The developer log message to output.
function dbg.DevLog(message) end

--- Outputs a colored message to the console.
--- @param color table The color table (typically containing RGB values).
--- @param message string The message to output in color.
function dbg.ConColorMsg(color, message) end

--- Outputs a console message.
--- @param message string The console message to output.
function dbg.ConMsg(message) end

--- Outputs a console warning message.
--- @param message string The console warning message to output.
function dbg.ConWarning(message) end

--- Outputs a console log message.
--- @param message string The console log message to output.
function dbg.ConLog(message) end

--- Outputs a colored debug message to the console if the specified level is active.
--- @param color table The color table (typically containing RGB values).
--- @param message string The debug message to output in color.
function dbg.ConDColorMsg(color, message) end

--- Outputs a debug console message if the specified level is active.
--- @param message string The debug console message to output.
function dbg.ConDMsg(message) end

--- Outputs a debug console warning message if the specified level is active.
--- @param message string The debug console warning message to output.
function dbg.ConDWarning(message) end

--- Outputs a debug console log message if the specified level is active.
--- @param message string The debug console log message to output.
function dbg.ConDLog(message) end

--- Outputs a network message with a specified channel.
--- @param channel integer The network channel for the message.
--- @param message string The network message to output.
function dbg.NetMsg(channel, message) end

--- Outputs a network warning message with a specified channel.
--- @param channel integer The network channel for the warning.
--- @param message string The network warning message to output.
function dbg.NetWarning(channel, message) end

--- Outputs a network log message with a specified channel.
--- @param channel integer The network channel for the log.
--- @param message string The network log message to output.
function dbg.NetLog(channel, message) end

--- Color library providing functions and methods for handling RGBA colors.
--- @class Color
Color = {}

--- Creates a new Color object with the specified RGBA values.
--- @param r integer Red component (0-255).
--- @param g integer Green component (0-255).
--- @param b integer Blue component (0-255).
--- @param a? integer Alpha component (0-255, defaults to 255).
--- @return table color A Color object.
function Color(r, g, b, a) end

--- Gets the alpha component of the color.
--- @return integer alpha The alpha value (0-255).
function Color:a() end

--- Gets the blue component of the color.
--- @return integer blue The blue value (0-255).
function Color:b() end

--- Gets the green component of the color.
--- @return integer green The green value (0-255).
function Color:g() end

--- Gets the RGBA components of the color.
--- @return integer r The red value (0-255).
--- @return integer g The green value (0-255).
--- @return integer b The blue value (0-255).
--- @return integer a The alpha value (0-255).
function Color:GetColor() end

--- Gets the raw color value as a single integer.
--- @return integer rawColor The raw color value.
function Color:GetRawColor() end

--- Gets the red component of the color.
--- @return integer red The red value (0-255).
function Color:r() end

--- Sets the RGBA components of the color.
--- @param r integer Red component (0-255).
--- @param g integer Green component (0-255).
--- @param b integer Blue component (0-255).
--- @param a? integer Alpha component (0-255, defaults to 255).
function Color:SetColor(r, g, b, a) end

--- Sets the raw color value as a single integer.
--- @param rawColor integer The raw color value.
function Color:SetRawColor(rawColor) end

--- Returns a string representation of the color in the format "(r, g, b, a)".
--- @return string str The string representation of the color.
function Color:__tostring() end

--- Checks if two Color objects are equal.
--- @param other table Another Color object to compare with.
--- @return boolean equal Whether the two colors are equal.
function Color:__eq(other) end

--- Prints one or more values to the console, separated by tabs, followed by a newline.
--- Converts each value to a string using the global `tostring` function.
--- @param ... any Values to print.
function print(...) end

--- Returns the type of a value, either as a Lua type or a custom metatable `__type` if defined.
--- @param value any The value to check the type of.
--- @return string type The type name of the value (e.g., "number", "string", or custom metatable `__type`).
function type(value) end

--- Includes and executes a Lua file relative to the caller's source file path.
--- The file path is constructed by combining the directory of the calling script with the provided filename.
--- @param filename string The name of the Lua file to include (relative to the caller's directory).
function include(filename) end

--- Includes again
--- @param filename string
function includeC(filename) end

---Represents a single navigation mesh area.
return debugoverlay
