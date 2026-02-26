--========== Copyright (C) 2025, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose: Initialize the base scripted weapon.
--
--===========================================================================--

includeC("shared.lua")
require("spaint")

ToolGunMode = CreateClientConVar("toolgun_mode", "Remover", false, false)

function SWEP:DrawLargeWeaponBox(bSelected, xpos, ypos, boxWide, boxTall, selectedColor, alpha, number) end

function SWEP:DrawModel(flags) end

function SWEP:DrawHUD()
    -- Too unoptimized.
    local toolName = ToolGunMode:GetString()
    local tool = self.Tools[toolName]
    local desc = tool and tool.Description or ""

    spaint.Texture({
        texture = "gui/gradient",
        pos = { -10, 20 },
        width = 600,
        height = 150,
        color = Color(0, 0, 0, 225) -- black
    })

    -- According to my calculations it should overlay and make it darker
    spaint.Texture({
        texture = "gui/gradient",
        pos = { -10, 145 },
        width = 600,
        height = 25,
        color = Color(0, 0, 0, 255) -- black
    })

    spaint.TextS({
        text = toolName,
        pos = { 55, 35 },
        font = "DefaultEvenLarger",
        color = Color(255, 255, 255)
    }, 1)

    if desc ~= "" then
        spaint.TextS({
            text = desc,
            pos = { 55, 115 },
            font = "DefaultLargeButSmaller",
            color = Color(200, 200, 200)
        }, 1)
    end

    spaint.TextS({
        text = "Reload to switch tools!",
        pos = { 55, 145 },
        font = "DefaultLargeButSmaller",
        color = Color(255, 255, 255)
    }, 1)
end

function SWEP:MuzzleFlash(pos1, angles, type, firstPerson) end
