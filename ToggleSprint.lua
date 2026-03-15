local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
if not remotesFolder then
	remotesFolder = Instance.new("Folder")
	remotesFolder.Name = "Remotes"
	remotesFolder.Parent = ReplicatedStorage
end

local remote = remotesFolder:FindFirstChild("ToggleSprint")
if not remote then
	remote = Instance.new("RemoteEvent")
	remote.Name = "ToggleSprint"
	remote.Parent = remotesFolder
end

return remote
