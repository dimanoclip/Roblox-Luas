local Library = {}
local ts = game:GetService('TeleportService')
Library.Link = "https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/additional.lua"
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/additional.lua"))()
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
    if pos:IsA('Vector3') then pos = pos
    elseif pos:IsA('Part') or pos:IsA('MeshPart') then pos = pos.Position
    elseif pos:IsA('Model') then pos = pos.PrimaryPart.Position
    elseif pos:IsA('Player') then pos = pos.Character.PrimaryPart.Position end
    return math.floor(((game.Players.LocalPlayer.Character.HumanoidRootPart).Position - pos).magnitude) or 0
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
Library.format_number = function(number)
    local str_num = tostring(number)
    if tonumber(str_num:sub(-1)) > 3 then
        return str_num..'th'
    elseif tonumber(str_num:sub(-1)) == 3 then
        return str_num..'rd'
    elseif tonumber(str_num:sub(-1)) == 2 then
        return str_num..'nd'
    elseif tonumber(str_num:sub(-1)) == 1 then
        return str_num..'st'
    end
end
Library.join_place = function(placeid, jobid)
    placeid = placeid or game.PlaceId
    jobid = jobid and tostring(jobid) or jobid
    if jobid then
        ts:TeleportToPlaceInstance(placeid, jobid, game.Players.LocalPlayer)
    else
        ts:Teleport(placeid, game.Players.LocalPlayer)
    end
end
Library.hlplayer = function(ply, fillcolor, outlinecolor, transparency)
    if ply.Character:FindFirstChild("U_Highlight") then return end
    fillcolor = fillcolor or Color3.fromRGB(0,0,0)
    outlinecolor = outlinecolor or Color3.fromRGB(255,255,255)
    transparency = transparency or 0
    local hl = Instance.new("Highlight")
    hl.Name = "U_Highlight"
    hl.Parent = ply.Character
    hl.FillColor = fillcolor
    hl.OutlineColor = outlinecolor
    hl.DepthMode = Enum.HighlightDepthMode.Occluded
    hl.FillTransparency = transparency
    return hl
end
Library.unhlplayer = function(ply)
        ply.Character:FindFirstChild("U_Highlight"):Remove()
end
Library.copy_connect = function()
    setclipboard(string.format("game:GetService('TeleportService'):TeleportToPlaceInstance(%s, '%s', game.Players.LocalPlayer)", tostring(game.PlaceId), game.JobId))
end
Library.ss = function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
    print("Loaded simplespy")
end
Library.dd = function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/refs/heads/main/dex.lua", true))()
    print("Loaded darkdex")
end
Library.aa = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Anti-AFK.lua"))()
end
return Library