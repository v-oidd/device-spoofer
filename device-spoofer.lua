targetPlatform = targetPlatform or "Windows"

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local platforms = {
    Unknown = 0,
    Windows = 1,
    Linux = 2,
    Mobile = 3,
    Console = 4,
    VR = 5,
    MacOS = 6
}

local targetPlatformID = platforms[targetPlatform]
if not targetPlatformID then return end

while Players.LocalPlayer == nil do
    Players:GetPropertyChangedSignal('LocalPlayer'):wait()
end

if Players.LocalPlayer.Character then return end

Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Check").Disabled = true
ReplicatedStorage:WaitForChild("DTr").please:FireServer(targetPlatformID)
