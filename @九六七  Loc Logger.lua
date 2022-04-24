----- @九六七 / Universal Location Logger
local LocalizationService = game:GetService("LocalizationService")
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local close = Instance.new("TextButton")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local username = Instance.new("TextBox")
local snatch = Instance.new("TextButton")
local TextButton_Roundify_12px = Instance.new("ImageLabel")
local miscbut = Instance.new("TextButton")
local MISC = Instance.new("ImageLabel")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")
local snatchall = Instance.new("TextButton")
local TextButton_Roundify_12px_2 = Instance.new("ImageLabel")
local TextLabel_7 = Instance.new("TextLabel")
Frame.Draggable = true
Frame.Active = true
Frame.Selectable = true
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = "rbxassetid://5292029547"
sound:Play()
 
ScreenGui.Parent = game.CoreGui
 
Frame.Name = "Frame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.152727276, 0, 0.277641267, 0)
Frame.Size = UDim2.new(0, 0, 0, 0)
Frame.ZIndex = 3
Frame.Image = "rbxassetid://3570695787"
Frame.ImageColor3 = Color3.fromRGB(20, 20, 20)
Frame.ScaleType = Enum.ScaleType.Slice
Frame.SliceCenter = Rect.new(100, 100, 100, 100)
Frame.SliceScale = 0.120
Frame.ClipsDescendants = true
 
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.026143793, 0, 0.0232558139, 0)
TextLabel.Size = UDim2.new(0, 22, 0, 24)
TextLabel.ZIndex = 3
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "IP"
TextLabel.TextColor3 = Color3.fromRGB(255, 85, 0)
TextLabel.TextSize = 25.000
 
TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.0980392173, 0, 0.0232558139, 0)
TextLabel_2.Size = UDim2.new(0, 102, 0, 24)
TextLabel_2.ZIndex = 3
TextLabel_2.Font = Enum.Font.SourceSansBold
TextLabel_2.Text = "LOGGER"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 25.000
 
close.Name = "close"
close.Parent = Frame
close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close.BackgroundTransparency = 1.010
close.Position = UDim2.new(0.934640527, 0, 0.0232558139, 0)
close.Size = UDim2.new(0, 20, 0, 20)
close.ZIndex = 3
close.Font = Enum.Font.SourceSansBold
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 0, 0)
close.TextScaled = true
close.TextSize = 14.000
close.TextWrapped = true
 
username.Name = "username"
username.Parent = Frame
username.BackgroundColor3 = Color3.fromRGB(255, 128, 0)
username.BackgroundTransparency = 1.000
username.BorderSizePixel = 0
username.Position = UDim2.new(0.173202619, 0, 0.313953489, 0)
username.Size = UDim2.new(0, 200, 0, 24)
username.ZIndex = 3
username.Font = Enum.Font.GothamBold
username.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
username.PlaceholderText = "Input User"
username.Text = ""
username.TextColor3 = Color3.fromRGB(255, 255, 255)
username.TextSize = 14.000
 
snatch.Name = "LogFakeIp"
snatch.Parent = Frame
snatch.BackgroundColor3 = Color3.fromRGB(255, 128, 0)
snatch.BackgroundTransparency = 1.000
snatch.BorderSizePixel = 0
snatch.Position = UDim2.new(0.205882356, 0, 0.511627913, 0)
snatch.Size = UDim2.new(0, 180, 0, 28)
snatch.ZIndex = 4
snatch.Font = Enum.Font.SourceSansBold
snatch.Text = "Take Ip"
snatch.TextColor3 = Color3.fromRGB(255, 255, 255)
snatch.TextScaled = true
snatch.TextSize = 14.000
snatch.TextWrapped = true

snatch.MouseButton1Down:connect(function()
    local v = game.Players[username.Text]
    local result, code = pcall(function()
    	return LocalizationService:GetCountryRegionForPlayerAsync(v)
    end)
    ass = gethiddenproperty or get_hidden_prop
    local Thing = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://country.io/names.json"))
    local ParsedCountry = Thing[ass(v, "CountryRegionCodeReplicate")]
    local SayMessageRequest = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
    SayMessageRequest:FireServer(tostring(v.Name.." is from [Country Code: ##]".." OS: "..v.OsPlatform.." IP: "..math.random(836).."."..math.random(725).."."..math.random(99)..".".."##".." Location Region:"..code), "All")
    print(v.Name.." is from [Country Code: ##]".." OS: "..v.OsPlatform.." IP: "..math.random(836).."."..math.random(725).."."..math.random(99)..".".."##".." Location Region:"..code)
    wait(0.55)
end)
 
local function XHSJL_fake_script() -- close.LocalScript 
	local script = Instance.new('LocalScript', close)
 
	close.MouseButton1Down:Connect(function()
	    MISC:TweenPosition(UDim2.new(0.078, 0, 0.073, 0), 'Out', 'Bounce', 0.35)
			wait(.35)
	    Frame.ClipsDescendants = true
		Frame:TweenSize(UDim2.new(0,0,0,0), 'Out', 'Linear', .3)
		wait(.3)
		ScreenGui:Destroy()
	end)
end
coroutine.wrap(XHSJL_fake_script)()
local function MOOLDA_fake_script() -- miscbut.LocalScript 
	local script = Instance.new('LocalScript', miscbut)
 
	local t = false
	miscbut.MouseButton1Down:Connect(function()
		if (t == false) then
			MISC:TweenPosition(UDim2.new(1.051, 0, 0.073, 0), 'Out', 'Bounce', 0.35)
			wait(.35)
			t = true
		elseif (t == true) then
			MISC:TweenPosition(UDim2.new(0.078, 0, 0.073, 0), 'Out', 'Bounce', 0.35)
			wait(.35)
			t = false
		end
	end)
end
coroutine.wrap(MOOLDA_fake_script)()
Frame:TweenSize(UDim2.new(0, 306, 0, 172), 'Out', 'Linear', 0.3)
wait(.3)
Frame.ClipsDescendants = false