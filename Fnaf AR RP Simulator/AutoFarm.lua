--|Farm coins
--|Really miss the game...
--|Game: https://www.roblox.com/games/4543665395
local Faz_Coins,a=(function()local x={}for _,v in pairs(workspace:GetChildren())do if v.Name=='Faz-Coins'then table.insert(x,v)end;end;return x;end)(),game.Players.LocalPlayer
for _,v in pairs(Faz_Coins)do
	local c=a.Character.PrimaryPart
	if c then
		firetouchinterest(c,v,0)
		firetouchinterest(c,v,1)
		v:GetPropertyChangedSignal'Transparency':Connect(function()
			repeat task.wait()until a.Character and(a.Character.PrimaryPart)
			local c=a.Character.PrimaryPart
			firetouchinterest(c,v,0)
			firetouchinterest(c,v,1)
		end)
	end
end
