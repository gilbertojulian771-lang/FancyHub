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
