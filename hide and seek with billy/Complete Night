--|Automatically complete the current night
local c,ms,drs,ht,ch=game.Players.LocalPlayer.Character,workspace.Radio.mainPart.mainMusic,workspace.Doors:GetChildren(),{duckbathicon='bathtub',boxicon='pantry',shirticon='jacketShelf',shoeicon='shoeShelf',zzzicoin='bed',trashicon='trashcan',tvicon='tvShelf'},{}
function fpt(cf,p)
    c:SetPrimaryPartCFrame(cf)
    task.wait(.25)
    fireproximityprompt(p)
end
if ms.Playing then
    fpt(ms.Parent.CFrame,ms.Parent.music)
end
for _,v in pairs(drs)do
    if v.Transparency~=0 then
        repeat task.wait()
            fpt(v.CFrame,v.door)
        until v.Transparency==0
    end
end
for _,v in pairs(workspace.hintSpotsClaimed:GetChildren())do
    local n=game.MarketplaceService:GetProductInfo(v.Decal.Texture:match'%d+').Name
    ch[n]=0
end
for i,v in pairs(ht)do
    if not ch[i]then
        local pl=workspace.hidingSpots[v][v]
        fpt(pl.CFrame,pl.hide)
    end
end
