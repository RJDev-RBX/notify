-- notify by RJDev
-- Rohan Jagpal
-- 30 April 2022


local PLAYERS = game:GetService("Players")

local Notification = require(script.Notification)

local Notify = {}

function Notify:notifyPlayer(player, notifyType, message)
	local newNotif = Notification.new(player, notifyType, message)
	newNotif:send()
end

function Notify:Init()
	PLAYERS.PlayerAdded:Connect(function(player)
		script.Notifications:Clone().Parent = player.PlayerGui
		script.SoundManager.Parent = game:GetService("ReplicatedStorage")
	end)
end

return Notify