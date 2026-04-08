-- FANCY HUB | BY HADXS
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "Fancy Hub | By HADXS", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "FancyHubData",
    IntroText = "Fancy Hub por HADXS"
})

local Tab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://4483345998"
})

_G.AutoFarm = false

Tab:AddToggle({
    Name = "Auto-Lift (Equipa Pesa)",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
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
    end    
})

Tab:AddButton({
    Name = "Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end
})

OrionLib:Init()

