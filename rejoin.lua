-- loadstring(game:HttpGet("https://raw.githubusercontent.com/dimanoclip/Roblox-Luas/main/rejoin.lua"))()
local Success, ErrorMessage = pcall(function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer) end)
if ErrorMessage and not Success then warn(ErrorMessage) end