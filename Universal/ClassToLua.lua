--| First_Version 100% | Create an Script named "Decompiled" in "ReplicatedFirst" to get the Source
loadstring(game:HttpGetAsync'https://raw.githubusercontent.com/Pixelated03/Roblox/_/Universal/GetProps.lua')()
do
	--|| Edited_By_Pixelated03 ||--
	function P(a)
		return string.match(a,'[\n%]]')and'[['..string.gsub(a,']','\\]')..']]'or'.'..a
	end
	(getgenv and getgenv()or getfenv()).MakePath=function(v)
		local a,b=v,P(tostring(v))
		if a==workspace then
			b='workspace'
		elseif a==game then
			b='game'
		else
			while a.Parent do
				a=a.Parent
				if a==workspace then
					b='workspace'..b
					break
				elseif a==game then
					b='game'..b
					break
				else--- Doesn't include':GetService(s)'
					b=P(tostring(a))..b
				end
			end
		end
		return b
	end
end
local Players
do--[[ Services ]]--
	Players=game:GetService'Players'
end
local _M={
	UseLocal=nil--[[There's limits but faster]]
	,CompressToCommas=nil--[[Could fix some errors but does visual lag while editing | Looks cool!]]
	,UseChrs=nil--[[Player_Characters requires many Descendants]]
	,UseSrc=true--[[Slow]]
	,ToRblxFile=nil--[[Only works with Exploits, replacing'saveinstance']]
	,SourceOnScript=nil--[[Source runs directly on self Script]]
	,EnterType='\n'--[['\n'=Enter,';'=1_Line]]
	,CompressDecimals=nil--[[Advanced 0.001 = 1e-3(Could make code longer)]]
	,UseClassVar=nil--[[Is this Binary??]]
	,PropsAtEnd=nil--[[Take care of ur vision..]]
	,AsignPropsAtFunction=nil--[[Who needs to scroll in props while I got them directly into the vars!]]}
function ConvI(I)
	local c=''
	if not tonumber(I)then
		c,I=string.match(I,'%D$'),string.sub(I,1,#I-1)
	end
	I=tonumber(I)
	local sg=math.sign(I)
	I=math.abs(I)
	if I==math.huge then
		return'math.huge'..c
	elseif I==0 then
		return(0)..c
	elseif _M.CompressDecimals then
		local p=math.floor(math.log10(I))
		return (sg==-1 and'-'or'')..I/10^p..'e'..p..c
	else
		return(I*sg)..c
	end
end
function ConvV(v)
	return v.X+v.Y+v.Z==0 and'Vector3.zero'or'Vector3.new('..ConvI(v.X)..','..ConvI(v.Y)..','..ConvI(v.Z)..')'
end
function ycall(f)
	if coroutine.resume(coroutine.create(f))then
		return true
	end
end
function C(c:table,I:number)
	if#c~=0 then
		local h,NewL,VL,L,VP,FT={},true,'',{},'',''
		for ExI,s in next,c do
			if not ycall(function()
					local _=s.ClassName
				end)then
				continue
			end--| Checks the Instance Access Lvl
			if _M.UseChrs or not Players:GetPlayerFromCharacter(s)then--| Skipped(Chr)
				local g=GetClassData(s,'Properties')
				if g then
					if _M.ToRblxFile then--+ All in one!
						warn'Feature is not here );'
					else
						local ic,cP=GetClassInfo(s),MakePath(s)
						local Cr=ic.Insertable=='false'or s.Parent==game or(ic.Tags and ic.Tags.NotCreatable)or ic.Browsable=='false'
						L[I]={N=(_M.UseClassVar and s.ClassName or'_')..I..ExI+1--[[Class..ListI..OIndex]]}
						for i,v in next,g do
							local t=typeof(v)
							if t=='Font'then
								v=t..'.new(\''..v.Family..'\','..tostring(v.Weight.Name)..','..tostring(v.Style.Name)..')'
							elseif t=='UDim2'then
								v=t..'.new('..(v.X.Scale+v.X.Offset+v.Y.Scale+v.Y.Offset==0 and''
									or ConvI(v.X.Scale)..','..ConvI(v.X.Offset)..','..ConvI(v.Y.Scale)..','..ConvI(v.X.Offset))..')'
							elseif t=='BrickColor'then
								v='BrickColor.new\''..v.Name..'\''
							elseif t=='NumberRange'then
								v='NumberRange.new('..ConvI(v.Min)..','..ConvI(v.Max)..')'
							elseif t=='NumberSequence'then
								local s=''
								for _,v in next,v.Keypoints do
									s=s..'Keypoint.new('..ConvI(v.Time)..','..ConvI(v.Envelope)..','..ConvI(v.Value)..'),'
								end
								v='.new({'..s..'})'
							elseif t=='ColorSequence'then
								local s=''
								for _,v in next,v.Keypoints do
									s=s..t..'Keypoint.new('..ConvI(v.Time)..',Color3.new('..ConvI(v.Value.R)..','..ConvI(v.Value.G)..','..ConvI(v.Value.B)..')),'
								end
								v='.new({'..s..'})'
							elseif t=='Ray'then
								v='Ray.new('..ConvV(v.Origin)..','..ConvV(v.Direction)..')'
							elseif t=='Vector3'then
								v=ConvV(v)
							elseif t=='Vector2'and v==Vector2.zero then
								v='Vector2.zero'
							elseif t=='CFrame'and v==CFrame.identity then
								v='CFrame.identity'
							elseif t=='number'then
								v=ConvI(v)
							elseif t=='string'then
								if i~='Source'or _M.UseSrc then
									v=(i~='Source'or not _M.SourceOnScript)and(string.match(v,']')and'string.gsub([['..string.gsub(v,']','\\]')..']],\'\\\\\',\'\')'or(string.match(v,'[\n%]]')
										and'[['..string.gsub(v,']','\\]')..']]'or'\''..v..'\''))
										or'task.spawn(function()'.._M.EnterType..v.._M.EnterType..'end)'
								end
							elseif t=='EnumItem'then
								v='\''..v.Name..'\''
							elseif t=='boolean'then
								v=tostring(v)
							elseif t=='Instance'then
								if not Cr or i~='Parent'then
									v='\b'..MakePath(v)..'\b'
								else
									continue
								end
							elseif t=='Faces'then
								v='Faces.new('..string.gsub((v.Right and'Enum.NormalId.Right,'or'')..(v.Top and'Enum.NormalId.Top,'or'')..(v.Back and'Enum.NormalId.Back,'or'')
									..(v.Left and'Enum.NormalId.Left,'or'')..(v.Bottom and'Enum.NormalId.Bottom,'or'')..(v.Front and'Enum.NormalId.Front,'or''),',$','')..')'
							elseif t=='Axes'then
								v='Axes.new('..string.gsub((v.X and'Enum.Axis.X,'or'')..(v.Y and'Enum.Axis.Y,'or'')..(v.Z and'Enum.Axis.Z,'or''),',$','')..')'
							elseif t=='Region3int16'then
								v='Region3int16.new(Vector3int16.new('..ConvI(v.Min.X)..','..ConvI(v.Min.Y)..','..ConvI(v.Min.Z)..'),Vector3int16.new('..ConvI(v.Max.X)..','..ConvI(v.Max.Y)..','
									..ConvI(v.Max.Z)..'))'
							elseif t=='TweenInfo'then
								v='TweenInfo.new('..ConvI(v.Time)..','..tostring(v.EasingStyle)..','..tostring(v.EasingDirection)..','..ConvI(v.RepeatCount)..','..tostring(v.Reverses)
									..','..ConvI(v.DelayTime)..')'
							else
								v=t..'.new('..string.gsub(string.gsub(tostring(v)..')',' ',''),'%d+%.?.-%D',ConvI)
							end
							if _M.CompressToCommas then
								VP,FT=VP..L[I].N..'.'..i..',',FT..','..v--| VP,...=FT,...
							else
								VP=VP..L[I].N..'.'..i..'='..v.._M.EnterType
							end
						end
						
						_M.T[cP]=L[I].N
						local INew=Cr and cP--| Includes Props for NonCreatable
							or 'Instance.new\''..s.ClassName..'\''
						if _M.CompressToCommas then
							_M.Src,NewL,VL=_M.Src..(_M.UseLocal and NewL and'local 'or'')..L[I].N..',',nil,VL..','..INew
						else
							VL=VL..(_M.UseLocal and'local 'or'')..L[I].N..'='..INew.._M.EnterType
						end
						for _,v in next,s:GetChildren()do
							table.insert(h,v)
						end
					end
				end
			end
		end
		if not _M.PropsAtEnd then
			if _M.CompressToCommas then
				_M.Src=string.gsub(_M.Src,',$','=')..string.sub(VL,2).._M.EnterType..(not _M.PropsAtEnd and string.gsub(VP,',$','=')..string.sub(FT,2)or'').._M.EnterType
			else
				_M.Src=_M.Src..string.gsub(VL,_M.EnterType..'$','').._M.EnterType..VP
			end
		end
		C(h,I+1)
	end
end
(getgenv and getgenv()or getfenv()).ClassToLua=function(c:Instances,o:Options)
	do--[[ M_Dir ]]--
		_M.Src,_M.T='',{}
	end
	if o then
		for k,v in next,o do
			if v then
				_M[k]=true
			end
		end
	end
	C(c,0)
	_M.Src=string.gsub(_M.Src,'\b(.-)\b',function(s)--| I desided to simplify script & make patterns instead of many ordered tables that changes the entire code with every action needed
		return _M.T[s]or s
	end)
	if o then
		for k,v in next,o do
			if v then
				_M[k]=nil
			end
		end
	end
	game:FindService'ReplicatedFirst'.Decompiled.Source=_M.Src
	game:FindService'TestService':Message'Decompiled!'
end
