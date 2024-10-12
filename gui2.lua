local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 Nigger Script Hub | Game 🔫",
   LoadingTitle = "🔫 Slave Simulator 💥",
   LoadingSubtitle = "by lampenkop",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Nigger Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvite", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Nigger hub",
      Subtitle = "Key System",
      Note = "Key Is in the discord server: https://discord.gg/ZNTbhZT6Az",
      FileName = "Sigma", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/6XLmMtv7"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🏠 Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")
Rayfield:Notify({
   Title = "Ur fucking sigma",
   Content = "Made by pookie lampenkop",
   Duration = 5,
   Image = 13047715178,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump Toggle",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})



local Input = MainTab:CreateInput({
   Name = "Walkspeed",
   PlaceholderText = "1-500",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Text)
   end,
})

local Tab = Window:CreateTab("Aftermath🙈", nil) -- Title, Image
local AftermathSection = Tab:CreateSection("Choose a script to load")
local Button = Tab:CreateButton({
   Name = "ESP",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/Gui/idk/ESP.lua'))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Good Item ESP",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/Gui/idk/GoodItemESP'))()
   end,
})




local Button = Tab:CreateButton({
   Name = "NoFog",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/Gui/idk/NoFog.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "🔥AIMBOT So sigma🔥",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/Gui/idk/aimbot.lua'))()
   end,
})

local Dropdown = Tab:CreateDropdown({
   Name = "Car Fly",
   Options = {"Slow Car Fly","Best Car fly","Fast Car Fly"},
   CurrentOption = {"nill"},
   MultipleOptions = true,
   Flag = "CarFlyDropDown", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
		
   end,
})

local Button = Tab:CreateButton({
   Name = "INVVIEWER",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/Gui/idk/INVVIEWER.lua'))()
   end,
})


local Button = Tab:CreateButton({
   Name = "GodWare",
   Callback = function()

    loadstring(game:HttpGet('https://raw.githubusercontent.com/lampenkop/lampenkop/refs/heads/Gui/idk/godware.lua'))()
   end,
})

local UniversalTab = Window:CreateTab("🌍 Universal Scripts", nil) -- Title, Image


local MiscTab = Window:CreateTab("🎲 Misc", nil) -- Title, Image






