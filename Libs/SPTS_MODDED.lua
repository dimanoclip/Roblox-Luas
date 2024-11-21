-- https://www.roblox.com/games/15786769057
local PlaceId = 15786769057
if game.PlaceId ~= PlaceId then warn(string.format("Wrong game detected. %s expected, got %s", PlaceId, game.PlaceId)) return end
if not game:IsLoaded() then game.Loaded:Wait() end
---------------------------------------------------------
game:GetService('Players').LocalPlayer.Idled:Connect(function() game:GetService('VirtualUser'):CaptureController() game:GetService('VirtualUser'):ClickButton2(Vector2.new()) end)
local msgs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/msgs.lua"))()
_G.levels = {15, 23, 18, 16, 14}
local players = game.Players
local player = players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait() and player.Character
local hum = char:WaitForChild('Humanoid')
local HRP = char:WaitForChild('HumanoidRootPart')
player.CharacterAdded:Connect(function(character) char = character;hum = char:WaitForChild('Humanoid'); HRP = char:WaitForChild('HumanoidRootPart') end)
local gui = player.PlayerGui
local RS = game.ReplicatedStorage
local RunService=game:GetService("RunService")
local remote = RS:WaitForChild("RemoteEvent")
local function checknearplrs()
    for i,v in pairs(game.Players:children()) do
        if v~=player and v.Character and v.Character.HumanoidRootPart and math.floor((char.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude) <= 200 then return true end
        task.wait()
    end
    return false
end
spawn(function() 
    while true do 
        pcall(function()
            remote:FireServer({"+FS".._G.levels[1]})
            if not checknearplrs() and hum and hum.Health >= 25 then remote:FireServer({"+BT".._G.levels[2]}) end
            remote:FireServer({"+MS".._G.levels[3]})
            remote:FireServer({"+JF".._G.levels[4]})
            remote:FireServer({"+PP".._G.levels[5]}) 
        end)
        task.wait()
end end)
spawn(function()
while true do
    pcall(function()
    if hum.Health <= 0 then
        task.wait(0.1)
        remote:FireServer({"Respawn"})
        gui.ScreenGui.Enabled = true
        game.Lighting.Blur.Enabled = false
        repeat task.wait() until gui.IntroGui.Enabled == true
        gui.IntroGui.Enabled = false
        task.wait(0.1)
        remote:FireServer({"ConcealRevealAura"})
    end
    end)
    task.wait()
end
end)
msgs.Notify('AutoFarm', 'Loaded', 1)
task.spawn(function()
while task.wait() do
    remote:FireServer({"FinishMission",200000})
    task.wait()
end
end)

local function SA(player)
    remote:FireServer({"Skill_SoulAttack_Start", player})
    remote:FireServer({"Skill_SoulAttack_End"})
end
local function SR(player)
    local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    remote:FireServer({"Skill_SoulReap", player})
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.x+math.random(-4, 4), pos.y+math.random(-4, 4), pos.z)
end
local function soulattack(player)
    local PP = game.Players.LocalPlayer.PrivateStats.PsychicPower.Value
    if player == game.Players.LocalPlayer then return end
    if player then
        if player.PrivateStats.PsychicPower.Value < PP then
            SR(player)
        end
    else
        for i,v in pairs(game.Players:GetChildren()) do
            if v.PrivateStats.PsychicPower.Value < PP and v ~= game.Players.LocalPlayer then
                SA(v)
            end
            task.wait(1)
        end
    end
end

local shield = false
local addshield = workspace:WaitForChild("Main"):WaitForChild("MouseIgnoreGroup"):WaitForChild("SafeZone"):WaitForChild("Add")
local removeshield = workspace:WaitForChild("Main"):WaitForChild("MouseIgnoreGroup"):WaitForChild("SafeZone"):WaitForChild("Delete")
local UserInputService=game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(a,b)
    if a.KeyCode == Enum.KeyCode.F1 then shield = not shield; removeshield:FireServer() 
    elseif a.KeyCode == Enum.KeyCode.F2 then for i,v in pairs(game.Players:GetChildren()) do if v.PrivateStats.Reputation.Value < 0 then soulattack(v); task.wait(1) end end
    elseif a.KeyCode == Enum.KeyCode.F3 then soulattack() 
    elseif a.KeyCode == Enum.KeyCode.F5 then loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/rejoin.lua"))()
    elseif a.KeyCode == Enum.KeyCode.F6 then loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/serverhop.lua"))() end
end)
spawn(function() while task.wait() do if shield then addshield:FireServer() end end end)
msgs.Notify('Binds', 'F1 - toggle shield\nF2 - Kill villians(PP)\nF3 - kill all(PP)')


loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()