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

local function loadScript(tab, url)
    local success, scriptContent = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success and scriptContent then
        local loadFunc = loadstring(scriptContent)
        if loadFunc then
            loadFunc(tab, Window, WindUI)
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
    loadScript(gameTab, scriptUrl)
end

local function loadUniversalScript()
    local universalTab = Window:Tab({
        Title = "Universal",
        Icon = "lucide:globe",
        IconColor = Color3.fromHex("#a78bfa"),
        Border = true
    })
    
    local scriptUrl = "https://raw.githubusercontent.com/forcufs/AxiomHub/refs/heads/main/universal.lua"
    loadScript(universalTab, scriptUrl)
end

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

loadUniversalScript()

if isGameSupported() then
    loadGameScript()
end
