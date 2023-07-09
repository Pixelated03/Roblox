--|| Edited_By_Pixelated03 ||
local h,D,Mag,RAim,PSpin,LOnDeath=game.Players.LocalPlayer.Character:FindFirstChildOfClass'Humanoid',{},6,CFrame.Angles(0,.27052603405912107,0),CFrame.new(.04,0,0),true
function newD(v)
	if v~=h.Parent and v.ClassName=='Model'then
		D[v]=true
	end
end
for _,v in next,workspace:GetDescendants()do
	newD(v)
end
workspace.DescendantAdded:Connect(newD)
workspace.DescendantRemoving:Connect(function(v)
	D[v]=nil
end)
function GetCloser()
	local l,u,o=9e9,nil,nil
	for i in next,D do
		if i.PrimaryPart and not i:FindFirstChildOfClass'ForceField'and h.Parent.PrimaryPart then
			local m,h=(h.Parent.PrimaryPart.Position-i.PrimaryPart.Position).Magnitude,i:FindFirstChildOfClass'Humanoid'
			if m<l and h and(LOnDeath or h.Health>0)then
				l,u,o=m,h,i
			end
		end
	end
	return o,u
end
local G=getgenv and getgenv()or getfenv()
G.SwordBot=true
while G.SwordBot and h.Health>0 and task.wait()do
	local g,uh=GetCloser()
	if not g or not uh or uh.Health<=0 then
		h:Move(Vector3.zero)
		if LOnDeath then
			h.Parent.Animate.PlayEmote:Invoke('dance'..math.random(1,3),.1,h)
			task.wait(1)--| Dancing could give Karma.
		end
	else
		local u,t=(g.PrimaryPart.Position-h.Parent.PrimaryPart.Position),h.Parent:FindFirstChildOfClass'Tool'
		if not t then
			t=game.Players.LocalPlayer.Backpack:FindFirstChildOfClass'Tool'
			if t then
				h:EquipTool(t)
			end
		end
		if t then
			if u.Magnitude<=Mag*2.25 and t.Enabled then
				t:Activate()
			end
			u=u.Unit*(u.Magnitude-((Mag*.9)--| Closer_Limit
				*(t.Enabled and 1 or 1.5)))--| Runs .5 studs away using sword
				+(uh.MoveDirection*2.25)--| Runs into Target Moving_Direction
			h.Parent:SetPrimaryPartCFrame(CFrame.new((h.Parent.PrimaryPart.CFrame*PSpin).Position--| Follows/Spins over the Target
				,g.PrimaryPart.Position*Vector3.new(1,0,1)+Vector3.new(0,h.Parent.PrimaryPart.Position.Y,0))*RAim)--| Aims at the Target_Arm
			h:MoveTo(h.Parent.PrimaryPart.Position+u)--| :Move is broken from PlayerModule OnRender
			if not h.Jump
				and workspace:Raycast(h.Parent.HumanoidRootPart.Position-(h.Parent.HumanoidRootPart.Size/2)
					,h.Parent.HumanoidRootPart.CFrame.LookVector*2)then--| Try to avoid
				h.Jump=true
			end
		end
	end
end
