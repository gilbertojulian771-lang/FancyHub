-- FANCY HUB | BY HADXS
-- Inspirado en la estructura de Super Nova Hub

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/Lib/Elerium.lua"))()

-- Crear la Ventana (Estilo similar al link que pasaste)
local Window = Library:AddWindow("Fancy Hub | HADXS", {
    main_color = Color3.fromRGB(120, 0, 255), -- Morado Neón (Estilo Super Nova)
    min_size = Vector2.new(350, 400),
    toggle_key = Enum.KeyCode.RightControl,
})

-- Pestaña de Farm (Muscle Legends)
local FarmTab = Window:AddTab("Farm")

_G.AutoFarm = false

FarmTab:AddSwitch("Auto-Lift (Equipa Pesa)", function(state)
    _G.AutoFarm = state
    task.spawn(function()
        while _G.AutoFarm do
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end)
            task.wait(0.1)
        end
    end)
end)

-- Pestaña de Personaje
local PlayerTab = Window:AddTab("Jugador")

PlayerTab:AddButton("Anti-AFK", function()
    local vu = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:Connect(function()
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end)
end)

-----------------------------------------------------------
-- BOTÓN FLOTANTE (Indispensable para móvil)
-----------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
ToggleButton.Position = UDim2.new(0.1, 0, 0.4, 0)
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Text = "FH" -- Siglas de Fancy Hub
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Draggable = true -- Lo puedes mover con el dedo

UICorner.CornerRadius = UDim.new(0, 50)
UICorner.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    -- Este código busca la GUI creada por Elerium y la oculta/muestra
    for _, v in pairs(game.CoreGui:GetChildren()) do
        if v.Name == "Fancy Hub | HADXS" then
            v.Enabled = not v.Enabled
        end
    end
end)

Library:Notify("Fancy Hub", "Cargado correctamente por HADXS", 5)
