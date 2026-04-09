-- [[ Fancy Hub | Muscle Legends ]]
-- Librería: Elerium UI

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Th3_C0re/Elerium-Lib/main/Lib.lua"))()
local Window = library:AddWindow("Fancy Hub", {
    main_color = Color3.fromRGB(255, 110, 0), -- Naranja vibrante
    min_size = Vector2.new(500, 400),
    toggle_key = Enum.KeyCode.RightControl,
})

-- [ TAB: HOME ]
local HomeTab = Window:AddTab("Home")
HomeTab:AddLabel("Fancy Hub - Premium Muscle Legends Script")
HomeTab:AddLabel("Status: [ WORKING ]")
HomeTab:AddButton("Copy Discord Link", function() setclipboard("https://discord.gg/fancyhub") end)

-- [ TAB: MAIN ]
local MainTab = Window:AddTab("Main")
MainTab:AddLabel("Auto Farming")
MainTab:AddSwitch("Auto Brawls (Join/Win)", function(state)
    _G.Brawl = state
    spawn(function()
        while _G.Brawl do
            game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("join")
            task.wait(2)
        end
    end)
end)

-- [ TAB: CRYSTAL ]
local CryTab = Window:AddTab("Crystal")
CryTab:AddButton("Buy Top Crystal", function()
    game:GetService("ReplicatedStorage").rEvents.checkCrystalEvent:FireServer("Blue Crystal")
end)

-- [ TAB: MISC ]
local MiscTab = Window:AddTab("Misc")
MiscTab:AddSlider("Walk Speed", function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end, {min = 16, max = 500})
MiscTab:AddSwitch("Walk on Water", function(state)
    game:GetService("Players").LocalPlayer.Character.WaterWalking.Value = state
end)

-- [ TAB: KILLER ]
local KillTab = Window:AddTab("Killer")
_G.KillAll = false
KillTab:AddSwitch("Auto Kill Everyone", function(state)
    _G.KillAll = state
    spawn(function()
        while _G.KillAll do
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", v.Character.HumanoidRootPart.Position)
                end
            end
            task.wait(0.1)
        end
    end)
end)
