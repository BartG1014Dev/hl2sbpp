--- @class IScheme
--- Scheme interface.
local IScheme = {}

--- Gets color.
--- @param name string Name.
--- @param default Color Default.
--- @return Color
function IScheme:GetColor(name, default) end

--- Gets font.
--- @param name string Name.
--- @param proportional boolean? Proportional.
--- @return HFont
function IScheme:GetFont(name, proportional) end

--- Gets font name.
--- @param font HFont Font.
--- @return string
function IScheme:GetFontName(font) end

--- Gets resource string.
--- @param name string Name.
--- @return string
function IScheme:GetResourceString(name) end


--- Scheme library functions.
--- @class scheme
scheme = {}

--- Gets default scheme.
--- @return HScheme
function scheme.GetDefaultScheme() end

--- Gets IScheme.
--- @param scheme HScheme Scheme.
--- @return IScheme
function scheme.GetIScheme(scheme) end

--- Gets proportional normalized value.
--- @param value number Value.
--- @return number
function scheme.GetProportionalNormalizedValue(value) end

--- Gets proportional normalized value ex.
--- @param scheme HScheme Scheme.
--- @param value number Value.
--- @return number
function scheme.GetProportionalNormalizedValueEx(scheme, value) end

--- Gets proportional scaled value.
--- @param value number Value.
--- @return number
function scheme.GetProportionalScaledValue(value) end

--- Gets proportional scaled value ex.
--- @param scheme HScheme Scheme.
--- @param value number Value.
--- @return number
function scheme.GetProportionalScaledValueEx(scheme, value) end

--- Gets scheme.
--- @param name string Name.
--- @return HScheme
function scheme.GetScheme(name) end

--- Loads scheme from file.
--- @param file string File.
--- @param name string Name.
--- @return HScheme
function scheme.LoadSchemeFromFile(file, name) end

--- Loads scheme from file ex.
--- @param vpanel VPanel VPanel.
--- @param file string File.
--- @param name string Name.
--- @return HScheme
function scheme.LoadSchemeFromFileEx(vpanel, file, name) end

--- Reloads fonts.
function scheme.ReloadFonts() end

--- Reloads schemes.
function scheme.ReloadSchemes() end

return IScheme, scheme