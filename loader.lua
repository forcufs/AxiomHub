-- Loader

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local function CreateGradient(color1, color2, color3)
    return WindUI:Gradient({
        ["0"] = { Color = color1, Transparency = 0 },
        ["50"] = { Color = color2, Transparency = 0 },
        ["100"] = { Color = color3, Transparency = 0 },
    }, {
        Rotation = 135,
    })
end

local Themes = {
    Midnight = {
        Name = "AxiomMidnight",
        Accent = CreateGradient(Color3.fromHex("#0f0f1a"), Color3.fromHex("#1a1a2e"), Color3.fromHex("#0f0f1a")),
        Background = Color3.fromHex("#080810"),
        Outline = CreateGradient(Color3.fromHex("#6c6cff"), Color3.fromHex("#8a4fff"), Color3.fromHex("#6c6cff")),
        Text = Color3.fromHex("#e8e8f0"),
        Placeholder = Color3.fromHex("#5a5a7a"),
        Button = CreateGradient(Color3.fromHex("#1a1a30"), Color3.fromHex("#252545"), Color3.fromHex("#1a1a30")),
        Icon = CreateGradient(Color3.fromHex("#6c6cff"), Color3.fromHex("#a78bfa"), Color3.fromHex("#6c6cff")),
        Hover = Color3.fromHex("#a78bfa"),
        WindowBackground = CreateGradient(Color3.fromHex("#080810"), Color3.fromHex("#0f0f1f"), Color3.fromHex("#080810")),
        WindowShadow = Color3.fromHex("#000000"),
        WindowTopbarButtonIcon = CreateGradient(Color3.fromHex("#6c6cff"), Color3.fromHex("#a78bfa"), Color3.fromHex("#6c6cff")),
        WindowTopbarTitle = Color3.fromHex("#e8e8f0"),
        WindowTopbarAuthor = Color3.fromHex("#a78bfa"),
        WindowTopbarIcon = CreateGradient(Color3.fromHex("#6c6cff"), Color3.fromHex("#a78bfa"), Color3.fromHex("#6c6cff")),
        TabBackground = Color3.fromHex("#e8e8f0"),
        TabTitle = Color3.fromHex("#e8e8f0"),
        TabIcon = CreateGradient(Color3.fromHex("#6c6cff"), Color3.fromHex("#a78bfa"), Color3.fromHex("#6c6cff")),
        ElementBackground = CreateGradient(Color3.fromHex("#12121f"), Color3.fromHex("#1a1a2e"), Color3.fromHex("#12121f")),
        ElementTitle = Color3.fromHex("#e8e8f0"),
        ElementDesc = Color3.fromHex("#a78bfa"),
        ElementIcon = CreateGradient(Color3.fromHex("#6c6cff"), Color3.fromHex("#a78bfa"), Color3.fromHex("#6c6cff")),
        Toggle = CreateGradient(Color3.fromHex("#1a1a30"), Color3.fromHex("#252545"), Color3.fromHex("#1a1a30")),
        ToggleBar = CreateGradient(Color3.fromHex("#6c6cff"), Color3.fromHex("#a78bfa"), Color3.fromHex("#6c6cff")),
        Slider = CreateGradient(Color3.fromHex("#1a1a30"), Color3.fromHex("#252545"), Color3.fromHex("#1a1a30")),
        SliderThumb = CreateGradient(Color3.fromHex("#6c6cff"), Color3.fromHex("#a78bfa"), Color3.fromHex("#6c6cff")),
    },
    Lucid = {
        Name = "AxiomLucid",
        Accent = Color3.fromHex("#f5f0e8"),
        Background = Color3.fromHex("#fffdf7"),
        Outline = Color3.fromHex("#d4cfc4"),
        Text = Color3.fromHex("#3a3a3a"),
        Placeholder = Color3.fromHex("#b0a99d"),
        Button = Color3.fromHex("#e8e2d5"),
        Icon = Color3.fromHex("#9b8c7c"),
        Hover = Color3.fromHex("#c4b998"),
        WindowBackground = Color3.fromHex("#fffdf7"),
        WindowShadow = Color3.fromHex("#000000"),
        WindowTopbarButtonIcon = Color3.fromHex("#9b8c7c"),
        WindowTopbarTitle = Color3.fromHex("#3a3a3a"),
        WindowTopbarAuthor = Color3.fromHex("#6b5e4f"),
        WindowTopbarIcon = Color3.fromHex("#9b8c7c"),
        TabBackground = Color3.fromHex("#3a3a3a"),
        TabTitle = Color3.fromHex("#3a3a3a"),
        TabIcon = Color3.fromHex("#9b8c7c"),
        ElementBackground = Color3.fromHex("#faf7f0"),
        ElementTitle = Color3.fromHex("#3a3a3a"),
        ElementDesc = Color3.fromHex("#6b5e4f"),
        ElementIcon = Color3.fromHex("#9b8c7c"),
        Toggle = Color3.fromHex("#e8e2d5"),
        ToggleBar = Color3.fromHex("#9b8c7c"),
        Slider = Color3.fromHex("#e8e2d5"),
        SliderThumb = Color3.fromHex("#9b8c7c"),
    },
    Violet = {
        Name = "AxiomViolet",
        Accent = CreateGradient(Color3.fromHex("#2d1b4e"), Color3.fromHex("#4a2d7a"), Color3.fromHex("#2d1b4e")),
        Background = Color3.fromHex("#1a102b"),
        Outline = CreateGradient(Color3.fromHex("#a78bfa"), Color3.fromHex("#c4b5fd"), Color3.fromHex("#a78bfa")),
        Text = Color3.fromHex("#ede9fe"),
        Placeholder = Color3.fromHex("#7c6ba0"),
        Button = CreateGradient(Color3.fromHex("#3d2660"), Color3.fromHex("#5a3890"), Color3.fromHex("#3d2660")),
        Icon = CreateGradient(Color3.fromHex("#a78bfa"), Color3.fromHex("#c4b5fd"), Color3.fromHex("#a78bfa")),
        Hover = Color3.fromHex("#c4b5fd"),
        WindowBackground = CreateGradient(Color3.fromHex("#1a102b"), Color3.fromHex("#251745"), Color3.fromHex("#1a102b")),
        WindowShadow = Color3.fromHex("#000000"),
        WindowTopbarButtonIcon = CreateGradient(Color3.fromHex("#a78bfa"), Color3.fromHex("#c4b5fd"), Color3.fromHex("#a78bfa")),
        WindowTopbarTitle = Color3.fromHex("#ede9fe"),
        WindowTopbarAuthor = Color3.fromHex("#c4b5fd"),
        WindowTopbarIcon = CreateGradient(Color3.fromHex("#a78bfa"), Color3.fromHex("#c4b5fd"), Color3.fromHex("#a78bfa")),
        TabBackground = Color3.fromHex("#ede9fe"),
        TabTitle = Color3.fromHex("#ede9fe"),
        TabIcon = CreateGradient(Color3.fromHex("#a78bfa"), Color3.fromHex("#c4b5fd"), Color3.fromHex("#a78bfa")),
        ElementBackground = CreateGradient(Color3.fromHex("#221636"), Color3.fromHex("#2d1b4e"), Color3.fromHex("#221636")),
        ElementTitle = Color3.fromHex("#ede9fe"),
        ElementDesc = Color3.fromHex("#c4b5fd"),
        ElementIcon = CreateGradient(Color3.fromHex("#a78bfa"), Color3.fromHex("#c4b5fd"), Color3.fromHex("#a78bfa")),
        Toggle = CreateGradient(Color3.fromHex("#3d2660"), Color3.fromHex("#5a3890"), Color3.fromHex("#3d2660")),
        ToggleBar = CreateGradient(Color3.fromHex("#a78bfa"), Color3.fromHex("#c4b5fd"), Color3.fromHex("#a78bfa")),
        Slider = CreateGradient(Color3.fromHex("#3d2660"), Color3.fromHex("#5a3890"), Color3.fromHex("#3d2660")),
        SliderThumb = CreateGradient(Color3.fromHex("#a78bfa"), Color3.fromHex("#c4b5fd"), Color3.fromHex("#a78bfa")),
    },
}

for _, theme in pairs(Themes) do
    WindUI:AddTheme({
        Name = theme.Name,
        Accent = theme.Accent,
        Background = theme.Background,
        BackgroundTransparency = 0,
        Outline = theme.Outline,
        Text = theme.Text,
        Placeholder = theme.Placeholder,
        Button = theme.Button,
        Icon = theme.Icon,
        Hover = theme.Hover,
        WindowBackground = theme.WindowBackground,
        WindowShadow = theme.WindowShadow,
        WindowTopbarButtonIcon = theme.WindowTopbarButtonIcon,
        WindowTopbarTitle = theme.WindowTopbarTitle,
        WindowTopbarAuthor = theme.WindowTopbarAuthor,
        WindowTopbarIcon = theme.WindowTopbarIcon,
        TabBackground = theme.TabBackground,
        TabTitle = theme.TabTitle,
        TabIcon = theme.TabIcon,
        ElementBackground = theme.ElementBackground,
        ElementTitle = theme.ElementTitle,
        ElementDesc = theme.ElementDesc,
        ElementIcon = theme.ElementIcon,
        Toggle = theme.Toggle,
        ToggleBar = theme.ToggleBar,
        Slider = theme.Slider,
        SliderThumb = theme.SliderThumb,
    })
end

WindUI:SetTheme("AxiomMidnight")

local Window = WindUI:CreateWindow({
    Title = "Axiom Hub",
    Icon = "lucide:box",
    Author = "by zen",
    Folder = "AxiomHub",
    Size = UDim2.fromOffset(520, 460),
    Transparent = false,
    ToggleKey = Enum.KeyCode.K,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")

local supportedGames = {
    [142823291] = { name = "Murder Mystery 2", icon = "lucide:sword" },
}

local currentGameSupported = supportedGames[game.PlaceId]

local function isGameSupported()
    return currentGameSupported ~= nil
end

local function getGameName()
    if currentGameSupported then
        return currentGameSupported.name
    end
    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    if success and info and info.Name then
        return info.Name
    end
    return "Unknown"
end

-- Built‑in universal script (fallback)
local UniversalFallback = [[
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
]]

local function loadScript(tab, url, fallbackSource)
    local success, scriptContent = pcall(function()
        return game:HttpGet(url)
    end)
    
    if not success or not scriptContent then
        if fallbackSource then
            scriptContent = fallbackSource
        else
            tab:Section({ Title = "Error" }):Paragraph({
                Title = "Failed to load",
                Desc = "Could not fetch script from server."
            })
            return
        end
    end
    
    local loadFunc = loadstring(scriptContent)
    if loadFunc then
        local ok, err = pcall(loadFunc, tab, Window, WindUI)
        if not ok then
            tab:Section({ Title = "Error" }):Paragraph({
                Title = "Failed to load",
                Desc = "Script error: " .. tostring(err)
            })
        end
    end
end

local function loadGameScript()
    if not currentGameSupported then return end
    
    local gameTab = Window:Tab({
        Title = currentGameSupported.name,
        Icon = currentGameSupported.icon,
        IconColor = Color3.fromHex("#a78bfa"),
        Border = true
    })
    
    local scriptUrl = "https://raw.githubusercontent.com/forcufs/AxiomHub/refs/heads/main/scripts/" .. game.PlaceId .. ".lua"
    loadScript(gameTab, scriptUrl, nil)
end

local function loadUniversalScript()
    local universalTab = Window:Tab({
        Title = "Universal",
        Icon = "lucide:globe",
        IconColor = Color3.fromHex("#a78bfa"),
        Border = true
    })
    
    local scriptUrl = "https://raw.githubusercontent.com/forcufs/AxiomHub/refs/heads/main/universal.lua"
    loadScript(universalTab, scriptUrl, UniversalFallback)
end

-- Home tab
local HomeTab = Window:Tab({ 
    Title = "Home", 
    Icon = "lucide:home",
    IconColor = Color3.fromHex("#a78bfa"),
    Border = true
})

local HomeSection = HomeTab:Section({ Title = "Welcome to Axiom Hub" })

HomeSection:Image({
    Image = "rbxassetid://73812132033559",
    AspectRatio = "16:9",
    Radius = 12,
})

HomeSection:Paragraph({
    Title = "Current User",
    Desc = "@" .. LocalPlayer.Name
})

HomeSection:Paragraph({
    Title = "Game",
    Desc = getGameName()
})

HomeSection:Paragraph({
    Title = "Game ID",
    Desc = tostring(game.PlaceId)
})

HomeSection:Paragraph({
    Title = "Supported",
    Desc = isGameSupported() and "✅ Supported" or "❌ Not Supported"
})

HomeSection:Paragraph({
    Title = "Job ID",
    Desc = game.JobId
})

-- Settings tab
local SettingsTab = Window:Tab({
    Title = "Settings",
    Icon = "lucide:settings",
    IconColor = Color3.fromHex("#a78bfa"),
    Border = true
})

local ThemeSection = SettingsTab:Section({ Title = "Themes" })

ThemeSection:Dropdown({
    Title = "Select Theme",
    Values = {"Midnight", "Lucid", "Violet"},
    Value = "Midnight",
    Callback = function(value)
        WindUI:SetTheme("Axiom" .. value)
    end
})

loadUniversalScript()

if isGameSupported() then
    loadGameScript()
end
