local Library = {}
local Camera = workspace:FindFirstChildWhichIsA("Camera")
local VirtualInputManager = game:GetService("VirtualInputManager")

Library.MouseClick = function(x, y, wtime)
  VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, nil, 0)
    if wtime then task.wait(wtime) end
    VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, nil, 0)
end

Library.MoveMouse = function(x, y)
    VirtualInputManager:SendMouseMoveEvent(x, y, nil)
end

Library.PressKey = function(kc, wtime)
    VirtualInputManager:SendKeyEvent(true, kc, false, nil)
    if wtime then task.wait(wtime) end
    VirtualInputManager:SendKeyEvent(false, kc, false, nil)
end

Library.PressButton = function(ButtonLabel)
    Library.MouseClick(ButtonLabel.AbsolutePosition.X + ButtonLabel.AbsoluteSize.X/2, ButtonLabel.AbsolutePosition.Y + ButtonLabel.AbsoluteSize.Y*3/2)
end

Library.CenterMouseClick = function()
    Library.MouseClick(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
end

return Library