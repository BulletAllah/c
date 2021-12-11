print([[Made by yth0z @BulletAllah]])

_G.HttpEnabled = true

if setclipboard then
else
	print("UNSUPORTED EXPLOIT: SETCLIPBOARD IS MISSING!")
end

if hookfunction then
else
	print("UNSUPORTED EXPLOIT: HOOKFUNCTION IS MISSING!")
end

function RString(length)
	local a = {}

	for i = 1,length do
		table.insert(a,string.char(math.random(33,126)))
	end

	return table.concat(a)
end

local _04AEBFEA87FC480FA555E5E221007A90 = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Top = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local Enable = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Holder = Instance.new("ScrollingFrame")
local Template = Instance.new("ImageLabel")
local Url = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local Copy = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")

_04AEBFEA87FC480FA555E5E221007A90.Name = RString(25)
_04AEBFEA87FC480FA555E5E221007A90.Parent = game.Players.LocalPlayer.PlayerGui
_04AEBFEA87FC480FA555E5E221007A90.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_04AEBFEA87FC480FA555E5E221007A90.ResetOnSpawn = false
_04AEBFEA87FC480FA555E5E221007A90.IgnoreGuiInset = true

Main.Name = "Main"
Main.Parent = _04AEBFEA87FC480FA555E5E221007A90
Main.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.234899327, 0, 0.227752641, 0)
Main.Size = UDim2.new(0, 334, 0, 456)

Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Top.BorderSizePixel = 0
Top.Size = UDim2.new(0, 334, 0, 31)
Top.Image = "rbxassetid://6073743871"
Top.ScaleType = Enum.ScaleType.Crop

Title.Name = "Title"
Title.Parent = Top
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.0239520967, 0, 0, 0)
Title.Size = UDim2.new(0, 200, 0, 31)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "HTTP Logger v1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18.000
Title.TextXAlignment = Enum.TextXAlignment.Left

UICorner.Parent = Main

--[[
Enable.Name = "Enable"
Enable.Parent = Main
Enable.BackgroundColor3 = Color3.fromRGB(85, 255, 0)
Enable.BorderSizePixel = 0
Enable.Position = UDim2.new(0.766467035, 0, 0.0109649124, 0)
Enable.Size = UDim2.new(0, 72, 0, 21)
Enable.Font = Enum.Font.SourceSans
Enable.Text = ""
Enable.TextColor3 = Color3.fromRGB(0, 0, 0)
Enable.TextSize = 14.000
UICorner_2.Parent = Enable
]]

Holder.Name = "Holder"
Holder.Parent = Main
Holder.Active = true
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.BackgroundTransparency = 1.000
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(0.0239520967, 0, 0.0855263174, 0)
Holder.Size = UDim2.new(0, 320, 0, 408)
Holder.ScrollBarThickness = 0

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Holder
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    local absoluteSize = UIListLayout.AbsoluteContentSize
    Holder.CanvasSize = UDim2.new(0, absoluteSize.X, 0, absoluteSize.Y)
end)

Template.Name = "Template"
Template.Parent = Holder
Template.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Template.BorderSizePixel = 0
Template.Size = UDim2.new(0, 320, 0, 37)
Template.Visible = false
Template.Image = "rbxassetid://6073743871"
Template.ScaleType = Enum.ScaleType.Crop
Url.Name = "Url"
Url.Parent = Template
Url.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Url.Position = UDim2.new(0.0187500007, 0, 0.0853378698, 0)
Url.Size = UDim2.new(0, 277, 0, 29)
Url.Font = Enum.Font.Code
Url.Text = " hi"
Url.TextColor3 = Color3.fromRGB(255, 255, 255)
Url.TextSize = 14.000
Url.TextXAlignment = Enum.TextXAlignment.Left
Url.ClipsDescendants = true
UICorner_3.Parent = Url
UICorner_4.Parent = Template
Copy.Name = "Copy"
Copy.Parent = Template
Copy.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Copy.BorderSizePixel = 0
Copy.Position = UDim2.new(0.897000015, 0, 0.0920000002, 0)
Copy.Size = UDim2.new(0, 29, 0, 29)
Copy.Font = Enum.Font.SourceSansBold
Copy.Text = "C"
Copy.TextColor3 = Color3.fromRGB(255, 255, 255)
Copy.TextSize = 14.000
UICorner_5.Parent = Copy

function add(url)
	local stuff = Template:Clone()
	stuff.Visible = true
	stuff.Parent = Holder
	stuff.Url.Text = " "..tostring(url)
	stuff.Name = tostring("url")
	
	stuff.Copy.MouseButton1Click:Connect(function() setclipboard(url) end)
end

local Get
local Async

Get = hookfunction(game.HttpGet, function(x,url,...)
	if _G.HttpEnabled == true then
		add(url)
		return get(x,url,...)
	end
end)

Async = hookfunction(game.HttpGetAsync, function(x,url,...)
	if _G.HttpEnabled == true then
		add(url)
		return get(x,url,...)
	end
end)

local UIS = game:GetService("UserInputService")
function dragify(Frame)
    dragToggle = nil
    local dragSpeed = 1
    dragInput = nil
    dragStart = nil
    local dragPos = nil
    function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.10), {Position = Position}):Play()
    end
    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end

dragify(Main)
