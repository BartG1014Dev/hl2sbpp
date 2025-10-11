-- example_panel.lua
-- All Palm controls must start with a P! Example: PButton, PLabel

local concommand = require("concommand")
include("palm/cl_init.lua")

local FCVAR_CLIENTDLL = _E.FCVAR.CLIENTDLL

-- Local means dont use it anywhere else
local function OnOpenExamplePanel()
  local NewFrame = vgui.Create(
    "PFrame" -- Control name
  )
  NewFrame:SetPos(5, 5) -- x, y
  NewFrame:SetSize(300, 150) -- width, height
  NewFrame:SetTitle("Name window")
  NewFrame:SetVisible(true)
  NewFrame:SetDraggable(false) -- can move or no?
  NewFrame:ShowCloseButton(true) -- enable close button or no?

  local NewLabel = vgui.Create(
    "PLabel", -- Control name
    NewFrame, -- Parent
    "Ass" -- Text
  )
  NewLabel:SetPos(5, 30) --x, y
  NewLabel:SetVisible(true)

  local NewButton = vgui.Create(
    "PButton", -- Control name
    NewFrame, -- parent
    "Batman", -- Text
    NewFrame, -- Action signal
    "Batman" -- Command name
  )
  NewButton:SetPos(5, 60) -- x, y

  -- We set a command hook.
  NewFrame.OnCommand = function(self, command) -- self is required!
    -- If command equals Batman, print I am Batman
    if command == "Batman" then
      print("I am Batman")
    end
  end

  NewFrame:MakePopup() -- moves to center
end

concommand.Create(
  "OpenExamplePanel", -- Name
  OnOpenExamplePanel, -- Function
  "Opens an example panel.", -- Description
  FCVAR_CLIENTDLL --Flags
)
