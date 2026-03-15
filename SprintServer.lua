local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SprintConfig = require(ReplicatedStorage.Modules.SprintConfig)
local ToggleSprint = require(ReplicatedStorage.Remotes.ToggleSprint)

local function setSpeed(player, isSprinting)
	local character = player.Character
	if not character then
		return
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		return
	end

	humanoid.WalkSpeed = isSprinting and SprintConfig.SprintSpeed or SprintConfig.NormalSpeed
end

ToggleSprint.OnServerEvent:Connect(function(player, isSprinting)
	if typeof(isSprinting) ~= "boolean" then
		return
	end

	setSpeed(player, isSprinting)
end)

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		humanoid.WalkSpeed = SprintConfig.NormalSpeed
	end)
end)
