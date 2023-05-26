function ColoredMessage(text, color)
    if color:lower() == "red" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text;
            Font = Enum.Font.Cartoon;
            Color = Color3.fromRGB(190,0,0);
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "green" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text;
            Font = Enum.Font.Cartoon;
            Color = Color3.fromRGB(0,255,190);
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "blue" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text;
            Font = Enum.Font.Cartoon;
            Color = Color3.fromRGB(0,120,255);
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "purple" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text;
            Font = Enum.Font.Cartoon;
            Color = Color3.fromRGB(200,0,255);
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "gold" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text;
            Font = Enum.Font.Cartoon;
            Color = Color3.fromRGB(255, 200,0);
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "orange" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text;
            Font = Enum.Font.Cartoon;
            Color = Color3.fromRGB(255,150,0);
            FontSize = Enum.FontSize.Size96
        })
    elseif color:lower() == "black" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text;
            Font = Enum.Font.Cartoon;
            Color = Color3.fromRGB(0,0,0);
            FontSize = Enum.FontSize.Size96
        })
    else
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = text;
            Font = Enum.Font.Cartoon;
            Color = Color3.fromRGB(255,255,255);
            FontSize = Enum.FontSize.Size96
        })
    end
end
