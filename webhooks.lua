if not _G.WebHooks then
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
		Library.SWH(
			'https://discord.com/api/webhooks/1141419114779385926/SqqmAqRlV90lm_ngpEZSfU8iFNtH3EnVECsd5_xCfh93MyNrdjgjJkAjc8H0xgJ9Btq4',
			"Player Existing",
			player.Name,
			0x0050a3
		)
		v.Chatted:connect(function(msg)
			Library.SWH(
				'https://discord.com/api/webhooks/1141419114779385926/SqqmAqRlV90lm_ngpEZSfU8iFNtH3EnVECsd5_xCfh93MyNrdjgjJkAjc8H0xgJ9Btq4',
				player.Name,
				msg,
				0x00a36d
			)
		end)
	end
end
_G.WebHooks = true
