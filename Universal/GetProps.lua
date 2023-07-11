--!nolint
--[[|Raw:
	print(game.HttpService:JSONEncode(GetClassData('Part','Properties')))--| Could return nil, Options is optional/avanced
]]--+ (Works on Studio/Exploit & I'm probably make a Plugin with this¿?)
--|| Edited_By_Pixelated03 + API-Tracker maded from MaximumADHD ||--
local A,C,D,API,REF,S,ycall,G,rAPI,rREF,Http,C13--| A={ Class={ Class={ Properties,Functions,...},...}, Enum={ Enum={ EnumItem},...}}| C=Class_Category| D=Class_Data| S=Skipped_Security
do--[- Dir -]--
	G,rAPI,rREF,Http,C13=getgenv and getgenv()or getfenv(),'https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/Mini-API-Dump.json'
	,'https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/ReflectionMetadata.xml',game:FindService'HttpService',utf8.char(13)
	A,C,D,API,REF,S,ycall={Class={},Enum={}},{Parts='BasePart',GUI='GuiObject'},{Member=true,YieldFunction=true,Callbacks=true,Functions=true,Events=true,Properties=true,YieldFunctions=true,EnumItem=true}
	,(readfile and isfile and isfile'API'and readfile'API')or G.API or pcall(function()game:HttpGetAsync(rAPI)end)or Http:GetAsync(rAPI)
	,(readfile and isfile and isfile'REF'and readfile'REF')or G.REF or pcall(function()game:HttpGetAsync(rREF)end)or Http:GetAsync(rREF)
	,{PluginSecurity=true,NotAccessibleSecurity=true},function(f)
		return coroutine.resume(coroutine.create(f))
	end
	if isfile and writefile then
		if not isfile'REF'then
			writefile('REF',REF)
		end
		if not isfile'API'then
			writefile('API',API)
		end
	end
	API,G.API,G.REF=game:FindService'HttpService':JSONDecode(API),API,REF
end
do--[+ Ref_Parse +]--
	for t,c in string.gmatch(REF,'"(%a+)">(.-)[\n<]')do
		if c~=C13 and c~=''then
			if not A.A then--| Class/Enum Index
				A.A=c
			elseif C[c]then--| Class_Category
				A.A0[C[c]]=true
			elseif t=='PreferredParent'or t=='PreferredParents'then--| Explorer_PreferredParents
				A.A0.PreferredParents=A.A0.PreferredParents or{}
				A.A0.PreferredParents[c]=true
			elseif A.C then--| N{...}_Check
				if A.L and A.A0[A.C][A.L]then
					A.A0[A.C][A.L][t]=c
				elseif(A.A~='BillboardGui'or(c~='AbsolutePosition'and c~='AbsoluteSize'))and c~='PGSPhysicsSolverEnabled'then--+ 2 Deprecated
					A.A0[A.C][c],A.L={},c
				end
			elseif not A.L then--| Class_Info
				A.A0[t]=c
			end
		else--| Meta_Index
			local e=string.sub(t,19)
			if D[e]then--| Data_Index
				if e=='Member'and A.C then
					A.L=nil
				else
					A.A0[e],A.C={},e
				end
			elseif A[e]then--| New_Index
				if A.A then
					A[e][A.A]=A.A0
				end
				A.A,A.A0,A.L,A.C=nil,{},nil,nil
			end
		end
	end
	A.A,A.L,A.A0,A.C=nil,nil,nil,nil--| Completely removal
end--| ClassCategory,ExplorerImageIndex,ExplorerOrder,PreferredParents,Insertable,Browsable,Deprecated,GuiObject,FFlag,BasePart,Name,ServiceVisibility/D{...}
do--[+ Api_Parse +]--
	for _,v in next,API.Classes do
		if#v.Members~=0 then
			A.Class[v.Name]=A.Class[v.Name]or{}
			for _,p in next,v.Members do
				local f=p.MemberType=='Property'and'Properties'or p.MemberType..'s'
				if type(p.Security)=='table'and p.Security.Write~='None'and p.Security.Write~='PluginSecurity'and p.Security.Write~='RobloxSecurity'and p.Security.Write~='RobloxScriptSecurity'and p.Security.Write~='LocalUserSecurity'and p.Security.Write~='NotAccessibleSecurity'then--None,PluginSecurity,RobloxSecurity,RobloxScriptSecurity,LocalUserSecurity,NotAccessibleSecurity
					print(p.Security,p.Name,v.Name,f)
				end
				if D[f]then
					local Tags
					if p.Tags then
						for _,t in next,p.Tags do
							Tags=Tags or{}
							Tags[t]=true
						end
					end
					A.Class[v.Name][f]=A.Class[v.Name][f]or{}
					A.Class[v.Name][f][p.Name]=A.Class[v.Name][f][p.Name]or{}
					A.Class[v.Name][f][p.Name].Tags=Tags
					for i,b in next,p do
						if i~='Name'and i~='Tags'then
							A.Class[v.Name][f][p.Name][i]=b
						end
					end
				end
			end
			if v.Tags then
				for _,t in next,v.Tags do
					A.Class[v.Name].Tags=A.Class[v.Name].Tags or{}
					A.Class[v.Name].Tags[t]=true
				end
			end
			for i,b in next,v do
				if i~='Name'and i~='Tags'then
					A.Class[v.Name][i]=b
				end
			end
		end
	end
	for _,v in next,API.Enums do
		A.Enum[v.Name]=A.Enum[v.Name]or{}
		A.Enum[v.Name].Tags=v.Tags
		for _,i in next,v.Items do
			A.Enum[v.Name][i.Name]=A.Enum[v.Name][i.Name]or{}
			A.Enum[v.Name][i.Name].Value,A.Enum[v.Name][i.Name].Tags=i.Value,i.Tags
			if i.LegacyNames then
				for _,n in next,i.LegacyNames do
					A.Enum[v.Name][i.Name].LegacyNames=A.Enum[v.Name][i.Name].LegacyNames or{}
					A.Enum[v.Name][i.Name].LegacyNames[n]=true
				end
			end
		end
	end
	table.clear(API)
end--| { Tags={ Tag=true,...},MemoryCategory='',Superclass='',{ Prop={ Tags={ Tag=true,...},MemoryCategory='',Superclass=''}}}
local _M={Server=nil,ServerOnly=nil
	,NotReplicated=true--[[Client]],CustomLuaState=true--[[General]],Hidden=true--[[Internal]],Yields=true--[[CallAsync]],ReadOnly=nil--[[FFlag]],Deprecated=nil--[[Replaced]]
	,NotBrowsable=nil--[[Hidden]],CanYield=true--[[Yield]],NotScriptable=nil--[[DevOnly]],NoYield=nil--[[Direct]]
	,None=true,PluginSecurity=nil,RobloxSecurity=nil,RobloxScriptSecurity=nil,LocalUserSecurity=true,NotAccessibleSecurity=nil--[[Read_Only]]}
do--[[ Global_Functions ]]--
	function IndexProp(v,e,cl,t,tb,ty,op)
		ycall(function()--| Try to avoid any error
			for k,r in next,e do
				if(k=='ServerOnly'or k=='Deprecated')and not o[k]or r=='Server'and not o[r]then--| Skipped(Ref)
					return
				elseif k=='Security'then--| Skipped(Api)
					if r.Read then
						if not _M[r.Read]or not _M[r.Write]then
							return
						end
					elseif not _M[r]then
						return
					end
				elseif k=='Tags'then
					for t in next,r do--| Filtring(Api_Tags)
						if not _M[t]then
							return
						end
					end
				end
			end
			if t then
				tb[v]=cl[v]
			else
				tb[v]=true
			end
		end)
	end
	G.GetClassData=function(cl:InstanceOrClass,ty:Data,op:Options)--* Returns Properties/Functions/...
		local t=type(cl)=='userdata'
		local c=t and cl.ClassName or cl
		if A.Class[c]then
			local tb={}
			ty=ty or'Properties'
			if ty=='Properties'then
				if t then
					tb.Parent,tb.Name=cl.Parent,cl.Name
				else
					tb.Parent,tb.Name=true,true
				end
			end
			if o then
				for k,v in next,op do
					if v then
						_M[k]=true
					end
				end
			end
			if A.Class[c][ty]then
				for i,v in next,A.Class[c][ty]do--| PropName=Value
					IndexProp(i,v,cl,t,tb,ty,op or _M)
				end
			end
			for _,v in next,C do--| Gets Category_Props
				if A.Class[c][v]and A.Class[v][ty]then
					for i,v in next,A.Class[v][ty]do
						IndexProp(i,v,cl,t,tb,ty,op or _M)
					end
				end
			end
			if o then
				for k,v in next,op do
					if v then
						_M[k]=nil
					end
				end
			end
			return tb
		end
	end
	G.GetEnums=function(d:ExcludeDeprecated)--* Every Enum:GetEnums() uses memory to create tables | Use'Enum.EnumItem'to':GetEnumItems()'
		if d then
			local e={}
			for n,t in next,A.Enum do
				if not t.Tags then
					e[n]=GetEnumItems(n,true)
				end
			end
			return e
		end
		return A.Enum
	end
	G.GetEnumItems=function(E,d:ExcludeDeprecated)--* Enum.EnumItem but Excludes Deprecated
		E=A.Enum[type(E)=='userdata'and E.Name or E].EnumItem
		if d and E then
			local e={}
			for n,t in next,E do
				if not t.Tags and n~='LegacyNames'and not t.Deprecated then
					e[n]=t
				end
			end
			return e
		end
		return E
	end
	G.GetClassInfo=function(c:InstanceOrClass)--* Returns all info without filtring(Properties,ClassImageIndex,Tags,...)
		if type(c)=='userdata'and A.Class[c.ClassName]then
			return A.Class[c.ClassName]
		elseif A.Class[c]then
			return A.Class[c]
		end
	end
	G.GetClasses=function()
		return A.Class
	end
	game:FindService'TestService':Message'API_Loaded!'
end
