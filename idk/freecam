
-- LocalScript in StarterPlayerScripts

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local freeLookEnabled = false
local normalFlySpeed = 5 -- Normale snelheid
local sprintFlySpeed = 10 -- Versnelde snelheid
local flySpeed = normalFlySpeed

local pitch = 0 -- Hoek voor omhoog/omlaag
local yaw = 0 -- Hoek voor links/rechts

local function toggleFreeLook()
    freeLookEnabled = not freeLookEnabled
    if freeLookEnabled then
        -- Zet de camera in scriptable mode
        camera.CameraType = Enum.CameraType.Scriptable
        -- Beweeg de camera naar de positie van het karakter
        camera.CFrame = player.Character.HumanoidRootPart.CFrame
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter -- Verberg de muis

        -- Bevries het karakter
        player.Character.HumanoidRootPart.Anchored = true
    else
        -- Zet de camera terug naar normaal
        camera.CameraType = Enum.CameraType.Custom
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default -- Toon de muis

        -- Laat het karakter weer bewegen
        player.Character.HumanoidRootPart.Anchored = false
    end
end

local function onRenderStep()
    if freeLookEnabled then
        -- Rotatie op basis van muisbeweging
        local mouseDelta = UserInputService:GetMouseDelta()

        -- Alleen yaw aanpassen voor links/rechts draaien
        yaw = yaw - mouseDelta.X * 0.1

        -- Beperk pitch om alleen omhoog/omlaag te bewegen
        pitch = math.clamp(pitch - mouseDelta.Y * 0.1, -89, 89)

        -- Pas de camera CFrame aan
        camera.CFrame = CFrame.new(camera.CFrame.Position) * CFrame.Angles(math.rad(pitch), math.rad(yaw), 0)

        -- Beweging van de camera (vliegen)
        local direction = Vector3.new(0, 0, 0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            direction = direction + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            direction = direction - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            direction = direction - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            direction = direction + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            direction = direction + Vector3.new(0, 1, 0) -- Omhoog
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            direction = direction - Vector3.new(0, 1, 0) -- Omlaag
        end

        -- Versnelling bij het ingedrukt houden van Shift
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            flySpeed = sprintFlySpeed
        else
            flySpeed = normalFlySpeed
        end

        camera.CFrame = camera.CFrame + direction * flySpeed * 0.1 -- Pas de snelheid aan
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.F2 then
        toggleFreeLook()
    end
end)

RunService.RenderStepped:Connect(onRenderStep)
