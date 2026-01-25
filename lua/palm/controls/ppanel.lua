-- ppanel.lua
---@param dlg self:PPanel
local function PositionDialog(dlg)
  if not IsValid(dlg) then
    return
  end

  local w, h = surface.GetScreenSize()
  if not w or not h or w == 0 or h == 0 then
    return
  end

  -- double check
  if not IsValid(dlg) then
    return
  end

  local pw, ph = dlg:GetSize()
  if not pw or not ph then
    return
  end

  dlg:SetPos((w - pw) / 2, (h - ph) / 2)
end

---@class PPanel:Frame
---@field Init fun(self:PPanel, parent:Panel?, panelName:string)
local PPanel = {
  base = "Frame",

  Init = function(self, parent)
    self:SetParent(parent)

    self.IsPopupV = false

    self.Center = function(self)
      PositionDialog(self)
      self:Activate() -- hacky hacky!!
    end

    self.MakePopup = function(self)
      self.IsPopupV = true

      self:Center()
    end
  end,

  Activate = function(self) end,
}

CONTROLS.Add("PPanel", PPanel)
