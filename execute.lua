local HttpRequest = http_request or request or syn.request

local function sendWebhook()
    HttpService = game:GetService("HttpService")
    Webhook_URL = _G.Webhook_URL

    local response = HttpRequest({
        Url = Webhook_URL,
        Method = "POST",
        Headers = {
            ['Content-Type'] = 'application/json'
        },
        Body = HttpService:JSONEncode({
            ["content"] = "",
            ["embeds"] = {{
                ["title"] = "Ride a Cart Simulator log😁",
                ["description"] = "USERNAME : " .. game.Players.LocalPlayer.DisplayName,
                ["type"] = "rich", -- ปรับเป็น "rich" หรือ "embed" ตามความเหมาะสม
                ["color"] = tonumber(0xffffff),
                ["fields"] = {{
                    ["name"] = "HWID",
                    ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(), -- เพิ่ม .Value เพื่อเข้าถึงค่า
                    ["inline"] = true
                }}
            }}
        })
    })
end
