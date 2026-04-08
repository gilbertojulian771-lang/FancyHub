local FancyHub = {}
local flags = { autoTrain = false, autoRebirth = false }

-- 1. INTERFAZ PRINCIPAL
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "FancyHub|By HADXS"
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- Barra superior de pestañas
local TabHolder = Instance.new("ScrollingFrame", MainFrame)
TabHolder.Size = UDim2.new(1, 0, 0, 40)
TabHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
TabHolder.BorderSizePixel = 0
TabHolder.CanvasSize = UDim2.new(1.5, 0, 0, 0)
TabHolder.ScrollBarThickness = 0

local UIListLayoutTab = Instance.new("UIListLayout", TabHolder)
UIListLayoutTab.FillDirection = Enum.FillDirection.Horizontal
UIListLayoutTab.SortOrder = Enum.SortOrder.LayoutOrder

-- Contenedor de contenido
local ContentHolder = Instance.new("Frame", MainFrame)
ContentHolder.Size = UDim2.new(1, 0, 1, -40)
ContentHolder.Position = UDim2.new(0, 0, 0, 40)
ContentHolder.BackgroundTransparency = 1

-- 2. FUNCIONES DE LA LIBRERÍA
function FancyHub:AddTab(name)
    local TabBtn = Instance.new("TextButton", TabHolder)
    TabBtn.Size = UDim2.new(0, 100, 1, 0)
    TabBtn.Text = name
    TabBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    TabBtn.TextColor3 = Color3.new(1, 1, 1)
    TabBtn.Font = Enum.Font.GothamBold

    local Page = Instance.new("ScrollingFrame", ContentHolder)
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Visible = false
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0

    local PageLayout = Instance.new("UIListLayout", Page)
    PageLayout.Padding = UDim.new(0, 10)
    PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(ContentHolder:GetChildren()) do p.Visible = false end
        Page.Visible = true
    end)

    return Page
end

function FancyHub:AddToggle(parent, text, callback)
    local Toggle = Instance.new("TextButton", parent)
    Toggle.Size = UDim2.new(0.9, 0, 0, 40)
    Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    Toggle.Text = text .. ": OFF"
    Toggle.TextColor3 = Color3.new(1, 1, 1)
    Toggle.Font = Enum.Font.Gotham

    local active = false
    Toggle.MouseButton1Click:Connect(function()
        active = not active
        Toggle.Text = text .. (active and ": ON" or ": OFF")
        Toggle.TextColor3 = active and Color3.fromRGB(0, 255, 150) or Color3.new(1, 1, 1)
        callback(active)
    end)
end

-- 3. LÓGICA DE JUEGO (Muscle Legends)
task.spawn(function()
    while task.wait(0.1) do
        if flags.autoTrain then
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if flags.autoRebirth then
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
        end
    end
end)

-- IMPORTANTE: Exponer flags y retornar
FancyHub.flags = flags
return FancyHub
local corner = Instance.new("UICorner", Toggle)
corner.CornerRadius = UDim.new(0, 8) -- Esto redondea las esquinas
