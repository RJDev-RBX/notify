local Notification = {}
Notification.__index = Notification

Notification.Groups = {}

function Notification.new(player: Player, notifType: string, message: string)
	if not script:FindFirstChild(notifType) then warn("Notif type not found") return end
	
	local newNotification = {}
	setmetatable(newNotification, Notification)

	newNotification["player"] = player
	
	newNotification["frame"] = script[notifType]:Clone()
	newNotification["frame"].Parent = player.PlayerGui:WaitForChild("Notifications").Frame
	newNotification["frame"].Notification.Body.Message.Text = message
	return newNotification
end

function Notification:send()
	wait(.5)
	self.frame.Position = UDim2.new(1, 0, (1 - (((#self.frame.Parent:GetChildren()-2) * .15)+((#self.frame.Parent:GetChildren()-1) * .008))), 0)
	wait()
	self.frame.Notification:TweenPosition(UDim2.new(0,0,1,0), "In", "Quint", .7, false, nil)
	local debounce = false
	self.frame.Notification.Header.ImageButton.MouseButton1Click:Connect(function()
		if debounce then return end
		debounce = true
		local yTemp = self.frame.Position.Y.Scale
		self.frame.Notification:TweenPosition(UDim2.new(2,0,1,0), "Out", "Quint", .5, false, nil)
		wait(.5)
		self.frame:Destroy()
		for _, frame in pairs(self.player.PlayerGui.Notifications.Frame:GetChildren()) do
			if frame ~= self.frame and frame:IsA("Frame") and frame.Position.Y.Scale < yTemp then
				frame:TweenPosition(UDim2.new(1, 0, (frame.Position.Y.Scale + 0.158), 0), "In", "Quad", .25, false, nil)
			end
		end
		self = nil
	end)
end

return Notification