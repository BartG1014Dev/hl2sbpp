--========== Copyleft � 2010, Team Sandbox, Some rights reserved. ===========--
--
-- Purpose: Initialize the base scripted weapon.
--
--===========================================================================--

SWEP.printname				= "TOOLGUN"
SWEP.viewmodel				= "models/weapons/c_toolgun.mdl"
SWEP.playermodel			= "models/weapons/w_pistol.mdl"
SWEP.anim_prefix			= "smg2"
SWEP.bucket					= 2
SWEP.bucket_position		= 2

SWEP.clip_size				= -1
SWEP.clip2_size				= -1
SWEP.default_clip			= -1
SWEP.default_clip2			= -1
SWEP.primary_ammo			= "None"
SWEP.secondary_ammo			= "None"

SWEP.weight					= 7
SWEP.item_flags				= 0

SWEP.damage					= 0

SWEP.SoundData				=
{
	empty					= "",
	single_shot				= "Airboat.FireGunRevDown"
}

SWEP.ShowUsageHint			= false
SWEP.AutoSwitchTo			= true
SWEP.AutoSwitchFrom			= true
SWEP.BuiltRightHanded		= true
SWEP.AllowFlipping			= true
SWEP.MeleeWeapon			= true -- @ThePixelMoon: hacky hack
SWEP.UseHands				= true

SWEP.DrawCrosshair = true
SWEP.DrawAmmo = false

SWEP.m_acttable            =
{
	{ ACT.MP_STAND_IDLE,				ACT.HL2MP_IDLE_PISTOL,					false },
	{ ACT.MP_CROUCH_IDLE,				ACT.HL2MP_IDLE_CROUCH_PISTOL,			false },
	{ ACT.MP_RUN,						ACT.HL2MP_RUN_PISTOL,					false },
	{ ACT.MP_CROUCHWALK,				ACT.HL2MP_WALK_CROUCH_PISTOL,			false },
	{ ACT.MP_ATTACK_STAND_PRIMARYFIRE,	ACT.HL2MP_GESTURE_RANGE_ATTACK_PISTOL,	false },
	{ ACT.MP_ATTACK_CROUCH_PRIMARYFIRE,	ACT.HL2MP_GESTURE_RANGE_ATTACK_PISTOL,	false },
	{ ACT.MP_RELOAD_STAND,				ACT.HL2MP_GESTURE_RELOAD_PISTOL,		false },
	{ ACT.MP_RELOAD_CROUCH,				ACT.HL2MP_GESTURE_RELOAD_PISTOL,		false },
	{ ACT.MP_JUMP,						ACT.HL2MP_JUMP_PISTOL,					false },
};

SWEP.Tools = {}

function SWEP:RegisterTool(name, tbl)
    self.Tools[name] = tbl
end

function SWEP:GetActiveTool()
    return self.Tools[self.CurrentTool or ""] or nil
end

function SWEP:Initialize()
	self.m_bReloadsSingly	= false;
	self.m_bFiresUnderwater	= true;
	self.CurrentTool = nil;

	self:LoadTools()
end

function SWEP:Precache()
end

function SWEP:PrimaryAttack()
	local pPlayer = self:GetOwner()

	self.m_flNextPrimaryAttack = gpGlobals.curtime() + 0.15;
	
	self:SendWeaponAnim( ACT.VM_PRIMARYATTACK );

	-- @ThePixelMoon: hacky
	self:EmitSound( "Airboat.FireGunRevDown" )
	 
	ToHL2MPPlayer(pPlayer):DoAnimationEvent( PlayerAnimEvent.ATTACK_PRIMARY );

	local vForward 		= Vector()
	local vRight 		= Vector()
	local vUp  			= Vector()
	local vecEye 		= pPlayer:EyePosition();
	pPlayer:EyeVectors( vForward, vRight, vUp );
	
	local tr = trace_t()
	MASK_SHOT = _E.MASK.SHOT
	UTIL.TraceLine( vecEye, vecEye + vForward * 56755, MASK_SHOT, pPlayer, 0, tr );

	-- @ThePixelMoon: GOD FUCKING DAMN IT I HATE YOU SO MUCH LUA I WISH I FUCKING
	-- NEVER DID THAT BUT THIS PIECE OF SHIT DIDNT WORK AND THE ONLY WAY FOR IT TO
	-- WORK IS TO DO THIS FUCKING MONSTROSITY
	if SERVER then engine.ServerCommand("ent_create env_spark; ent_fire env_spark SparkOnce; wait; wait; wait; wait; ent_fire env_spark kill\n")
	else engine.ClientCmd_Unrestricted("ent_create env_spark; ent_fire env_spark SparkOnce; wait; wait; wait; wait; ent_fire env_spark kill\n") end

    local tool = self.Tools[self.CurrentTool]
    if not tool then return end

    if tool.PrimaryAttack then
        tool:PrimaryAttack(self, pPlayer, tr)
    end
end

function SWEP:CycleTool()
    local keys = {}
    for k, _ in pairs(self.Tools) do
        table.insert(keys, k)
    end
    table.sort(keys)

    if #keys == 0 then
        DevWarning("No tools loaded\n")
        return
    end

    local function KeyFromValue(tbl, value)
        for k, v in pairs(tbl) do
            if v == value then
                return k
            end
        end
        return nil
    end

    local idx = KeyFromValue(keys, self.CurrentTool) or 0
    idx = idx + 1
    if idx > #keys then idx = 1 end

    self.CurrentTool = keys[idx]

    local movehelper = MoveHelper()
    if movehelper then
        local tool = self:GetActiveTool()
        local toolName = self.CurrentTool or "none"
        local desc = tool and tool.Description or ""

        movehelper:Con_NPrintf(1, string.format("Mode: %s", toolName))
        if desc ~= "" then
            movehelper:Con_NPrintf(2, desc)
        end
    end

    --print("Current tool: " .. (self.CurrentTool or "none"))
end

function SWEP:SecondaryAttack()
	local pPlayer = self:GetOwner()

    if not next(self.Tools) then
        DevWarning("Tools not loaded yet\n")
        return
    end
	
	local vForward 		= Vector()
	local vRight 		= Vector()
	local vUp  			= Vector()
	local vecEye 		= pPlayer:EyePosition();
	pPlayer:EyeVectors( vForward, vRight, vUp );
	
	local tr = trace_t()
	MASK_SHOT = _E.MASK.SHOT
	UTIL.TraceLine( vecEye, vecEye + vForward * 56755, MASK_SHOT, pPlayer, 0, tr );

    local tool = self.Tools[self.CurrentTool]
    if not tool then return end

	if tool.SecondaryAttack then
		tool:SecondaryAttack(self, pPlayer, tr)
	end
	
	self:CycleTool()

	self.m_flNextSecondaryAttack = gpGlobals.curtime() + 0.5;

	return true
end

function SWEP:Reload()
	return true;
end

function SWEP:Think()
end

function SWEP:CanHolster()
end

function SWEP:Deploy()
end

function SWEP:LoadTools()
	local toolFiles = {
		"tools/dissolver.lua",
		"tools/remover.lua",
		"tools/duplicator.lua",
		"tools/color.lua",
		"tools/igniter.lua",
		"tools/explode.lua",
		"tools/light.lua",
		"tools/balloon.lua"
		-- TODO: add more here
	}

	for _, path in ipairs(toolFiles) do
		--if filesystem.FileExists("lua/" .. path, "MOD") then
			TOOL = {}
			local ok, err = pcall(function()
				includeC(path)
			end)

			if ok then
				if TOOL.Name then
					self:RegisterTool(TOOL.Name, TOOL)
					print("Loaded tool:", TOOL.Name)
				else
					print("Tool did not set TOOL.Name:", path)
				end
			else
				print("Error loading tool:", path, err)
			end

			TOOL = nil
		--else
		--	print("Cannot open tool file:", path)
		--end
	end

	if not self.CurrentTool or not self.Tools[self.CurrentTool] then
		for k, _ in pairs(self.Tools) do
			self.CurrentTool = k
			break
		end
	end
end

function SWEP:GetDrawActivity()
	return ACT.VM_DRAW;
end

function SWEP:Holster( pSwitchingTo )
end

function SWEP:ItemPostFrame()
    local movehelper = MoveHelper()
    if not movehelper then return end
    movehelper:Con_NPrintf(4, "Right click to switch mode")
end

function SWEP:ItemBusyFrame()
end

function SWEP:DoImpactEffect()
end
