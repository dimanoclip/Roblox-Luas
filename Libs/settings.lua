--https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/settings.lua
local Library = {}
local HttpService = game:GetService("HttpService")
local function encode(table: table) return HttpService:JSONEncode(table) end
local function decode(table: table) return HttpService:JSONDecode(table) end
local function check() if writefile and readfile and isfile and delfile then return true else return false end end
Library.save = function(name: string, table: table)
    name = name or "UselessData.json"
    if check() then
        if string.sub(name, -5) ~= ".json" then name = name..".json" end
        writefile(name, encode(table))
    else return end
end
Library.get = function(name: string)
    name = name or "UselessData.json"
    if check() then
        if isfile(name) then
            if string.sub(name, -5) ~= ".json" then name = name..".json" end
            return decode(readfile(name))
        end
    else return {} end 
end
Library.del = function(name: string)
    name = name or "UselessData.json"
    if check() then
        delfile(name)
    else return end
end
Library.check = function(name: string)
    name = name or "UselessData.json"
    if check() then
        return isfile(name)
    else return end
end
return Library
