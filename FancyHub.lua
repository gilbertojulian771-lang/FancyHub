-- FANCY HUB | BY HADXS
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- CREAR LA VENTANA (Usamos una variable para controlar el arrastre)
local Window = Library.CreateLib("Fancy Hub | HADXS", "BloodTheme")

-- HACER QUE EL MENÚ SE MUEVA EN MÓVIL
-- Buscamos la base de la interfaz para darle permiso de arrastre
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v:IsA("ScreenGui") and v:FindFirstChild("Main") then
        v.Main.Draggable = true
        v.Main.Active = true
    end
end

-- BOTÓN HADXS PARA ABRIR/CERRAR
local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")
local Corner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 55, 0, 55)
Button.Position = UDim2.new(0, 10, 0.4, 0)
Button.Text = "HADXS"
Button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Draggable = true -- El botón también se mueve
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
