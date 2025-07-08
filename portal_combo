local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local EquipBtn = Instance.new("TextButton")
local ComboBtn = Instance.new("TextButton")
local TeleportBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
Frame.Size = UDim2.new(0, 200, 0, 250)
Frame.Position = UDim2.new(0, 20, 0, 300)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Parent = ScreenGui
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local function makeBtn(text, posY)
	local btn = Instance.new("TextButton")
	btn.Text = text
	btn.Size = UDim2.new(1, -20, 0, 50)
	btn.Position = UDim2.new(0, 10, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.Parent = Frame
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 10)
	return btn
end

EquipBtn = makeBtn("Equip Combo", 10)
ComboBtn = makeBtn("Full Combo", 70)
TeleportBtn = makeBtn("Teleport", 130)

EquipBtn.MouseButton1Click:Connect(function()
	local rs = game:GetService("ReplicatedStorage").Remotes.CommF_
	rs:InvokeServer("equipItem", "Cursed Dual Katana")
	wait(0.2)
	rs:InvokeServer("equipItem", "Dragon Talon")
	wait(0.2)
	rs:InvokeServer("equipItem", "Portal")
end)

ComboBtn.MouseButton1Click:Connect(function()
	local vi = game:GetService("VirtualInputManager")
	vi:SendKeyEvent(true, Enum.KeyCode.V, false, game)
	wait(0.5)
	vi:SendKeyEvent(true, Enum.KeyCode.X, false, game)
	wait(0.3)
	vi:SendKeyEvent(true, Enum.KeyCode.One, false, game)
	wait(0.2)
	vi:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
	wait(0.2)
	vi:SendKeyEvent(true, Enum.KeyCode.Two, false, game)
	wait(0.2)
	vi:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
end)

TeleportBtn.MouseButton1Click:Connect(function()
	local vi = game:GetService("VirtualInputManager")
	vi:SendKeyEvent(true, Enum.KeyCode.C, false, game)
end)
