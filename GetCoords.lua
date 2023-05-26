local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local SavePosition = Instance.new("TextLabel", ScreenGui)

SavePosition.Name = "Pos"
SavePosition.BackgroundColor3 = Color3.new(0, 0, 0)
SavePosition.BackgroundTransparency = 0.5
SavePosition.BorderColor3 = Color3.new(1, 1, 1)
SavePosition.BorderSizePixel = 2
SavePosition.Size = UDim2.new(0, 150, 0, 40)
SavePosition.Position = UDim2.new(0.466, 0, 0, -38)
SavePosition.Font = Enum.Font.Fantasy
SavePosition.Text = " "
SavePosition.TextColor3 = Color3.new(1, 1, 1)
SavePosition.TextSize = 18
SavePosition.TextWrapped = true
SavePosition.Visible = true

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

local curlocation = coroutine.wrap(function()
	while true do
		LocationX = round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x, 0)
		LocationY = round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y, 0)
		LocationZ = round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z, 0)
		SavePosition.Text = " "..LocationX..", "..LocationY..", "..LocationZ
		wait(0.5)
	end
end)

curlocation()
