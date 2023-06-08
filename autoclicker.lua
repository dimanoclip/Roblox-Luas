local on
local StartBind=Enum.KeyCode.F5
local FinishBind=Enum.KeyCode.F6
local UserInputService=game:GetService("UserInputService")
local RunService=game:GetService("RunService")
local plr=game:GetService("Players").LocalPlayer
local vu=game:GetService("VirtualUser")
local mouse=plr:GetMouse()
local ScreenGui=Instance.new("ScreenGui",plr.PlayerGui)
local IsEnabled=Instance.new("TextLabel",ScreenGui)
IsEnabled.Size=UDim2.new(0,55,0,15)
IsEnabled.BackgroundColor3=Color3.fromRGB(50,190,50)
IsEnabled.Visible=false
IsEnabled.Text="Enabled"
IsEnabled.TextScaled=true
IsEnabled.TextSize=11
local function CC()
vu:CaptureController();
end 
local function CB()
local v2 = Vector2.new();
vu:ClickButton1(v2);
end
function Start(a,b)
   if a.KeyCode==StartBind then
       on=true
       a=RunService.Stepped:Connect(function()
           if on then
               CC(); CB();
               IsEnabled.Visible=true
               IsEnabled.Position=UDim2.new(0,mouse.X+12.5,0,mouse.Y+25)
           else
               a:Disconnect()
           end
       end)
       IsEnabled.Visible=false
   end
end
function Stop(a,b)
   if a.KeyCode==FinishBind then
       on=false
       IsEnabled.Visible=false
   end
end
UserInputService.InputBegan:connect(Start)
UserInputService.InputEnded:connect(Stop)
