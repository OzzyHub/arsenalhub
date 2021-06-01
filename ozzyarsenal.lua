-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Dekor = Instance.new("TextLabel")
local Dekor2 = Instance.new("TextLabel")
local Aimbottext = Instance.new("TextLabel")
local Aimbotrun = Instance.new("TextButton")
local Dekor3 = Instance.new("TextLabel")
local esptext = Instance.new("TextLabel")
local Dekor4 = Instance.new("TextLabel")
local esprun = Instance.new("TextButton")
local Fulbrighttext = Instance.new("TextLabel")
local fulbrightrun = Instance.new("TextButton")
local Dekor5 = Instance.new("TextLabel")
local bilgi = Instance.new("TextLabel")
local bilgiic = Instance.new("TextLabel")
local Dekor6 = Instance.new("TextLabel")
local rage = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MainFrame.BackgroundTransparency = 0.500
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.00832702499, 0, 0.234643728, 0)
MainFrame.Size = UDim2.new(0, 141, 0, 329)

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(-0.0842105299, 0, -0.0212765969, 0)
Title.Size = UDim2.new(0, 171, 0, 50)
Title.Font = Enum.Font.Sarpanch
Title.Text = "--Arsenal--"
Title.TextColor3 = Color3.fromRGB(98, 229, 235)
Title.TextSize = 25.000

Dekor.Name = "Dekor"
Dekor.Parent = MainFrame
Dekor.BackgroundColor3 = Color3.fromRGB(98, 229, 235)
Dekor.BorderSizePixel = 0
Dekor.Size = UDim2.new(0, 1, 0, 329)
Dekor.Font = Enum.Font.SourceSans
Dekor.Text = ""
Dekor.TextColor3 = Color3.fromRGB(0, 0, 0)
Dekor.TextSize = 14.000

Dekor2.Name = "Dekor2"
Dekor2.Parent = MainFrame
Dekor2.BackgroundColor3 = Color3.fromRGB(98, 229, 235)
Dekor2.BorderSizePixel = 0
Dekor2.Position = UDim2.new(-0.00227696821, 0, 0.0942249224, 0)
Dekor2.Size = UDim2.new(0, 120, 0, 1)
Dekor2.Font = Enum.Font.SourceSans
Dekor2.Text = ""
Dekor2.TextColor3 = Color3.fromRGB(0, 0, 0)
Dekor2.TextSize = 14.000

Aimbottext.Name = "Aimbottext"
Aimbottext.Parent = MainFrame
Aimbottext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Aimbottext.BackgroundTransparency = 1.000
Aimbottext.Position = UDim2.new(0.0439342968, 0, 0.130699098, 0)
Aimbottext.Size = UDim2.new(0, 69, 0, 34)
Aimbottext.Font = Enum.Font.SciFi
Aimbottext.Text = "AimBot"
Aimbottext.TextColor3 = Color3.fromRGB(0, 255, 106)
Aimbottext.TextSize = 20.000

Aimbotrun.Name = "Aimbotrun"
Aimbotrun.Parent = MainFrame
Aimbotrun.BackgroundColor3 = Color3.fromRGB(10, 230, 101)
Aimbotrun.BorderSizePixel = 0
Aimbotrun.Position = UDim2.new(0.581560254, 0, 0.148936182, 0)
Aimbotrun.Size = UDim2.new(0, 24, 0, 21)
Aimbotrun.Font = Enum.Font.SciFi
Aimbotrun.Text = ""
Aimbotrun.TextColor3 = Color3.fromRGB(85, 170, 255)
Aimbotrun.TextSize = 20.000
Aimbotrun.MouseButton1Down:connect(function()
	print('To Enable Press E')
	bodyPart = 'UpperTorso'

	on = false

	local lp = game:GetService('Players').LocalPlayer
	local char = lp.Character


	local mouse = lp:GetMouse()


	game:GetService("UserInputService").InputBegan:connect(function(inputObject)
		if inputObject.KeyCode == Enum.KeyCode.E then
			on = not on
		end
	end)












--[[local function isObstructed(part)
   local hrp = char.HumanoidRootPart
   local PointA_Position = hrp.Position
   local PointB_Position = part.Position

   local Direction = (PointB_Position - PointA_Position).Unit
   local Raycast = Ray.new(PointA_Position, Direction * 100)
   local Hit = workspace:FindPartOnRay(Raycast, char)
   if Hit == part then
       return true
   else
       return false
   end
end
]]

	function cansee(targ)
		local cam = workspace.CurrentCamera
		local ray = Ray.new(lp.Character.Head.CFrame.p, (targ.CFrame.p - lp.Character.Head.CFrame.p).unit * 300)
		local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {lp.Character}, false, true)
		if part then
			local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")

			if not humanoid then
				humanoid = part.Parent.Parent:FindFirstChildOfClass("Humanoid")
			end

			if humanoid and targ and humanoid.Parent == targ.Parent then
				local blah,actualthing = cam:WorldToScreenPoint(targ.Position)
				if actualthing == true then
					return true
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end




	local function getClosestPlayerToCursor(x, y)
		local closestPlayer = nil
		local shortestDistance = math.huge

		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= lp and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
				local pos = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
				local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(x, y)).magnitude

				local targettable = (v.Team ~= lp.Team or v.Team == nil) and v.Character.Humanoid.Health > 0
				if magnitude < shortestDistance and cansee(v.Character.Head) == true and (v.Team ~= lp.Team or v.Team == nil) and v.Character.Humanoid.Health > 0 then
					closestPlayer = v
					shortestDistance = magnitude
				end
			end
		end
		return closestPlayer, shortestDistance
	end










	TweenStatus = nil

	local TweenService = game:GetService("TweenService")
	TweenCFrame = Instance.new("CFrameValue")


	function tweenstuff(partpos)
		TweenStatus = true
		TweenCFrame.Value = workspace.CurrentCamera.CFrame
		local tweenframe = TweenService:Create(TweenCFrame, TweenInfo.new(0.2),{Value = CFrame.new(workspace.CurrentCamera.CFrame.Position, partpos)})
		tweenframe:Play()
		tweenframe.Completed:Wait()
		TweenStatus = nil
		TweenCFrame.Value = CFrame.new(0,0,0)
	end




	game:GetService('RunService').Heartbeat:connect(function()
		if on == true then
			local plr, distance = getClosestPlayerToCursor(mouse.X, mouse.Y)
			if TweenStatus == nil and plr ~= nil and distance > 150 then
				tweenstuff(plr.Character.Head.Position)
			end
			if TweenStatus == true then
				workspace.CurrentCamera.CFrame = TweenCFrame.Value
			end
			if plr ~= nil and distance < 150 and TweenStatus == nil then
				workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, plr.Character.Head.Position)
			end
		end
	end)
end)

Dekor3.Name = "Dekor3"
Dekor3.Parent = MainFrame
Dekor3.BackgroundColor3 = Color3.fromRGB(98, 229, 235)
Dekor3.BorderSizePixel = 0
Dekor3.Position = UDim2.new(0.00481523201, 0, 0.261398166, 0)
Dekor3.Size = UDim2.new(0, 120, 0, 1)
Dekor3.Font = Enum.Font.SourceSans
Dekor3.Text = ""
Dekor3.TextColor3 = Color3.fromRGB(0, 0, 0)
Dekor3.TextSize = 14.000

esptext.Name = "esptext"
esptext.Parent = MainFrame
esptext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
esptext.BackgroundTransparency = 1.000
esptext.Position = UDim2.new(-0.0837252736, 0, 0.31306991, 0)
esptext.Size = UDim2.new(0, 69, 0, 34)
esptext.Font = Enum.Font.SciFi
esptext.Text = "Esp"
esptext.TextColor3 = Color3.fromRGB(0, 255, 106)
esptext.TextSize = 20.000

Dekor4.Name = "Dekor4"
Dekor4.Parent = MainFrame
Dekor4.BackgroundColor3 = Color3.fromRGB(98, 229, 235)
Dekor4.BorderSizePixel = 0
Dekor4.Position = UDim2.new(-0.00227696635, 0, 0.440729469, 0)
Dekor4.Size = UDim2.new(0, 120, 0, 1)
Dekor4.Font = Enum.Font.SourceSans
Dekor4.Text = ""
Dekor4.TextColor3 = Color3.fromRGB(0, 0, 0)
Dekor4.TextSize = 14.000

esprun.Name = "esprun"
esprun.Parent = MainFrame
esprun.BackgroundColor3 = Color3.fromRGB(10, 230, 101)
esprun.BorderSizePixel = 0
esprun.Position = UDim2.new(0.404255271, 0, 0.331306994, 0)
esprun.Size = UDim2.new(0, 24, 0, 21)
esprun.Font = Enum.Font.SciFi
esprun.Text = ""
esprun.TextColor3 = Color3.fromRGB(85, 170, 255)
esprun.TextSize = 20.000
esprun.MouseButton1Down:connect(function()
	function Create(base, team)
		local bb = Instance.new('BillboardGui', game.CoreGui)
		bb.Adornee = base
		bb.ExtentsOffset = Vector3.new(0,1,0)
		bb.AlwaysOnTop = true
		bb.Size = UDim2.new(0,5,0,5)
		bb.StudsOffset = Vector3.new(0,1,0)
		bb.Name = 'tracker'
		local frame = Instance.new('Frame',bb)
		frame.ZIndex = 10
		frame.BackgroundTransparency = 0.3
		frame.Size = UDim2.new(1,0,1,0)
		local txtlbl = Instance.new('TextLabel',bb)
		txtlbl.ZIndex = 10
		txtlbl.BackgroundTransparency = 1
		txtlbl.Position = UDim2.new(0,0,0,-35)
		txtlbl.Size = UDim2.new(1,0,10,0)
		txtlbl.Font = 'ArialBold'
		txtlbl.FontSize = 'Size12'
		txtlbl.Text = base.Parent.Name:upper()
		txtlbl.TextStrokeTransparency = 0.5
		if team then
			txtlbl.TextColor3 = Color3.new(0,1,1)
			frame.BackgroundColor3 = Color3.new(0,1,1)
		else
			txtlbl.TextColor3 = Color3.new(1,0,0)
			frame.BackgroundColor3 = Color3.new(1,0,0)
		end
	end

	function Clear()
		for _,v in pairs(game.CoreGui:children()) do
			if v.Name == 'tracker' and v:isA('BillboardGui') then
				v:Destroy()
			end
		end
	end

	function Find()
		Clear()
		track = true
		spawn(function()
			while wait(1) do
				if track then
					Clear()
					for _,v in pairs(game.Players:players()) do
						if v.TeamColor ~= game.Players.LocalPlayer.TeamColor then
							if v.Character and v.Character.Head then
								Create(v.Character.Head, false)
							end
						end
					end
				end
				wait(1)
			end
		end)
	end

	Find()
end)

Fulbrighttext.Name = "Fulbrighttext"
Fulbrighttext.Parent = MainFrame
Fulbrighttext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fulbrighttext.BackgroundTransparency = 1.000
Fulbrighttext.Position = UDim2.new(0.0439342968, 0, 0.477203667, 0)
Fulbrighttext.Size = UDim2.new(0, 69, 0, 34)
Fulbrighttext.Font = Enum.Font.SciFi
Fulbrighttext.Text = "Fulbright"
Fulbrighttext.TextColor3 = Color3.fromRGB(0, 255, 106)
Fulbrighttext.TextSize = 20.000

fulbrightrun.Name = "fulbrightrun"
fulbrightrun.Parent = MainFrame
fulbrightrun.BackgroundColor3 = Color3.fromRGB(10, 230, 101)
fulbrightrun.BorderSizePixel = 0
fulbrightrun.Position = UDim2.new(0.673758864, 0, 0.495440751, 0)
fulbrightrun.Size = UDim2.new(0, 24, 0, 21)
fulbrightrun.Font = Enum.Font.SciFi
fulbrightrun.Text = ""
fulbrightrun.TextColor3 = Color3.fromRGB(85, 170, 255)
fulbrightrun.TextSize = 20.000
fulbrightrun.MouseButton1Down:connect(function()
	if not _G.FullBrightExecuted then

		_G.FullBrightEnabled = false

		_G.NormalLightingSettings = {
			Brightness = game:GetService("Lighting").Brightness,
			ClockTime = game:GetService("Lighting").ClockTime,
			FogEnd = game:GetService("Lighting").FogEnd,
			GlobalShadows = game:GetService("Lighting").GlobalShadows,
			Ambient = game:GetService("Lighting").Ambient
		}

		game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
			if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
				_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
				if not _G.FullBrightEnabled then
					repeat
						wait()
					until _G.FullBrightEnabled
				end
				game:GetService("Lighting").Brightness = 1
			end
		end)

		game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
			if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
				_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
				if not _G.FullBrightEnabled then
					repeat
						wait()
					until _G.FullBrightEnabled
				end
				game:GetService("Lighting").ClockTime = 12
			end
		end)

		game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
			if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
				_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
				if not _G.FullBrightEnabled then
					repeat
						wait()
					until _G.FullBrightEnabled
				end
				game:GetService("Lighting").FogEnd = 786543
			end
		end)

		game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
			if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
				_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
				if not _G.FullBrightEnabled then
					repeat
						wait()
					until _G.FullBrightEnabled
				end
				game:GetService("Lighting").GlobalShadows = false
			end
		end)

		game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
			if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
				_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
				if not _G.FullBrightEnabled then
					repeat
						wait()
					until _G.FullBrightEnabled
				end
				game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
			end
		end)

		game:GetService("Lighting").Brightness = 1
		game:GetService("Lighting").ClockTime = 12
		game:GetService("Lighting").FogEnd = 786543
		game:GetService("Lighting").GlobalShadows = false
		game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

		local LatestValue = true
		spawn(function()
			repeat
				wait()
			until _G.FullBrightEnabled
			while wait() do
				if _G.FullBrightEnabled ~= LatestValue then
					if not _G.FullBrightEnabled then
						game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
						game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
						game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
						game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
						game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
					else
						game:GetService("Lighting").Brightness = 1
						game:GetService("Lighting").ClockTime = 12
						game:GetService("Lighting").FogEnd = 786543
						game:GetService("Lighting").GlobalShadows = false
						game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
					end
					LatestValue = not LatestValue
				end
			end
		end)
	end

	_G.FullBrightExecuted = true
	_G.FullBrightEnabled = not _G.FullBrightEnabled
end)

Dekor5.Name = "Dekor5"
Dekor5.Parent = MainFrame
Dekor5.BackgroundColor3 = Color3.fromRGB(98, 229, 235)
Dekor5.BorderSizePixel = 0
Dekor5.Position = UDim2.new(0.00481523201, 0, 0.580547094, 0)
Dekor5.Size = UDim2.new(0, 120, 0, 1)
Dekor5.Font = Enum.Font.SourceSans
Dekor5.Text = ""
Dekor5.TextColor3 = Color3.fromRGB(0, 0, 0)
Dekor5.TextSize = 14.000

bilgi.Name = "bilgi"
bilgi.Parent = MainFrame
bilgi.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bilgi.BackgroundTransparency = 1.000
bilgi.Position = UDim2.new(-0.17640911, 0, 0.559270501, 0)
bilgi.Size = UDim2.new(0, 171, 0, 50)
bilgi.Font = Enum.Font.Sarpanch
bilgi.Text = "--Bİlgi--"
bilgi.TextColor3 = Color3.fromRGB(98, 229, 235)
bilgi.TextSize = 25.000

bilgiic.Name = "bilgiic"
bilgiic.Parent = MainFrame
bilgiic.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bilgiic.BackgroundTransparency = 1.000
bilgiic.Position = UDim2.new(0.0150802303, 0, 0.659574449, 0)
bilgiic.Size = UDim2.new(0, 135, 0, 54)
bilgiic.Font = Enum.Font.Sarpanch
bilgiic.Text = "Scriptimiz legit tabanlı bir hiledir mümkün olduğunca en kısık ayarlarda hileler mevcuttur."
bilgiic.TextColor3 = Color3.fromRGB(98, 229, 235)
bilgiic.TextScaled = true
bilgiic.TextSize = 25.000
bilgiic.TextWrapped = true

Dekor6.Name = "Dekor6"
Dekor6.Parent = MainFrame
Dekor6.BackgroundColor3 = Color3.fromRGB(98, 229, 235)
Dekor6.BorderSizePixel = 0
Dekor6.Position = UDim2.new(0.00481523201, 0, 0.860182345, 0)
Dekor6.Size = UDim2.new(0, 120, 0, 1)
Dekor6.Font = Enum.Font.SourceSans
Dekor6.Text = ""
Dekor6.TextColor3 = Color3.fromRGB(0, 0, 0)
Dekor6.TextSize = 14.000

rage.Name = "rage"
rage.Parent = MainFrame
rage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rage.BackgroundTransparency = 1.000
rage.BorderSizePixel = 10
rage.Position = UDim2.new(0.0434490144, 0, 0.860182405, 0)
rage.Size = UDim2.new(0, 130, 0, 35)
rage.Font = Enum.Font.Sarpanch
rage.Text = "Rage ? çok yakında :)"
rage.TextColor3 = Color3.fromRGB(98, 229, 235)
rage.TextScaled = true
rage.TextSize = 25.000
rage.TextWrapped = true
