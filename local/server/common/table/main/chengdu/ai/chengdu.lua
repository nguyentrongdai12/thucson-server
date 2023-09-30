-------------------------------------------------------------------------------
--id= 5308 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5308 = class(CAIObject)
function CAI_5308:ctor(id, objid)
self.dwTarId = 0
end

function CAI_5308:OnInteractive(uid, event)

local content=""

if event=="defaulttalk" then

	if SvrCanAcceptTask(uid, 1673)==1 then
		content = GetFileContent("talk/npc_talk_5308_01.xml")
	else
		content = GetFileContent("talk/npc_talk_5308.xml")
	end

elseif event=="Run" then
	self.dwTarId = uid
	GotoState(self.ObjID, "Run")
	--LockInteractive(self.ObjID)
	UserPrepareRun(uid)
end

return content
end

AITable[5308] = CAI_5308

-------------------------------------------------------------------------------
--id= 5309 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5309 = class(CAIObject)
function CAI_5309:ctor(id, objid)
self.dwTarId = 0
end

function CAI_5309:OnInteractive(uid, event)

local content=""

if event=="defaulttalk" then

	if SvrCanAcceptTask(uid, 1674)==1 then
		content = GetFileContent("talk/npc_talk_5309_01.xml")

	else
		content = GetFileContent("talk/npc_talk_5309.xml")
	end

elseif event=="Run" then
	self.dwTarId = uid
	GotoState(self.ObjID, "Run")
--LockInteractive(self.ObjID)
	UserPrepareRun(uid)
end

return content
end

AITable[5309] = CAI_5309