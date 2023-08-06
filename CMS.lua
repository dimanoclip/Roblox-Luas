--[[ 
if you dont know a path for ur modulescript,
you can use this script:
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
]]--
local Library = {}
Library.CMS = function(msp)
	for i,v in require(ModuleScriptPathHere) do
		local toprint = (i.." = {\n")
		for i,v in pairs(v) do
			toprint = (toprint.."				"..i.." = "..tostring(v).."\n")
		end
		toprint = (toprint.."			}")
		print(toprint)
	end
end
return Library
