-- 👑 FAKE ADMIN PANEL
-- Cosmetic/demo only. Commands do NOT actually affect the game.

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "FakeAdminPanel"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--------------------------------------------------
-- MAIN PANEL
--------------------------------------------------

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 340, 0, 500)
panel.Position = UDim2.new(0.5, -170, 0.5, -250)
panel.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
panel.BorderSizePixel = 0
panel.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = panel

--------------------------------------------------
-- TITLE
--------------------------------------------------

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 55)
title.BackgroundTransparency = 1
title.Text = "👑 FAKE ADMIN PANEL"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextSize = 23
title.Font = Enum.Font.GothamBold
title.Parent = panel

--------------------------------------------------
-- STATUS
--------------------------------------------------

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 35)
status.Position = UDim2.new(0, 10, 0, 50)
status.BackgroundTransparency = 1
status.Text = "🟢 ADMIN MODE: ON"
status.TextColor3 = Color3.fromRGB(80, 255, 120)
status.TextSize = 16
status.Font = Enum.Font.GothamBold
status.Parent = panel

--------------------------------------------------
-- ANNOUNCEMENT DISPLAY
--------------------------------------------------

local announcement = Instance.new("TextLabel")
announcement.Size = UDim2.new(1, -20, 0, 75)
announcement.Position = UDim2.new(0, 10, 1, -85)
announcement.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
announcement.TextColor3 = Color3.fromRGB(255, 255, 255)
announcement.TextSize = 16
announcement.Font = Enum.Font.GothamBold
announcement.TextWrapped = true
announcement.Visible = false
announcement.Parent = panel

local announcementCorner = Instance.new("UICorner")
announcementCorner.CornerRadius = UDim.new(0, 8)
announcementCorner.Parent = announcement

--------------------------------------------------
-- ANNOUNCEMENT FUNCTION
--------------------------------------------------

local function makeAnnouncement(message)

	-- Fake verified badge
	announcement.Text =
		"🔵 " .. player.Name .. " ✓\n" ..
		"📢 " .. message

	announcement.Visible = true

	task.delay(5, function()
		announcement.Visible = false
	end)
end

--------------------------------------------------
-- COMMAND BUTTONS
--------------------------------------------------

local commands = {
	"🔥 Spawn Egg",
	"💰 Give Coins",
	"⚡ Speed",
	"🦘 Super Jump",
	"❄️ Freeze Player",
	"📢 Global Announcement",
	"💀 Ban Player"
}

for i, command in ipairs(commands) do

	local button = Instance.new("TextButton")

	button.Size = UDim2.new(1, -30, 0, 40)
	button.Position =
		UDim2.new(0, 15, 0, 95 + ((i - 1) * 45))

	button.BackgroundColor3 = Color3.fromRGB(45, 45, 56)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Text = command
	button.TextSize = 15
	button.Font = Enum.Font.GothamBold
	button.BorderSizePixel = 0
	button.Parent = panel

	local buttonCorner = Instance.new("UICorner")
	buttonCorner.CornerRadius = UDim.new(0, 8)
	buttonCorner.Parent = button

	button.MouseButton1Click:Connect(function()

		-- Announcement button
		if command == "📢 Global Announcement" then

			makeAnnouncement("Hello everyone! 👑")

		else

			-- Fake command feedback
			local oldText = button.Text

			button.Text = "✅ EXECUTED!"

			task.wait(0.8)

			button.Text = oldText

		end
	end)
end

--------------------------------------------------
-- FAKE ADMIN TAG
--------------------------------------------------

local function addFakeTag(character)

	local head = character:WaitForChild("Head")

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "FakeAdminTag"
	billboard.Size = UDim2.new(0, 170, 0, 45)
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = head

	local tag = Instance.new("TextLabel")
	tag.Size = UDim2.new(1, 0, 1, 0)
	tag.BackgroundTransparency = 1
	tag.Text = "👑 ADMIN"
	tag.TextColor3 = Color3.fromRGB(255, 215, 0)
	tag.TextStrokeTransparency = 0
	tag.TextSize = 21
	tag.Font = Enum.Font.GothamBold
	tag.Parent = billboard
end

--------------------------------------------------
-- CHARACTER HANDLING
--------------------------------------------------

if player.Character then
	addFakeTag(player.Character)
end

player.CharacterAdded:Connect(function(character)
	addFakeTag(character)
end)