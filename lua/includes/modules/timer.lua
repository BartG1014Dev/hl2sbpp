-- timer.lua

local hook = require("hook")

Timer = {}
Timer.timers = {}

local nameCounter = 0

function Timer.Think()
  local now = CurTime()
  for name, t in pairs(Timer.timers) do
    if now >= t.nextTime then
      local ok, err = pcall(t.func)
      if not ok then
        print("Timer error:", err)
      end
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

function Timer.Add(name, delay, repetitions, func)
  if name == nil then
    nameCounter = nameCounter + 1
    name = "timer_" .. nameCounter
  end
  Timer.timers[name] = {
    delay = delay,
    repetitions = repetitions or 1,
    func = func,
    nextTime = CurTime() + delay, -- Changed from engine.Time() to CurTime()
  }
  return name
end

function Timer.Simple(delay, func)
  return Timer.Add(nil, delay, 1, func)
end

function Timer.Remove(name)
  Timer.timers[name] = nil
end

hook.add("Think", "TimerThink", function()
  -- Should be fine.
  Timer.Think()
end)

return Timer
