-- Guis
Gui = Instance.new("ScreenGui", game.CoreGui)
Button = Instance.new("TextButton", Gui)
min = Instance.new("TextButton", Button)
open = Instance.new("TextButton", Gui)

--Hop Button
Button.Size = UDim2.new(0, 100, 0, 40)
Button.BackgroundTransparency = 0
Button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Button.Position = UDim2.new(0.003, 0, 0.93, 0)
Button.Text = "Server Hop"
Button.TextColor3 = Color3.new(255, 255, 255)

--Minimize Button
min.Size = UDim2.new(0, 20, 0, 20)
min.BackgroundTransparency = 1
min.Position = UDim2.new(0, 0, 0, 0)
min.Text = "-"
min.TextColor3 = Color3.new(0, 0, 255)

--Open Button
open.Size = UDim2.new(0, 100, 0, 40)
open.BackgroundTransparency = 0.6
open.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
open.Position = UDim2.new(0.003, 0, 0.93, 0)
open.Text = "Open"
open.Visible = false
open.TextColor3 = Color3.new(255, 255, 255)

-- Scripts
Button.MouseButton1Down:connect(function()
	local PlaceID = game.PlaceId
	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	function TPReturner()
	  local Site;
	  if foundAnything == "" then
	      Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
	  else
	      Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
	  end
	  local ID = ""
	  if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
	      foundAnything = Site.nextPageCursor
	  end
	  local num = 0;
	  for i,v in pairs(Site.data) do
	      local Possible = true
	      ID = tostring(v.id)
	      if tonumber(v.maxPlayers) > tonumber(v.playing) then
	          for _,Existing in pairs(AllIDs) do
	              if num ~= 0 then
	                  if ID == tostring(Existing) then
	                      Possible = false
	                  end
	              else
	                  if tonumber(actualHour) ~= tonumber(Existing) then
	                      local delFile = pcall(function()
	                          -- delfile("NotSameServers.json")
	                          AllIDs = {}
	                          table.insert(AllIDs, actualHour)
	                      end)
	                  end
	              end
	              num = num + 1
	          end
	          if Possible == true then
	              table.insert(AllIDs, ID)
	              wait()
	              pcall(function()
	                  -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
	                  wait()
	                  game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
	              end)
	              wait(4)
	          end
	      end
	  end
	end

	function Teleport()
	  while wait() do
	      pcall(function()
	          TPReturner()
	          if foundAnything ~= "" then
	              TPReturner()
	          end
	      end)
	  end
	end

	Teleport()
end)

min.MouseButton1Down:connect(function()
	Button.Visible = false
	open.Visible = true
end)

open.MouseButton1Down:connect(function()
	Button.Visible = true
	open.Visible = false
end)
