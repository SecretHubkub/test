_G.Webhook_URL = "https://discord.com/api/webhooks/1232594929109434389/HIRL7cCe2d7u1ZnbeilJm74XmDl2chnJxVGFZZSvxeT7etxzf1IpEP2RNYz4QD2R2ehk"
spawn(function()
    sendWebhook2()
end)


local HttpRequest = http_request or request or syn.request
-- สร้างตัวแปรเพื่อเก็บสถานะการส่ง webhook
local webhookSent = false

-- สร้างฟังก์ชันสำหรับส่ง webhook
function sendWebhook2()
    -- ตรวจสอบว่า webhook ยังไม่ได้ส่ง
    if not webhookSent then
        HttpService = game:GetService("HttpService")
        Webhook_URL = _G.Webhook_URL

        -- ส่ง webhook
        local response = HttpRequest({
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
                        ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(), -- เพิ่ม .Value เพื่อเข้าถึงค่า
                        ["inline"] = true
                    }}
                }}
            })
        })

        -- ตั้งค่าสถานะ webhook ให้เป็น true เมื่อส่งแล้ว
        webhookSent = true
    end
end
