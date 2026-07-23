-- Murder Mystery 2

local function createMM2Tab(gameTab, Window, WindUI)
    local MM2Section = gameTab:Section({ Title = "Murder Mystery 2 Features" })
    
    MM2Section:Paragraph({
        Title = "🔪 Murderer ESP",
        Desc = "Highlights the murderer in red"
    })
    
    MM2Section:Paragraph({
        Title = "🔫 Sheriff ESP",
        Desc = "Highlights the sheriff in blue"
    })
    
    MM2Section:Paragraph({
        Title = "💎 Coin ESP",
        Desc = "Shows collectible coins through walls"
    })
    
    MM2Section:Button({
        Title = "Coming Soon",
        Icon = "lucide:clock",
        Justify = "Center",
        Callback = function()
            WindUI:Notify({
                Title = "Axiom Hub",
                Content = "MM2 features are under development!",
                Duration = 5
            })
        end
    })
end

createMM2Tab(gameTab, Window, WindUI)
