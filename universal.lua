local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local SpeedEnabled = false
local SpeedValue = 16
local NoclipEnabled = false
local noclipConnection
local FlyEnabled = false
local FlySpeed = 50
local flyConnection
local flyBodyVelocity = nil
local flyBodyGyro = nil

return function(gameTab, Window, WindUI)
    local MovementSection = gameTab:Section({ Title = "Movement" })
    
    MovementSection:Toggle({
        Title = "Speed Hack",
        Value = false,
        Callback = function(state)
            SpeedEnabled = state
            if LocalPlayer.Character then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.WalkSpeed = state and SpeedValue or 16 end
            end
        end
    })
    
    MovementSection:Slider({
        Title = "Walk Speed",
        Value = { Min = 16, Max = 200, Default = 50 },
        Step = 1,
        Callback = function(val)
            SpeedValue = val
            if SpeedEnabled and LocalPlayer.Character then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.WalkSpeed = val end
            end
        end
    })
    
    LocalPlayer.CharacterAdded:Connect(function(char)
        if SpeedEnabled then
            local hum = char:WaitForChild("Humanoid")
            hum.WalkSpeed = SpeedValue
        end
    end)
    
    MovementSection:Toggle({
        Title = "Noclip",
        Value = false,
        Callback = function(state)
            NoclipEnabled = state
            if noclipConnection then noclipConnection:Disconnect(); noclipConnection = nil end
            if state then
                noclipConnection = RunService.Stepped:Connect(function()
                    if NoclipEnabled and LocalPlayer.Character then
                        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                            if part:IsA("BasePart") then part.CanCollide = false end
                        end
                    end
                end)
            end
        end
    })
    
    MovementSection:Toggle({
        Title = "Fly",
        Value = false,
        Callback = function(state)
            FlyEnabled = state
            if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
            if not state then
                if flyBodyVelocity then flyBodyVelocity:Destroy(); flyBodyVelocity = nil end
                if flyBodyGyro then flyBodyGyro:Destroy(); flyBodyGyro = nil end
                return
            end
            local function setupFly(char)
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if not root then return end
                if flyBodyVelocity then flyBodyVelocity:Destroy() end
                if flyBodyGyro then flyBodyGyro:Destroy() end
                flyBodyVelocity = Instance.new("BodyVelocity")
                flyBodyVelocity.MaxForce = Vector3.new(40000, 40000, 40000)
                flyBodyVelocity.Velocity = Vector3.new()
                flyBodyVelocity.Parent = root
                flyBodyGyro = Instance.new("BodyGyro")
                flyBodyGyro.MaxTorque = Vector3.new(40000, 40000, 40000)
                flyBodyGyro.CFrame = workspace.CurrentCamera and workspace.CurrentCamera.CFrame or root.CFrame
                flyBodyGyro.Parent = root
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then hum.PlatformStand = true end
            end
            if LocalPlayer.Character then setupFly(LocalPlayer.Character) end
            LocalPlayer.CharacterAdded:Connect(function(char) if FlyEnabled then setupFly(char) end end)
            flyConnection = RunService.Heartbeat:Connect(function()
                if not FlyEnabled then return end
                local char = LocalPlayer.Character
                if not char then return end
                local root = char:FindFirstChild("HumanoidRootPart")
                if not root or not flyBodyVelocity then return end
                local camera = workspace.CurrentCamera
                if not camera then return end
                local moveDir = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir -= camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir -= camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir += camera.CFrame.UpVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir -= camera.CFrame.UpVector end
                if moveDir.Magnitude > 0 then
                    flyBodyVelocity.Velocity = moveDir.Unit * FlySpeed
                else
                    flyBodyVelocity.Velocity = Vector3.new()
                end
                if flyBodyGyro then flyBodyGyro.CFrame = camera.CFrame end
            end)
        end
    })
    
    MovementSection:Slider({
        Title = "Fly Speed",
        Value = { Min = 10, Max = 200, Default = 50 },
        Step = 5,
        Callback = function(val) FlySpeed = val end
    })
    
    local PlayerSection = gameTab:Section({ Title = "Player" })
    
    local selectedPlayer = nil
    
    local playerDropdown = PlayerSection:Dropdown({
        Title = "Select Player",
        Values = {},
        Value = nil,
        AllowNone = true,
        Callback = function(value)
            selectedPlayer = value and Players:FindFirstChild(value) or nil
        end
    })
    
    local function refreshDropdown()
        local names = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then table.insert(names, p.Name) end
        end
        table.sort(names)
        playerDropdown:Refresh(names)
    end
    
    refreshDropdown()
    
    Players.PlayerAdded:Connect(refreshDropdown)
    Players.PlayerRemoving:Connect(refreshDropdown)
    
    PlayerSection:Button({
        Title = "Refresh Player List",
        Justify = "Center",
        Callback = refreshDropdown
    })
    
    PlayerSection:Button({
        Title = "Teleport to Player",
        Icon = "lucide:arrow-right",
        Justify = "Center",
        Callback = function()
            if not selectedPlayer then
                WindUI:Notify({Title="Error",Content="No player selected",Duration=3})
                return
            end
            local char = LocalPlayer.Character
            local target = selectedPlayer.Character
            if char and target and target:FindFirstChild("HumanoidRootPart") then
                char:SetPrimaryPartCFrame(target.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                WindUI:Notify({Title="Teleport",Content="Teleported to "..selectedPlayer.Name,Duration=3})
            end
        end
    })
    
    PlayerSection:Button({
        Title = "Spectate Player",
        Icon = "lucide:eye",
        Justify = "Center",
        Callback = function()
            if not selectedPlayer then
                WindUI:Notify({Title="Error",Content="No player selected",Duration=3})
                return
            end
            local cam = workspace.CurrentCamera
            if cam and selectedPlayer.Character then
                cam.CameraSubject = selectedPlayer.Character:FindFirstChildOfClass("Humanoid")
                WindUI:Notify({Title="Spectate",Content="Now spectating "..selectedPlayer.Name,Duration=3})
            end
        end
    })
    
    local MiscSection = gameTab:Section({ Title = "Misc" })
    
    MiscSection:Button({
        Title = "Reset Character",
        Icon = "lucide:rotate-ccw",
        Justify = "Center",
        Callback = function()
            if LocalPlayer.Character then
                LocalPlayer.Character:BreakJoints()
            end
        end
    })
    
    MiscSection:Button({
        Title = "Rejoin Server",
        Icon = "lucide:refresh-cw",
        Justify = "Center",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
        end
    })
end
