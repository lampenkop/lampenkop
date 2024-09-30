local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local ScrollingFrame = Instance.new("ScrollingFrame")
local FooterLabel = Instance.new("TextLabel") -- Voor de "Made by lampenkop" tekst

-- Setup ScreenGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Setup MainFrame met ronde hoeken
MainFrame.Size = UDim2.new(0, 450, 0, 550)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Parent = ScreenGui

-- Ronde hoeken voor MainFrame
local cornerMain = Instance.new("UICorner")
cornerMain.CornerRadius = UDim.new(0, 12)
cornerMain.Parent = MainFrame

-- Setup TitleLabel
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TitleLabel.Text = "Script Loader"  -- Veranderd naar Script Loader
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 26
TitleLabel.Parent = MainFrame

-- Ronde hoeken voor TitleLabel
local cornerTitle = Instance.new("UICorner")
cornerTitle.CornerRadius = UDim.new(0, 12)
cornerTitle.Parent = TitleLabel

-- Setup Close Button
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 10)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BorderSizePixel = 0
CloseButton.Font = Enum.Font.Gotham
CloseButton.Parent = MainFrame
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Ronde hoeken voor CloseButton
local cornerClose = Instance.new("UICorner")
cornerClose.CornerRadius = UDim.new(0, 6)
cornerClose.Parent = CloseButton

-- Setup Minimize Button
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -70, 0, 10)
MinimizeButton.Text = "-"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Font = Enum.Font.Gotham
MinimizeButton.Parent = MainFrame
MinimizeButton.MouseButton1Click:Connect(function()
    if MainFrame.Size.Y.Offset == 550 then
        MainFrame.Size = UDim2.new(0, 450, 0, 50)
    else
        MainFrame.Size = UDim2.new(0, 450, 0, 550)
    end
end)

-- Ronde hoeken voor MinimizeButton
local cornerMinimize = Instance.new("UICorner")
cornerMinimize.CornerRadius = UDim.new(0, 6)
cornerMinimize.Parent = MinimizeButton

-- Setup ScrollingFrame
ScrollingFrame.Size = UDim2.new(1, 0, 1, -80)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 50)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Parent = MainFrame

-- Setup UIListLayout voor ScrollingFrame
UIListLayout.Parent = ScrollingFrame

-- Footer Label (Made by lampenkop)
FooterLabel.Size = UDim2.new(1, 0, 0, 20)
FooterLabel.Position = UDim2.new(0, 0, 1, -20)
FooterLabel.BackgroundTransparency = 1
FooterLabel.Text = "Made by lampenkop"
FooterLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
FooterLabel.TextScaled = true
FooterLabel.Font = Enum.Font.Gotham
FooterLabel.Parent = MainFrame

-- Add game buttons met betere visuals
local games = {"Aftermath", "Frontlines", "Arsenal", "Counter Blox"} 
local loadButtons = {}
local aftermathVisible = false

local function hideLoadButtons()
    for _, btn in ipairs(loadButtons) do
        btn:Destroy()
    end
    loadButtons = {}
end

for _, gameName in ipairs(games) do
    local gameButton = Instance.new("TextButton")
    gameButton.Size = UDim2.new(1, 0, 0, 50)
    gameButton.Text = gameName
    gameButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    gameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    gameButton.Font = Enum.Font.Gotham
    gameButton.TextSize = 20
    gameButton.BorderSizePixel = 0
    gameButton.Parent = ScrollingFrame

    -- Hover effect met smooth transition
    gameButton.MouseEnter:Connect(function()
        gameButton:TweenSizeAndPosition(UDim2.new(1, 0, 0, 55), gameButton.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2)
        gameButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)

    gameButton.MouseLeave:Connect(function()
        gameButton:TweenSizeAndPosition(UDim2.new(1, 0, 0, 50), gameButton.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2)
        gameButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)

    gameButton.MouseButton1Click:Connect(function()
        hideLoadButtons()

        if gameName == "Aftermath" then
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
                actionButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                actionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                actionButton.Font = Enum.Font.Gotham
                actionButton.TextSize = 18
                actionButton.BorderSizePixel = 0
                actionButton.Parent = ScrollingFrame

                actionButton.MouseEnter:Connect(function()
                    actionButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
                end)

                actionButton.MouseLeave:Connect(function()
                    actionButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                end)

                actionButton.MouseButton1Click:Connect(function()
                    loadstring(game:HttpGet(btnInfo[2]))()  -- Laad het script
                end)

                table.insert(loadButtons, actionButton)  -- Voeg de knop toe aan de lijst
            end
        elseif gameName == "Frontlines" then
            local loadButton = Instance.new("TextButton")
            loadButton.Size = UDim2.new(1, 0, 0, 40)
            loadButton.Text = "Load Frontlines Lite"
            loadButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            loadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            loadButton.Font = Enum.Font.Gotham
            loadButton.TextSize = 18
            loadButton.BorderSizePixel = 0
            loadButton.Parent = ScrollingFrame

            loadButton.MouseEnter:Connect(function()
                loadButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
            end)

            loadButton.MouseLeave:Connect(function()
                loadButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            end)

            loadButton.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/5bebf0b1e173f4baff73449722204837.lua'))()
            end)

            table.insert(loadButtons, loadButton)

        elseif gameName == "Arsenal" then
            local loadButton = Instance.new("TextButton")
            loadButton.Size = UDim2.new(1, 0, 0, 40)
            loadButton.Text = "Load Arsenal Lite"
            loadButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            loadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            loadButton.Font = Enum.Font.Gotham
            loadButton.TextSize = 18
            loadButton.BorderSizePixel = 0
            loadButton.Parent = ScrollingFrame

            loadButton.MouseEnter:Connect(function()
                loadButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
            end)

            loadButton.MouseLeave:Connect(function()
                loadButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            end)

            loadButton.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/b95e8fecdf824e41f4a030044b055add.lua'))()
            end)

            table.insert(loadButtons, loadButton)

        elseif gameName == "Counter Blox" then
            local loadButton = Instance.new("TextButton")
            loadButton.Size = UDim2.new(1, 0, 0, 40)
            loadButton.Text = "Load Solaris"
            loadButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            loadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            loadButton.Font = Enum.Font.Gotham
            loadButton.TextSize = 18
            loadButton.BorderSizePixel = 0
            loadButton.Parent = ScrollingFrame

            loadButton.MouseEnter:Connect(function()
                loadButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
            end)

            loadButton.MouseLeave:Connect(function()
                loadButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            end)

            loadButton.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/toasty-dev/pissblox/main/solaris_bootstrapper.lua",true))()
            end)

            table.insert(loadButtons, loadButton)
        end
    end)

    gameButton.MouseButton2Click:Connect(function()
        hideLoadButtons()  -- Verberg de laadknoppen als er op een game wordt dubbelgeklikt
    end)
end

-- Versleepfunctionaliteit met animatie
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

