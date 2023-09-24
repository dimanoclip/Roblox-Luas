local Library = {}
local HttpService = game:GetService("HttpService")
local function encode(table: table) return HttpService:JSONEncode(table) end
local function decode(table: table) return HttpService:JSONDecode(table) end
Library.Send = function(link, title, desc, color) 
	local color = tonumber(color)
	local url = link or 'https://discord.com/api/webhooks/1141673758705340456/5xx10UZvGtYAvup23n5kfAemYgYpz7xgW90VTAdSvtZSdyhk91RCutNyMciS24fo3te1'
	local data = {
		["content"] = "",
		["embeds"] = {{
            ["author"] = {
                ["name"] = "Useless webhook",
                ["url"] = "https://github.com/Dimanoname/1/blob/main/wh.lua",
                ["icon_url"] = "https://i.imgur.com/x4q1HDg.png"
            },
			["title"] = title or "Roblox",
            ["url"] = "https://www.roblox.com/games/"..game.PlaceId,
			["description"] = desc or "smth happend",
			["type"] = "rich",
			["color"] = color or tonumber(0x000000),
			["footer"] = {
				["text"] = game.Players.LocalPlayer.Name,
				["icon_url"] = "https://i.imgur.com/x4q1HDg.png"
			}
		}}
	}
	local newdata = encode(data)
	local headers = {["content-type"] = "application/json"}
	request = http_request or request or HttpPost or syn.request
	local result = {Url = url, Body = newdata, Method = "POST", Headers = headers}
	request(result)
end
return Library
