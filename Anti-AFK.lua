-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Anti-AFK.lua"))()
local gcn = getconnections or get_signal_cons
if gcn then
	for i, v in gcn(game.Players.LocalPlayer.Idled) do
		if v["Disable"] then
			v["Disable"](v)
		elseif v["Disconnect"] then
			v["Disconnect"](v)
		end
	end
else
	local VirtualUser = cloneref(game:GetService("VirtualUser"))
	game.Players.LocalPlayer.Idled:Connect(function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end)
end