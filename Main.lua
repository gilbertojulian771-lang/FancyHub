-- [[ FANCY HUB v1.0 ]]
-- Optimized for Muscle Legends

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")

-- Anti-AFK para evitar que te saque el servidor
player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new(0, 0))
end)

-- Cargando Librería Elerium
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/mota283883/LaLecheAviento/refs/heads/main/Library"))()
local displayName = player.DisplayName or player.Name

local window = library:AddWindow("Fancy Hub | " .. displayName, {
    main_color = Color3.fromRGB(255, 120, 0), -- Naranja Jaguar
    min_size = Vector2.new(430, 500),
    can_resize = false,
})

--- [ TAB: FARMING ] ---
local AutoFarm = window:AddTab("Farming")
AutoFarm:AddLabel("Farming").TextSize = 20

AutoFarm:AddSwitch("Fast Farming", function(state)
    _G.FastFarm = state
    task.spawn(function()
        while _G.FastFarm do
            -- Detecta qué herramienta tienes en la mano para usarla
            local tool = player.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
            task.wait(0.01)
        end
    end)
end)

AutoFarm:AddSwitch("Auto Rebirth Infinito", function(state)
    _G.AutoRebirth = state
    task.spawn(function()
        while _G.AutoRebirth do
            ReplicatedStorage.rEvents.rebirthEvent:FireServer("rebirthRequest")
            task.wait(2)
        end
    end)
end)

--- [ TAB: KILLER ] ---
local Killer = window:AddTab("Killer")
Killer:AddLabel("PvP Features").TextSize = 20

Killer:AddSwitch("Auto Kill All", function(state)
    _G.KillAll = state
    task.spawn(function()
        while _G.KillAll do
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    -- Teletransporta el golpe al oponente
                    ReplicatedStorage.rEvents.punchEvent:FireServer("punch", v.Character.HumanoidRootPart.Position)
                end
            end
            task.wait(0.1)
        end
    end)
end)

Killer:AddSwitch("Auto Punch Fast", function(state)
    _G.FastPunch = state
    task.spawn(function()
        while _G.FastPunch do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch")
            task.wait()
        end
    end)
end)

--- [ TAB: MISC ] ---
local Misc = window:AddTab("Misc")
Misc:AddSwitch("Auto Spin", function(state)
    _G.AutoSpin = state
    task.spawn(function()
        while _G.AutoSpin do
            ReplicatedStorage.rEvents.wheelSpinEvent:FireServer()
            task.wait(5)
        end
    end)
end)

Misc:AddButton("Walk on Water", function()
    player.Character.WaterWalking.Value = true
end)

--- [ TAB: CREDITOS ] ---
local Credits = window:AddTab("Creditos")
Credits:Show()
Credits:AddLabel("Fancy Hub Official").TextSize = 20
Credits:AddLabel("Developer: Gerpas_777").TextSize = 18
Credits:AddLabel("UI: Elerium Classic").TextSize = 18

Credits:AddButton("Servidor Discord", function()
    setclipboard("https://discord.gg/fancyhub")
end)
