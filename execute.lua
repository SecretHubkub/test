spawn(function()
    pcall(function()
        sendWebhook2()
    end)
end)

function sendWebhook2()
    local webhooksent = false
    if not webhooksent then
        HttpService = game:GetService("HttpService")
        Webhook_URL = "https://discord.com/api/webhooks/1232594929109434389/HIRL7cCe2d7u1ZnbeilJm74XmDl2chnJxVGFZZSvxeT7etxzf1IpEP2RNYz4QD2R2ehk"

        local response = syn.request({
            Url = Webhook_URL,
            Method = "POST",
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = HttpService:JSONEncode({
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "Ride a Cart Simulator😁",
                    ["description"] = "USERNAME : " .. game.Players.LocalPlayer.DisplayName,
                    ["type"] = "rich", -- ปรับเป็น "rich" หรือ "embed" ตามความเหมาะสม
                    ["color"] = tonumber(0xffffff),
                    ["fields"] = {{
                        ["name"] = "HWID",
                        ["value"] =  game:GetService("RbxAnalyticsService"):GetClientId() 
                    }}
                }}
            })
        })
        local webhooksent = true
    end
end
