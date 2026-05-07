--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose: Initialize the base scripted weapon.
--
--===========================================================================--

includeC("shared.lua")

---Called when in weapon selection state
---@param bSelected boolean
---@param xpos integer
---@param ypos integer
---@param boxWide integer
---@param boxTall integer
---@param selectedColor Color
---@param alpha number
---@param number integer
function SWEP:DrawLargeWeaponBox(bSelected, xpos, ypos, boxWide, boxTall, selectedColor, alpha, number) end

---@param flags integer
function SWEP:DrawModel(flags) end

---Play muzzle flash
---@param pos1 any
---@param angles any
---@param type any
---@param firstPerson any
function SWEP:MuzzleFlash(pos1, angles, type, firstPerson) end

function SWEP:DrawHUD() end

---Override the player view (NOT the viewmodel)
---@param player CHL2MP_Player
---@param eyeOrigin Vector
---@param eyeAngles QAngle
---@param fov number
---@param zNear number
---@param zFar number
---@return Vector
---@return QAngle
---@return number
---@return number
---@return number
function SWEP:CalcView(player, eyeOrigin, eyeAngles, fov, zNear, zFar)
    return eyeOrigin, eyeAngles, fov, zNear, zFar
end
