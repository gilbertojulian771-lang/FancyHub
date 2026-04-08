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

-- Pestaña de Créditos
local Credits = Window:NewTab("Créditos")
local cSec = Credits:NewSection("Creado por HADXS")
