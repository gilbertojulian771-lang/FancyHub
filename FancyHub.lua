local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vip-Original/Elerium-Lib/main/Lib.lua"))()
local Window = Library:AddWindow("HADXS Hub | Muscle Legends", {
    main_color = Color3.fromRGB(170, 0, 0), -- Un rojo intenso para el estilo Elerium
    min_size = Vector2.new(400, 300),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

-- Pestañas principales
local MainTab = Window:AddTab("Auto-Farm")
local PlayerTab = Window:AddTab("Player")
local TeleportTab = Window:AddTab("Teleports")

-- Variables de control
_G.AutoWeight = false
_G.AutoRebirth = false

-- SECCIÓN: Auto-Farm
MainTab:AddSwitch("Auto Weight", function(bool)
    _G.AutoWeight = bool
    spawn(function()
        while _G.AutoWeight do
            task.wait()
            local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight") or game.Players.LocalPlayer.Character:FindFirstChild("Weight")
            if tool then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                tool:Activate()
            end
        end
    end)
end)

MainTab:AddSwitch("Auto Rebirth", function(bool)
    _G.AutoRebirth = bool
    spawn(function()
        while _G.AutoRebirth do
            task.wait(1)
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
        end
    end)
end)

-- SECCIÓN: Player
PlayerTab:AddSlider("WalkSpeed", 16, 500, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

PlayerTab:AddSlider("JumpPower", 50, 1000, 50, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

-- Botón Flotante para Móvil (Movible)
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 10, 0.5, 0)
ToggleButton.Text = "HADXS"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Draggable = true -- Para que puedas moverlo donde no estorbe

ToggleButton.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightShift, false, game)
end)
