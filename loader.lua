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

WindUI:AddTheme({
    Name = "AxiomDark",
    
    Accent = CreateGradient(
        Color3.fromHex("#0f0f1a"),
        Color3.fromHex("#1a1a2e"),
        Color3.fromHex("#0f0f1a")
    ),
    Background = Color3.fromHex("#080810"),
    BackgroundTransparency = 0,
    Outline = CreateGradient(
        Color3.fromHex("#6c6cff"),
        Color3.fromHex("#8a4fff"),
        Color3.fromHex("#6c6cff")
    ),
    Text = Color3.fromHex("#e8e8f0"),
    Placeholder = Color3.fromHex("#5a5a7a"),
    
    Button = CreateGradient(
        Color3.fromHex("#1a1a30"),
        Color3.fromHex("#252545"),
        Color3.fromHex("#1a1a30")
    ),
    Icon = CreateGradient(
        Color3.fromHex("#6c6cff"),
        Color3.fromHex("#a78bfa"),
        Color3.fromHex("#6c6cff")
    ),
    
    Hover = Color3.fromHex("#a78bfa"),
    
    WindowBackground = CreateGradient(
        Color3.fromHex("#080810"),
        Color3.fromHex("#0f0f1f"),
        Color3.fromHex("#080810")
    ),
    WindowShadow = Color3.fromHex("#000000"),
    
    WindowTopbarButtonIcon = CreateGradient(
        Color3.fromHex("#6c6cff"),
        Color3.fromHex("#a78bfa"),
        Color3.fromHex("#6c6cff")
    ),
    WindowTopbarTitle = Color3.fromHex("#e8e8f0"),
    WindowTopbarAuthor = Color3.fromHex("#a78bfa"),
    WindowTopbarIcon = CreateGradient(
        Color3.fromHex("#6c6cff"),
        Color3.fromHex("#a78bfa"),
        Color3.fromHex("#6c6cff")
    ),
    
    TabBackground = Color3.fromHex("#e8e8f0"),
    TabTitle = Color3.fromHex("#e8e8f0"),
    TabIcon = CreateGradient(
        Color3.fromHex("#6c6cff"),
        Color3.fromHex("#a78bfa"),
        Color3.fromHex("#6c6cff")
    ),
    
    ElementBackground = CreateGradient(
        Color3.fromHex("#12121f"),
        Color3.fromHex("#1a1a2e"),
        Color3.fromHex("#12121f")
    ),
    ElementTitle = Color3.fromHex("#e8e8f0"),
    ElementDesc = Color3.fromHex("#a78bfa"),
    ElementIcon = CreateGradient(
        Color3.fromHex("#6c6cff"),
        Color3.fromHex("#a78bfa"),
        Color3.fromHex("#6c6cff")
    ),
    
    Toggle = CreateGradient(
        Color3.fromHex("#1a1a30"),
        Color3.fromHex("#252545"),
        Color3.fromHex("#1a1a30")
    ),
    ToggleBar = CreateGradient(
        Color3.fromHex("#6c6cff"),
        Color3.fromHex("#a78bfa"),
        Color3.fromHex("#6c6cff")
    ),
    
    Slider = CreateGradient(
        Color3.fromHex("#1a1a30"),
        Color3.fromHex("#252545"),
        Color3.fromHex("#1a1a30")
    ),
    SliderThumb = CreateGradient(
        Color3.fromHex("#6c6cff"),
        Color3.fromHex("#a78bfa"),
        Color3.fromHex("#6c6cff")
    ),
})

WindUI:SetTheme("AxiomDark")


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
local HttpService = game:GetService("HttpService")

local supportedGames = {
    [142823291] = {
        name = "Murder Mystery 2",
        script = "https://raw.githubusercontent.com/forcufs/AxiomHub/main/142823291.lua",
        icon = "🗡️"
    },
    [2753915549] = {
        name = "Blox Fruits",
        script = "https://raw.githubusercontent.com/forcufs/AxiomHub/main/2753915549.lua",
        icon = "🍎"
    },
    [537413528] = {
        name = "Build A Boat For Treasure",
        script = "https://raw.githubusercontent.com/forcufs/AxiomHub/main/537413528.lua",
        icon = "⛵"
    },
    [155615604] = {
        name = "Prison Life",
        script = "https://raw.githubusercontent.com/forcufs/AxiomHub/main/155615604.lua",
        icon = "🔒"
    },
    [1962086868] = {
        name = "Tower of Hell",
        script = "https://raw.githubusercontent.com/forcufs/AxiomHub/main/1962086868.lua",
        icon = "🏗️"
    },
    [292439477] = {
        name = "Phantom Forces",
        script = "https://raw.githubusercontent.com/forcufs/AxiomHub/main/292439477.lua",
        icon = "🔫"
    },
    [301549746] = {
        name = "Counter Blox",
        script = "https://raw.githubusercontent.com/forcufs/AxiomHub/main/301549746.lua",
        icon = "🎯"
    },
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

local function loadGameScript()
    if not currentGameSupported then return end
    
    local success, scriptContent = pcall(function()
        return game:HttpGet(currentGameSupported.script)
    end)
    
    if success and scriptContent then
        -- Create the game tab
        local gameTab = Window:Tab({
            Title = currentGameSupported.name,
            Icon = currentGameSupported.icon,
            IconColor = Color3.fromHex("#a78bfa"),
            Border = true
        })
        
        -- Execute the game-specific script with access to the tab
        local loadFunc = loadstring(scriptContent)
        if loadFunc then
            loadFunc(gameTab, Window, WindUI)
        end
    end
end

-- Home Tab
local HomeTab = Window:Tab({ 
    Title = "Home", 
    Icon = "lucide:home",
    IconColor = Color3.fromHex("#a78bfa"),
    Border = true
})

local HomeSection = HomeTab:Section({ Title = "Welcome to Axiom Hub" })

-- Logo using Roblox asset ID
HomeSection:Image({
    Image = "rbxassetid://73812132033559",
    AspectRatio = "16:9",
    Radius = 12,
})

-- User info cards
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

-- Load game-specific script if supported
if isGameSupported() then
    loadGameScript()
end
