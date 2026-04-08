-- FANCY HUB | BY HADXS
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/Lib/Elerium.lua"))()

local Window = Library:AddWindow("Fancy Hub | HADXS", {
    main_color = Color3.fromRGB(120, 0, 255),
    min_size = Vector2.new(350, 400),
    toggle_key = Enum.KeyCode.RightControl,
})

local FarmTab = Window:AddTab("Farm")

_G.AutoFarm = false
FarmTab:AddSwitch("Auto-Lift (Equipa Pesa)", function(state)
    _G.AutoFarm = state
    task.spawn(function()
        while _G.AutoFarm do
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end)
            task.wait(0.1)
        end
    end)
end)

local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
ToggleButton.Position = UDim2.new(0.1, 0, 0.4, 0)
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Text = "FH"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Draggable = true

UICorner.CornerRadius = UDim.new(0, 50)
UICorner.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    for _, v in pairs(game.CoreGui:GetChildren()) do
        if v.Name == "Fancy Hub | HADXS" then
            v.Enabled = not v.Enabled
        end
    end
end)
