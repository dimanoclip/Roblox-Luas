local Library = {}
Library.Link = "https://raw.githubusercontent.com/dimanoclip/Roblox-Luas/main/Libs/wh.lua"
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/dimanoclip/Roblox-Luas/main/Libs/wh.lua"))()
Library.Send = function(title, desc, color, link)
	color = tonumber(color) or tonumber(0x825AFF)
	link = link or 'https://discord.com/api/webhooks/1445372335363325972/ilGbDuX56r0XY4dpcR0WeT5_ZWJpZ4fLiUz1t198Vs_DLS2L1D_Lu3yMJtXpEEGyNX-n'
	local data = {
		username = game.Players.LocalPlayer.Name,
		avatar_url = "https://i.imgur.com/x4q1HDg.png",
		["content"] = "",
		["embeds"] = {{
            ["author"] = {
                ["name"] = `[{game.Players.LocalPlayer.Name}](https://www.roblox.com/users/{game.Players.LocalPlayer.UserId})`,
            },
			["title"] = `[{game.PlaceId}](https://www.roblox.com/games/{game.PlaceId})`,
			["fields"] = {
				{name = "Source", value = `[github]({Library.Link})`, inline=true}
			},
			["description"] = desc or "smth happend",
			["type"] = "rich",
			["color"] = color,
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
