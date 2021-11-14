
if not Bypass then Bypass = "limbs" end
HumanDied = false

CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..Part0.Name
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..Part0.Name
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 67752;
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "AthP_"..Part0.Name
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "AthP_"..Part0.Name
	local AttachmentC=Instance.new('Attachment',Part1); AttachmentC.Name = "AthO_"..Part0.Name
	local AttachmentD=Instance.new('Attachment',Part0); AttachmentD.Name = "AthO_"..Part0.Name
	AttachmentC.Orientation = Angle
	AttachmentA.Position = Position
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentC;
	AlignOri.Attachment0 = AttachmentD;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
end

local eeeee = game.Players.LocalPlayer.Character
local naming = 1

for _,v in pairs(eeeee:GetDescendants()) do
	if v:IsA("Accessory") then
	if v.Name == "MeshPartAccessory" then
	v.Name = "MeshPartAccessory"..naming
	
	naming += 1
	end
	end
end

coroutine.wrap(function()
	local player = game.Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:wait()
	if sethiddenproperty then
		while true do
			game:GetService("RunService").RenderStepped:Wait()
			settings().Physics.AllowSleep = false
			local TBL = game:GetService("Players"):GetChildren() 
			for _ = 1,#TBL do local Players = TBL[_]
				if Players ~= game:GetService("Players").LocalPlayer then
					Players.MaximumSimulationRadius = 0
					sethiddenproperty(Players,"SimulationRadius",0) 
				end 
			end
			game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)
			sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.pow(math.huge,math.huge)*math.huge)
			if HumanDied then break end
		end
	else
		while true do
			game:GetService("RunService").RenderStepped:Wait()
			settings().Physics.AllowSleep = false
			local TBL = game:GetService("Players"):GetChildren() 
			for _ = 1,#TBL do local Players = TBL[_]
				if Players ~= game:GetService("Players").LocalPlayer then
					Players.MaximumSimulationRadius = 0
				end 
			end
			game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)
			if HumanDied then break end
		end
	end
end)()

if game:GetService("Players").LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
if Bypass == "limbs" then --------------------------------------------------------------------------------------------------------------------
	game:GetService("Players").LocalPlayer["Character"].Archivable = true 
	local CloneChar = game:GetService("Players").LocalPlayer["Character"]:Clone()
	CloneChar.Parent = workspace 
	CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame * CFrame.new(0,2,0)
	wait() 
	CloneChar.Humanoid.BreakJointsOnDeath = false
	workspace.Camera.CameraSubject = CloneChar.Humanoid
	CloneChar.Name = "non" 
	CloneChar.Humanoid.DisplayDistanceType = "None"
	if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face"):Destroy() end

	local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]
	DeadChar.HumanoidRootPart:Destroy()

	local LVecPart = Instance.new("Part", workspace) LVecPart.CanCollide = false LVecPart.Transparency = 1
	local CONVEC
	local function VECTORUNIT()
	if HumanDied then CONVEC:Disconnect(); return end
	local lookVec = workspace.Camera.CFrame.lookVector
	local Root = CloneChar["HumanoidRootPart"]
	LVecPart.Position = Root.Position
	LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
	end
	CONVEC = game:GetService("RunService").Heartbeat:Connect(VECTORUNIT)

	local CONDOWN
	local WDown, ADown, SDown, DDown, SpaceDown = false, false, false, false, false
	local function KEYDOWN(_,Processed) 
	if HumanDied then CONDOWN:Disconnect(); return end
	if Processed ~= true then
	local Key = _.KeyCode
	if Key == Enum.KeyCode.W then
	WDown = true end
	if Key == Enum.KeyCode.A then
	ADown = true end
	if Key == Enum.KeyCode.S then
	SDown = true end
	if Key == Enum.KeyCode.D then
	DDown = true end
	if Key == Enum.KeyCode.Space then
	SpaceDown = true end end end
	CONDOWN = game:GetService("UserInputService").InputBegan:Connect(KEYDOWN)

	local CONUP
	local function KEYUP(_)
	if HumanDied then CONUP:Disconnect(); return end
	local Key = _.KeyCode
	if Key == Enum.KeyCode.W then
	WDown = false end
	if Key == Enum.KeyCode.A then
	ADown = false end
	if Key == Enum.KeyCode.S then
	SDown = false end
	if Key == Enum.KeyCode.D then
	DDown = false end
	if Key == Enum.KeyCode.Space then
	SpaceDown = false end end
	CONUP = game:GetService("UserInputService").InputEnded:Connect(KEYUP)

	local function MoveClone(X,Y,Z)
	LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
	workspace["non"].Humanoid.WalkToPoint = LVecPart.Position
	end

	coroutine.wrap(function() 
	while true do game:GetService("RunService").RenderStepped:Wait()
	if HumanDied then break end
	if WDown then MoveClone(0,0,1e4) end
	if ADown then MoveClone(1e4,0,0) end
	if SDown then MoveClone(0,0,-1e4) end
	if DDown then MoveClone(-1e4,0,0) end
	if SpaceDown then CloneChar["Humanoid"].Jump = true end
	if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
	workspace["non"].Humanoid.WalkToPoint = workspace["non"].HumanoidRootPart.Position end
	end 
	end)()

	local con
	function UnCollide()
		if HumanDied then con:Disconnect(); return end
		for _,Parts in next, CloneChar:GetDescendants() do
			if Parts:IsA("BasePart") then
				Parts.CanCollide = false 
			end 
		end
		for _,Parts in next, DeadChar:GetDescendants() do
			if Parts:IsA("BasePart") then
			Parts.CanCollide = false
			end 
		end 
	end
	con = game:GetService("RunService").Stepped:Connect(UnCollide)

	local resetBindable = Instance.new("BindableEvent")
	resetBindable.Event:connect(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
		resetBindable:Destroy()
		pcall(function()
			CloneChar.Humanoid.Health = 0
			DeadChar.Humanoid.Health = 0
		end)
	end)
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

	coroutine.wrap(function()
		while true do
			game:GetService("RunService").RenderStepped:wait()
			if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health <= 0 or not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChild("Humanoid") or DeadChar:FindFirstChild("Humanoid").Health <= 0 then 
				HumanDied = true
				pcall(function()
					game.Players.LocalPlayer.Character = CloneChar
					CloneChar:Destroy()
					game.Players.LocalPlayer.Character = DeadChar
					if resetBindable then
						game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
						resetBindable:Destroy()
					end
					DeadChar.Humanoid.Health = 0
				end)
				break
			end		
		end
	end)()

	SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["Torso"],CloneChar["Torso"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["Left Arm"],CloneChar["Left Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["Right Arm"],CloneChar["Right Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["Left Leg"],CloneChar["Left Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["Right Leg"],CloneChar["Right Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))

	coroutine.wrap(function()
		while true do
			game:GetService("RunService").RenderStepped:wait()
			if HumanDied then break end
			DeadChar["Torso"].CFrame = CloneChar["Torso"].CFrame
		end
	end)()

	for _,v in next, DeadChar:GetChildren() do
		if v:IsA("Accessory") then
			SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
		end
	end

	for _,BodyParts in next, CloneChar:GetDescendants() do
	if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
	BodyParts.Transparency = 1 end end

	DeadChar.Torso["Left Shoulder"]:Destroy()
	DeadChar.Torso["Right Shoulder"]:Destroy()
	DeadChar.Torso["Left Hip"]:Destroy()
	DeadChar.Torso["Right Hip"]:Destroy()

elseif Bypass == "death" then --------------------------------------------------------------------------------------------------------------------
	game:GetService("Players").LocalPlayer["Character"].Archivable = true 
	local CloneChar = game:GetService("Players").LocalPlayer["Character"]:Clone()
	game:GetService("Players").LocalPlayer["Character"].Humanoid.WalkSpeed = 0 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.JumpPower = 0 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.AutoRotate = false
	local FalseChar = Instance.new("Model", workspace); FalseChar.Name = ""
	Instance.new("Part",FalseChar).Name = "Head" 
	Instance.new("Part",FalseChar).Name = "Torso" 
	Instance.new("Humanoid",FalseChar).Name = "Humanoid"
	game:GetService("Players").LocalPlayer["Character"] = FalseChar
	game:GetService("Players").LocalPlayer["Character"].Humanoid.Name = "FalseHumanoid"
	local Clone = game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Clone()
	Clone.Parent = game:GetService("Players").LocalPlayer["Character"]
	Clone.Name = "Humanoid"
	game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Destroy() 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0 
	game:GetService("Players").LocalPlayer["Character"] = workspace[game:GetService("Players").LocalPlayer.Name] 
	wait(5.65) 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0
	CloneChar.Parent = workspace 
	CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame * CFrame.new(0,2,0)
	wait() 
	CloneChar.Humanoid.BreakJointsOnDeath = false
	workspace.Camera.CameraSubject = CloneChar.Humanoid 
	CloneChar.Name = "non" 
	CloneChar.Humanoid.DisplayDistanceType = "None"
	if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face"):Destroy() end
	

	FalseChar:Destroy()

	local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]

	local LVecPart = Instance.new("Part", workspace) LVecPart.CanCollide = false LVecPart.Transparency = 1
	local CONVEC
	local function VECTORUNIT()
	if HumanDied then CONVEC:Disconnect(); return end
	local lookVec = workspace.Camera.CFrame.lookVector
	local Root = CloneChar["HumanoidRootPart"]
	LVecPart.Position = Root.Position
	LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
	end
	CONVEC = game:GetService("RunService").Heartbeat:Connect(VECTORUNIT)

	local CONDOWN
	local WDown, ADown, SDown, DDown, SpaceDown = false, false, false, false, false
	local function KEYDOWN(_,Processed) 
	if HumanDied then CONDOWN:Disconnect(); return end
	if Processed ~= true then
	local Key = _.KeyCode
	if Key == Enum.KeyCode.W then
	WDown = true end
	if Key == Enum.KeyCode.A then
	ADown = true end
	if Key == Enum.KeyCode.S then
	SDown = true end
	if Key == Enum.KeyCode.D then
	DDown = true end
	if Key == Enum.KeyCode.Space then
	SpaceDown = true end end end
	CONDOWN = game:GetService("UserInputService").InputBegan:Connect(KEYDOWN)

	local CONUP
	local function KEYUP(_)
	if HumanDied then CONUP:Disconnect(); return end
	local Key = _.KeyCode
	if Key == Enum.KeyCode.W then
	WDown = false end
	if Key == Enum.KeyCode.A then
	ADown = false end
	if Key == Enum.KeyCode.S then
	SDown = false end
	if Key == Enum.KeyCode.D then
	DDown = false end
	if Key == Enum.KeyCode.Space then
	SpaceDown = false end end
	CONUP = game:GetService("UserInputService").InputEnded:Connect(KEYUP)

	local function MoveClone(X,Y,Z)
	LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
	workspace["non"].Humanoid.WalkToPoint = LVecPart.Position
	end

	coroutine.wrap(function() 
	while true do game:GetService("RunService").RenderStepped:Wait()
	if HumanDied then break end
	if WDown then MoveClone(0,0,1e4) end
	if ADown then MoveClone(1e4,0,0) end
	if SDown then MoveClone(0,0,-1e4) end
	if DDown then MoveClone(-1e4,0,0) end
	if SpaceDown then CloneChar["Humanoid"].Jump = true end
	if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
	workspace["non"].Humanoid.WalkToPoint = workspace["non"].HumanoidRootPart.Position end
	end 
	end)()

	local con
	function UnCollide()
		if HumanDied then con:Disconnect(); return end
		for _,Parts in next, CloneChar:GetDescendants() do
			if Parts:IsA("BasePart") then
				Parts.CanCollide = false 
			end 
		end
		for _,Parts in next, DeadChar:GetDescendants() do
			if Parts:IsA("BasePart") then
			Parts.CanCollide = false
			end 
		end 
	end
	con = game:GetService("RunService").Stepped:Connect(UnCollide)

	local resetBindable = Instance.new("BindableEvent")
	resetBindable.Event:connect(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
		resetBindable:Destroy()
		CloneChar.Humanoid.Health = 0
	end)
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

	coroutine.wrap(function()
		while true do
			game:GetService("RunService").RenderStepped:wait()
			if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health <= 0 then 
				HumanDied = true
				pcall(function()
					game.Players.LocalPlayer.Character = CloneChar
					CloneChar:Destroy()
					game.Players.LocalPlayer.Character = DeadChar
					if resetBindable then
						game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
						resetBindable:Destroy()
					end
					DeadChar.Humanoid.Health = 0
				end)
				break
			end		
		end
	end)()

	SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["Torso"],CloneChar["Torso"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["Left Arm"],CloneChar["Left Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["Right Arm"],CloneChar["Right Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["Left Leg"],CloneChar["Left Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["Right Leg"],CloneChar["Right Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
    SCIFIMOVIELOL(DeadChar["HumanoidRootPart"],CloneChar["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))

	for _,v in next, DeadChar:GetChildren() do
		if v:IsA("Accessory") then
			SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
		end
	end

	for _,BodyParts in next, CloneChar:GetDescendants() do
	if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
	BodyParts.Transparency = 1 end end
elseif Bypass == "hats" then
	game:GetService("Players").LocalPlayer["Character"].Archivable = true 
	local DeadChar = game.Players.LocalPlayer.Character
	DeadChar.Name = "non"
	local HatPosition = Vector3.new(0,0,0)
	local HatName = "MediHood"
	local HatsLimb = {
		Rarm = DeadChar:FindFirstChild("Hat1"),
		Larm = DeadChar:FindFirstChild("Pink Hair"),
		Rleg = DeadChar:FindFirstChild("Robloxclassicred"),
		Lleg = DeadChar:FindFirstChild("Kate Hair"),
		Torso1 = DeadChar:FindFirstChild("Pal Hair"),
		Torso2 = DeadChar:FindFirstChild("LavanderHair")
	}
	HatName = DeadChar:FindFirstChild(HatName)

	coroutine.wrap(function()
		while true do
			game:GetService("RunService").RenderStepped:wait()
			if not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChild("Humanoid") or DeadChar:FindFirstChild("Humanoid").Health <= 0 then 
				HumanDied = true
				pcall(function()
					if resetBindable then
						game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
						resetBindable:Destroy()
					end
					DeadChar.Humanoid.Health = 0
				end)
				break
			end		
		end
	end)()

	local con
	function UnCollide()
		if HumanDied then con:Disconnect(); return end
		for _,Parts in next, DeadChar:GetDescendants() do
			if Parts:IsA("BasePart") then
			Parts.CanCollide = false
			end 
		end 
	end
	con = game:GetService("RunService").Stepped:Connect(UnCollide)

	SCIFIMOVIELOL(HatName.Handle,DeadChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(HatsLimb.Torso1.Handle,DeadChar["Torso"],Vector3.new(0.5,0,0),Vector3.new(90,0,0))
	SCIFIMOVIELOL(HatsLimb.Torso2.Handle,DeadChar["Torso"],Vector3.new(-0.5,0,0),Vector3.new(90,0,0))
	SCIFIMOVIELOL(HatsLimb.Larm.Handle,DeadChar["Left Arm"],Vector3.new(0,0,0),Vector3.new(90,0,0))
	SCIFIMOVIELOL(HatsLimb.Rarm.Handle,DeadChar["Right Arm"],Vector3.new(0,0,0),Vector3.new(90,0,0))
	SCIFIMOVIELOL(HatsLimb.Lleg.Handle,DeadChar["Left Leg"],Vector3.new(0,0,0),Vector3.new(90,0,0))
	SCIFIMOVIELOL(HatsLimb.Rleg.Handle,DeadChar["Right Leg"],Vector3.new(0,0,0),Vector3.new(90,0,0))
    
    for i,v in pairs(HatsLimb) do
		v.Handle:FindFirstChild("AccessoryWeld"):Destroy()
		if v.Handle:FindFirstChild("Mesh") then v.Handle:FindFirstChild("Mesh"):Destroy() end
		if v.Handle:FindFirstChild("SpecialMesh") then v.Handle:FindFirstChild("SpecialMesh"):Destroy() end
	end
	HatName.Handle:FindFirstChild("AccessoryWeld"):Destroy()
end
else
if Bypass == "limbs" then --------------------------------------------------------------------------------------------------------------------
	game:GetService("Players").LocalPlayer["Character"].Archivable = true 
	local CloneChar = game:GetObjects("rbxassetid://5227463276")[1]
	CloneChar.Parent = workspace 
	CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame * CFrame.new(0,0.5,0.1)
	CloneChar.Humanoid.BreakJointsOnDeath = false
	workspace.Camera.CameraSubject = CloneChar.Humanoid 
	CloneChar.Name = "non" 
	CloneChar.Humanoid.DisplayDistanceType = "None"
	if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face"):Destroy() end
	

	local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]
	DeadChar.HumanoidRootPart:Destroy()

	local LVecPart = Instance.new("Part", workspace) LVecPart.CanCollide = false LVecPart.Transparency = 1
	local CONVEC
	local function VECTORUNIT()
	if HumanDied then CONVEC:Disconnect(); return end
	local lookVec = workspace.Camera.CFrame.lookVector
	local Root = CloneChar["HumanoidRootPart"]
	LVecPart.Position = Root.Position
	LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
	end
	CONVEC = game:GetService("RunService").Heartbeat:Connect(VECTORUNIT)

	local CONDOWN
	local WDown, ADown, SDown, DDown, SpaceDown = false, false, false, false, false
	local function KEYDOWN(_,Processed) 
	if HumanDied then CONDOWN:Disconnect(); return end
	if Processed ~= true then
	local Key = _.KeyCode
	if Key == Enum.KeyCode.W then
	WDown = true end
	if Key == Enum.KeyCode.A then
	ADown = true end
	if Key == Enum.KeyCode.S then
	SDown = true end
	if Key == Enum.KeyCode.D then
	DDown = true end
	if Key == Enum.KeyCode.Space then
	SpaceDown = true end end end
	CONDOWN = game:GetService("UserInputService").InputBegan:Connect(KEYDOWN)

	local CONUP
	local function KEYUP(_)
	if HumanDied then CONUP:Disconnect(); return end
	local Key = _.KeyCode
	if Key == Enum.KeyCode.W then
	WDown = false end
	if Key == Enum.KeyCode.A then
	ADown = false end
	if Key == Enum.KeyCode.S then
	SDown = false end
	if Key == Enum.KeyCode.D then
	DDown = false end
	if Key == Enum.KeyCode.Space then
	SpaceDown = false end end
	CONUP = game:GetService("UserInputService").InputEnded:Connect(KEYUP)

	local function MoveClone(X,Y,Z)
	LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
	workspace["non"].Humanoid.WalkToPoint = LVecPart.Position
	end

	coroutine.wrap(function() 
	while true do game:GetService("RunService").RenderStepped:Wait()
	if HumanDied then break end
	if WDown then MoveClone(0,0,1e4) end
	if ADown then MoveClone(1e4,0,0) end
	if SDown then MoveClone(0,0,-1e4) end
	if DDown then MoveClone(-1e4,0,0) end
	if SpaceDown then CloneChar["Humanoid"].Jump = true end
	if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
	workspace["non"].Humanoid.WalkToPoint = workspace["non"].HumanoidRootPart.Position end
	end 
	end)()

	local con
	function UnCollide()
		if HumanDied then con:Disconnect(); return end
		for _,Parts in next, CloneChar:GetDescendants() do
			if Parts:IsA("BasePart") then
				Parts.CanCollide = false 
			end 
		end
		for _,Parts in next, DeadChar:GetDescendants() do
			if Parts:IsA("BasePart") then
			Parts.CanCollide = false
			end 
		end 
	end
	con = game:GetService("RunService").Stepped:Connect(UnCollide)

	local resetBindable = Instance.new("BindableEvent")
	resetBindable.Event:connect(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
		resetBindable:Destroy()
		CloneChar.Humanoid.Health = 0
	end)
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

	coroutine.wrap(function()
		while true do
			game:GetService("RunService").RenderStepped:wait()
			if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health <= 0 or not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChild("Humanoid") or DeadChar:FindFirstChild("Humanoid").Health <= 0 then 
				HumanDied = true
				pcall(function()
					game.Players.LocalPlayer.Character = CloneChar
					CloneChar:Destroy()
					game.Players.LocalPlayer.Character = DeadChar
					if resetBindable then
						game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
						resetBindable:Destroy()
					end
					DeadChar.Humanoid.Health = 0
				end)
				break
			end		
		end
	end)()

	for _,v in next, DeadChar:GetChildren() do
		if v:IsA("Accessory") then
			v:Clone().Parent = CloneChar
		end
	end

	for _,v in next, DeadChar:GetDescendants() do
		if v:IsA("Motor6D") and v.Name ~= "Neck" then
			v:Destroy()
		end
	end

	SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["UpperTorso"],CloneChar["Torso"],Vector3.new(0,0.2,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LowerTorso"],CloneChar["Torso"],Vector3.new(0,-0.78,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LeftUpperArm"],CloneChar["Left Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LeftLowerArm"],CloneChar["Left Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LeftHand"],CloneChar["Left Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightUpperArm"],CloneChar["Right Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightLowerArm"],CloneChar["Right Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightHand"],CloneChar["Right Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))

	SCIFIMOVIELOL(DeadChar["LeftUpperLeg"],CloneChar["Left Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LeftLowerLeg"],CloneChar["Left Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LeftFoot"],CloneChar["Left Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightUpperLeg"],CloneChar["Right Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightLowerLeg"],CloneChar["Right Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightFoot"],CloneChar["Right Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))

	coroutine.wrap(function()
		while true do
			game:GetService("RunService").RenderStepped:wait()
			if HumanDied then break end
			DeadChar["UpperTorso"].CFrame = CloneChar["Torso"].CFrame * CFrame.new(0,0.2,0)
		end
	end)()

	for _,v in next, DeadChar:GetChildren() do
		if v:IsA("Accessory") then
			SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
		end
	end

	for _,BodyParts in next, CloneChar:GetDescendants() do
	if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
	BodyParts.Transparency = 1 end end

elseif Bypass == "death" then --------------------------------------------------------------------------------------------------------------------
	game:GetService("Players").LocalPlayer["Character"].Archivable = true 
	local CloneChar = game:GetObjects("rbxassetid://5227463276")[1]
	game:GetService("Players").LocalPlayer["Character"].Humanoid.WalkSpeed = 0 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.JumpPower = 0 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.AutoRotate = false
	local FalseChar = Instance.new("Model", workspace); FalseChar.Name = ""
	Instance.new("Part",FalseChar).Name = "Head" 
	Instance.new("Part",FalseChar).Name = "UpperTorso"
	Instance.new("Humanoid",FalseChar).Name = "Humanoid"
	game:GetService("Players").LocalPlayer["Character"] = FalseChar
	game:GetService("Players").LocalPlayer["Character"].Humanoid.Name = "FalseHumanoid"
	local Clone = game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Clone()
	Clone.Parent = game:GetService("Players").LocalPlayer["Character"]
	Clone.Name = "Humanoid"
	game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Destroy() 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0 
	game:GetService("Players").LocalPlayer["Character"] = workspace[game:GetService("Players").LocalPlayer.Name] 
	wait(5.65) 
	game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0
	CloneChar.Parent = workspace 
	CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame * CFrame.new(0,0.5,0.1)
	wait() 
	CloneChar.Humanoid.BreakJointsOnDeath = false
	workspace.Camera.CameraSubject = CloneChar.Humanoid 
	CloneChar.Name = "non" 
	CloneChar.Humanoid.DisplayDistanceType = "None"
	if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face"):Destroy() end
	

	FalseChar:Destroy()

	local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]

	local LVecPart = Instance.new("Part", workspace) LVecPart.CanCollide = false LVecPart.Transparency = 1
	local CONVEC
	local function VECTORUNIT()
	if HumanDied then CONVEC:Disconnect(); return end
	local lookVec = workspace.Camera.CFrame.lookVector
	local Root = CloneChar["HumanoidRootPart"]
	LVecPart.Position = Root.Position
	LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
	end
	CONVEC = game:GetService("RunService").Heartbeat:Connect(VECTORUNIT)

	local CONDOWN
	local WDown, ADown, SDown, DDown, SpaceDown = false, false, false, false, false
	local function KEYDOWN(_,Processed) 
	if HumanDied then CONDOWN:Disconnect(); return end
	if Processed ~= true then
	local Key = _.KeyCode
	if Key == Enum.KeyCode.W then
	WDown = true end
	if Key == Enum.KeyCode.A then
	ADown = true end
	if Key == Enum.KeyCode.S then
	SDown = true end
	if Key == Enum.KeyCode.D then
	DDown = true end
	if Key == Enum.KeyCode.Space then
	SpaceDown = true end end end
	CONDOWN = game:GetService("UserInputService").InputBegan:Connect(KEYDOWN)

	local CONUP
	local function KEYUP(_)
	if HumanDied then CONUP:Disconnect(); return end
	local Key = _.KeyCode
	if Key == Enum.KeyCode.W then
	WDown = false end
	if Key == Enum.KeyCode.A then
	ADown = false end
	if Key == Enum.KeyCode.S then
	SDown = false end
	if Key == Enum.KeyCode.D then
	DDown = false end
	if Key == Enum.KeyCode.Space then
	SpaceDown = false end end
	CONUP = game:GetService("UserInputService").InputEnded:Connect(KEYUP)

	local function MoveClone(X,Y,Z)
	LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
	workspace["non"].Humanoid.WalkToPoint = LVecPart.Position
	end

	coroutine.wrap(function() 
	while true do game:GetService("RunService").RenderStepped:Wait()
	if HumanDied then break end
	if WDown then MoveClone(0,0,1e4) end
	if ADown then MoveClone(1e4,0,0) end
	if SDown then MoveClone(0,0,-1e4) end
	if DDown then MoveClone(-1e4,0,0) end
	if SpaceDown then CloneChar["Humanoid"].Jump = true end
	if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
	workspace["non"].Humanoid.WalkToPoint = workspace["non"].HumanoidRootPart.Position end
	end 
	end)()

	local con
	function UnCollide()
		if HumanDied then con:Disconnect(); return end
		for _,Parts in next, CloneChar:GetDescendants() do
			if Parts:IsA("BasePart") then
				Parts.CanCollide = false 
			end 
		end
		for _,Parts in next, DeadChar:GetDescendants() do
			if Parts:IsA("BasePart") then
			Parts.CanCollide = false
			end 
		end 
	end
	con = game:GetService("RunService").Stepped:Connect(UnCollide)

	local resetBindable = Instance.new("BindableEvent")
	resetBindable.Event:connect(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
		resetBindable:Destroy()
		CloneChar.Humanoid.Health = 0
	end)
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

	coroutine.wrap(function()
		while true do
			game:GetService("RunService").RenderStepped:wait()
			if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health <= 0 then 
				HumanDied = true
				pcall(function()
					game.Players.LocalPlayer.Character = CloneChar
					CloneChar:Destroy()
					game.Players.LocalPlayer.Character = DeadChar
					if resetBindable then
						game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
						resetBindable:Destroy()
					end
					DeadChar.Humanoid.Health = 0
				end)
				break
			end		
		end
	end)()

	for _,v in next, DeadChar:GetChildren() do
		if v:IsA("Accessory") then
			v:Clone().Parent = CloneChar
		end
	end

	SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["UpperTorso"],CloneChar["Torso"],Vector3.new(0,0.2,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LowerTorso"],CloneChar["Torso"],Vector3.new(0,-0.78,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LeftUpperArm"],CloneChar["Left Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LeftLowerArm"],CloneChar["Left Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LeftHand"],CloneChar["Left Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightUpperArm"],CloneChar["Right Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightLowerArm"],CloneChar["Right Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightHand"],CloneChar["Right Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))

	SCIFIMOVIELOL(DeadChar["LeftUpperLeg"],CloneChar["Left Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LeftLowerLeg"],CloneChar["Left Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["LeftFoot"],CloneChar["Left Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightUpperLeg"],CloneChar["Right Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightLowerLeg"],CloneChar["Right Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
	SCIFIMOVIELOL(DeadChar["RightFoot"],CloneChar["Right Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))

    SCIFIMOVIELOL(DeadChar["HumanoidRootPart"],CloneChar["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))

	for _,v in next, DeadChar:GetChildren() do
		if v:IsA("Accessory") then
			SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
		end
	end

	for _,BodyParts in next, CloneChar:GetDescendants() do
	if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
	BodyParts.Transparency = 1 end end
	if DeadChar.Head:FindFirstChild("Neck") then
		game.Players.LocalPlayer.Character:BreakJoints()
	end
end
end
