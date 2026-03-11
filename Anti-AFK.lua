-- loadstring(game:HttpGet("https://raw.githubusercontent.com/dimanoclip/Roblox-Luas/main/Anti-AFK.lua"))()
if not getgenv().Useless or not getgenv().Useless.AntiAfkLoaded then
	getgenv().Useless = {}
	getgenv().Useless.AntiAfkLoaded = false
	local gcn = getconnections or get_signal_cons
	if gcn then
		for i, v in gcn(game.Players.LocalPlayer.Idled) do
			pcall(function()
				if v["Disable"] then
					v["Disable"](v)
				elseif v["Disconnect"] then
					v["Disconnect"](v)
				end
			end)
		end
	end
	local VirtualUser = cloneref(game:GetService("VirtualUser"))
	game.Players.LocalPlayer.Idled:Connect(function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/dimanoclip/Roblox-Luas/main/Libs/msgs.lua"))().Notify("Anti-AFK", "Loaded", 1)
	getgenv().Useless.AntiAfkLoaded = true
	queue_on_teleport('getgenv().Useless.AntiAfkLoaded = false; loadstring(game:HttpGet("https://raw.githubusercontent.com/dimanoclip/Roblox-Luas/main/Anti-AFK.lua"))()')
end