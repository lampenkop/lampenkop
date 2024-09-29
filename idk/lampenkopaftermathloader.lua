-- Maak de GUI 
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NoFogLoader"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false -- Blijft na respawn

-- Maak het hoofdframe
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 700) -- Verhoogde breedte
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -350) -- Midden van het scherm
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Donkerder grijs
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true -- Maak het sleepbaar
mainFrame.ClipsDescendants = true

-- Afgeronde hoeken
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12) -- Afgeronde hoeken
corner.Parent = mainFrame

-- Maak de titel van de GUI
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.15, 0) -- Titel bovenin
titleLabel.Position = UDim2.new(0, 0, 0, 5) -- Verplaats omhoog
titleLabel.Text = "Script Loader"
titleLabel.TextScaled = true
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Witte tekst
titleLabel.BackgroundTransparency = 1 -- Transparante achtergrond
titleLabel.Font = Enum.Font.GothamBold -- Modernere font
titleLabel.Parent = mainFrame

-- Maak de minimize knop
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 50, 0, 50)
minimizeButton.Position = UDim2.new(1, -120, 0, 0) -- Verplaats omhoog
minimizeButton.Text = "-"
minimizeButton.TextScaled = true
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Neutrale kleur
minimizeButton.BorderSizePixel = 0
minimizeButton.Parent = mainFrame

-- Maak de sluitknop
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(1, -60, 0, 0) -- Verplaats omhoog
closeButton.Text = "X"
closeButton.TextScaled = true
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80) -- Heldere rode kleur
closeButton.BorderSizePixel = 0
closeButton.Parent = mainFrame

-- Maak een ScrollingFrame voor de knoppen
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 0.75, 0) -- 75% van de hoogte
scrollFrame.Position = UDim2.new(0, 0, 0.15, 0) -- Onder de titel
scrollFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scrollFrame.BorderSizePixel = 0
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 300) -- Dynamische grootte, verhoog canvas hoogte
scrollFrame.ScrollBarThickness = 10 -- Dikkere scrollbalk
scrollFrame.Parent = mainFrame

-- Afgeronde hoeken voor de ScrollingFrame
local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 12) -- Afgeronde hoeken
scrollCorner.Parent = scrollFrame

-- Functie om knoppen te maken (hergebruik voor consistentie)
local function createButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 50) -- 100% breed, 50 hoog met wat ruimte
    button.Position = position
    button.Text = text
    button.TextScaled = true
    button.TextColor3 = Color3.fromRGB(255, 255, 255) -- Witte tekst
    button.Font = Enum.Font.Gotham -- Modern font
    button.BackgroundColor3 = Color3.fromRGB(70, 130, 180) -- Blauwere tint
    button.BorderSizePixel = 0

    -- Afgeronde hoeken
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button

    button.Parent = scrollFrame -- Plaats de knoppen in de ScrollingFrame

    -- Connect de callback functie aan de knop
    button.MouseButton1Click:Connect(callback)

    return button
end

-- Maak de knoppen met ruimte tussen hen
local loadNoFogButton = createButton("Load No Fog", UDim2.new(0, 0, 0, 0), function()
    local Lighting = game:GetService("Lighting")
    local skyInstance = Lighting:FindFirstChildOfClass("Sky")
    if skyInstance then
        skyInstance:Destroy() -- Verwijder de Sky voor de 'No Fog' functie
    end
    print("No Fog geladen.") -- Bevestigingsbericht in de console
end)

local loadItemESPButton = createButton("Load Item ESP", UDim2.new(0, 0, 0, 60), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/main/boema.lua"))()
    print("Item ESP geladen.") -- Bevestigingsbericht in de console
end)

local loadLootbagESPButton = createButton("Load Lootbag ESP", UDim2.new(0, 0, 0, 120), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/main/idk/lootbagESP.lua"))()
    print("Lootbag ESP geladen.") -- Bevestigingsbericht in de console
end)

local loadAimbotESPButton = createButton("Load AIMBOT/ESP", UDim2.new(0, 0, 0, 180), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/main/idk/aimbot.lua"))()
    print("AIMBOT/ESP geladen.") -- Bevestigingsbericht in de console
end)

local loadInvViewerButton = createButton("Load INV Viewer", UDim2.new(0, 0, 0, 240), function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/135dafb0c84b7bfb126256e1e47fa782.lua"))()
    print("INV Viewer geladen.") -- Bevestigingsbericht in de console
end)

local loadCarFlyButton = createButton("Load Car Fly", UDim2.new(0, 0, 0, 300), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/main/idk/carfly.lua"))()
    print("Car Fly geladen.") -- Bevestigingsbericht in de console
end)

-- Maak de "Made by lampenkop" label
local footerLabel = Instance.new("TextLabel")
footerLabel.Size = UDim2.new(1, 0, 0.1, 0) -- 100% breed, 10% hoog
footerLabel.Position = UDim2.new(0, 0, 0.85, 0) -- Onder de knoppen
footerLabel.Text = "Made by lampenkop"
footerLabel.TextScaled = true
footerLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Zwarte tekst
footerLabel.BackgroundTransparency = 1 -- Transparante achtergrond
footerLabel.Font = Enum.Font.Gotham -- Modernere font
footerLabel.Parent = mainFrame

-- Frame voor geminimaliseerde versie
local minimizedFrame = Instance.new("Frame")
minimizedFrame.Size = UDim2.new(0, 100, 0, 50)
minimizedFrame.Position = mainFrame.Position -- Zelfde positie als mainFrame
minimizedFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizedFrame.Visible = false -- Begin onzichtbaar
minimizedFrame.Parent = screenGui
minimizedFrame.Active = true
minimizedFrame.Draggable = true -- Sleepbaar

-- Knop om de GUI weer uit te klappen
local expandButton = Instance.new("TextButton")
expandButton.Size = UDim2.new(1, 0, 1, 0)
expandButton.Position = UDim2.new(0, 0, 0, 0)
expandButton.Text = "+"
expandButton.TextScaled = true
expandButton.TextColor3 = Color3.fromRGB(255, 255, 255)
expandButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
expandButton.BorderSizePixel = 0
expandButton.Parent = minimizedFrame

-- Minimize functie
minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false -- Verberg het hoofdframe
    minimizedFrame.Position = mainFrame.Position -- Zet de geminimaliseerde frame op dezelfde plek
    minimizedFrame.Visible = true -- Toon de geminimaliseerde versie
end)

-- Expand functie
expandButton.MouseButton1Click:Connect(function()
    minimizedFrame.Visible = false -- Verberg het geminimaliseerde frame
    mainFrame.Visible = true -- Toon het hoofdframe weer
end)

-- Sluit functie
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy() -- Verwijder de hele GUI
end)
