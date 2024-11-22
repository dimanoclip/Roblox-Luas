
local adds = loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/additional.lua"))()
local P = game:GetService("Players")
local LP = P.LocalPlayer
local RunService=game:GetService("RunService")
local DB = false
local ESP_players = {}
local Library = {}
Library.add = function(player) table.insert(ESP_players, player.Name, player) end
Library.rem = function(player) table.remove(ESP_players, player.Name) end
Library.Link = "https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/ESP.lua"
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/ESP.lua"))()
local CreateESP = function(PLR)
	local Icon = Instance.new("BillboardGui")
	local NameDist = Instance.new("TextLabel")
	Icon.Parent = PLR.Character:FindFirstChild('Head')
	Icon.Name = "Icon"
	Icon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Icon.Active = true
	Icon.AlwaysOnTop = true
	Icon.ExtentsOffset = Vector3.new(0, 1, 0)
	Icon.LightInfluence = 1.000
	Icon.Size = UDim2.new(0, 400, 0, 50)
	NameDist.Name = "NameDist"
	NameDist.Parent = Icon
	NameDist.BackgroundColor3 = PLR.TeamColor.Color
	NameDist.BackgroundTransparency = 1.000
	NameDist.Position = UDim2.new(0, 0, 0, 0)
	NameDist.Size = UDim2.new(0, 400, 0, 10)
	NameDist.Font = Enum.Font.IndieFlower
	NameDist.Text = "NIL"
	NameDist.TextColor3 = Color3.fromRGB(160, 0, 0)
	NameDist.TextSize = 18.000
	NameDist.TextWrapped = true
end
local UpdateESP = function(PLR, ICON)
	local NameDist = Instance.new("TextLabel")
	NameDist.Name = "NameDist"
	NameDist.Parent = ICON
	NameDist.BackgroundColor3 = PLR.TeamColor.Color
	NameDist.BackgroundTransparency = 1.000
	NameDist.Position = UDim2.new(0, 0, 0, 0)
	NameDist.Size = UDim2.new(0, 400, 0, 10)
	NameDist.Font = Enum.Font.IndieFlower
	NameDist.Text = "NIL"
	NameDist.TextColor3 = Color3.fromRGB(160,0,0)
	NameDist.TextSize = 18.000
	NameDist.TextWrapped = true
end
RunService.Stepped:Connect(function()
	for i,v in pairs(P:GetChildren()) do
		if ESP_players[v.Name] then continue end
		if v == game.Players.LocalPlayer or v.Character == nil then continue end
		if v.Character:FindFirstChild('Head'):FindFirstChild("Icon") ~= nil then
			v.Character:FindFirstChild('Head'):FindFirstChild("Icon"):Remove()
		end
	end
	if DB then return end
	DB = true
	pcall(function()
		if not ESP_players[1] then return end
		for i,v in pairs(ESP_players) do
			if v:IsA("Player") then
				if v == game.Players.LocalPlayer or v.Character == nil then continue end
				if v.Character:FindFirstChild('Head'):FindFirstChild("Icon") == nil then
					CreateESP(v)
				else
					if v.Character:FindFirstChild('Head').Icon:FindFirstChild("NameDist") == nil then
						UpdateESP(v, v.Character:FindFirstChild('Head').Icon)
					else
						if v.Character:FindFirstChild('Head'):FindFirstChild("Icon").Enabled == false then
							v.Character:FindFirstChild('Head'):FindFirstChild("Icon").Enabled = true
						else
							if v.Character:FindFirstChild('Head'):FindFirstChild("Icon") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
								v.Character:FindFirstChild('Head').Icon["NameDist"].Text = v.Name..'| '..adds.dist_to(v)
							else
								if v.Character:FindFirstChild('Head'):FindFirstChild("Icon") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil then
									v.Character:FindFirstChild('Head').Icon["NameDist"].Text = v.Name
								end
							end
						end
					end
				end
			end
		end
	end)
	task.wait()
	DB = false
end)
return Library