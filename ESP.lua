if not game:IsLoaded() then
	game.Loaded:Wait()
end
local adds = loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/additional.lua"))()
local Toggle = true
local P = game:GetService("Players")
local LP = P.LocalPlayer
local UserInputService=game:GetService("UserInputService")
local RunService=game:GetService("RunService")
local DB = false
local ESPT = function(PLR)
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
	NameDist.TextColor3 = PLR.TeamColor.Color
	NameDist.TextSize = 18.000
	NameDist.TextWrapped = true
end
local ESPTF = function(PLR, ICON)
	local NameDist = Instance.new("TextLabel")
	NameDist.Name = "NameDist"
	NameDist.Parent = ICON
	NameDist.BackgroundColor3 = PLR.TeamColor.Color
	NameDist.BackgroundTransparency = 1.000
	NameDist.Position = UDim2.new(0, 0, 0, 0)
	NameDist.Size = UDim2.new(0, 400, 0, 10)
	NameDist.Font = Enum.Font.IndieFlower
	NameDist.Text = "NIL"
	NameDist.TextColor3 = PLR.TeamColor.Color
	NameDist.TextSize = 18.000
	NameDist.TextWrapped = true
end
RunService.Stepped:Connect(function()
	if not Toggle then
		for i,v in pairs(P:GetChildren()) do
			if v.Character:FindFirstChild('Head'):FindFirstChild("Icon") ~= nil then
				v.Character:FindFirstChild('Head'):FindFirstChild("Icon"):Remove()
			end
		end
	end
	if DB then return end
	DB = true
	pcall(function()
		if Toggle then
			for i,v in pairs(P:GetChildren()) do
				if v:IsA("Player") then
					if v ~= game.Players.LocalPlayer then
						if v.Character ~= nil then
							if v.Character:FindFirstChild('Head'):FindFirstChild("Icon") == nil then
								ESPT(v)
							else
								if v.Character:FindFirstChild('Head').Icon:FindFirstChild("NameDist") == nil then
									ESPTF(v, v.Character:FindFirstChild('Head').Icon)
								else
									if v.Character:FindFirstChild('Head'):FindFirstChild("Icon").Enabled == false then
										v.Character:FindFirstChild('Head'):FindFirstChild("Icon").Enabled = true
									else
										if v.Character:FindFirstChild('Head'):FindFirstChild("Icon") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
											v.Character:FindFirstChild('Head').Icon["NameDist"].Text = v.Name
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
				end
			end
		end
	end)
	wait()
	DB = false
end)
-----------------------------------------------------------------
UserInputService.InputBegan:connect(function(a,b)
   if a.KeyCode==Enum.KeyCode.F1 then
       Toggle = not Toggle
   end
end)
