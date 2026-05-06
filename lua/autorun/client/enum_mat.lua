--========== Copyright © 2026, Team HL2SB++, All rights reserved. ===========--
--
-- Purpose:
--
--===========================================================================--

---@class MATERIAL_VAR
MATERIAL_VAR = {
    DEBUG                       = bitty.lshift(1, 0),
    NO_DEBUG_OVERRIDE           = bitty.lshift(1, 1),
    NO_DRAW                     = bitty.lshift(1, 2),
    USE_IN_FILLRATE_MODE        = bitty.lshift(1, 3),

    VERTEXCOLOR                 = bitty.lshift(1, 4),
    VERTEXALPHA                 = bitty.lshift(1, 5),
    SELFILLUM                   = bitty.lshift(1, 6),
    ADDITIVE                    = bitty.lshift(1, 7),
    ALPHATEST                   = bitty.lshift(1, 8),
    MULTIPASS                   = bitty.lshift(1, 9),
    ZNEARER                     = bitty.lshift(1, 10),
    MODEL                       = bitty.lshift(1, 11),
    FLAT                        = bitty.lshift(1, 12),
    NOCULL                      = bitty.lshift(1, 13),
    NOFOG                       = bitty.lshift(1, 14),
    IGNOREZ                     = bitty.lshift(1, 15),
    DECAL                       = bitty.lshift(1, 16),
    ENVMAPSPHERE                = bitty.lshift(1, 17),
    NOALPHAMOD                  = bitty.lshift(1, 18),
    ENVMAPCAMERASPACE           = bitty.lshift(1, 19),
    BASEALPHAENVMAPMASK         = bitty.lshift(1, 20),
    TRANSLUCENT                 = bitty.lshift(1, 21),
    NORMALMAPALPHAENVMAPMASK    = bitty.lshift(1, 22),
    NEEDS_SOFTWARE_SKINNING     = bitty.lshift(1, 23),
    OPAQUETEXTURE               = bitty.lshift(1, 24),
    ENVMAPMODE                  = bitty.lshift(1, 25),
    SUPPRESS_DECALS             = bitty.lshift(1, 26),
    HALFLAMBERT                 = bitty.lshift(1, 27),
    WIREFRAME                   = bitty.lshift(1, 28),
    ALLOWALPHATOCOVERAGE        = bitty.lshift(1, 29),
    IGNORE_ALPHA_MODULATION     = bitty.lshift(1, 30),
}

---@class RT_SIZE
RT_SIZE = {
    NO_CHANGE                    = 0,
    DEFAULT                      = 1,
    PICMIP                       = 2,
    HDR                          = 3,
    FULL_FRAME_BUFFER            = 4,
    OFFSCREEN                    = 5,
    FULL_FRAME_BUFFER_ROUNDED_UP = 6,
}

---@class MATERIAL_RT_DEPTH
MATERIAL_RT_DEPTH = {
    SHARED   = 0,
    SEPARATE = 1,
    NONE     = 2,
    ONLY     = 3,
}

---@class IMAGE_FORMAT
IMAGE_FORMAT = {
    UNKNOWN            = -1,
    RGBA8888           = 0,
    ABGR8888           = 1,
    RGB888             = 2,
    BGR888             = 3,
    RGB565             = 4,
    I8                 = 5,
    IA88               = 6,
    P8                 = 7,
    A8                 = 8,
    RGB888_BLUESCREEN  = 9,
    BGR888_BLUESCREEN  = 10,
    ARGB8888           = 11,
    BGRA8888           = 12,
    DXT1               = 13,
    DXT3               = 14,
    DXT5               = 15,

    ETC2_RGB8          = 16,
    ETC2_RGBA8         = 17,

    BGRX8888           = 18,
    BGR565             = 19,
    BGRX5551           = 20,
    BGRA4444           = 21,
    DXT1_ONEBITALPHA   = 22,
    BGRA5551           = 23,
    UV88               = 24,
    UVWQ8888           = 25,
    RGBA16161616F      = 26, -- 16-bit float per channel HDR. Most common HDR RT
    RGBA16161616       = 27, -- 16-bit uint per channel
    UVLX8888           = 28,
    R32F               = 29, -- Single-channel 32-bit float
    RGB323232F         = 30, -- 3x32-bit float
    RGBA32323232F      = 31, -- 4x32-bit float
    NV_DST16           = 32, -- NVIDIA shadow depth tex
    NV_DST24           = 33,
    NV_INTZ            = 34, -- NVIDIA INTZ depth-stencil readable
    NV_RAWZ            = 35,
    ATI_DST16          = 36,
    ATI_DST24          = 37,
    NV_NULL            = 38, -- Dummy null texture (zero VRAM)
    ATI2N              = 39, -- ATI2N / DXN compressed normal map
    ATI1N              = 40, -- ATI1N compressed single-channel
    DXT1_RUNTIME       = 41,
    DXT5_RUNTIME       = 42,
}

---@class TEXTUREFLAGS
TEXTUREFLAGS = {
    POINTSAMPLE                       = 0x00000001,
    TRILINEAR                         = 0x00000002,
    CLAMPS                            = 0x00000004,
    CLAMPT                            = 0x00000008,
    ANISOTROPIC                       = 0x00000010,
    HINT_DXT5                         = 0x00000020,
    PWL_CORRECTED                     = 0x00000040,
    NORMAL                            = 0x00000080,
    NOMIP                             = 0x00000100,
    NOLOD                             = 0x00000200,
    ALL_MIPS                          = 0x00000400,
    PROCEDURAL                        = 0x00000800,
    ONEBITALPHA                       = 0x00001000,
    EIGHTBITALPHA                     = 0x00002000,
    ENVMAP                            = 0x00004000,
    RENDERTARGET                      = 0x00008000,
    DEPTHRENDERTARGET                 = 0x00010000,
    NODEBUGOVERRIDE                   = 0x00020000,
    SINGLECOPY                        = 0x00040000,
    PRE_SRGB                          = 0x00080000,
    NODEPTHBUFFER                     = 0x00800000,
    CLAMPU                            = 0x02000000,
    VERTEXTEXTURE                     = 0x04000000,
    SSBUMP                            = 0x08000000,
    BORDER                            = 0x20000000,
}

---@class MaterialVarType
MaterialVarType = { 
	TYPE_FLOAT = 0,
	TYPE_STRING = 1,
	TYPE_VECTOR = 2,
	TYPE_TEXTURE = 3,
	TYPE_INT = 4,
	TYPE_FOURCC = 5,
	TYPE_UNDEFINED = 6,
	TYPE_MATRIX = 7,
	TYPE_MATERIAL = 8,
};

---@type integer
MATERIAL_POINTS               = 0
---@type integer
MATERIAL_LINES                = 1
---@type integer
MATERIAL_TRIANGLES            = 2
---@type integer
MATERIAL_TRIANGLE_STRIP       = 3
---@type integer
MATERIAL_LINE_STRIP           = 4
---@type integer
MATERIAL_LINE_LOOP            = 5
---@type integer
MATERIAL_POLYGON              = 6
---@type integer
MATERIAL_QUADS                = 7
---@type integer
MATERIAL_INSTANCED_QUADS      = 8
---@type integer
MATERIAL_HETEROGENOUS         = 9

---@type integer
MATERIAL_MODEL      = 0
---@type integer
MATERIAL_VIEW       = 1
---@type integer
MATERIAL_PROJECTION = 2

---@type integer
MATERIAL_CULLMODE_CCW = 0
---@type integer
MATERIAL_CULLMODE_CW  = 1
