--|Win: Win
local n
for _,v in pairs(game.Players.LocalPlayer.PlayerGui.Dimensions.MainFrame.DimensionsFrame.ScrollingFrame:GetChildren())do
	if v:FindFirstChild'ActionButton'and v.ActionButton=='USING'then
		n=v.Name
	end
end
for i=1,30 do
	game.ReplicatedStorage.BeatLevel:FireServer(tick(),'Level '..tostring(30),n,false)
end
