local Library = {}
local colors = {
    red = Color3.fromRGB(190,0,0),
    green = Color3.fromRGB(0,255,190),
    blue = Color3.fromRGB(0,120,255),
    purple = Color3.fromRGB(200,0,255),
    yellow = Color3.fromRGB(255, 200,0),
    orange = Color3.fromRGB(255,150,0),
    black = Color3.fromRGB(0,0,0),
    gray = Color3.fromRGB(60,60,60),
    white = Color3.fromRGB(255,255,255)
}
Library.Link = "https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/msgs.lua"
Library.Chat = function(text:string, color:string)
    if not game.StarterGui:GetCore("ChatActive") then game.StarterGui:SetCore("ChatActive", true) end
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = text,
        Font = Enum.Font.Code,
        Color = type(color) == "string" and colors[color:lower()] or color,
        FontSize = Enum.FontSize.Size96
    })
end

Library.Notify = function(title, text, dur)
    if dur then
        game.StarterGui:SetCore("SendNotification", {
            Title = tostring(title),
            Text = tostring(text),
            Duration = dur
        })
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = tostring(title),
            Text = tostring(text),
            Duration = dur < 0 and math.huge or 1
        })
    end
end

return Library
