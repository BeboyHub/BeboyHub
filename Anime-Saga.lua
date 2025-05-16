-- โหลด Kavo UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Pepsi's World", "DarkTheme")

local Tab = Window:NewTab("General")
local Section = Tab:NewSection("Mana & Anti-Stun")

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local manaFolder = workspace:WaitForChild("PlayerFodel")

-- ตัวแปรเก็บสถานะเปิด/ปิดฟีเจอร์
local infManaEnabled = false
local antiStunEnabled = false

-- Toggle สำหรับ Infinite Mana
Section:NewToggle("Infinite Mana", "เปิด/ปิด Infinite Mana", function(state)
    infManaEnabled = state
end)

-- Toggle สำหรับ Anti Stun
Section:NewToggle("Anti Stun", "เปิด/ปิด Anti Stun", function(state)
    antiStunEnabled = state
end)

-- ฟังก์ชันอัพเดต Infinite Mana
RunService.Stepped:Connect(function()
    if infManaEnabled then
        for _, playerModel in pairs(manaFolder:GetChildren()) do
            if playerModel:FindFirstChild("Mana") then
                local mana = playerModel.Mana
                if mana.Value < math.huge then
                    mana.Value = math.huge
                end
            end
        end
    end
end)

-- ฟังก์ชันป้องกันติดสตั้น (Anti Stun)
RunService.Stepped:Connect(function()
    if antiStunEnabled then
        local char = lp.Character
        if char then
            -- ป้องกัน Anchor
            if char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.Anchored = false
            end

            -- ล็อกความเร็วไม่ให้ลด
            if char:FindFirstChild("Humanoid") then
                local hum = char.Humanoid
                hum.WalkSpeed = 20
                hum.JumpPower = 50
            end

            -- ลบสถานะ Stunned
            local stun = char:FindFirstChild("Stunned") or char:FindFirstChild("IsStunned")
            if stun then
                stun:Destroy()
            end
        end
    end
end)
