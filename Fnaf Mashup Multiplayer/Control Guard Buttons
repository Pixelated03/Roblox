--|Now you can troll the guard by manipulating the mask, camera, music box or any other visible button
while task.wait()do
	local g=game.Players.LocalPlayer.PlayerGui:FindFirstChild'GuardTools'
	if g then
		g.Enabled=true
		for _,v in pairs(g:GetDescendants())do
			if v.Name~='StaticEffect'and v.Name~='ScoreInfo'then
				pcall(function()
					v.Visible=true
				end)
			end
		end
		game.StarterGui:setCoreGuiEnabled('Chat',true)
	end
end
