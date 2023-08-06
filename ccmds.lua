local pp = game.Players
local player = pp.LocalPlayer
local rejoincmd = "!rejoin"
local serverhopcmd = "!serverhop"

player.Chatted:Connect(function(msg)
	if msg:sub(1, rejoincmd:len()):lower() == rejoincmd:lower() then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/1/main/rejoin.lua"))
	elseif msg:sub(1, serverhopcmd:len()):lower() == serverhopcmd:lower() then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/1/main/serverhop.lua"))
	end
end)

