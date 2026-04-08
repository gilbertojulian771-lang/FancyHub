-- FANCY HUB | BY HADXS (ELERIUM FIX)
local Success, Library = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/Libaries/EleriumLib.lua"))()
end)

if not Success then 
    warn("Error cargando librería Elerium")
    return 
end

local Window = Library:AddWindow("Fancy Hub | HADXS", {
    main_color = Color3.fromRGB(255, 0, 0),
    min_size = Vector2.new(350, 250),
    toggle_key = Enum.KeyCode.RightControl,
    can_resize = true,
})

-- PESTAÑAS
local Tab1 = Window:AddTab("Auto Farm")
local Tab2 = Window:AddTab("Jugador")
local Tab3 = Window:AddTab("Teleports")

-- AUTO FARM
_G.AutoFarm = false
Tab1:AddToggle("Auto-Farm (Pesas/Rocas)", function(state)
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

_G.AutoRebirth = false
Tab1:AddToggle("Auto-Rebirth", function(state)
    _G.AutoRebirth = state
    while _G.AutoRebirth do
        game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
        task.wait(1)
    end
end)

-- JUGADOR
Tab2:AddSlider("Velocidad", 16, 500, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Tab2:AddSlider("Salto", 50, 500, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- TELEPORTS
Tab3:AddButton("Zona 1 (Gym)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-100, 5, 0)
end)
Tab3:AddButton("Zona 2 (Beach)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(200, 5, 200)
end)

-- BOTÓN FLOTANTE (ESTO ES LO QUE ABRE EL MENÚ EN MÓVIL)
local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")
local Corner = Instance.new("UICorner")
ScreenGui.Parent = game.CoreGui
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 55, 0, 55)
Button.Position = UDim2.new(0, 10, 0.4, 0)
Button.Text = "HADXS"
Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Button.TextColor3 = Color3.fromRGB(255, 0, 0)
Button.Draggable = true
Corner.CornerRadius = UDim.new(0, 50)
Corner.Parent = Button

Button.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
end)
