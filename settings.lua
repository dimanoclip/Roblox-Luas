local Library = {}
local HttpService = game:GetService("HttpService")
local function encode(table: table) return HttpService:JSONEncode(table) end
local function decode(table: table) return HttpService:JSONDecode(table) end
Library.save = function(name: string, table: table)
    if writefile then 
        if string.sub(name, -5) ~= ".json" then name = name..".json" end
        writefile(name, encode(table)) 
    else return end 
end
Library.get = function(name: string)
    if readfile and isfile then 
        if isfile(name) then 
            if string.sub(name, -5) ~= ".json" then name = name..".json" end
            return decode(readfile(name)) 
        end
    else return {} end 
end
Library.del = function(name: string)
    if delfile then
        if string.sub(name, -5) ~= ".json" then name = name..".json" end
        delfile(name)
    else return end
end
Library.check = function(name: string)
    if isfile then
        return isfile(name)
    else return end
end
return Library
