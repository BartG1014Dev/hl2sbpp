
--- @class CScriptedClientLuaPanel : Panel
--- Scripted client Lua panel.
CScriptedClientLuaPanel = {}

--- Creates default panels.
function CScriptedClientLuaPanel:CreateDefaultPanels() end

--- Starts the panel with game UI funcs and event manager.
--- @param pGameUIFuncs any Game UI funcs.
--- @param pGameEventManager any Game event manager.
function CScriptedClientLuaPanel:Start(pGameUIFuncs, pGameEventManager) end

--- Sets the parent panel.
--- @param parent any VPANEL parent.
function CScriptedClientLuaPanel:SetParent(parent) end

--- Paints the panel.
function CScriptedClientLuaPanel:Paint() end

--- @class CScriptedHudViewport : Panel
--- Scripted HUD viewport.
CScriptedHudViewport = {}

--- Sets the parent panel.
--- @param parent any VPANEL parent.
function CScriptedHudViewport:SetParent(parent) end

--- Paints the panel.
function CScriptedHudViewport:Paint() end

return CScriptedClientLuaPanel, CScriptedHudViewport