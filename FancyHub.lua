-- FANCY HUB | BY HADXS (ESTILO ELERIUM)
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/Libaries/EleriumLib.lua"))()

local Win = Lib:AddWindow("Fancy Hub | HADXS", {
    main_color = Color3.fromRGB(255, 0, 0), -- Color Rojo
    min_size = Vector2.new(350, 250),
    toggle_key = Enum.KeyCode.RightControl,
    can_resize = true,
})

-- PESTAÑAS AL ESTILO ELERIUM
local Tab1 = Win:AddTab("Farm")
local Tab2 = Win:AddTab("Stats")

-- AUTO FARM
_G.AutoFarm = false
Tab1:AddToggle("Auto Fuerza (Pesas/Rocas)", function(state)
    _G.AutoFarm = state
    task.spawn(function()
        while _G.AutoFarm do
            pcall(function()
                local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then tool:Activate() end
            end)
            task.wait(0.1)
        end
    end)
end)

Tab1:AddButton("Auto Rebirth", function()
    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
end)

-- JUGADOR
Tab2:AddSlider("Velocidad", 16, 500, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Tab2:AddSlider("Salto", 50, 500, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- BOTÓN HADXS PARA MÓVIL
local SG = Instance.new("ScreenGui", game.CoreGui)
local BT = Instance.new("TextButton", SG)
BT.Size = UDim2.new(0, 60, 0, 60)
BT.Position = UDim2.new(0, 10, 0.5, 0)
BT.Text = "HADXS"
BT.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BT.TextColor3 = Color3.fromRGB(255, 0, 0)
BT.Draggable = true
Instance.new("UICorner", BT).CornerRadius = UDim.new(0, 50)

BT.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
end)
