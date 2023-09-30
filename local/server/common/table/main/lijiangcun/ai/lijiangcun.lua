-------------------------------------------------------------------------------
--id= 5507 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5507 = class(CAIObject)
function CAI_5507:ctor(id, objid)
end

function CAI_5507:OnInteractive(uid, event)	
	local content
	if event=="defaulttalk" then
		if CheckUserDoingTask(uid, 1721) == 1 then
			if GetItemCount(uid, 5020) > 1 then
			    Say(self.ObjID, L("msg_script_5507_1"))
			else
			    Say(self.ObjID, L("msg_script_5507_2"))
			    AddItem(uid,5020,0,0,1)
			end
		end
	end
	return content
end

AITable[5507] = CAI_5507

-------------------------------------------------------------------------------
--id= 5508 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5508 = class(CAIObject)
function CAI_5508:ctor(id, objid)
end

function CAI_5508:OnInteractive(uid, event)	
	local content
	if event=="defaulttalk" then
		if CheckUserDoingTask(uid, 1721) == 1 then
			if GetItemCount(uid, 5021) > 1 then
			    Say(self.ObjID, L("msg_script_5508_1"))
			else
			    Say(self.ObjID, L("msg_script_5508_2"))
			    AddItem(uid,5022,0,0,1)
			end
		end
	end
	return content
end

AITable[5508] = CAI_5508

-------------------------------------------------------------------------------
--id= 5509 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5509 = class(CAIObject)
function CAI_5509:ctor(id, objid)
end

function CAI_5509:OnInteractive(uid, event)	
	local content
	if event=="defaulttalk" then
		if CheckUserDoingTask(uid, 1721) == 1 then
			if GetItemCount(uid, 5022) > 1 then
			    Say(self.ObjID, L("msg_script_5509_1"))
			else
			    Say(self.ObjID, L("msg_script_5509_2"))
			    AddItem(uid,5021,0,0,1)
			end
		end
	end
	return content
end

AITable[5509] = CAI_5509

-------------------------------------------------------------------------------
--id= 5510 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5510 = class(CAIObject)
function CAI_5510:OnArrive(n, IsEndPoint)
	if IsEndPoint==1 then
		Say(self.ObjID, L("msg_script_5510_onarrive"))
		DisActivePatrol(self.ObjID)
		Disappear(self.ObjID)
	end

	if n==1 then
		Say(self.ObjID, L("msg_script_5510_onarrive_4"))
	end

end
AITable[5510] = CAI_5510

-------------------------------------------------------------------------------
--id= 5532 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5532 = class(CAIObject)
function CAI_5532:ctor(id, objid)
	self.dwTarId = 0
end

function CAI_5532:OnInteractive(uid, event)

	local content=""

	if event=="defaulttalk" then
	
		if CheckUserDoingTask(uid, 1715)==0 then
			content = GetFileContent("talk/npc_talk_5532.xml")
		else
			content = GetFileContent("talk/npc_talk_5532_01.xml")
		end

	elseif event=="duel" then
		self.dwTarId = uid
		GotoState(self.ObjID, "Duel")
		LockInteractive(self.ObjID)
	end

	return content
end

function CAI_5532:OnHpLower(rate)
	if rate<=5 then
		GotoState(self.ObjID, "Return")
	end
end

function CAI_5532:OnStartDuel(nid, noid, tar)
	SetDuelTarget(self.ObjID, self.dwTarId)
	AddToHateList_Ex(self.ObjID, self.dwTarId, 1, 0)
	Say(self.ObjID, L("msg_script_5532_onstartduel"))
	self.dwTarId = 0
end

function CAI_5532:OnEndDuel(nid, noid, rate, tar)
	if rate<=5 then
		Say(self.ObjID, L("msg_script_5532_onendduel_lost"))
		TaskNpcEndDuel(self.ObjID, tar, 0)
	else
		Say(self.ObjID, L("msg_script_5532_onendduel_win"))
		TaskNpcEndDuel(self.ObjID, tar, 1)
	end
end

AITable[5532] = CAI_5532

-------------------------------------------------------------------------------
--id= 5541 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5541 = class(CAIObject)
function CAI_5541:ctor(id, objid)
end

function CAI_5541:OnDead(killer)
	local id
	for i=1, 1 do
		id = CreateNpc(self.ObjID, 5560, 0, 0, 0)
		AddToHateList(id, killer, 1)
	end
end

AITable[5541] = CAI_5541
-------------------------------------------------------------------------------
--重整旗鼓任务脚本（ID:1823）
-------------------------------------------------------------------------------
--脚本2（获得李元化的信）
-------------------------------------------------------------------------------
CAI_5503 = class(CAIObject)
function CAI_5503:ctor(id, objid)
end

function CAI_5503:OnInteractive(uid, event)	
	local content
	if event=="defaulttalk" then
		if CheckUserDoingTask(uid, 1823) == 1 then
			    if CheckUserHaveItem(uid,5131) == 0 then
			    	Say(self.ObjID, L("msg_script_5503"))
			        AddItem(uid,5131,0,0,1)
			    end 
		end
		content = GetFileContent("talk/npc_talk_5503.xml")
		--content = ReplaceUserName(content, uid)
	end
	return content
end

AITable[5503] = CAI_5503