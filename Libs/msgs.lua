local Library = {}
local colors = {
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
local TextChatService = game:GetService("TextChatService")
Library.Link = "https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/msgs.lua"
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/msgs.lua"))()
Library.Chat = function(text:string, color:string)
    if color and type(color) == "string" and colors[color:lower()] then
        TextChatService.TextChannels.RBXSystem:DisplaySystemMessage(
            string.format("<b> <font color='%s' face='Code' size='18'>%s</font> </b>", colors[color] and colors[color] or color, text)
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
