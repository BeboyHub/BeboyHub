-- โหลด Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- สร้างหน้าต่าง
local Window = Rayfield:CreateWindow({
    Name = "Swordify Auto Win",
    LoadingTitle = "Auto Win Loading...",
    LoadingSubtitle = "By TChay",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SwordifyConfig",
        FileName = "AutoWinConfig"
    }
})

-- แท็บสำหรับ Auto Win
local AutoTab = Window:CreateTab("🏆 Auto Win", 4483362458)

-- แท็บสำหรับฟีเจอร์อื่น ๆ เช่น Claim
local OtherTab = Window:CreateTab("🎁 ฟีเจอร์อื่น ๆ", 4483362458)

-- ตัวแปรสถานะ
local autoWinWorld1 = false
local autoWinWorld2 = false
local autoWinWorld3 = false
local autoWinWorld4 = false
local autoClaim = false

-- Auto Win โลก 1
AutoTab:CreateToggle({
    Name = "โลก 1 - Auto Win",
    CurrentValue = false,
    Callback = function(Value)
        autoWinWorld1 = Value
        if autoWinWorld1 then
            task.spawn(function()
                while autoWinWorld1 do
                    local args = {
                        [1] = 1,
                        [2] = Vector3.new(308.8736572265625, 5.2907633781433105, -218.1591339111328)
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("EnemyDied"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Auto Win โลก 2
AutoTab:CreateToggle({
    Name = "โลก 2 - Auto Win",
    CurrentValue = false,
    Callback = function(Value)
        autoWinWorld2 = Value
        if autoWinWorld2 then
            task.spawn(function()
                while autoWinWorld2 do
                    local args = {
                        [1] = 2,
                        [2] = Vector3.new(321.8331298828125, 5.290765762329102, -318.3057556152344)
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("EnemyDied"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Auto Win โลก 3
AutoTab:CreateToggle({
    Name = "โลก 3 - Auto Win",
    CurrentValue = false,
    Callback = function(Value)
        autoWinWorld3 = Value
        if autoWinWorld3 then
            task.spawn(function()
                while autoWinWorld3 do
                    local args = {
                        [1] = 1,
                        [2] = Vector3.new(296.89556884765625, 5.290654182434082, -478.93963623046875)
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("EnemyDied"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- ✅ Auto Win โลก 4 (ที่เพิ่มเข้ามา)
AutoTab:CreateToggle({
    Name = "โลก 4 - Auto Win",
    CurrentValue = false,
    Callback = function(Value)
        autoWinWorld4 = Value
        if autoWinWorld4 then
            task.spawn(function()
                while autoWinWorld4 do
                    local args = {
                        [1] = 1,
                        [2] = Vector3.new(131.76898193359375, 5.24628210067749, -511.0265197753906)
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("EnemyDied"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Auto Claim Rewards
OtherTab:CreateToggle({
    Name = "Auto Claim Rewards",
    CurrentValue = false,
    Callback = function(Value)
        autoClaim = Value
        if autoClaim then
            task.spawn(function()
                while autoClaim do
                    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("ClaimRewards"):FireServer()
                    task.wait(1)
                end
            end)
        end
    end
})
