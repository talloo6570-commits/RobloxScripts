https://github.com/talloo6570-commits/RobloxScripts.git

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local Event = ReplicatedStorage:WaitForChild("MoonDevKickEvent")

local LightPurple = Color3.fromRGB(190, 130, 255)
local Purple = Color3.fromRGB(170, 80, 255)
local LightPink = Color3.fromRGB(255, 150, 210)
local MoonStroke = Color3.fromRGB(215, 175, 255)
local White = Color3.fromRGB(255, 255, 255)

local Gui = Instance.new("ScreenGui")
Gui.Name = "MoonDevKickClient"
Gui.ResetOnSpawn = false
Gui.Parent = Player:WaitForChild("PlayerGui")

local function Corner(Object, Radius)
	local C = Instance.new("UICorner")
	C.CornerRadius = UDim.new(0, Radius)
	C.Parent = Object
end

local function Stroke(Object, Color, Thickness)
	local S = Instance.new("UIStroke")
	S.Color = Color
	S.Thickness = Thickness
	S.Parent = Object
end

local function Gradient(Object)
	local G = Instance.new("UIGradient")
	G.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, LightPurple),
		ColorSequenceKeypoint.new(0.5, Purple),
		ColorSequenceKeypoint.new(1, LightPink)
	})
	G.Rotation = 25
	G.Parent = Object
end

local function Hover(Button, Normal, HoverColor)
	Button.MouseEnter:Connect(function()
		TweenService:Create(Button, TweenInfo.new(0.18), {
			BackgroundColor3 = HoverColor
		}):Play()
	end)

	Button.MouseLeave:Connect(function()
		TweenService:Create(Button, TweenInfo.new(0.18), {
			BackgroundColor3 = Normal
		}):Play()
	end)
end

-- OPEN BUTTON
local Open = Instance.new("TextButton")
Open.Name = "MoonDev's KickClient"
Open.Size = UDim2.fromOffset(220, 48)
Open.Position = UDim2.new(0.5, -110, 0, 25)
Open.BackgroundColor3 = Purple
Open.Text = "MoonDev's KickClient"
Open.TextColor3 = White
Open.TextSize = 17
Open.Font = Enum.Font.GothamBold
Open.Parent = Gui

Corner(Open, 12)
Stroke(Open, MoonStroke, 2.5)
Gradient(Open)
Hover(Open, Purple, LightPurple)

-- MAIN PANEL
local Panel = Instance.new("Frame")
Panel.Size = UDim2.fromOffset(370, 420)
Panel.Position = UDim2.new(0.5, -185, 0.5, -210)
Panel.BackgroundColor3 = Color3.fromRGB(250, 243, 255)
Panel.Visible = false
Panel.Parent = Gui

Corner(Panel, 16)
Stroke(Panel, LightPurple, 2)

-- HEADER
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 65)
Header.BackgroundColor3 = Purple
Header.Parent = Panel

Corner(Header, 16)
Gradient(Header)

local HeaderCover = Instance.new("Frame")
HeaderCover.Size = UDim2.new(1, 0, 0, 18)
HeaderCover.Position = UDim2.new(0, 0, 1, -18)
HeaderCover.BackgroundColor3 = Purple
HeaderCover.BorderSizePixel = 0
HeaderCover.Parent = Header
Gradient(HeaderCover)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -65, 1, 0)
Title.Position = UDim2.fromOffset(15, 0)
Title.BackgroundTransparency = 1
Title.Text = "🌙 MoonDev's KickClient"
Title.TextColor3 = White
Title.TextSize = 19
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(35, 35)
Close.Position = UDim2.new(1, -45, 0, 15)
Close.BackgroundColor3 = LightPink
Close.Text = "×"
Close.TextColor3 = White
Close.TextSize = 25
Close.Font = Enum.Font.GothamBold
Close.Parent = Header

Corner(Close, 10)
Stroke(Close, White, 1)
Hover(Close, LightPink, Purple)

-- DESCRIPTION
local Description = Instance.new("TextLabel")
Description.Size = UDim2.new(1, -30, 0, 30)
Description.Position = UDim2.fromOffset(15, 75)
Description.BackgroundTransparency = 1
Description.Text = "Select a player"
Description.TextColor3 = Purple
Description.TextSize = 14
Description.Font = Enum.Font.GothamBold
Description.TextXAlignment = Enum.TextXAlignment.Left
Description.Parent = Panel

-- PLAYER LIST
local List = Instance.new("ScrollingFrame")
List.Size = UDim2.new(1, -30, 0, 190)
List.Position = UDim2.fromOffset(15, 110)
List.BackgroundColor3 = Color3.fromRGB(255, 250, 255)
List.BorderSizePixel = 0
List.ScrollBarThickness = 4
List.ScrollBarImageColor3 = Purple
List.CanvasSize = UDim2.new()
List.Parent = Panel

Corner(List, 12)
Stroke(List, LightPurple, 1.5)

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 7)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = List

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 8)
Padding.PaddingLeft = UDim.new(0, 8)
Padding.PaddingRight = UDim.new(0, 8)
Padding.Parent = List

-- SELECTED PLAYER
local SelectedLabel = Instance.new("TextLabel")
SelectedLabel.Size = UDim2.new(1, -30, 0, 35)
SelectedLabel.Position = UDim2.fromOffset(15, 310)
SelectedLabel.BackgroundTransparency = 1
SelectedLabel.Text = "No player selected"
SelectedLabel.TextColor3 = Purple
SelectedLabel.TextSize = 13
SelectedLabel.Font = Enum.Font.GothamBold
SelectedLabel.Parent = Panel

-- KICK BUTTON
local Kick = Instance.new("TextButton")
Kick.Size = UDim2.new(1, -30, 0, 43)
Kick.Position = UDim2.fromOffset(15, 355)
Kick.BackgroundColor3 = Purple
Kick.Text = "KICK PLAYER"
Kick.TextColor3 = White
Kick.TextSize = 15
Kick.Font = Enum.Font.GothamBold
Kick.Parent = Panel

Corner(Kick, 12)
Stroke(Kick, LightPurple, 2)
Gradient(Kick)
Hover(Kick, Purple, LightPurple)

-- CONFIRMATION
local Confirm = Instance.new("Frame")
Confirm.Size = UDim2.fromOffset(280, 150)
Confirm.Position = UDim2.new(0.5, -140, 0.5, -75)
Confirm.BackgroundColor3 = Color3.fromRGB(250, 243, 255)
Confirm.Visible = false
Confirm.ZIndex = 5
Confirm.Parent = Gui

Corner(Confirm, 16)
Stroke(Confirm, LightPurple, 2)

local ConfirmTitle = Instance.new("TextLabel")
ConfirmTitle.Size = UDim2.new(1, -20, 0, 55)
ConfirmTitle.Position = UDim2.fromOffset(10, 8)
ConfirmTitle.BackgroundTransparency = 1
ConfirmTitle.Text = "Confirm kick?"
ConfirmTitle.TextColor3 = Purple
ConfirmTitle.TextSize = 17
ConfirmTitle.Font = Enum.Font.GothamBold
ConfirmTitle.ZIndex = 6
ConfirmTitle.Parent = Confirm

local Cancel = Instance.new("TextButton")
Cancel.Size = UDim2.fromOffset(110, 38)
Cancel.Position = UDim2.fromOffset(15, 95)
Cancel.BackgroundColor3 = LightPurple
Cancel.Text = "CANCEL"
Cancel.TextColor3 = White
Cancel.TextSize = 13
Cancel.Font = Enum.Font.GothamBold
Cancel.ZIndex = 6
Cancel.Parent = Confirm

Corner(Cancel, 10)
Stroke(Cancel, Purple, 1)
Hover(Cancel, LightPurple, Purple)

local Yes = Instance.new("TextButton")
Yes.Size = UDim2.fromOffset(110, 38)
Yes.Position = UDim2.fromOffset(155, 95)
Yes.BackgroundColor3 = Purple
Yes.Text = "CONFIRM"
Yes.TextColor3 = White
Yes.TextSize = 13
Yes.Font = Enum.Font.GothamBold
Yes.ZIndex = 6
Yes.Parent = Confirm

Corner(Yes, 10)
Stroke(Yes, LightPurple, 1)
Hover(Yes, Purple, LightPurple)

-- PLAYER SELECTION
local SelectedPlayer = nil

local function RefreshList()
	for _, Item in ipairs(List:GetChildren()) do
		if Item:IsA("TextButton") then
			Item:Destroy()
		end
	end

	for _, Target in ipairs(Players:GetPlayers()) do
		local Button = Instance.new("TextButton")
		Button.Size = UDim2.new(1, -5, 0, 38)
		Button.BackgroundColor3 = Color3.fromRGB(245, 232, 255)
		Button.Text = Target.DisplayName .. "   @" .. Target.Name
		Button.TextColor3 = Purple
		Button.TextSize = 13
		Button.Font = Enum.Font.GothamSemibold
		Button.Parent = List

		Corner(Button, 9)
		Stroke(Button, LightPurple, 1)
		Hover(Button, Color3.fromRGB(245, 232, 255), LightPink)

		Button.MouseButton1Click:Connect(function()
			SelectedPlayer = Target
			SelectedLabel.Text = "Selected: @" .. Target.Name
		end)
	end

	task.wait()
	List.CanvasSize = UDim2.fromOffset(0, Layout.AbsoluteContentSize.Y + 15)
end

Open.MouseButton1Click:Connect(function()
	Panel.Visible = not Panel.Visible

	if Panel.Visible then
		RefreshList()
	end
end)

Close.MouseButton1Click:Connect(function()
	Panel.Visible = false
	Confirm.Visible = false
end)

Kick.MouseButton1Click:Connect(function()
	if SelectedPlayer and SelectedPlayer.Parent == Players then
		ConfirmTitle.Text = "Kick @" .. SelectedPlayer.Name .. "?"
		Confirm.Visible = true
	end
end)

Cancel.MouseButton1Click:Connect(function()
	Confirm.Visible = false
end)

-- SEND KICK REQUEST TO SERVER
Yes.MouseButton1Click:Connect(function()
	if SelectedPlayer and SelectedPlayer.Parent == Players then
		Event:FireServer(SelectedPlayer.UserId)
	end

	Confirm.Visible = false
end)

Players.PlayerAdded:Connect(RefreshList)

Players.PlayerRemoving:Connect(function(Target)
	if SelectedPlayer == Target then
		SelectedPlayer = nil
		SelectedLabel.Text = "No player selected"
	end

	RefreshList()
end)

print("MoonDev's KickClient loaded!")
