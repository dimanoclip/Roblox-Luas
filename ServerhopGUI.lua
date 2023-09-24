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
Button.Text = "ServerHop"
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
Button.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/serverhop.lua"))()
end)

min.MouseButton1Down:Connect(function()
	Button.Visible = false
	open.Visible = true
end)

open.MouseButton1Down:Connect(function()
	Button.Visible = true
	open.Visible = false
end)
