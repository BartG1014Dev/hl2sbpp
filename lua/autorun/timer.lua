-- timer.lua
local hook = require("hook")

Timer = {}
Timer.timers = {}

function Timer.Think()
  local now = CurTime()
  for name, t in pairs(Timer.timers) do
    if now >= t.nextTime then
      local ok, err = pcall(t.func)
      if not ok then print("Timer error:", err) end

      if t.repetitions == 0 then
        t.nextTime = now + t.delay
      elseif t.repetitions > 1 then
        t.repetitions = t.repetitions - 1
        t.nextTime = now + t.delay
      else
        Timer.timers[name] = nil
      end
    end
  end
end

--hook.Add("Think", "TimerAutoThink", Timer.Think)

function Timer.Add(name, delay, repetitions, func)
  if type(name) == "function" then
    func, repetitions, delay, name = name, repetitions, delay, tostring(math.random(1,1e9))
  end
  Timer.timers[name] = {
    delay = delay,
    repetitions = repetitions or 1,
    func = func,
    nextTime = engine.Time() + delay
  }
  return name
end

function Timer.Simple(delay, func)
  return Timer.Add(nil, delay, 1, func)
end

function Timer.Remove(name)
  Timer.timers[name] = nil
end
