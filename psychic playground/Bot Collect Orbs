--|Automatically Collect Orbs
game['Run Service']:BindToRenderStep('CollectOrbs32',10,function()
	for _,v in pairs(workspace.EnergyOrbs:GetChildren())do
		v.CFrame=game.Players.LocalPlayer.Character.PrimaryPart.CFrame
		v.CanCollide=false
	end
end)
