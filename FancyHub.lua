local FancyHub = {}
local flags = { autoTrain = false, autoRebirth = false }

-- 1. FRAME PRINCIPAL (Dimensiones exactas de la imagen)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "FancyHub_HADXS"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 520, 0, 310)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Gris oscuro neutro
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- HEADER (Donde va el nombre)
local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 25)
Header.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Header.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -10, 1, 0)
Title.Position = UDim2.new(0, 8, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "ZEUZ || bienvenido - HADXS" 
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.Font = Enum.Font.Gotham
Title.TextSize = 12
Title.TextXAlignment = Enum.TextXAlignment.Left

-- TAB HOLDER (Contenedor de botones de navegación)
local TabHolder = Instance.new("ScrollingFrame", MainFrame)
TabHolder.Size = UDim2.new(1, 0, 0, 25)
TabHolder.Position = UDim2.new(0, 0, 0, 25)
TabHolder.BackgroundColor3 = Color3.fromRGB(55, 55, 55) -- Gris más claro para pestañas
TabHolder.BorderSizePixel = 0
TabHolder.CanvasSize = UDim2.new(2, 0, 0, 0) -- Para que deslice
TabHolder.ScrollBarThickness = 0

local UIListLayoutTab = Instance.new("UIListLayout", TabHolder)
UIListLayoutTab.FillDirection = Enum.FillDirection.Horizontal
UIListLayoutTab.SortOrder = Enum.SortOrder.LayoutOrder

-- CONTENT HOLDER (Donde se ven los botones de las funciones)
local ContentHolder = Instance.new("Frame", MainFrame)
ContentHolder.Size = UDim2.new(1, 0, 1, -50)
ContentHolder.Position = UDim2.new(0, 0, 0, 50)
ContentHolder.BackgroundTransparency = 1

-- 2. FUNCIONES DE CONSTRUCCIÓN
function FancyHub:AddTab(name)
    local TabBtn = Instance.new("TextButton", TabHolder)
    TabBtn.Size = UDim2.new(0, 75, 1, 0)
    TabBtn.Text = name
    TabBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabBtn.Font = Enum.Font.Gotham
    TabBtn.TextSize = 11
    TabBtn.BorderSizePixel = 1
    TabBtn.BorderColor3 = Color3.fromRGB(40, 40, 40)

    local Page = Instance.new("ScrollingFrame", ContentHolder)
    Page.Name = name .. "Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Visible = false
    Page.BackgroundTransparency = 1
    Page.ScrollBarThickness = 2

    local PageLayout = Instance.new("UIListLayout", Page)
    PageLayout.Padding = UDim.new(0, 4)
    PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(ContentHolder:GetChildren()) do 
            if p:IsA("ScrollingFrame") then p.Visible = false end 
        end
        Page.Visible = true
    end)
    return Page
end

-- Función para Títulos de Sección (--- Texto ---)
function FancyHub:AddSection(parent, text)
    local Label = Instance.new("TextLabel", parent)
    Label.Size = UDim2.new(1, 0, 0, 20)
    Label.BackgroundTransparency = 1
    Label.Text = "---- " .. text .. " ----"
    Label.TextColor3 = Color3.fromRGB(150, 150, 150)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 11
end

-- Función para Dropdowns (Iguales a los de Zeuz)
function FancyHub:AddDropdown(parent, text)
    local Drop = Instance.new("TextButton", parent)
    Drop.Size = UDim2.new(0.95, 0, 0, 22)
    Drop.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Drop.BorderSizePixel = 1
    Drop.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Drop.Text = "  " .. text .. "                                                   v"
    Drop.TextColor3 = Color3.fromRGB(200, 200, 200)
    Drop.Font = Enum.Font.Gotham
    Drop.TextSize = 11
    Drop.TextXAlignment = Enum.TextXAlignment.Left
end

-- Función para Toggles (Cambiando color al activar)
function FancyHub:AddToggle(parent, text, callback)
    local Toggle = Instance.new("TextButton", parent)
    Toggle.Size = UDim2.new(0.95, 0, 0, 25)
    Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Toggle.BorderSizePixel = 0
    Toggle.Text = text
    Toggle.TextColor3 = Color3.new(1, 1, 1)
    Toggle.Font = Enum.Font.Gotham
    Toggle.TextSize = 11

    local active = false
    Toggle.MouseButton1Click:Connect(function()
        active = not active
        Toggle.BackgroundColor3 = active and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(60, 60, 60)
        callback(active)
    end)
end

-- Lógica de entrenamiento
task.spawn(function()
    while task.wait(0.1) do
        if flags.autoTrain then
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
        end
    end
end)

FancyHub.flags = flags
return FancyHub
