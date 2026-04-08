local FancyHub = {}
FancyHub.flags = { autoTrain = false, autoRebirth = false, fastTools = false }

-- 1. INTERFAZ (Ya configurada con esquinas redondas)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 520, 0, 310)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- HEADER
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

-- (Funciones AddTab, AddSection y AddToggle se mantienen igual)

-- 2. LÓGICA DE FAST TOOLS
task.spawn(function()
    while task.wait() do -- Bucle súper rápido
        if FancyHub.flags.fastTools then
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate() -- Activa la herramienta sin esperar la animación normal
            end
        end
    end
end)

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
