-- weapons/weapon_toolgun/tools/duplicator.lua
TOOL.Name = "Duplicator"
TOOL.Description = "Copy an entity (primary) and paste it (secondary)."
TOOL.CopiedData = nil

local function IsValidEntity(ent)
  return IsValid(ent) and not ent:IsPlayer()
end

function TOOL:PrimaryAttack(swep, player, trace)
  --if CLIENT then return end

  local ent = trace.m_pEnt
  local phys = ent:VPhysicsGetObject()

  if not IsValidEntity(ent) then
    Warning("Nah.\n")
    return
  end

  -- store a snapshot (avoid storing the actual entity pointer)
  self.CopiedData = {
    class = ent:GetClassname() or "prop_physics",
    model = ent:GetModelName() or nil,
    angles = ent:GetAbsAngles(),
    solid = ent:GetSolid() or nil,
    moveType = ent:GetMoveType() or nil,
    phys = phys ~= NULL and {
      mass = phys:GetMass(),
      velocity = phys:GetVelocity(),
    } or nil,
  }

  -- HACKHACK
  effect.Dissolve(ent, "sprites/blueglow1.vmt", gpGlobals.curtime(), 0)

  engine.ClientCommand(swep:GetOwner(), "hint_add \"Entity copied: " .. self.CopiedData.class .. "\" 2" )
end

function TOOL:SecondaryAttack(swep, player, trace)
  if not self.CopiedData then
    Warning("Nothing copied\n")
    return
  end

  swep:SendWeaponAnim(ACT.VM_PRIMARYATTACK)

  -- @ThePixelMoon: hacky
  swep:EmitSound("Airboat.FireGunRevDown")

  ToHL2MPPlayer(player):DoAnimationEvent(PlayerAnimEvent.ATTACK_PRIMARY)

  local data = self.CopiedData

  local spawnPos
  if trace and trace.m_pEnt and trace.fraction and trace.fraction < 1 then
    local offset = Vector(0, 0, 8)
    spawnPos = trace.endpos + offset
  else
    local forward = player:GetAimVector()
    spawnPos = player:EyePos() + forward * 100
  end

  -- try to create the same class; fall back to prop_physics if it fails and we have a model
  local ent

  ent = CreateEntityByName(data.class)
  if not IsValidEntity(ent) and data.model then
    ent = CreateEntityByName("prop_physics")
  end

  if not IsValidEntity(ent) then
    Warning("Failed to create entity (" .. tostring(data.class) .. ")\n")
    return
  end

  if data.model and ent.SetModel then
    ent:SetModel(data.model)
  end

  ent:SetAbsOrigin(spawnPos)
  ent:SetAbsAngles(data.angles or QAngle(0, 0, 0))
  --ent:SetSkin(data.skin or 0)

  if data.solid and ent.SetSolid then
    ent:SetSolid(data.solid)
  end
  if data.moveType and ent.SetMoveType then
    ent:SetMoveType(data.moveType)
  end

  ent:Spawn()
  ent:Activate()

  -- try to recreate physics properties
  if data.phys and ent:VPhysicsGetObject() then
    local phys = ent:VPhysicsGetObject()
    if data.phys.mass and phys.SetMass then
      pcall(function()
        phys:SetMass(data.phys.mass)
      end)
    end
    if data.phys.velocity and phys.SetVelocityInstantaneous then
      pcall(function()
        phys:SetVelocityInstantaneous(data.phys.velocity, data.phys.velocity)
      end)
    elseif data.phys.velocity and phys.SetVelocity then
      pcall(function()
        phys:SetVelocity(data.phys.velocity, data.phys.velocity)
      end)
    end
    phys:Wake()
  end
end
