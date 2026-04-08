local FancyHub = {}
FancyHub.flags = { autoTrain = false, autoRebirth = false }

-- 1. INTERFAZ PRINCIPAL (REDONDEADA)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "FancyHub_HADXS"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 520, 0, 310)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- Esquinas redondas del marco principal
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- HEADER (Título)
local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Header.BorderSizePixel = 0

-- Esquinas redondas del header
local HeaderCorner = Instance.new("UICorner", Header)
HeaderCorner.CornerRadius = UDim.new(0, 12)

-- Tapa para que las esquinas de abajo del header sean rectas y encajen bien
local HeaderFix = Instance.new("Frame", Header)
HeaderFix.Size = UDim2.new(1, 0, 0, 10)
HeaderFix.Position = UDim2.new(0, 0, 1, -10)
HeaderFix.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
HeaderFix.BorderSizePixel = 0

local TitleText = Instance.new("TextLabel", Header)
TitleText.Size = UDim2.new(1, -10, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "FancyHub || bienvenido - HADXS" -- AQUÍ EL NOMBRE CORREGIDO
TitleText.TextColor3 = Color3.fromRGB(0, 255, 150) -- Verde Neón
TitleText.TextSize = 14
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- BARRA DE PESTAÑAS (TABS)
local TabHolder = Instance.new("ScrollingFrame", MainFrame)
TabHolder.Size = UDim2.new(1, -20, 0, 30)
TabHolder.Position = UDim2.new(0, 10, 0, 40)
TabHolder.BackgroundTransparency = 1
TabHolder.CanvasSize = UDim2.new(2, 0, 0, 0)
TabHolder.ScrollBarThickness = 0

local UIListLayoutTab = Instance.new("UIListLayout", TabHolder)
UIListLayoutTab.FillDirection = Enum.FillDirection.Horizontal
UIListLayoutTab.Padding = UDim.new(0, 8)

-- CONTENIDO
local ContentHolder = Instance.new("Frame", MainFrame)
ContentHolder.Size = UDim2.new(1, -20, 1, -85)
ContentHolder.Position = UDim2.new(0, 10, 0, 75)
ContentHolder.BackgroundTransparency = 1

-- 2. FUNCIONES DE CONSTRUCCIÓN
function FancyHub:AddTab(name)
    local TabBtn = Instance.new("TextButton", TabHolder)
    TabBtn.Size = UDim2.new(0, 90, 1, 0)
    TabBtn.Text = name
    TabBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.TextSize = 12
    TabBtn.BorderSizePixel = 0
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    local Page = Instance.new("ScrollingFrame", ContentHolder)
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Visible = false
    Page.BackgroundTransparency = 1
    Page.ScrollBarThickness = 0

    local PageLayout = Instance.new("UIListLayout", Page)
    PageLayout.Padding = UDim.new(0, 8)
    PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(ContentHolder:GetChildren()) do 
            if p:IsA("ScrollingFrame") then p.Visible = false end 
        end
        Page.Visible = true
    end)
    return Page
end

function FancyHub:AddSection(parent, text)
    local Label = Instance.new("TextLabel", parent)
    Label.Size = UDim2.new(0.95, 0, 0, 20)
    Label.BackgroundTransparency = 1
    Label.Text = "--- " .. text .. " ---"
    Label.TextColor3 = Color3.fromRGB(120, 120, 130)
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 11
end

function FancyHub:AddToggle(parent, text, callback)
    local Toggle = Instance.new("TextButton", parent)
    Toggle.Size = UDim2.new(0.95, 0, 0, 38)
    Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    Toggle.Text = "  " .. text .. ": OFF"
    Toggle.TextColor3 = Color3.new(1, 1, 1)
    Toggle.Font = Enum.Font.GothamSemibold
    Toggle.TextSize = 13
    Toggle.TextXAlignment = Enum.TextXAlignment.Left
    Toggle.BorderSizePixel = 0
    
    Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 8)

    local active = false
    Toggle.MouseButton1Click:Connect(function()
        active = not active
        Toggle.Text = active and "  " .. text .. ": ON" or "  " .. text .. ": OFF"
        Toggle.TextColor3 = active and Color3.fromRGB(0, 255, 150) or Color3.new(1, 1, 1)
        Toggle.BackgroundColor3 = active and Color3.fromRGB(45, 55, 50) or Color3.fromRGB(40, 40, 45)
        callback(active)
    end)
end

-- 3. LÓGICA DE AUTO-TRAIN
task.spawn(function()
    while task.wait(0.1) do
        if FancyHub.flags.autoTrain then
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
        end
    end
end)

return FancyHub
