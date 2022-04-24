----- @九六七
local Client = game.Players.LocalPlayer;
local Character = Client.Character; 
local StarterGui = game:GetService("StarterGui");
local Players = game:GetService("Players");
local ReplicatedStorage  = game:GetService("ReplicatedStorage");
local UserInputService = game:GetService("UserInputService")

_G.Toggle = true
_G.OnlyAdminCoil = true
_G.InputDebounce = false

StarterGui:SetCore("SendNotification", {
	Title = "Notification",
	Text = "Enjoy",
	Duration = 1.5,
})

local BloxNotification = function(String)
	StarterGui:SetCore("SendNotification", {
		Title = "Notification",
		Text = "Updated value to "..tostring(String).. " permanently.",
		Duration = 1.5,
	})
end

local Random = function(Char)
	if not _G.Toggle then return end
	
	if Character then --- This actually breaks when your internet is shit
		wait(0.3)
		
		BloxNotification(true)
		
		for _, v in pairs(ReplicatedStorage:WaitForChild("Gear"):GetChildren()) do
			local ToolInstance = v:Clone()
		
			if _G.OnlyAdminCoil ~= false then
				if ToolInstance.Name == "jump" and ToolInstance:IsA("Tool") then
					ToolInstance.Parent = Client:FindFirstChild("Backpack") or Character
				end
			else
				ToolInstance.Parent = Client:FindFirstChild("Backpack") or Character
			end
		end
		
		if Char:FindFirstChild("KillScript") then
			Char:FindFirstChild("KillScript"):Destroy()
		else
			local KillScript = Char:FindFirstChild("KillScript"):Wait()
			KillScript:Destroy()
		end
	end
	
	print("Client Success pcall for "..Client.DisplayName", ".._G.Toggle.." | ".._G.OnlyAdminCoil.." |")
end

local InputDetect = function(Input, IsTyping)
	if IsTyping and InputDebounce then
		return
	end
	
	InputDebounce = true
	
	if Input.Keycode == Enum.Keycode.E then
		if _G.Toggle == true then
			_G.Toggle = false
		else
			_G.Toggle = true
		end
		
		BloxNotification(tostring(_G.Toggle))
	end
	
	if Input.Keycode == Enum.Keycode.R then
		if _G.OnlyAdminCoil == true then
			_G.OnlyAdminCoil = false
		else
			_G.OnlyAdminCoil = true
		end
		
		BloxNotification(tostring(_G.OnlyAdminCoil))
	end
	
	wait(0.1)
	InputDebounce = false
end

Client.CharacterAdded:Connect(Random)
UserInputService.InputBegan:Connect(InputDetect)

Random(Character)