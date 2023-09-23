local Library = {}
local HttpService = game:GetService("HttpService")
local function encode(table: table) return HttpService:JSONEncode(table) end
local function decode(table: table) return HttpService:JSONDecode(table) end
Library.save = function(name: string, table: table)
    if writefile then 
        writefile(name, encode(table)) 
    end 
end
Library.get = function(name: string)
    if readfile and isfile then 
        if isfile(name) then 
            return decode(readfile(name)) 
        end 
    end 
end
return Library
