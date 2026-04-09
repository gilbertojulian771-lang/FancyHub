--[[
    WORLD HUB - MUSCLE LEGENDS V1.0.4
    UI Library: Rayfield (Versión Corregida)
--]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "World Hub | Muscle Legends",
   LoadingTitle = "World Hub",
   LoadingSubtitle = "by Rafael & Sherya",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

-- Variables
local _G = { FastFarm = false, AutoRebirth = false }
local muscleEvent = game:GetService("ReplicatedStorage"):WaitForChild("MuscleEvent")

-- PESTAÑA PRINCIPAL
-- Quitamos el ID del icono para evitar que la interfaz falle si el ID no carga
local MainTab = Window:CreateTab("Farming") 

MainTab:CreateSection("Entrenamiento")

MainTab:CreateToggle({
   Name = "Fast Farming",
   CurrentValue = false,
   Flag = "Farm1",
   Callback = function(Value)
      _G.FastFarm = Value
      if Value then
          task.spawn(function()
              while _G.FastFarm do
                  task.wait()
                  muscleEvent:FireServer("punch", "leftHand")
                  muscleEvent:FireServer("punch", "rightHand")
                  local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                  if tool then tool:Activate() end
              end
          end)
      end
   end,
})

MainTab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Flag = "Rebirth1",
   Callback = function(Value)
      _G.AutoRebirth = Value
      if Value then
          task.spawn(function()
              while _G.AutoRebirth do
                  task.wait(1)
                  muscleEvent:FireServer("rebirthRequest")
              end
          end)
      end
   end,
})

-- PESTAÑA CRÉDITOS
local CreditsTab = Window:CreateTab("Créditos")

CreditsTab:CreateLabel("Desarrollado por Rafael y Sherya")
CreditsTab:CreateButton({
   Name = "Copiar Discord",
   Callback = function()
      setclipboard("https://discord.gg/gbfKgNpDAG")
   end,
})

Rayfield:Notify({
   Title = "World Hub Listo",
   Content = "Interfaz cargada correctamente",
   Duration = 5,
})
