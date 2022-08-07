----- @九六七 / Combat Warriors Helper
local GetPlayerService = function()
	for _, class in pairs(game:GetChildren()) do
		if class.ClassName == "Players" then
			return class
		end
 	end
end

--// Variables
local Players = GetPlayerService()
local Client = Players.LocalPlayer;
local Character = Client.Character;

--// Services
local MarketplaceService = game:GetService("MarketplaceService");
local UserInputService = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");
local StarterGui = game:GetService("StarterGui");

--// Main Variable Switch
getfenv().IsHelperOn = true

--// Hitbox Settings
getfenv().HitboxEnhanced = true
getfenv().HitboxSize = Vector3.new(1.5, 5, 1.5)

--// Settings Customization, Manual Change
getfenv().WeaponEquipped = "Bo Staff"

local AnimationInfo = {}
local AnimNames = {
  "Slash";
  "Swing";
  "Sword";
}

local HitboxNames = {
	"Hitbox";
	"Hitbox2";
	"Hitbox3";
	"Hitbox4";
	"Hitbox5";
}

function GetInfo(Id)
	local Success, Info = pcall(function()
		return MarketplaceService:GetProductInfo(Id)
	end)
  
	if Success then
		return Info
	end
  
	return {Name=''}
end

function QuickBlock(Player)
	keypress(0x46)
	task.wait()
	keyrelease(0x46)
end

function InputChange(Key, IsTyping)
	if IsTyping then
		return
	end
	
	if Key.KeyCode == Enum.KeyCode.U then
		if getfenv().IsHelperOn == true then
			getfenv().IsHelperOn = false
		else
			getfenv().IsHelperOn = true
		end

		StarterGui:SetCore("SendNotification", {
			Title = "九六七", 
			Text = "Changed Main Status To: "..tostring(getfenv().IsHelperOn)
		})
	end

	if Key.KeyCode == Enum.KeyCode.H then
		if getfenv().HitboxEnhanced == true then
			getfenv().HitboxEnhanced = false
		else
			getfenv().HitboxEnhanced = true
		end

		StarterGui:SetCore("SendNotification", {
			Title = "九六七", 
			Text = "Changed Hitbox Status To: "..tostring(getfenv().HitboxEnhanced)
		})
	end
end

function HitboxUpdate(Weapon, Size)
	if Weapon:IsA("Tool") then
		local Hitboxes = Weapon:WaitForChild("Hitboxes"):GetChildren()

		 for _, Hitbox in pairs(Hitboxes) do
			if table.find(HitboxNames, Hitbox.Name) then
				local HitboxPart = Hitbox

				for _, DmgPoint in pairs(HitboxPart:GetDescendants()) do
					if DmgPoint.ClassName == "Attachment" then
						local XPos = DmgPoint.Position.X ~= 0 and (DmgPoint.Position.X > 0 
							and DmgPoint.Position.X + getfenv().HitboxSize.X/2 or DmgPoint.Position.X - getfenv().HitboxSize.X/2)
						or 0

						local YPos = DmgPoint.Position.Y ~= 0 and (DmgPoint.Position.Y > 0 
							and DmgPoint.Position.Y + getfenv().HitboxSize.Y/2 or DmgPoint.Position.Y - getfenv().HitboxSize.Y/2)
						or 0

						local ZPos = DmgPoint.Position.Z ~= 0 and (DmgPoint.Position.Z > 0 
							and DmgPoint.Position.Z + getfenv().HitboxSize.Z/2 or DmgPoint.Position.Z - getfenv().HitboxSize.Z/2)
						or 0

						TweenService:Create(DmgPoint, TweenInfo.new(1), {Position = Vector3.new(
							XPos,
							YPos,
							ZPos
						)}):Play()
					end
				end
			end
		 end
 	end
end

function PlayerAdded(Player)
	local function CharacterAdded(Char)
		if getfenv().IsHelperOn == false then
			return
		end

		if getfenv().HitboxEnhanced then
			local Weapon = Character:FindFirstChild(tostring(getfenv().WeaponEquipped))
			HitboxUpdate(Weapon, getfenv().HitboxSize)
		end

		local Humanoid = Char:WaitForChild("Humanoid", 3)

		if Humanoid then
			Humanoid.AnimationPlayed:Connect(function(Track)
				local Info = AnimationInfo[Track.Animation.AnimationId]
				
				--// Check
				if not Info then
					Info = GetInfo(tonumber(Track.Animation.AnimationId:match("%d+")))
					AnimationInfo[Track.Animation.AnimationId] = Info
				end
				
				if (Client.Character and Client.Character:FindFirstChild("Head") and Player.Character:FindFirstChild("Head")) then
					local MagnitudeDistance = (Player.Character.Head.Position - Client.Character.Head.Position).Magnitude
					if MagnitudeDistance < 15 then
						for _, AnimName in pairs(AnimNames) do
                          if Info.Name:match(AnimName) then
							pcall(QuickBlock, Player)
                          end
                      end
					end
				end
			end)
		end

		task.wait()
	end
	
	if Player.Character then
		CharacterAdded(Player.Character)
	end
	
	Player.CharacterAdded:Connect(CharacterAdded)
end

for _, Player in pairs(Players:GetPlayers()) do
   	if Player ~= Client then
       PlayerAdded(Player)
   	end
end

UserInputService.InputBegan:Connect(InputChange)
Players.PlayerAdded:Connect(PlayerAdded)
