--|Automatically places the cakes in the machines
if AutoPlaceCakesL then
	AutoPlaceCakesL()
end
local C,C2,E,vec={},{},game.Players.LocalPlayer.Character.NonPCDragTool,{
Dough=Vector3.new(62,155,82),
Batter=Vector3.new(62,155,82),
StationOneBatter=Vector3.new(136,155,86),
StationTwoBatter=Vector3.new(219,155,87),
StationThreeBatter=Vector3.new(299,155,85),
StationFourBatter=Vector3.new(385,154,80),
StationFiveBatter=Vector3.new(498,155,80),
CountedCake=Vector3.new(607,154,58)}
C[#C]=E.ChildAdded:Connect(function(v)
	task.wait()
	game.ReplicatedStorage.DragTools.Placement:FireServer(v,vec[v.Name])
end)
for _,v in pairs(E:GetChildren())do
	game.ReplicatedStorage.DragTools.Placement:FireServer(v,vec[v.Name])
end
function NewCake(v)
	if C2[v]then
		return
	else
		C2[v]=0
	end
	game.ReplicatedStorage.DragTools.Selection:FireServer(v,E)
	C[#C]=v:GetPropertyChangedSignal'Name':Connect(function()
		task.wait()
		game.ReplicatedStorage.DragTools.Selection:FireServer(v,E)
	end)
end
C[#C]=workspace.CakeBatter.ChildAdded:Connect(NewCake)
for _,v in pairs(workspace.CakeBatter:GetChildren())do
	NewCake(v)
end
getgenv().AutoPlaceCakesL=function()
	for _,v in pairs(C)do
		v:Disconnect()
	end
	table.clear(C)
	table.clear(C2)
end
