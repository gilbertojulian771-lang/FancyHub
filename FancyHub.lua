local FancyHub = {}
FancyHub.flags = { autoTrain = false, autoRebirth = false, fastTools = false }

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 520, 0, 310)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 12)

local TitleText = Instance.new("TextLabel", Header)
TitleText.Size = UDim2.new(1, -10, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "FancyHub || bienvenido - HADXS"
TitleText.TextColor3 = Color3.fromRGB(0, 255, 150)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 14
TitleText.TextXAlignment = Enum.TextXAlignment.Left

local TabHolder = Instance.new("ScrollingFrame", MainFrame)
TabHolder.Size = UDim2.new(1, -20, 0, 30)
TabHolder.Position = UDim2.new(0, 10, 0, 40)
TabHolder.BackgroundTransparency = 1
TabHolder.CanvasSize = UDim2.new(2, 0, 0, 0)
TabHolder.ScrollBarThickness = 0
Instance.new("UIListLayout", TabHolder).FillDirection = Enum.FillDirection.Horizontal

local ContentHolder = Instance.new("Frame", MainFrame)
ContentHolder.Size = UDim2.new(1, -20, 1, -85)
ContentHolder.Position = UDim2.new(0, 10, 0, 75)
ContentHolder.BackgroundTransparency = 1

function FancyHub:AddTab(name)
    local TabBtn = Instance.new("TextButton", TabHolder)
    TabBtn.Size = UDim2.new(0, 90, 1, 0)
    TabBtn.Text = name
    TabBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.TextSize = 12
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    local Page = Instance.new("ScrollingFrame", ContentHolder)
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Visible = false
    Page.BackgroundTransparency = 1
    Page.ScrollBarThickness = 0
    Instance.new("UIListLayout", Page).Padding = UDim.new(0, 8)

    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(ContentHolder:GetChildren()) do p.Visible = false end
        Page.Visible = true
    end)
    return Page
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
    Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 8)

    local active = false
    Toggle.MouseButton1Click:Connect(function()
        active = not active
        Toggle.Text = active and "  " .. text .. ": ON" or "  " .. text .. ": OFF"
        Toggle.TextColor3 = active and Color3.fromRGB(0, 255, 150) or Color3.new(1, 1, 1)
        callback(active)
    end)
end

-- Bucle de herramientas
task.spawn(function()
    while task.wait() do
        if FancyHub.flags.fastTools or FancyHub.flags.autoTrain then
            local t = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if t then t:Activate() end
        end
        if FancyHub.flags.fastTools then task.wait() else task.wait(0.1) end
    end
end)

return FancyHub -- SIEMPRE DEBE SER LA ÚLTIMA LÍNEA

-- LOOPS DE FUNCIONES (CORREGIDO PARA MUSCLE LEGENDS)
task.spawn(function()
    while true do
        if FancyHub.flags.autoTrain or FancyHub.flags.fastTools then
            local p = game.Players.LocalPlayer
            local char = p.Character
            -- Buscamos la herramienta tanto en el personaje como en el inventario
            local tool = char:FindFirstChildOfClass("Tool") or p.Backpack:FindFirstChildOfClass("Tool")
            
            if tool then
                -- Si la herramienta está en el inventario, la equipamos
                if tool.Parent == p.Backpack then
                    char.Humanoid:EquipTool(tool)
                end
                -- Activamos la herramienta
                tool:Activate()
            end
        end
        
        -- Ajuste de velocidad: Fast Tools es casi instantáneo, Auto Train tiene un pequeño respiro
        if FancyHub.flags.fastTools then
            task.wait() 
        else
            task.wait(0.1)
        end
    end
end)
