--[[
    WORLD HUB - MUSCLE LEGENDS V1.0.4
    UI Library: Elerium
    Desarrollado por: Rafael y Sherya
--]]

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Elerium-Lib-v2/main/source.lua"))()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local muscleEvent = game:GetService("ReplicatedStorage").MuscleEvent
local displayName = player.DisplayName or player.Name

-- Anti-AFK (Evita que te saquen por inactividad)
local VirtualUser = game:GetService("VirtualUser")
player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new(0, 0))
end)

-- Variables de Control
local _G = {
    FastFarm = false,
    AutoRebirth = false,
    AutoPunch = false,
    AutoEvolve = false
}

-- Configuración de la Ventana
local window = library:AddWindow("World Hub | " .. displayName, {
    main_color = Color3.fromRGB(0, 0, 0), -- Fondo Negro Elegante
    min_size = Vector2.new(430, 500),
    can_resize = false,
})

-- PESTAÑA: FARMING
local AutoFarm = window:AddTab("Farming")

AutoFarm:AddLabel("Entrenamiento Automático").TextSize = 20

AutoFarm:AddSwitch("Fast Farming (Pesas/Punch)", function(state)
    _G.FastFarm = state
    while _G.FastFarm do
        task.wait()
        -- Activa la herramienta equipada y envía el evento de golpe
        local tool = player.Character:FindFirstChildOfClass("Tool")
        if tool then tool:Activate() end
        muscleEvent:FireServer("punch", "leftHand")
        muscleEvent:FireServer("punch", "rightHand")
    end
end)

AutoFarm:AddSwitch("Auto Rebirth Infinito", function(state)
    _G.AutoRebirth = state
    while _G.AutoRebirth do
        task.wait(1)
        muscleEvent:FireServer("rebirthRequest")
    end
end)

AutoFarm:AddSwitch("Auto Evolucionar", function(state)
    _G.AutoEvolve = state
    while _G.AutoEvolve do
        task.wait(2)
        muscleEvent:FireServer("evolveRequest")
    end
end)

-- PESTAÑA: ESTADÍSTICAS
local StatsTab = window:AddTab("Estadísticas")

local labelFuerza = StatsTab:AddLabel("Fuerza: Cargando...")
local labelDura = StatsTab:AddLabel("Agilidad: Cargando...")
local labelRebirths = StatsTab:AddLabel("Rebirths: Cargando...")

-- Actualización en tiempo real de Stats
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            labelFuerza.Text = "Fuerza: " .. player.leaderstats.Strong.Value
            labelDura.Text = "Agilidad: " .. player.leaderstats.Agility.Value
            labelRebirths.Text = "Rebirths: " .. player.leaderstats.Rebirths.Value
        end)
    end
end)

-- PESTAÑA: KILLER
local KillerTab = window:AddTab("Killer")

KillerTab:AddSwitch("Auto Punch Fast", function(state)
    _G.AutoPunch = state
    while _G.AutoPunch do
        task.wait()
        muscleEvent:FireServer("punch", "leftHand")
        muscleEvent:FireServer("punch", "rightHand")
    end
end)

-- PESTAÑA: CRÉDITOS
local Credits = window:AddTab("Créditos")
Credits:AddLabel("WORLD HUB VERSION V1.0.4").TextSize = 20
Credits:AddLabel("Developers: Rafael y Sherya").TextSize = 18
Credits:AddLabel("Discord: rafael25ic")

Credits:AddButton("Copiar Servidor Discord", function()
    setclipboard("https://discord.gg/gbfKgNpDAG")
end)

-- Mostrar Interfaz
window:Show()
