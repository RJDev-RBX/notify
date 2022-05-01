local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Require audio player module
local AudioPlayer = require(ReplicatedStorage:WaitForChild("SoundManager"))

-- Set up sounds
AudioPlayer.setupAudio({
	["SimpleClick"] = 2499155192
})

-- Reference the button
local Frame = script.Parent.Frame

-- Function activated when button is pressed
local function onButtonActivated()
	wait(.75)
	AudioPlayer.playAudio("SimpleClick")
end
Frame.ChildAdded:Connect(onButtonActivated)