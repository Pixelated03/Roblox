--|Automatically press the buttons or complete the code
local DiscordLib = loadstring(game:HttpGet"https://pastebin.com/raw/za26qWBJ")()
local win = DiscordLib:Window("discord library")
local serv = win:Server("Flood Escape GUI", "")

local btns = serv:Channel("Main")

local m1,a={workspace.Easy,workspace.Medium,workspace.Hard},game.Players.LocalPlayer
btns:Button("Touch All Buttons", function()
	for _,v in pairs(m1)do
		for i=1,3 do
			local s=v:FindFirstChild('S'..tostring(i))
			if s then
				for _,v in pairs(s:GetChildren())do
					if tostring(v)=='Switch'then
						local b,c=v:FindFirstChild'Button',a.Character
						if b and c then
							local p=c.PrimaryPart
							if p and (b.Color==Color3.fromRGB(13,105,172)or b.Color==Color3.fromRGB(75, 151, 75)) then
								coroutine.wrap(function()
									firetouchinterest(p,b,0)
									firetouchinterest(p,b,1)
								end)()
							end
						end
					end
				end
			end
		end
	end
end)

btns:Button("Complete Code Doors", function()
	for _,v in pairs(m1)do
		local m=v:FindFirstChild'Main'
		if m then
			for i=1,4 do
				function SetButton(a)
					local l=m.CodeDoor:FindFirstChild(a..tostring(i)..'Trigger')
					if l then
						local c=l:FindFirstChild'ClickDetector'
						if c then
							local b=l.Parent.Script[a..tostring(i)..'Chose']
							if (b.Value and l.Color~=Color3.fromRGB(75,151,75))or l.Color==Color3.fromRGB(75,151,75)then
								fireclickdetector(c)
							end
						end
					end
				end
				SetButton('L')
				SetButton('R')
			end
		end
	end
end)

btns:Button("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
