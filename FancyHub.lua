-- FANCY HUB | BY HADXS (ELERIUM VERSION)
local Success, Library = pcall(function()
return loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/Libaries/EleriumLib.lua"))() 
end)

if not Success or not Library then 
    print("Error al cargar la librería Elerium")
    return 
end

local Window = Library:AddWindow("Fancy Hub | HADXS", {
    main_color = Color3.fromRGB(255, 0, 0), -- Color Rojo HADXS
    min_size = Vector2.new(350, 250),
    toggle_key = Enum.KeyCode.RightControl,
    can_resize = true,
})

-- PESTAÑAS
local Tab1 = Window:AddTab("Auto Farm")
local Tab2 = Window:AddTab("Jugador")

-- AUTO FARM (Funciona con Pesas y Rocas)
_G.AutoFarm = false
Tab1:AddToggle("Auto-Farm Universal", function(state)
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

-----------------------------------------------------------
-- BOTÓN FLOTANTE HADXS (FIJO PARA DELTA)
-----------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")
local Corner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 60, 0, 60)
Button.Position = UDim2.new(0, 10, 0.5, 0)
Button.Text = "HADXS"
Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Button.TextColor3 = Color3.fromRGB(255, 0, 0)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 14
Button.Draggable = true
Corner.CornerRadius = UDim.new(0, 50)
Corner.Parent = Button

-- Esto abre y cierra el menú Elerium en móvil
Button.MouseButton1Click:Connect(function()
    Library:Close() -- Función interna de Elerium para Toggle
end)
