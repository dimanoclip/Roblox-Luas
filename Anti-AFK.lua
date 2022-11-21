wait(0.5)
local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")
ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;
ca.Parent=ba;
ca.Active=true
ca.BackgroundColor3=Color3.new(0.136471,0.136471,0.136471)
ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,260,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="Anti AFK Script"ca.TextColor3=Color3.new(1,0,1)
ca.TextSize=22;
local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
end)
