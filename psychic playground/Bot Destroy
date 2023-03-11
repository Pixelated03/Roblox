--|Automatically destroys and pushes everything in a 40 stud radius
--|Recommended Magnitude: 20-120 studs
if BDestroy4343 then
	getgenv().BDestroy4343=nil
	task.wait(.11)
end
local LC,e=game.Players.LocalPlayer,game.ReplicatedStorage.RemoteEvent
function MC(v)
	local cf=v.ClassName=='Model'and v:GetModelCFrame()or v.CFrame
	if(cf.Position-LC.Character.PrimaryPart.Position).Magnitude<40 then
		e:FireServer('SelectObject',v,cf)
		e:FireServer('ThrowObject')
	end
end
getgenv().BDestroy4343=true
while BDestroy4343 and task.wait(.1)do
	if LC.Character and LC.Character.PrimaryPart then
		for _,v in pairs(workspace.Objects:GetChildren())do
			if v.Name~=LC.Name then
				MC(v)
				local fp=v:FindFirstChildOfClass'Part'
				if fp then
					MC(fp)
				end
			end
		end
	end
end
