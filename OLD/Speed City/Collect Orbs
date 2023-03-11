--|Automatically collect orbs
_G.AutoCollectOrbs=true
local a=game:FindService('Players').LocalPlayer
local S={}
for _,x in pairs(workspace:GetChildren())do
	local s=x:FindFirstChild('Spawners')
	if s then
		for _,v in pairs(s:GetChildren())do
			table.insert(S,v)
		end
	end
end
while _G.AutoCollectOrbs and task.wait(.1)do
	for _,v in pairs(S)do
		local m=v:FindFirstChildOfClass('Model')
		if m then
			local t=m:FindFirstChild('Outside')
			if t then
				local b=a.Character or a.CharacterAdded:Wait()
				local p=b.PrimaryPart
				if p then
					coroutine.wrap(function()
						firetouchinterest(p,t,0)
						firetouchinterest(p,t,1)
					end)()
				end
			end
		end
	end
end
