-- FancyHub v1.0 - Core Script
local FancyHub = {}

-- Configuración de la interfaz
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- Contenedor de pestañas
local TabHolder = Instance.new("ScrollingFrame", MainFrame)
TabHolder.Size = UDim2.new(1, 0, 0, 35)
TabHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
TabHolder.BorderSizePixel = 0

local UIListLayout = Instance.new("UIListLayout", TabHolder)
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Función para añadir botones (Tabs)
function FancyHub:AddTab(name)
    local TabBtn = Instance.new("TextButton", TabHolder)
    TabBtn.Size = UDim2.new(0, 90, 1, 0)
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.new(1, 1, 1)
    TabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    
    TabBtn.MouseButton1Click:Connect(function()
        print("FancyHub: Pestaña " .. name .. " seleccionada.")
        -- Aquí irá la lógica para cambiar de contenido
    end)
    return TabBtn
end

return FancyHub
-- Debajo de tu código actual, añade esto para el contenido
local ContentHolder = Instance.new("Frame", MainFrame)
ContentHolder.Name = "ContentHolder"
ContentHolder.Size = UDim2.new(1, 0, 1, -35)
ContentHolder.Position = UDim2.new(0, 0, 0, 35)
ContentHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 40) -- Un tono apenas distinto
ContentHolder.BorderSizePixel = 0

-- Función mejorada para crear pestañas
function FancyHub:AddTab(name)
    local TabBtn = Instance.new("TextButton", TabHolder)
    TabBtn.Size = UDim2.new(0, 90, 1, 0)
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.new(1, 1, 1)
    TabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    
    -- Creamos un marco para el contenido de esta pestaña específica
    local TabPage = Instance.new("ScrollingFrame", ContentHolder)
    TabPage.Name = name .. "Page"
    TabPage.Size = UDim2.new(1, 0, 1, 0)
    TabPage.Visible = false -- Oculta todas al inicio
    TabPage.BackgroundTransparency = 1
    
    TabBtn.MouseButton1Click:Connect(function()
        -- Ocultar todas las páginas
        for _, page in pairs(ContentHolder:GetChildren()) do
            if page:IsA("ScrollingFrame") then page.Visible = false end
        end
        -- Mostrar solo la actual
        TabPage.Visible = true
    end)
    
    return TabPage -- Retornamos la página para que puedas añadir botones dentro
end
-- VARIABLES DE ESTADO
local flags = {
    autoTrain = false,
    autoRebirth = false
}

-- FUNCIÓN PARA AÑADIR UN BOTÓN DE ACCIÓN (TOGGLE)
function FancyHub:AddToggle(parent, text, callback)
    local ToggleBtn = Instance.new("TextButton", parent)
    ToggleBtn.Size = UDim2.new(0.9, 0, 0, 40)
    ToggleBtn.Position = UDim2.new(0.05, 0, 0, 10) -- Se ajustará con un UIListLayout luego
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    ToggleBtn.Text = text .. ": OFF"
    ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
    ToggleBtn.Font = Enum.Font.Gotham
    
    local active = false
    ToggleBtn.MouseButton1Click:Connect(function()
        active = not active
        ToggleBtn.Text = text .. (active and ": ON" or ": OFF")
        ToggleBtn.TextColor3 = active and Color3.fromRGB(0, 255, 150) or Color3.new(1, 1, 1)
        callback(active)
    end)
end

-- LÓGICA DE MUSCLE LEGENDS (A y B)
-- 1. Auto-Train
task.spawn(function()
    while task.wait(0.1) do
        if flags.autoTrain then
            local char = game.Players.LocalPlayer.Character
            if char then
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then tool:Activate() end
            end
        end
    end
end)

-- 2. Auto-Rebirth
task.spawn(function()
    while task.wait(1) do
        if flags.autoRebirth then
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
        end
    end
end)
