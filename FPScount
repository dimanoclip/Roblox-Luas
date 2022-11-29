repeat wait() until game:IsLoaded() wait(2)
local ScreenGui = Instance.new("ScreenGui")
local Fps = Instance.new("TextLabel")
local cl = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Fps.Name = "Fps"
Fps.Parent = ScreenGui
Fps.Active=true
Fps.Draggable=true
Fps.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Fps.BackgroundTransparency = 0.700
Fps.Position = UDim2.new(0, 1663, 0, 492)
Fps.Size = UDim2.new(0, 125, 0, 25)
Fps.Font = Enum.Font.SourceSansSemibold
Fps.TextColor3 = Color3.fromRGB(255, 255, 255)
Fps.TextScaled = true
Fps.TextSize = 14.000
Fps.TextWrapped = true

cl.Parent = Fps
cl.BackgroundTransparency = 1
cl.Position = UDim2.new(0, 0, 0, 0)
cl.Size = UDim2.new(0, 20, 0, 20)
cl.Font = Enum.Font.Fantasy
cl.Text = "X"
cl.TextColor3 = Color3.new(1, 0, 0)
cl.TextSize = 17

-- Scripts:

local script = Instance.new('LocalScript', Fps)
local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function(frame) -- This will fire every time a frame is rendered
script.Parent.Text = ("FPS: "..math.round(1/frame)) 
end)

cl.MouseButton1Down:connect(function()
ScreenGui:Destroy()
end)
