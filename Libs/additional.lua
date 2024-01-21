local Library = {}
Library.Link = "https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/additional.lua"
Library.Children = function(table, callback)
    if table and (type(table) == "userdata" or type(table) == "table") then local tablename,ttable
        if type(table) == "userdata" then tablename,ttable = table.Name, table; while ttable.Name ~= "Game" do tablename = tostring(ttable.Parent).."."..tablename ttable = ttable.Parent end
        if table:IsA("ModuleScript") then table = require(table) elseif table:IsA("Instance") then table = table:GetChildren() end
        elseif type(table) == "table" then tablename = "Local list"; table = table end
        warn(string.format("%s:",tablename))
        for i,v in table do local type = v.ClassName callback(i,v,type) end
    else return end
end
Library.dist_to = function(pos)
    return math.floor(((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")).Position - pos).magnitude) or 0
end
Library.is_moving = function(humanoid)
    if (humanoid.MoveDirection == Vector3.new(0,0,0) and humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and humanoid:GetState() ~= Enum.HumanoidStateType.Freefall) then return false end
    return true
end
Library.is_exist = function(instance)
    if instance.Parent:FindFirstChild(instance) then return true end
    return false
end
Library.is_alive = function(ply)
    if ply.Character:FindFirstChild("Humanoid") and ply.Character:FindFirstChild("Humanoid").Health > 0 then return true end
    return false
end
Library.int = function(value)
    if tonumber(value) then return tonumber(value) end
    return 0
end
Library.str = function(value)
    return tostring(value) or ""
end
Library.has_value = function(src, value)
    if type(src) == "string" then
        return string.find(src, value) and true
    elseif type(src) == "table" then
        for i,v in pairs(src) do if v == value then return true end end
    end
    return false
end
Library.get_friends = function(player)
    local friends = {}
    for i,v in pairs(game.Players:children()) do if player:IsFriendsWith(v.UserId) then table.insert(friends, v) end end
    return friends
end
return Library