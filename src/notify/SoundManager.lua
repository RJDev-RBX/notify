local SoundService = game:GetService("SoundService")

local AudioPlayer = {}

-- Function to set up audio assets
AudioPlayer.setupAudio = function(assetArray)
	for name, audioID in pairs(assetArray) do
		local audioInstance = Instance.new("Sound")
		audioInstance.SoundId = "rbxassetid://" .. audioID
		audioInstance.Name = name
		audioInstance.Parent = SoundService
	end
end

-- Function to play an audio asset
AudioPlayer.playAudio = function(assetName)
	local audio = SoundService:FindFirstChild(assetName)
	if audio then
		if not audio.IsLoaded then
			audio.Loaded:Wait()
		end
		audio:Play()
	else
		warn("Could not find audio asset: " .. assetName)
	end
end

return AudioPlayer