--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose: All Palm controls must start with a P! Example: PButton, PLabel
--
--===========================================================================--

local concommand = require("concommand")
include("palm/cl_init.lua")

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
  8 -- FCVAR.CLIENTDLL --Flags
)

-- Local means dont use it anywhere else
local function OnOpenExamplePDialog()
  local NewDialog = vgui.Create(
    "PPropertyDialog" -- Control name
  )
  NewDialog:SetPos(5, 5) -- x, y
  NewDialog:SetSize(300, 150) -- width, height
  NewDialog:SetTitle("Name window")
  NewDialog:SetVisible(true)
  NewDialog:SetDraggable(false) -- can move or no?
  NewDialog:SetOKButtonVisible(true) -- enable OK button or no?
  NewDialog:SetCloseButtonVisible(true) -- enable close button or no?

  local NewPage = vgui.Create(
    "PPropertyPage", -- name
    NewDialog -- parent
  )
  NewPage:SetPos(0, 0) -- x,y
  NewPage:SetSize(300, 150) -- width, height
  NewPage:SetVisible(true)

  -- now, add the page
  NewDialog:AddPage(
    NewPage, -- page class
    "Title!!!" -- page title
  )

  local NewLabel = vgui.Create(
    "PLabel", -- Control name
    NewPage, -- Parent
    "Ass" -- Text
  )
  NewLabel:SetPos(5, 30) --x, y
  NewLabel:SetVisible(true)

  local NewButton = vgui.Create(
    "PButton", -- Control name
    NewPage, -- parent
    "Batman", -- Text
    NewPage, -- Action signal
    "Batman" -- Command name
  )
  NewButton:SetPos(5, 60) -- x, y

  -- We set a command hook.
  NewPage.OnCommand = function(self, command) -- self is required!
    -- If command equals Batman, print I am Batman
    if command == "Batman" then
      print("I am Batman")
    end
  end

  NewDialog:MakePopup() -- moves to center
end

concommand.Create(
  "OpenExamplePropertyDialog", -- Name
  OnOpenExamplePDialog, -- Function
  "Opens an example property dialog.", -- Description
  8 -- FCVAR.CLIENTDLL --Flags
)
