--|Automatically collect coins with tp......... you might OOF
while task.wait(.5)do
	local c,f=game.Players.LocalPlayer.Character.PrimaryPart,firetouchinterest
	if c then
		local oldC=c.CFrame
		for _,v in pairs(workspace.Coins:GetChildren())do
			if v.Coin.Transparency~=1 then
				repeat task.wait()c=game.Players.LocalPlayer.Character.PrimaryPart if c then c.Parent:SetPrimaryPartCFrame(CFrame.new(v.Coin.Position))f(c,v,0)f(c,v,1)end until v.Coin.Transparency==1 or not v.Parent
			end
		end
		c.Parent:SetPrimaryPartCFrame(oldC)
	end
end
