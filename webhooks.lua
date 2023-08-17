local Library = {}

Library.SWH = function(link, title, description, colour) 
	local tit,desc,color = tostring(title),tostring(desc),tonumber(colour)
	local url = link or 'https://discord.com/api/webhooks/1141673758705340456/5xx10UZvGtYAvup23n5kfAemYgYpz7xgW90VTAdSvtZSdyhk91RCutNyMciS24fo3te1'
	local data = {
		["content"] = "",
		["embeds"] = {{
			["title"] = tit,
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

game.Players.PlayerAdded:connect(function(player)
	Library.SWH(
		'https://discord.com/api/webhooks/1141419114779385926/SqqmAqRlV90lm_ngpEZSfU8iFNtH3EnVECsd5_xCfh93MyNrdjgjJkAjc8H0xgJ9Btq4',
		"Player Joined",
		player.Name,
		0x0050a3
	)
	player.Chatted:connect(function(msg)
		Library.SWH(
			'https://discord.com/api/webhooks/1141419114779385926/SqqmAqRlV90lm_ngpEZSfU8iFNtH3EnVECsd5_xCfh93MyNrdjgjJkAjc8H0xgJ9Btq4',
			player.Name
			msg,
			0x00a36d
		)
	end)
end)
game.Players.PlayerRemoving:connect(function(player)
	Library.SWH(
		'https://discord.com/api/webhooks/1141419114779385926/SqqmAqRlV90lm_ngpEZSfU8iFNtH3EnVECsd5_xCfh93MyNrdjgjJkAjc8H0xgJ9Btq4',
		"Player Exiting",
		player.Name,
		0x0050a3
	)
end)
task.wait(1)
for i,v in pairs(game.Players:children()) do
	local player = v
	v.Chatted:connect(function(msg)
		Library.SWH(
			'https://discord.com/api/webhooks/1141419114779385926/SqqmAqRlV90lm_ngpEZSfU8iFNtH3EnVECsd5_xCfh93MyNrdjgjJkAjc8H0xgJ9Btq4',
			player.Name,
			msg,
			0x00a36d
		)
	end)
end
