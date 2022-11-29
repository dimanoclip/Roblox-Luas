wait(0.5)
local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")
local cl = Instance.new("TextButton")
ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;
ca.Parent=ba;
ca.Active=true
ca.BackgroundColor3=Color3.new(0.136471,0.136471,0.136471)
ca.Draggable=true
ca.Position=UDim2.new(0,1660,0,0)
ca.Size=UDim2.new(0,260,0,52)
ca.Font=Enum.Font.SourceSansSemibold
ca.Text="Anti AFK Script"
ca.TextColor3=Color3.new(1,0,1)
ca.TextSize=22
cl.Parent = ca
cl.BackgroundTransparency = 1
cl.Position = UDim2.new(0, 0, 0, 0)
cl.Size = UDim2.new(0, 20, 0, 20)
cl.Font = Enum.Font.Fantasy
cl.Text = "X"
cl.TextColor3 = Color3.new(1, 0, 0)
cl.TextSize = 17
local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
end)
cl.MouseButton1Down:connect(function()
ba:Destroy()
end)
