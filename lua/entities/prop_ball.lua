--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

local Warning = dbg.Warning
local Msg = dbg.Msg

local sbox_can_eat_ball = ConVar("sbox_can_eat_ball", "0", FCVAR.REPLICATED)

function ENT:Initialize()
  self.NextBounce = 0
  if not _CLIENT then
    local allowPrecache = self.IsPrecacheAllowed()
    self.SetAllowPrecache(true)
    self.PrecacheModel("models/Combine_Helicopter/helicopter_bomb01.mdl")
    self:SetModel("models/Combine_Helicopter/helicopter_bomb01.mdl")
    self.SetAllowPrecache(allowPrecache)

    self:SetEffects(32) -- EF_NODRAW

    --self.LastVelocity = Vector(0,0,0)

    local ball = CreateEntityByName("env_sprite")
    ball:SetAbsOrigin(self:GetAbsOrigin())
    ball:SetParent(self, 1)
    ball:KeyValue("model", "sprites/sent_ball.vmt")
    ball:KeyValue(
      "rendercolor",
      tostring(random.RandomInt(0, 255))
        .. " "
        .. tostring(random.RandomInt(0, 255))
        .. " "
        .. tostring(random.RandomInt(0, 255))
    )
    ball:KeyValue("scale", tostring(random.RandomFloat(5, 10) / 50))
    ball:KeyValue("rendermode", "5")
    ball:KeyValue("GlowProxySize", "16")
    ball:Spawn()
    ball:Activate()
    ball:Think()
    ball:SetNextThink(gpGlobals.curtime() + 0.05)

    local pPhysicsObject = self:VPhysicsInitNormal(6, 0, false)
    if not pPhysicsObject then
      self:SetSolid(SolidType.NONE)
      self:SetMoveType(MoveType.NONE)
      Warning("ERROR!: Can't create physics object for " .. self:GetModelName() .. "\n")
    end

    if pPhysicsObject then
      --pPhysicsObject:SetDamping(0, 0)
      local bouncy = physprops:GetSurfaceIndex("ball")
      if bouncy and bouncy >= 0 then
        pPhysicsObject:SetMaterialIndex(bouncy)
      end

      pPhysicsObject:SetMass(1)
      pPhysicsObject:SetDragCoefficient(0, 0)
    end
  end
end

function ENT:StartTouch(pEntity)
  if not SERVER then return end
  if not sbox_can_eat_ball:GetBool() then return end

  if IsValid(pEntity) and pEntity:IsPlayer() then
    local pPlayer = ToHL2MPPlayer(pEntity)
    if not IsValid(pPlayer) then return end

    pPlayer:SetHealth(pPlayer:GetHealth() + 5)

    UTIL.Remove(self)
  end
end

