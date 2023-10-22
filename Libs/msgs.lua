--https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/msgs.lua
local Library = {}
Library.Chat = function(text, color)
    if not game.StarterGui:GetCore("ChatActive") then game.StarterGui:SetCore("ChatActive", true) end
    if color:lower() == "red" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text,
            Font = Enum.Font.Code,
            Color = Color3.fromRGB(190,0,0),
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "green" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text,
            Font = Enum.Font.Code,
            Color = Color3.fromRGB(0,255,190),
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "blue" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text,
            Font = Enum.Font.Code,
            Color = Color3.fromRGB(0,120,255),
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "purple" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text,
            Font = Enum.Font.Code,
            Color = Color3.fromRGB(200,0,255),
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "gold" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text,
            Font = Enum.Font.Code,
            Color = Color3.fromRGB(255, 200,0),
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "orange" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text,
            Font = Enum.Font.Code,
            Color = Color3.fromRGB(255,150,0),
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "black" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text,
            Font = Enum.Font.Code,
            Color = Color3.fromRGB(0,0,0),
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "gray" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text,
            Font = Enum.Font.Code,
            Color = Color3.fromRGB(6,60,60),
            FontSize = Enum.FontSize.Size96
        })
    else
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text,
            Font = Enum.Font.Code,
            Color = Color3.fromRGB(255,255,255),
            FontSize = Enum.FontSize.Size96
        })
    end
end

Library.Notify = function(title, text, dur)
    if dur == nil then
        game.StarterGui:SetCore("SendNotification", {
            Title = tostring(title),
            Text = tostring(text),
            Duration = 1
        })
    elseif dur < 0 then
        game.StarterGui:SetCore("SendNotification", {
            Title = tostring(title),
            Text = tostring(text),
            Duration = math.huge
        })
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = tostring(title),
            Text = tostring(text),
            Duration = dur
        })
    end
end

Library.Notifyv2 = function(title, text, dur)
	local conv = loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/1/main/convs.lua"))()
	local SG = game.CoreGui:FindFirstChild("UselessGui") or Instance.new("ScreenGui", game.CoreGui)
	SG.Name = "UselessGui"
	SG.DisplayOrder = 10
	SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local Frame = SG:FindFirstChild("Notification") or Instance.new("Frame", SG)
	Frame.Name = "Notification"
	Frame.Visible = true
	Frame.AutoLocalize = false
	Frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
	Frame.BackgroundTransparency = 0
	Frame.BorderMode = Enum.BorderMode.Inset
	Frame.BorderColor3 = Color3.new(1,1,1)
	Frame.Position = UDim2.fromOffset(SG.AbsoluteSize.X, SG.AbsoluteSize.Y-90)
	Frame.Size = UDim2.new(0, 350, 0, 40)
	local Title = SG:FindFirstChild("Notification"):FindFirstChild("TitleLabel") or Instance.new("TextLabel", Frame)
	Title.Name = "TitleLabel"
	Title.Size = UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y)
	Title.TextWrapped = true
	Title.TextScaled = true
	Title.Text = title
	Title.Font = Enum.Font.Code
	Title.TextColor3 = Color3.new(1,1,1)
	Title.BackgroundTransparency = 1
	Title.TextTransparency = 0
	task.wait(0.25)
	repeat task.wait()
	Frame.Position = UDim2.fromOffset(Frame.AbsolutePosition.X-10, Frame.AbsolutePosition.Y)
	until Frame.AbsolutePosition.X == SG.AbsoluteSize.X - 350
	task.wait(3)
	repeat task.wait()
	Title.TextTransparency = Title.TextTransparency + 0.1
	until conv.Round(Title.TextTransparency, 1) == 1
	task.wait(0.25)
	local Notify = SG:FindFirstChild("Notification"):FindFirstChild("NotifyLabel") or Instance.new("TextLabel", Frame)
	Notify.Name = "NotifyLabel"
	Notify.Size = UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y)
	Notify.TextWrapped = true
	Notify.TextScaled = true
	Notify.Text = text
	Notify.Font = Enum.Font.Code
	Notify.TextColor3 = Color3.new(1,1,1)
	Notify.BackgroundTransparency = 1
	repeat task.wait()
	Notify.TextTransparency = Notify.TextTransparency - 0.1
	until conv.Round(Notify.TextTransparency, 1) == 0
	task.wait(dur or 5)
	repeat task.wait()
	Frame.Position = UDim2.fromOffset(Frame.AbsolutePosition.X+10, Frame.AbsolutePosition.Y)
	until Frame.AbsolutePosition.X == SG.AbsoluteSize.X
	Notify.TextTransparency = 1
end

return Library
