if not game:IsLoaded() then
	game.Loaded:Wait()
end

--Press F5 To Toggle ESP--

--//Toggle\\--
getgenv().Toggle = true
getgenv().TC = false
local PlayerName = "DisplayName"

--//Variables\\--
local P = game:GetService("Players")
local LP = P.LocalPlayer
local UserInputService=game:GetService("UserInputService")
local plr=game:GetService("Players").LocalPlayer
local vu=game:GetService("VirtualUser")
plr.Idled:connect(function()
vu:CaptureController()vu:ClickButton2(Vector2.new())
end)
UserInputService.InputBegan:connect(function(a,b)
   if a.KeyCode==Enum.KeyCode.F5 then
       getgenv().Toggle = not getgenv().Toggle
   end
end)

--//Debounce\\--
local DB = false

local ESPT = function(PLR)
	--//ESP-Text\\--
	local Icon = Instance.new("BillboardGui")
	local NameDist = Instance.new("TextLabel")

	Icon.Parent = PLR.Character
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
	NameDist.Font = Enum.Font.SciFi
	NameDist.Text = "NIL"
	NameDist.TextColor3 = PLR.TeamColor.Color
	NameDist.TextSize = 18.000
	NameDist.TextWrapped = true
end

local ESPTF = function(PLR, ICON)
	local NameDist = Instance.new("TextLabel")
	
	NameDist.Name = "NameDist"
	NameDist.Parent = Icon
	NameDist.BackgroundColor3 = PLR.TeamColor.Color
	NameDist.BackgroundTransparency = 1.000
	NameDist.Position = UDim2.new(0, 0, 0, 0)
	NameDist.Size = UDim2.new(0, 400, 0, 10)
	NameDist.Font = Enum.Font.SciFi
	NameDist.Text = "NIL"
	NameDist.TextColor3 = PLR.TeamColor.Color
	NameDist.TextSize = 18.000
	NameDist.TextWrapped = true
end

--//Loop\\--
while task.wait() do
	if not getgenv().Toggle then
		for i,v in pairs(P:GetChildren()) do
			if v.Character:FindFirstChild("Icon") ~= nil then
				v.Character:FindFirstChild("Icon"):Remove()
			end
		end
		task.wait()
	end
	if DB then 
		return 
	end
	DB = true

	pcall(function()
		if getgenv().Toggle then
			for i,v in pairs(P:GetChildren()) do
				if v:IsA("Player") then
					if v ~= game.Players.LocalPlayer then
						if v.Character ~= nil then
							if getgenv().TC == false and v.Character:FindFirstChild("Icon") == nil then
								ESPT(v)
							else
								if getgenv().TC == false and v.Character.Icon:FindFirstChild("NameDist") == nil then
									ESPTF(v, v.Character.Icon)
								else
									if v.Character:FindFirstChild("Icon").Enabled == false then
										v.Character:FindFirstChild("Icon").Enabled = true
									else
										if v.Character:FindFirstChild("Icon") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
											local pos = math.floor(((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")).Position - (v.Character:FindFirstChild("HumanoidRootPart")).Position).magnitude)
											v.Character.Icon["NameDist"].Text = "Name: "..v[PlayerName].." | Distance: "..pos
										else
											if v.Character:FindFirstChild("Icon") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil then
												v.Character.Icon["NameDist"].Text = "Name: "..v[PlayerName]
											else
												if getgenv().TC == true and v.TeamColor ~= game.Players.LocalPlayer.TeamColor and v.Character:FindFirstChild("Icon") == nil then
													ESPT(v)
												else
													if getgenv().TC == true and v.TeamColor ~= game.Players.LocalPlayer.TeamColor and v.Character.Icon:FindFirstChild("NameDist") == nil then
														ESPTF(v, v.Character.Icon)
													else
														if getgenv().TC == true and v.Character.Icon:FindFirstChild("NameDist").TextColor3 ~= v.TeamColor.Color then
															v.Character.Icon["NameDist"].TextColor3 = v.TeamColor.Color
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
				end
			end
		end
	end)

	wait()

	DB = false
end
