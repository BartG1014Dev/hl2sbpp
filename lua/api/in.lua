---@class IN
---Input actions, corresponding to engine key/button flags.
IN = {}

---Primary attack (e.g., left mouse button)
IN.ATTACK = 1

---Jump action
IN.JUMP = 2

---Duck / crouch action
IN.DUCK = 4

---Move forward
IN.FORWARD = 8

---Move backward
IN.BACK = 16

---Use / interact with objects
IN.USE = 32

---Cancel current action
IN.CANCEL = 64

---Move left
IN.LEFT = 128

---Move right
IN.RIGHT = 256

---Strafe left
IN.MOVELEFT = 512

---Strafe right
IN.MOVERIGHT = 1024

---Secondary attack (e.g., right mouse button)
IN.ATTACK2 = 2048

---Run / sprint
IN.RUN = 4096

---Reload weapon
IN.RELOAD = 8192

---Alternative action 1
IN.ALT1 = 16384

---Alternative action 2
IN.ALT2 = 32768

---Show scoreboard
IN.SCORE = 65536

---Enable speed modifier
IN.SPEED = 131072

---Walk slowly
IN.WALK = 262144

---Zoom / aim down sights
IN.ZOOM = 524288

---Select weapon slot 1
IN.WEAPON1 = 1048576

---Select weapon slot 2
IN.WEAPON2 = 2097152

---Bullrush action
IN.BULLRUSH = 4194304

---Primary grenade
IN.GRENADE1 = 8388608

---Secondary grenade
IN.GRENADE2 = 16777216
return IN
