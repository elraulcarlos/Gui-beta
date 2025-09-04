local gui = Instance.new("ScreenGui")
gui.Name = "VoidwareGUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Botón flotante para abrir GUI (movible)
local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0, 120, 0, 40)
openBtn.Position = UDim2.new(0, 20, 0, 20)
openBtn.Text = "Abrir GUI"
openBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 14
openBtn.Visible = false
openBtn.Active = true
openBtn.Draggable = true
openBtn.Parent = gui

-- Marco principal
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 400, 0, 280)
main.Position = UDim2.new(0.5, -200, 0.5, -140)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BackgroundTransparency = 0.5
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

-- Encabezado
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 30)
header.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
header.BackgroundTransparency = 0.5
header.BorderSizePixel = 0
header.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.Text = "Voidware GUI"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- Botón minimizar
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 1, 0)
minimizeBtn.Position = UDim2.new(1, -30, 0, 0)
minimizeBtn.Text = "_"
minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 14
minimizeBtn.Parent = header

minimizeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    main.Visible = true
    openBtn.Visible = false
end)

-- Barra lateral
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 100, 1, -30)
sidebar.Position = UDim2.new(0, 0, 0, 30)
sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
sidebar.BackgroundTransparency = 0.5
sidebar.BorderSizePixel = 0
sidebar.Parent = main

-- Panel de contenido
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -100, 1, -30)
content.Position = UDim2.new(0, 100, 0, 30)
content.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
content.BackgroundTransparency = 0.5
content.BorderSizePixel = 0
content.Parent = main

local function clearContent()
    for _, child in pairs(content:GetChildren()) do
        child:Destroy()
    end
end

-- Opciones laterales
local sections = {"Main", "Visual", "Kill Aura"}

for i, name in ipairs(sections) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, (i - 1) * 35 + 5)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.BackgroundTransparency = 0.5
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 13
    btn.Parent = sidebar

    btn.MouseButton1Click:Connect(function()
        clearContent()

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 0, 30)
        label.Position = UDim2.new(0, 10, 0, 10)
        label.Text = "Sección: " .. name
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 16
        label.BackgroundTransparency = 1
        label.Parent = content

        if name == "Main" then
            local sliderLabel = Instance.new("TextLabel")
            sliderLabel.Size = UDim2.new(0, 200, 0, 30)
            sliderLabel.Position = UDim2.new(0, 10, 0, 50)
            sliderLabel.Text = "Velocidad: 16"
            sliderLabel.TextColor3 = Color3.new(1, 1, 1)
            sliderLabel.Font = Enum.Font.Gotham
            sliderLabel.TextSize = 14
            sliderLabel.BackgroundTransparency = 1
            sliderLabel.Parent = content

            local slider = Instance.new("TextButton")
            slider.Size = UDim2.new(0, 200, 0, 30)
            slider.Position = UDim2.new(0, 10, 0, 85)
            slider.Text = "← Ajustar →"
            slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            slider.TextColor3 = Color3.new(1, 1, 1)
            slider.Font = Enum.Font.Gotham
            slider.TextSize = 14
            slider.Parent = content

            local speed = 16
            slider.MouseButton1Click:Connect(function()
                speed = speed + 4
                if speed > 100 then speed = 16 end
                sliderLabel.Text = "Velocidad: " .. speed
                local player = game.Players.LocalPlayer
                local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = speed
                end
            end)
        end

        if name == "Visual" then
            local espBtn = Instance.new("TextButton")
            espBtn.Size = UDim2.new(0, 180, 0, 30)
            espBtn.Position = UDim2.new(0, 10, 0, 50)
            espBtn.Text = "Activar ESP"
            espBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            espBtn.TextColor3 = Color3.new(1, 1, 1)
            espBtn.Font = Enum.Font.Gotham
            espBtn.TextSize = 13
            espBtn.Parent = content

            espBtn.MouseButton1Click:Connect(function()
                for _, plr in pairs(game.Players:GetPlayers()) do
                    if plr ~= game.Players.LocalPlayer and plr.Character and not plr.Character:FindFirstChild("ESPBox") then
                        local box = Instance.new("BoxHandleAdornment")
                        box.Name = "ESPBox"
                        box.Adornee = plr.Character:FindFirstChild("HumanoidRootPart")
                        box.Size = Vector3.new(4, 6, 2)
                        box.Color3 = Color3.new(1, 0, 0)
                        box.Transparency = 0.5
                        box.AlwaysOnTop = true
                        box.ZIndex = 10
                        box.Parent = plr.Character
                    end
                end
            end)
        end

        if name == "Kill Aura" then
            local info = Instance.new("TextLabel")
            info.Size = UDim2.new(1, -20, 0, 30)
            info.Position = UDim2.new(0, 10, 0, 50)
            info.Text = "Kill Aura lista para integrar"
            info.TextColor3 = Color3.new(
