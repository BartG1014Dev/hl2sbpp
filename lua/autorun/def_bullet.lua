-- def_bullet.lua

local function lbs2kg(lbs)
    return lbs * 0.453592
end

local function BULLET_MASS_GRAINS_TO_LB(grains)
    return 0.002285 * grains / 16.0
end

local function BULLET_MASS_GRAINS_TO_KG(grains)
    return lbs2kg(BULLET_MASS_GRAINS_TO_LB(grains))
end

BULLET_IMPULSE_EXAGGERATION = 3.5

function BULLET_IMPULSE(grains, ftpersec)
    return ftpersec * 12 * BULLET_MASS_GRAINS_TO_KG(grains) * BULLET_IMPULSE_EXAGGERATION
end
