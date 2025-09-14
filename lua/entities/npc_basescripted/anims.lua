-- anims.lua

weaponRunActivities = {
    ["weapon_smg1"]      = ACT.HL2MP_RUN_SMG1,
    ["weapon_ar2"]       = ACT.HL2MP_RUN_AR2,
    ["weapon_shotgun"]   = ACT.HL2MP_RUN_SHOTGUN,
    ["weapon_crossbow"]  = ACT.HL2MP_RUN_CROSSBOW,
    ["weapon_frag"]      = ACT.HL2MP_RUN_GRENADE,
    ["weapon_rpg"]       = ACT.HL2MP_RUN_RPG,
    ["weapon_pistol"]    = ACT.HL2MP_RUN_PISTOL,
    ["weapon_357"]       = ACT.HL2MP_RUN_PISTOL,
    ["weapon_crowbar"]   = ACT.HL2MP_RUN_MELEE,
    ["weapon_stunstick"] = ACT.HL2MP_RUN_MELEE,
    ["weapon_slam"]      = ACT.HL2MP_RUN_SLAM,
    ["weapon_bugbait"]   = ACT.HL2MP_RUN_MELEE,
    ["weapon_physgun"]   = ACT.HL2MP_RUN_PHYSGUN,
    ["weapon_physcannon"]= ACT.HL2MP_RUN_PHYSGUN,
    ["weapon_toolgun"]   = ACT.HL2MP_RUN_PISTOL
}

weaponIdleActivities = {
    ["weapon_smg1"]      = ACT.HL2MP_IDLE_SMG1,
    ["weapon_ar2"]       = ACT.HL2MP_IDLE_AR2,
    ["weapon_shotgun"]   = ACT.HL2MP_IDLE_SHOTGUN,
    ["weapon_crossbow"]  = ACT.HL2MP_IDLE_CROSSBOW,
    ["weapon_frag"]      = ACT.HL2MP_IDLE_GRENADE,
    ["weapon_rpg"]       = ACT.HL2MP_IDLE_RPG,
    ["weapon_pistol"]    = ACT.HL2MP_IDLE_PISTOL,
    ["weapon_357"]       = ACT.HL2MP_IDLE_PISTOL,
    ["weapon_crowbar"]   = ACT.HL2MP_IDLE_MELEE,
    ["weapon_stunstick"] = ACT.HL2MP_IDLE_MELEE,
    ["weapon_slam"]      = ACT.HL2MP_IDLE_SLAM,
    ["weapon_bugbait"]   = ACT.HL2MP_IDLE_MELEE,
    ["weapon_physgun"]   = ACT.HL2MP_IDLE_PHYSGUN,
    ["weapon_physcannon"]= ACT.HL2MP_IDLE_PHYSGUN,
    ["weapon_toolgun"]   = ACT.HL2MP_IDLE_PISTOL
}

function GetRunActivity(weaponName)
    return weaponRunActivities[weaponName] or ACT.HL2MP_RUN 
end

function GetIdleActivity(weaponName)
    return weaponIdleActivities[weaponName] or ACT.HL2MP_IDLE
end
