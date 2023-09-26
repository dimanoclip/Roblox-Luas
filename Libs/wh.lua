local Library = {}
Library.Send = function(link, title, desc, color)
	color = tonumber(color)
	link = link or 'https://discord.com/api/webhooks/1141673758705340456/5xx10UZvGtYAvup23n5kfAemYgYpz7xgW90VTAdSvtZSdyhk91RCutNyMciS24fo3te1'
	local data = {
		["content"] = "",
		["embeds"] = {{
            ["author"] = {
                ["name"] = game.PlaceId,
                ["url"] = "https://www.roblox.com/games/"..game.PlaceId 
            },
			["title"] = title or "Roblox",
            ["url"] = "https://github.com/Dimanoname/1/blob/main/wh.lua",
			["description"] = desc or "smth happend",
			["type"] = "rich",
			["color"] = color or tonumber(0x000000),
			["footer"] = {
				["text"] = game.Players.LocalPlayer.Name,
				["icon_url"] = "https://i.imgur.com/x4q1HDg.png"
			}
		}}
	}
	data = game:GetService("HttpService"):JSONEncode(data)
	local request = http_request or request or HttpPost or syn.request
	local result = {
		Url = link,
		Body = data,
		Method = "POST",
		Headers = {
			["content-type"] = "application/json"
		}
	}
	request(result)
end
return Library
