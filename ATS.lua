-- loadstring(game:HttpGet("https://raw.githubusercontent.com/dimanoclip/Roblox-Luas/main/ATS.lua"))()
wait()
script:Destroy()
function descend(obj,class,func)
    for i,v in pairs(obj:GetChildren()) do
        if v:IsA(class) then
            func(v)
        end
        descend(v,class,func)
    end
end
local pls = game:GetService("Players").LocalPlayer
function initiateCharacter(char)
    if not char then return end
    wait()
    descend(char,"BasePart",function(obj)
        obj.Anchored = false
        obj.Changed:connect(function()
            if obj.Anchored then
                obj.Anchored = false
            end
        end)
    end)
    descend(char,"Humanoid",function(obj)
        obj.WalkSpeed = 16
        obj.Changed:connect(function()
            if obj.WalkSpeed == 0 then
                obj.WalkSpeed = 16
            end
        end)
    end)
end
initiateCharacter(pls.Character)
pls.CharacterAdded:connect(function(c)
    initiateCharacter(c)
end)
