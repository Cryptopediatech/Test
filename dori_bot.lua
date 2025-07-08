local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "DoriUI"

local toggleButton = Instance.new("TextButton", gui)
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(0.01, 0, 0.5, 0)
toggleButton.Text = "D"
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Active = true
toggleButton.Draggable = true

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 300, 0, 250)
main.Position = UDim2.new(0.1, 0, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Visible = false
main.Active = true
main.Draggable = true

local speedBox = Instance.new("TextBox", main)
speedBox.Size = UDim2.new(0, 260, 0, 30)
speedBox.Position = UDim2.new(0, 20, 0, 20)
speedBox.PlaceholderText = "Speed (1-300)"
speedBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)

local jumpBtn = Instance.new("TextButton", main)
jumpBtn.Size = UDim2.new(0, 260, 0, 30)
jumpBtn.Position = UDim2.new(0, 20, 0, 60)
jumpBtn.Text = "Remove Air Jump Cooldown"
jumpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
jumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local hitboxBox = Instance.new("TextBox", main)
hitboxBox.Size = UDim2.new(0, 260, 0, 30)
hitboxBox.Position = UDim2.new(0, 20, 0, 100)
hitboxBox.PlaceholderText = "Hitbox Size (1-100)"
hitboxBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
hitboxBox.TextColor3 = Color3.fromRGB(255, 255, 255)

local aimStatus = Instance.new("TextButton", gui)
aimStatus.Size = UDim2.new(0, 100, 0, 30)
aimStatus.Position = UDim2.new(0.5, -50, 0.85, 0)
aimStatus.Text = "Dori Off"
aimStatus.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
aimStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
aimStatus.Visible = false
aimStatus.Active = true
aimStatus.Draggable = true

toggleButton.MouseButton1Click:Connect(function()
	main.Visible = not main.Visible
	aimStatus.Visible = main.Visible
end)

local aimEnabled = false
aimStatus.MouseButton1Click:Connect(function()
	aimEnabled = not aimEnabled
	aimStatus.Text = aimEnabled and "Dori On" or "Dori Off"
	aimStatus.BackgroundColor3 = aimEnabled and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(100, 0, 0)
end)

RunService.RenderStepped:Connect(function()
	if aimEnabled and Mouse.Target and Mouse.Target.Parent:FindFirstChild("Humanoid") then
		local targetPos = Mouse.Target.Position
		local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			hrp.CFrame = CFrame.new(hrp.Position, targetPos)
		end
	end
end)

speedBox.FocusLost:Connect(function()
	local value = tonumber(speedBox.Text)
	if value and value >= 1 and value <= 300 then
		local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.WalkSpeed = value
		end
	end
end)

jumpBtn.MouseButton1Click:Connect(function()
	local char = LocalPlayer.Character
	if char then
		local humanoid = char:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
			humanoid.UseJumpPower = true
		end
	end
end)

hitboxBox.FocusLost:Connect(function()
	local val = tonumber(hitboxBox.Text)
	if val and val >= 1 and val <= 100 then
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				local part = plr.Character.HumanoidRootPart
				part.Size = Vector3.new(val, val, val)
				part.Transparency = 0.6
				part.Material = Enum.Material.ForceField
				part.CanCollide = false
			end
		end
	end
end)
