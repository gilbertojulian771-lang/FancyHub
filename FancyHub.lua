local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Fancy Hub | HADXS", "BloodTheme")

-- Pestaña Principal
local Tab = Window:NewTab("Auto Farm")
local Section = Tab:NewSection("Muscle Legends")

_G.AutoFarm = false

Section:NewToggle("Auto-Lift (Equipa Pesa)", "Entrena solo", function(state)
    _G.AutoFarm = state
    task.spawn(function()
        while _G.AutoFarm do
            pcall(function()
                local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end)
            task.wait(0.1)
        end
    end)
end)

Section:NewButton("Anti-AFK", "No te saca del juego", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

-----------------------------------------------------------
-- SISTEMA DE BOTÓN FLOTANTE (ABRIR/CERRAR)
-----------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
local ToggleBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Name = "FancyMobile"
ScreenGui.Parent = game.CoreGui

ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Rojo como tu tema
ToggleBtn.Position = UDim2.new(0.1, 0, 0.2, 0)
ToggleBtn.Size = UDim2.new(0, 45, 0, 45)
ToggleBtn.Text = "HADXS"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 10
ToggleBtn.Draggable = true -- ESTO PERMITE MOVER EL BOTÓN

UICorner.CornerRadius = UDim.new(0, 50)
UICorner.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function()
    Library:ToggleUI() -- Esta función de Kavo abre y cierra el menú
end)
