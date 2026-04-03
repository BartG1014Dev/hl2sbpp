--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose: Apply decals on surfaces/entities
--
--===========================================================================--

TOOL.Name = "Decal"
TOOL.Description = "Applies decals like blood, scorch, etc. Change decals on secondary fire."

TOOL.Current = 1

TOOL.Decals = {
  [1] = "Blood",
  [2] = "YellowBlood",
  [3] = "Scorch",
  [4] = "BeerSplash",
  [5] = "ExplosiveGunshot",
  [6] = "BirdPoop",
  [7] = "PaintSplatPink", -- white splat
  [8] = "ManhackCut",
  [9] = "FadingScorch",
  [10] = "AntlionSplat",
  [11] = "Splash.Large",
  [12] = "BulletProof",
  [13] = "GlassBreak",
  [14] = "Impact.Metal",
  [15] = "Impact.Sand",
  [16] = "Impact.BloodyFlesh",
  [17] = "Impact.Antlion",
  [18] = "Impact.Glass",
  [19] = "Impact.Wood",
  [20] = "Impact.Concrete",
}

function TOOL:PrimaryAttack(swep, player, trace)
  local decal = self.Decals[self.Current] or "Blood"
  UTIL.DecalTrace(trace, decal)
end

function TOOL:SecondaryAttack(swep, player, trace)
  self.Current = self.Current + 1
  if self.Current > #self.Decals then
    self.Current = 1
  end

  local name = self.Decals[self.Current] or "Unknown"

  if SERVER then
    UTIL.SayText("Current Decal: " .. name .. " (" .. self.Current .. ")\n", player)
  end
end
