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
            -- ถ้าเปิดให้ยิงซ้ำเรื่อยๆ
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
                    task.wait(_G.DupeDelay) -- ยิงตามความเร็วที่ตั้ง
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

-- Credit
local CreditTab = Window:CreateTab("Credits", 4483362458)

CreditTab:CreateParagraph({Title = "BeBoy Hub", Content = "Script made by TChay\nUI Powered by Rayfield Library."})
