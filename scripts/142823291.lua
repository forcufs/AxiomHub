local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local espDrawings = {}
local ESPBoxEnabled = false
local ESPNameEnabled = false
local ESPMurdererEnabled = false
local ESPSheriffEnabled = false
local ESPCoinEnabled = false

local murderers = {}
local sheriffs = {}

local function detectRoles()
    local remote = ReplicatedStorage:FindFirstChild("GetPlayerData", true)
    if remote then
        local success, data = pcall(function() return remote:InvokeServer() end)
        if success and type(data) == "table" then
            murderers = {}
            sheriffs = {}
            for pname, info in pairs(data) do
                if info.Role == "Murderer" and not info.Killed and not info.Dead then
                    table.insert(murderers, pname)
                elseif info.Role == "Sheriff" and not info.Killed and not info.Dead then
                    table.insert(sheriffs, pname)
                end
            end
        end
    end
end

local function clearPlayerESP(player)
    if espDrawings[player] then
        for _, d in ipairs(espDrawings[player]) do
            if d then pcall(function() d:Remove() end) end
        end
        espDrawings[player] = nil
    end
end

local function updateESP()
    for player, _ in pairs(espDrawings) do
        if not player or not player.Parent or not player.Character then
            clearPlayerESP(player)
        end
    end
    
    local camera = workspace.CurrentCamera
    if not camera then return end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local char = player.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local root = hum and hum.RootPart
        if not root then
            clearPlayerESP(player)
            continue
        end
        
        local isMurderer = table.find(murderers, player.Name)
        local isSheriff = table.find(sheriffs, player.Name)
        
        local showPlayer = (not ESPMurdererEnabled and not ESPSheriffEnabled) or
                          (ESPMurdererEnabled and isMurderer) or
                          (ESPSheriffEnabled and isSheriff)
        
        if not showPlayer then
            clearPlayerESP(player)
            continue
        end
        
        local boxColor = Color3.new(1,1,1)
        if isMurderer then
            boxColor = Color3.fromRGB(255, 0, 0)
        elseif isSheriff then
            boxColor = Color3.fromRGB(0, 0, 255)
        end
        
        local drawings = espDrawings[player]
        if not drawings then
            drawings = {}
            if ESPBoxEnabled then
                local lines = {}
                for i=1,12 do
                    local line = Drawing.new("Line")
                    line.Color = boxColor
                    line.Thickness = 1
                    line.Transparency = 1
                    line.Visible = false
                    table.insert(drawings, line)
                    table.insert(lines, line)
                end
                drawings.boxLines = lines
                drawings.boxColor = boxColor
            end
            if ESPNameEnabled then
                local nameText = Drawing.new("Text")
                nameText.Color = boxColor
                nameText.Size = 18
                nameText.TextXAlignment = Enum.TextXAlignment.Center
                nameText.TextYAlignment = Enum.TextYAlignment.Center
                nameText.Outline = true
                nameText.Visible = false
                table.insert(drawings, nameText)
                drawings.nameText = nameText
            end
            espDrawings[player] = drawings
        end
        
        local pos = root.Position
        local w, h, d = 2, 5, 1.5
        local center = pos
        
        if ESPBoxEnabled and drawings.boxLines then
            local corners3D = {
                Vector3.new(center.X - w/2, center.Y - h/2, center.Z - d/2),
                Vector3.new(center.X + w/2, center.Y - h/2, center.Z - d/2),
                Vector3.new(center.X + w/2, center.Y + h/2, center.Z - d/2),
                Vector3.new(center.X - w/2, center.Y + h/2, center.Z - d/2),
                Vector3.new(center.X - w/2, center.Y - h/2, center.Z + d/2),
                Vector3.new(center.X + w/2, center.Y - h/2, center.Z + d/2),
                Vector3.new(center.X + w/2, center.Y + h/2, center.Z + d/2),
                Vector3.new(center.X - w/2, center.Y + h/2, center.Z + d/2),
            }
            local screenCorners = {}
            for i, corner3D in ipairs(corners3D) do
                local screen, onScreen = camera:WorldToViewportPoint(corner3D)
                screenCorners[i] = {pos = Vector2.new(screen.X, screen.Y), visible = onScreen}
            end
            local edges = {
                {1,2},{2,3},{3,4},{4,1},
                {5,6},{6,7},{7,8},{8,5},
                {1,5},{2,6},{3,7},{4,8},
            }
            for idx, edge in ipairs(edges) do
                local line = drawings.boxLines[idx]
                if line then
                    local sc1, sc2 = screenCorners[edge[1]], screenCorners[edge[2]]
                    if sc1.visible and sc2.visible then
                        line.From = sc1.pos
                        line.To = sc2.pos
                        line.Color = drawings.boxColor or boxColor
                        line.Visible = true
                    else
                        line.Visible = false
                    end
                end
            end
        end
        
        if ESPNameEnabled and drawings.nameText then
            local topWorld = Vector3.new(center.X, center.Y + h/2 + 0.5, center.Z)
            local screenPos, onScreen = camera:WorldToViewportPoint(topWorld)
            if onScreen then
                drawings.nameText.Position = Vector2.new(screenPos.X, screenPos.Y)
                drawings.nameText.Text = player.Name
                drawings.nameText.Color = drawings.boxColor or boxColor
                drawings.nameText.Visible = true
            else
                drawings.nameText.Visible = false
            end
        end
    end
end

Players.PlayerRemoving:Connect(function(player) clearPlayerESP(player) end)

local roleUpdateConnection = RunService.Heartbeat:Connect(function()
    if (ESPMurdererEnabled or ESPSheriffEnabled) and tick() % 3 < 0.1 then
        detectRoles()
    end
end)

local espConnection = RunService.Heartbeat:Connect(updateESP)

return function(gameTab, Window, WindUI)
    local ESPSection = gameTab:Section({ Title = "Player ESP" })
    
    ESPSection:Toggle({
        Title = "Box ESP",
        Value = false,
        Callback = function(state) ESPBoxEnabled = state end
    })
    
    ESPSection:Toggle({
        Title = "Name ESP",
        Value = false,
        Callback = function(state) ESPNameEnabled = state end
    })
    
    ESPSection:Toggle({
        Title = "Murderer ESP",
        Value = false,
        Callback = function(state) ESPMurdererEnabled = state end
    })
    
    ESPSection:Toggle({
        Title = "Sheriff ESP",
        Value = false,
        Callback = function(state) ESPSheriffEnabled = state end
    })
    
    local MiscSection = gameTab:Section({ Title = "Misc" })
    
    MiscSection:Button({
        Title = "Coming Soon",
        Icon = "lucide:clock",
        Justify = "Center",
        Callback = function()
            WindUI:Notify({
                Title = "Axiom Hub",
                Content = "More MM2 features coming soon!",
                Duration = 5
            })
        end
    })
end
