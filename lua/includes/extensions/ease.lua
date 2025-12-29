local ease = {}

local sin, cos, pi, sqrt, abs, pow = 
    math.sin, math.cos, math.pi, math.sqrt, math.abs, math.pow

-------------------------------------------------------------
-- linear
-------------------------------------------------------------
function ease.linear(t)
    return t
end

-------------------------------------------------------------
-- quad
-------------------------------------------------------------
function ease.inQuad(t) return t * t end
function ease.outQuad(t) return t * (2 - t) end
function ease.inOutQuad(t)
    if t < 0.5 then return 2 * t * t end
    return -1 + (4 - 2 * t) * t
end

-------------------------------------------------------------
-- cubic
-------------------------------------------------------------
function ease.inCubic(t) return t^3 end
function ease.outCubic(t) return (t - 1)^3 + 1 end
function ease.inOutCubic(t)
    if t < 0.5 then return 4 * t^3 end
    return (t - 1) * (2*t - 2)^2 + 1
end

-------------------------------------------------------------
-- quart
-------------------------------------------------------------
function ease.inQuart(t) return t^4 end
function ease.outQuart(t) return 1 - (t - 1)^4 end
function ease.inOutQuart(t)
    if t < 0.5 then return 8 * t^4 end
    return 1 - 8 * (t - 1)^4
end

-------------------------------------------------------------
-- quint
-------------------------------------------------------------
function ease.inQuint(t) return t^5 end
function ease.outQuint(t) return 1 + (t - 1)^5 end
function ease.inOutQuint(t)
    if t < 0.5 then return 16 * t^5 end
    return 1 + 16 * (t - 1)^5
end

-------------------------------------------------------------
-- sine
-------------------------------------------------------------
function ease.inSine(t)
    return 1 - cos((t * pi) / 2)
end
function ease.outSine(t)
    return sin((t * pi) / 2)
end
function ease.inOutSine(t)
    return -(cos(pi * t) - 1) / 2
end

-------------------------------------------------------------
-- expo
-------------------------------------------------------------
function ease.inExpo(t)
    return t == 0 and 0 or pow(2, 10 * (t - 1))
end
function ease.outExpo(t)
    return t == 1 and 1 or 1 - pow(2, -10 * t)
end
function ease.inOutExpo(t)
    if t == 0 or t == 1 then return t end
    if t < 0.5 then return pow(2, 20 * t - 10) / 2 end
    return (2 - pow(2, -20 * t + 10)) / 2
end

-------------------------------------------------------------
-- circ
-------------------------------------------------------------
function ease.inCirc(t)
    return 1 - sqrt(1 - t * t)
end
function ease.outCirc(t)
    return sqrt(1 - (t - 1)^2)
end
function ease.inOutCirc(t)
    if t < 0.5 then return (1 - sqrt(1 - (2*t)^2)) / 2 end
    return (sqrt(1 - (2*t - 2)^2) + 1) / 2
end

-------------------------------------------------------------
-- back
-------------------------------------------------------------
local c1 = 1.70158
local c2 = c1 * 1.525

function ease.inBack(t)
    return c1 * t^3 - c1 * t^2
end
function ease.outBack(t)
    local t1 = t - 1
    return 1 + c1 * t1^3 + c1 * t1^2
end
function ease.inOutBack(t)
    if t < 0.5 then
        return (pow(2*t, 2) * ((c2 + 1) * 2*t - c2)) / 2
    else
        local t1 = 2*t - 2
        return (pow(t1, 2) * ((c2 + 1)*t1 + c2) + 2) / 2
    end
end

-------------------------------------------------------------
-- elastic
-------------------------------------------------------------
local c3 = (2 * pi) / 3

function ease.inElastic(t)
    if t == 0 or t == 1 then return t end
    return -pow(2, 10 * t - 10) * sin((t * 10 - 10.75) * c3)
end
function ease.outElastic(t)
    if t == 0 or t == 1 then return t end
    return pow(2, -10 * t) * sin((t * 10 - 0.75) * c3) + 1
end
function ease.inOutElastic(t)
    if t == 0 or t == 1 then return t end
    if t < 0.5 then
        return -(pow(2, 20*t - 10) * sin((20*t - 11.125) * (2*pi/4.5))) / 2
    end
    return (pow(2, -20*t + 10) * sin((20*t - 11.125) * (2*pi/4.5))) / 2 + 1
end

-------------------------------------------------------------
-- bounce
-------------------------------------------------------------
local function bounceOut(t)
    local n1, d1 = 7.5625, 2.75
    if t < 1 / d1 then
        return n1 * t * t
    elseif t < 2 / d1 then
        t = t - 1.5 / d1
        return n1 * t * t + 0.75
    elseif t < 2.5 / d1 then
        t = t - 2.25 / d1
        return n1 * t * t + 0.9375
    else
        t = t - 2.625 / d1
        return n1 * t * t + 0.984375
    end
end

function ease.inBounce(t)
    return 1 - bounceOut(1 - t)
end

function ease.outBounce(t)
    return bounceOut(t)
end

function ease.inOutBounce(t)
    if t < 0.5 then
        return (1 - bounceOut(1 - 2*t)) / 2
    end
    return (1 + bounceOut(2*t - 1)) / 2
end

return ease
