----- @九六七 / Arsenal Hitbox Extender
local GetPlayerService = function()
	for _, class in pairs(game:GetChildren()) do
		if class.ClassName == "Players" then
			return class
		end
 	end
end

local Players = GetPlayerService()
local Client = Players.LocalPlayer

coroutine.resume(coroutine.create(function()
	while wait() do
		wait(2.5)
		--warn("Error")
		
		for _, player in pairs(Players:GetPlayers()) do
			if player.Name ~= Client.Name and player.Character then
				player.Character.RightUpperLeg.CanCollide = false
				player.Character.RightUpperLeg.Transparency = 10
				player.Character.RightUpperLeg.Size = Vector3.new(8,8,6)

				player.Character.LeftUpperLeg.CanCollide = false
				player.Character.LeftUpperLeg.Transparency = 10
				player.Character.LeftUpperLeg.Size = Vector3.new(8,8,6)

				player.Character.HeadHB.CanCollide = false
				player.Character.HeadHB.Transparency = 10
				player.Character.HeadHB.Size = Vector3.new(5,6,6)

				player.Character.HumanoidRootPart.CanCollide = false
				player.Character.HumanoidRootPart.Transparency = 10
				player.Character.HumanoidRootPart.Size = Vector3.new(8,7,8)
			end
		end
	end
end))
