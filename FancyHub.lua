-- FANCY HUB | HADXS (ELERIUM)
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/Libaries/EleriumLib.lua"))()

local Win = Lib:AddWindow("Fancy Hub | HADXS", {
    main_color = Color3.fromRGB(255, 0, 0),
    min_size = Vector2.new(350, 250),
    toggle_key = Enum.KeyCode.RightControl,
    can_resize = true
})

local T1 = Win:AddTab("Farm")
local T2 = Win:AddTab("Stats")

_G.Farm = false
T1:AddToggle("Auto-Farm Universal", function(v)
    _G.Farm = v
    while _G.Farm do
        pcall(function()
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
        end)
        task.wait(0.1)
    end
end)

T2:AddSlider("Velocidad", 16, 500, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

-- BOTÓN PARA MÓVIL (HADXS)
local SG = Instance.new("ScreenGui", game.CoreGui)
local BT = Instance.new("TextButton", SG)
BT.Size = UDim2.new(0, 60, 0, 60)
BT.Position = UDim2.new(0, 15, 0.5, 0)
BT.Text = "HADXS"
BT.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BT.TextColor3 = Color3.fromRGB(255, 0, 0)
BT.Draggable = true
Instance.new("UICorner", BT).CornerRadius = UDim.new(0, 50)

BT.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
end)
