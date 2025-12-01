local Library = {}
Library.hex_colors = {
    red = '#BE0000',
    mint = '#00FFBE',
    green = '#00FF32',
    blue = '#0078FF',
    purple = '#825AFF',
    pink = '#C800FF',
    yellow = '#FFC800',
    orange = '#FF9600',
    black = '#000000',
    gray = '#3C3C3C',
    white = '#ffffff'
}
Library.rgb_colors = {
    red = Color3.fromRGB(190,0,0),
    mint = '#00FFBE',
    green = Color3.fromRGB(0,255,190),
    blue = Color3.fromRGB(0,120,255),
    purple = Color3.fromRGB(200,0,255),
    pink = '#C800FF',
    yellow = Color3.fromRGB(255, 200,0),
    orange = Color3.fromRGB(255,150,0),
    black = Color3.fromRGB(0,0,0),
    gray = Color3.fromRGB(60,60,60),
    white = Color3.fromRGB(255,255,255)
}
local TextChatService = game:GetService("TextChatService")
Library.Link = "https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/msgs.lua"
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/msgs.lua"))()
Library.Chat = function(text:string, color:string)
    color = color:lower()
    if color and type(color) == "string" and Library.hex_colors[color:lower()] then
        TextChatService.TextChannels.RBXSystem:DisplaySystemMessage(
            string.format("<font color='%s' face='Code' size='18'>%s</font>", Library.hex_colors[color], text)
        )
    end
end

Library.Notify = function(title, text, dur)
    dur = dur or -1
    game.StarterGui:SetCore("SendNotification", {
        Title = tostring(title),
        Text = tostring(text),
        Duration = dur > 0 and dur or math.huge,
        Button1 = "OK"
    })
end
return Library
