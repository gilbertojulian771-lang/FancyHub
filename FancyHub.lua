-- FANCY HUB | BY HADXS
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Fancy Hub | HADXS", "BloodTheme")

-- Hacer menú movible en móvil
task.spawn(function()
    pcall(function()
        wait(1)
        for _, v in pairs(game.CoreGui:GetChildren()) do
            if v:IsA("ScreenGui") and v:FindFirstChild("Main") then
                v.Main.Draggable = true
                v.Main.Active = true
            end
        end
    end)
end)

-- PESTAÑA AUTO FARM
local Tab1 = Window:NewTab("Auto Farm")
local Section1 = Tab1:NewSection("Entrenamiento")
Section1:NewToggle("Auto-Farm (Pesas/Rocas)", "Golpea automáticamente", function(state)
    _G.AutoFarm = state
    task.spawn(function()
        while _G.AutoFarm do
            pcall(function()
                local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then tool:Activate() end
            end)
            task.wait(0.1)
        end
    end)
end)

Section1:NewToggle("Auto-Rebirth", "Renace solo", function(state)
    _G.AutoRebirth = state
    while _G.AutoRebirth do
        game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
        task.wait(1)
    end
end)

-- PESTAÑA JUGADOR
local Tab2 = Window:NewTab("Jugador")
local Section2 = Tab2:NewSection("Mejoras")
Section2:NewSlider("Velocidad", "Corre más rápido", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section2:NewSlider("Salto", "Salta más alto", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- PESTAÑA TELEPORT
local Tab3 = Window:NewTab("Teleports")
local Section3 = Tab3:NewSection("Zonas")
Section3:NewButton("Zona 1 (Gym)", "Teletransporte", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-100, 5, 0)
end)
Section3:NewButton("Zona 2 (Beach)", "Teletransporte", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(200, 5, 200)
end)

-- BOTÓN FLOTANTE HADXS
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
Button.Draggable = true
Corner.Parent = Button
Button.MouseButton1Click:Connect(function() Library:ToggleUI() end)
