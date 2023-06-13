local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
 
local Success, ErrorMessage = pcall(function()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)

if ErrorMessage and not Success then
    warn(ErrorMessage)
end
end)
