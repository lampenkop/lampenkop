local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local ScrollingFrame = Instance.new("ScrollingFrame")

-- Setup ScreenGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Setup MainFrame
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Witte achtergrond als basis
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Add Gradient Background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),  -- Donkergrijs aan de bovenkant
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))   -- Iets lichter grijs aan de onderkant
}
gradient.Parent = MainFrame

-- Setup TitleLabel
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TitleLabel.Text = "Game Loader"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 24
TitleLabel.Parent = MainFrame

-- Setup Close Button
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BorderSizePixel = 0
CloseButton.Parent = MainFrame
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Setup Minimize Button
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
MinimizeButton.Text = "-"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Parent = MainFrame
MinimizeButton.MouseButton1Click:Connect(function()
    if MainFrame.Size.Y.Offset == 500 then
        MainFrame.Size = UDim2.new(0, 400, 0, 50)
    else
        MainFrame.Size = UDim2.new(0, 400, 0, 500)
    end
end)

-- Setup ScrollingFrame
ScrollingFrame.Size = UDim2.new(1, 0, 1, -50)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 50)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ScrollingFrame.Parent = MainFrame

-- Setup UIListLayout for ScrollingFrame
UIListLayout.Parent = ScrollingFrame

-- Add game buttons
local games = {"Aftermath", "Frontlines", "Arsenal"}
local loadButtons = {}
local aftermathVisible = false  -- Toggle status voor Aftermath knoppen

for _, gameName in ipairs(games) do
    local gameButton = Instance.new("TextButton")
    gameButton.Size = UDim2.new(1, 0, 0, 50)
    gameButton.Text = gameName
    gameButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    gameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    gameButton.Font = Enum.Font.SourceSans
    gameButton.TextSize = 20
    gameButton.BorderSizePixel = 0
    gameButton.Parent = ScrollingFrame

    -- Hover effect
    gameButton.MouseEnter:Connect(function()
        gameButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)

    gameButton.MouseLeave:Connect(function()
        gameButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)

    gameButton.MouseButton1Click:Connect(function()
        -- Verberg de laadknoppen als er al knoppen zijn
        for _, btn in ipairs(loadButtons) do
            btn:Destroy()
        end
        loadButtons = {}  -- Reset de lijst met knoppen

        if gameName == "Aftermath" then
            aftermathVisible = not aftermathVisible  -- Toggle de zichtbaarheid

            if aftermathVisible then
                -- Voeg Aftermath-specifieke knoppen toe
                local buttonNames = {
                    {"Load No Fog", "https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/gui/nofog.lua"},
                    {"Load Car Fly", "https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/gui/carfly.lua"},
                    {"Load GoodItemESP", "https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/gui/gooditemESP.lua"},
                    {"Load Inv Viewer", "https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/gui/invviewer.lua"},
                    {"Load Aimbot/ESP", "https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/gui/aimbotandESP.lua"}
                }

                for _, btnInfo in ipairs(buttonNames) do
                    local actionButton = Instance.new("TextButton")
                    actionButton.Size = UDim2.new(1, 0, 0, 40)
                    actionButton.Text = btnInfo[1]
                    actionButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    actionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    actionButton.Font = Enum.Font.SourceSans
                    actionButton.TextSize = 18
                    actionButton.BorderSizePixel = 0
                    actionButton.Parent = ScrollingFrame

                    -- Hover effect for action buttons
                    actionButton.MouseEnter:Connect(function()
                        actionButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    end)

                    actionButton.MouseLeave:Connect(function()
                        actionButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    end)

                    actionButton.MouseButton1Click:Connect(function()
                        loadstring(game:HttpGet(btnInfo[2]))()  -- Laad het script
                    end)

                    table.insert(loadButtons, actionButton)  -- Voeg de knop toe aan de lijst
                end
            end
        elseif gameName == "Frontlines" then
            -- Voeg Frontlines-specifieke knoppen toe
            local frontlinesButton = Instance.new("TextButton")
            frontlinesButton.Size = UDim2.new(1, 0, 0, 40)
            frontlinesButton.Text = "Load Frontlines Lite"
            frontlinesButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            frontlinesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            frontlinesButton.Font = Enum.Font.SourceSans
            frontlinesButton.TextSize = 18
            frontlinesButton.BorderSizePixel = 0
            frontlinesButton.Parent = ScrollingFrame

            frontlinesButton.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/5bebf0b1e173f4baff73449722204837.lua'))()
            end)

            table.insert(loadButtons, frontlinesButton)  -- Voeg de knop toe aan de lijst
        elseif gameName == "Arsenal" then
            -- Voeg Arsenal-specifieke knoppen toe
            local arsenalButton = Instance.new("TextButton")
            arsenalButton.Size = UDim2.new(1, 0, 0, 40)
            arsenalButton.Text = "Load Arsenal Lite"
            arsenalButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            arsenalButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            arsenalButton.Font = Enum.Font.SourceSans
            arsenalButton.TextSize = 18
            arsenalButton.BorderSizePixel = 0
            arsenalButton.Parent = ScrollingFrame

            arsenalButton.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/b95e8fecdf824e41f4a030044b055add.lua'))()
            end)

            table.insert(loadButtons, arsenalButton)  -- Voeg de knop toe aan de lijst
        end
    end)
end

-- Versleepfunctionaliteit
local dragging = false
local dragStart = nil
local startPos = nil

TitleLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TitleLabel.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

TitleLabel.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
