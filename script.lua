local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()

local window = Rayfield:CreateWindow({
    name = "HorkHub",
    subtitle = "+1 Laser Destruction 🔥",
    sidebarLayout = true,
})

local tab = window:CreateTab({ name = "Auto", icon = 108115485663409    })

tab:CreateToggle({
    name = "Auto-buy: Yellow Fire",
    callback = function(value)
       local args = {
	"2"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyLaser"):InvokeServer(unpack(args))
    end,
})

tab:CreateToggle({
    name = "Auto-buy: Blue Fire",
    callback = function(value)
       local args = {
	"3"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyLaser"):InvokeServer(unpack(args))
    end,
})

tab:CreateToggle({
    name = "Auto-buy: Dark Blue Fire",
    callback = function(value)
       local args = {
	"4"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyLaser"):InvokeServer(unpack(args))
    end,
})

tab:CreateToggle({
    name = "Auto-buy: Green Fire",
    callback = function(value)
       local args = {
	"5"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyLaser"):InvokeServer(unpack(args))
    end,
})

tab:CreateToggle({
    name = "Auto-buy: Pink Fire",
    callback = function(value)
       local args = {
	"6"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyLaser"):InvokeServer(unpack(args))
    end,
})

tab:CreateToggle({
    name = "Auto-buy: Whitee Fire",
    callback = function(value)
       local args = {
	"7"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyLaser"):InvokeServer(unpack(args))
    end,
})

tab:CreateDivider({ text = "Other" })

tab:CreateToggle({
    name = "Auto-rebirth",
    callback = function(value)
   game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("Rebirth"):InvokeServer()
    end,
})

tab:CreateDivider({ text = "Aura" })

tab:CreateToggle({
    name = "Auto-buy: Flame Aura",
    callback = function(value)
    local args = {
	    "1"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyAura"):InvokeServer(unpack(args))

    end,
})

tab:CreateToggle({
    name = "Auto-buy: Blue Aura",
    callback = function(value)
    local args = {
	    "2"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyAura"):InvokeServer(unpack(args))

    end,
})

tab:CreateToggle({
    name = "Auto-buy: Green Aura",
    callback = function(value)
    local args = {
	    "3"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyAura"):InvokeServer(unpack(args))

    end,
})

tab:CreateToggle({
    name = "Auto-buy: Pink Aura",
    callback = function(value)
    local args = {
	    "4"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyAura"):InvokeServer(unpack(args))

    end,
})

tab:CreateToggle({
    name = "Auto-buy: Void Aura",
    callback = function(value)
    local args = {
	    "5"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyAura"):InvokeServer(unpack(args))

    end,
})

local tab = window:CreateTab({ name = "Upgrade", icon = 88738500661569    })

tab:CreateToggle({
    name = "Auto-upgrade: CashMulti",
    callback = function(value)
    local args = {
	"CashMulti",
	"1"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyUpgrade"):InvokeServer(unpack(args))

    end,
})

tab:CreateToggle({
    name = "Auto-upgrade: Laser Speed",
    callback = function(value)
    local args = {
	"LaserSpeed",
	"1"
    }   
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyUpgrade"):InvokeServer(unpack(args))

    end,
})

tab:CreateToggle({
    name = "Auto-upgrade: Offline Hours",
    callback = function(value)
    local args = {
	"OfflineHours",
	"1"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Callers"):WaitForChild("RemoteFunctions"):WaitForChild("BuyUpgrade"):InvokeServer(unpack(args))

    end,
})


local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- ==================== TAB: MOVEMENT ====================
local movementTab = window:CreateTab({ Name = "Movement", Icon = 6023426915 })

local walkSpeedEnabled = false
local walkSpeedValue = 16
local jumpPowerEnabled = false
local jumpPowerValue = 50
local noclipEnabled = false
local flyEnabled = false
local flySpeed = 50

local bv, bg, controllingFly

-- Применение WalkSpeed и JumpPower в реальном времени
RunService.RenderStepped:Connect(function()
    local char = localPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            if walkSpeedEnabled then
                hum.WalkSpeed = walkSpeedValue
            end
            if jumpPowerEnabled then
                hum.UseJumpPower = true
                hum.JumpPower = jumpPowerValue
            end
        end
    end
end)

-- Noclip логика
RunService.Stepped:Connect(function()
    if noclipEnabled and localPlayer.Character then
        for _, part in ipairs(localPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Fly логика
local function startFly()
    local char = localPlayer.Character
    if not char then return end
    local rootPart = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not rootPart or not hum then return end

    hum.PlatformStand = true
    
    bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.Parent = rootPart

    bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.CFrame = rootPart.CFrame
    bg.Parent = rootPart

    controllingFly = RunService.RenderStepped:Connect(function()
        if not flyEnabled or not char or not rootPart.Parent then return end
        local cam = workspace.CurrentCamera
        local moveDir = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end

        bv.Velocity = moveDir * flySpeed
        bg.CFrame = cam.CFrame
    end)
end

local function stopFly()
    if controllingFly then
        controllingFly:Disconnect()
        controllingFly = nil
    end
    
    if bv then
        bv:Destroy()
        bv = nil
    end
    
    if bg then
        bg:Destroy()
        bg = nil
    end
    
    local char = localPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.PlatformStand = false
        end
    end
end

-- Элементы управления
movementTab:CreateToggle({
    Name = "WalkSpeed ",
    Callback = function(value)
        walkSpeedEnabled = value
        if not value and localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
            localPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
        end
    end,
})

movementTab:CreateSlider({
    Name = "Speed",
    Range = { 16, 150 },
    Increment = 1,
    CurrentValue = 16,
    Suffix = " spd",
    Callback = function(value)
        walkSpeedValue = value
    end,
})

movementTab:CreateToggle({
    Name = "JumpPower",
    Callback = function(value)
        jumpPowerEnabled = value
        if not value and localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
            localPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = 50
        end
    end,
})

movementTab:CreateSlider({
    Name = "Power",
    Range = { 50, 300 },
    Increment = 5,
    CurrentValue = 50,
    Suffix = " power",
    Callback = function(value)
        jumpPowerValue = value
    end,
})

movementTab:CreateToggle({
    Name = "Noclip",
    Callback = function(value)
        noclipEnabled = value
    end,
})

movementTab:CreateToggle({
    Name = "Fly",
    Callback = function(value)
        flyEnabled = value
        if flyEnabled then
            startFly()
        else
            stopFly()
        end
    end,
})

movementTab:CreateSlider({
    Name = "Fly speed",
    Range = { 20, 200 },
    Increment = 5,
    CurrentValue = 50,
    Suffix = " speed",
    Callback = function(value)
        flySpeed = value
    end,
})



