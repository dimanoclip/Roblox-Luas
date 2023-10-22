local Library = {}
Library.Children = function(table, callback)
    if table and (type(table) == "userdata" or type(table) == "table") then local tablename,ttable
        if type(table) == "userdata" then tablename,ttable = table.Name, table; while ttable.Name ~= "Game" do tablename = tostring(ttable.Parent).."."..tablename ttable = ttable.Parent end
        if table:IsA("ModuleScript") then table = require(table) elseif table:IsA("Instance") then table = table:GetChildren() end
        elseif type(table) == "table" then tablename = "Local list"; table = table end
        warn(string.format("%s:",tablename))
        for i,v in table do local type = v.ClassName callback(i,v,type) end
    else return end
end
return Library