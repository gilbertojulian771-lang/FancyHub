-- FANCY HUB | BY HADXS
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Fancy Hub | HADXS", "BloodTheme")

-- ESTO CREA EL BOTÓN PARA ABRIR/CERRAR
local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")
ScreenGui.Parent = game.CoreGui
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 50, 0, 50)
Button.Position = UDim2.new(0, 10, 0.5, 0)
Button.Text = "HADXS"
Button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
local Corner = Instance.new("UICorner")
Corner.Parent = Button

Button.MouseButton1Click:Connect(function()
    Library:ToggleUI()
end)

-- PESTAÑAS
local Tab = Window:NewTab("Auto Farm")
local Section = Tab:NewSection("Muscle Legends")

_G.AutoFarm = false
Section:NewToggle("Auto-Lift", "Entrena solo", function(state)
    _G.AutoFarm = state
    task.spawn(function()
        while _G.AutoFarm do
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
            task.wait(0.1)
        end
    end)
end)
