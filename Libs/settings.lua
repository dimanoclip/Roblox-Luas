--https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/settings.lua
local Library = {}
if _G.defname then else _G.defname = "UselessData.json" end
local HttpService = game:GetService("HttpService")
local function encode(table: table) return HttpService:JSONEncode(table) end
local function decode(table: table) return HttpService:JSONDecode(table) end
local function check() if writefile and readfile and isfile and delfile then return true else return false end end
Library.setdef = function(newname: string) if newname then _G.defname = newname end end
Library.getdef = function() return _G.defname end
Library.save = function(name: string, table: table)
    name = name or _G.defname
    table = table or {}
    if check() then
        if string.sub(name, -5) ~= ".json" then name = name..".json" end
        writefile(name, encode(table))
    else return end
end
Library.get = function(name: string)
    name = name or _G.defname
    if check() then
        if isfile(name) then
            if string.sub(name, -5) ~= ".json" then name = name..".json" end
            return decode(readfile(name))
        end
    else return {} end
end
Library.delfile = function(name: string)
    name = name or _G.defname
    if check() then
        delfile(name)
    else return end
end
Library.isfile = function(name: string)
    name = name or _G.defname
    if check() then
        return isfile(name)
    else return end
end
return Library