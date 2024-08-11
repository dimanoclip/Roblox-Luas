local Library = {}
Library.Link = "https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/vars.lua"
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/vars.lua"))()
Library.players = game:GetService("Players")
Library.player = Library.players.LocalPlayer
Library.character = Library.player.Character or Library.player.CharacterAdded:Wait()
Library.player.CharacterAdded:Connect(function(newCharacter) Library.character = newCharacter end) -- Updating character when spawns
Library.UIS = game:GetService("UserInputService")
return Library