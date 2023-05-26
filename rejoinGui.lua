-- Guis
Gui = Instance.new("ScreenGui", game.CoreGui)
But = Instance.new("TextButton", Gui)
mi = Instance.new("TextButton", But)
op = Instance.new("TextButton", Gui)

--Hop Button
But.Size = UDim2.new(0, 100, 0, 40)
But.BackgroundTransparency = 0
But.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
But.Position = UDim2.new(0.003, 0, 0.02, 0)
But.Text = "Rejoin"
But.TextColor3 = Color3.new(255, 255, 255)

--Minimize Button
mi.Size = UDim2.new(0, 20, 0, 20)
mi.BackgroundTransparency = 1
mi.Position = UDim2.new(0, 0, 0, 0)
mi.Text = "-"
mi.TextColor3 = Color3.new(0, 0, 255)

--Open Button
op.Size = UDim2.new(0, 100, 0, 40)
op.BackgroundTransparency = 0.6
op.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
op.Position = UDim2.new(0.003, 0, 0.02, 0)
op.Text = "Open"
op.Visible = false
op.TextColor3 = Color3.new(255, 255, 255)

-- Scripts
But.MouseButton1Down:connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/1/main/rejoin"))()
end)

mi.MouseButton1Down:connect(function()
	But.Visible = false
	op.Visible = true
end)

op.MouseButton1Down:connect(function()
	But.Visible = true
	op.Visible = false
end)
