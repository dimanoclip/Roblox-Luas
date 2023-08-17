local Library = {}
Library.SWH = function(link, title, desc, colour) 
	local color = tonumber(colour)
	local url = link or 'https://discord.com/api/webhooks/1141673758705340456/5xx10UZvGtYAvup23n5kfAemYgYpz7xgW90VTAdSvtZSdyhk91RCutNyMciS24fo3te1'
	local data = {
		["content"] = "",
		["embeds"] = {{
			["title"] = title,
			["description"] = desc,
			["type"] = "rich",
			["color"] = color or tonumber(0x000000),
			["footer"] = {
				["text"] = "UselessBot",
				["icon_url"] = "https://i.imgur.com/x4q1HDg.png"
			},
		}}
	}
	local newdata = game:GetService("HttpService"):JSONEncode(data)
	local headers = {["content-type"] = "application/json"}
	request = http_request or request or HttpPost or syn.request
	local result = {Url = url, Body = newdata, Method = "POST", Headers = headers}
	request(result)
end
return Library
