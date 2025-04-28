-- โหลด Rayfield (UI Library)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BeBoy Hub",
    LoadingTitle = "BeBoy Hub Loading...",
    LoadingSubtitle = "By TChay", -- เจ้าของ Hub
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BeBoyHubSettings", -- เซฟการตั้งค่าได้
        FileName = "BeBoyHub"
    }
})

local Tab = Window:CreateTab("Main", 4483362458) -- ไอคอน Tab เป็นเพชร

-- ตัวแปรหลัก
_G.AutoDupe = false
_G.DupeDelay = 0.1 -- เริ่มต้นหน่วง 0.1 วินาที

-- ปุ่ม Dupe 1 ครั้ง
Tab:CreateButton({
    Name = "💎 Dupe Gems (Single Shot)",
    Callback = function()
        local args = {
            [1] = {
                ["\2"] = {
                    [1] = {
                        [1] = "old_crate",
                        ["n"] = 1
                    }
                }
            },
            [2] = {}
        }
        game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
    end,
})

-- Toggle เปิด/ปิด Auto Dupe
Tab:CreateToggle({
    Name = "💎 Auto Dupe Gems",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoDupe = Value

        if Value then
            task.spawn(function()
                while _G.AutoDupe do
                    local args = {
                        [1] = {
                            ["\2"] = {
                                [1] = {
                                    [1] = "old_crate",
                                    ["n"] = 1
                                }
                            }
                        },
                        [2] = {}
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
                    task.wait(_G.DupeDelay)
                end
            end)
        end
    end,
})

-- Slider ปรับความเร็วยิง
Tab:CreateSlider({
    Name = "⏱️ Set Dupe Speed (Delay Seconds)",
    Range = {0.01, 1},
    Increment = 0.01,
    Suffix = "s",
    CurrentValue = 0.1,
    Callback = function(Value)
        _G.DupeDelay = Value
    end,
})

-- Credit Tab
local CreditTab = Window:CreateTab("Credits", 4483362458)

CreditTab:CreateParagraph({Title = "BeBoy Hub", Content = "Script made by TChay\nUI Powered by Rayfield Library."})

----------------------------------------------------------------
-- ส่วนเสริม: Misc Tab (Region Boost FPS และ Black Screen)
----------------------------------------------------------------

-- ตัวแปรสำหรับ Black Screen
local isBlackScreenEnabled = false
local blackScreenGui -- เก็บตัว Gui ไว้สำหรับปิด

-- สร้าง Tab Misc
local MiscTab = Window:CreateTab("Misc", 4483362458)

-- ปุ่ม Region Boost FPS
MiscTab:CreateButton({
    Name = "⚡ Region Boost FPS",
    Callback = function()
        sethiddenproperty(game.Lighting, "Technology", Enum.Technology.Compatibility)
        game.Lighting.GlobalShadows = false
        game.Lighting.FogEnd = 9e9
        settings().Rendering.QualityLevel = "Level01"

        for i, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            elseif v:IsA("Decal") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v:Destroy()
            end
        end
    end,
})

-- ปุ่มเปิด Black Screen
MiscTab:CreateButton({
    Name = "🖤 Enable Black Screen",
    Callback = function()
        if not isBlackScreenEnabled then
            blackScreenGui = Instance.new("ScreenGui")
            blackScreenGui.Name = "BlackScreen"
            blackScreenGui.ResetOnSpawn = false
            blackScreenGui.IgnoreGuiInset = true
            blackScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

            local Frame = Instance.new("Frame")
            Frame.Parent = blackScreenGui
            Frame.Size = UDim2.new(1, 0, 1, 0)
            Frame.BackgroundColor3 = Color3.new(0, 0, 0)
            Frame.BorderSizePixel = 0

            blackScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            isBlackScreenEnabled = true
        end
    end,
})

-- ปุ่มปิด Black Screen
MiscTab:CreateButton({
    Name = "🤍 Disable Black Screen",
    Callback = function()
        if isBlackScreenEnabled and blackScreenGui then
            blackScreenGui:Destroy()
            isBlackScreenEnabled = false
        end
    end,
})
