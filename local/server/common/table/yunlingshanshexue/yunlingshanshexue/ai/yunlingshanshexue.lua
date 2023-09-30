
CAI_157 = class(CAIObject)
function CAI_157:ctor(id, objid)
	self.iCurrNum = 0
	self.iTotalNum = 0
	self.captainId1 = 0
	self.captainId2 = 0
	self.dwLastSpecial = 0
end

function CAI_157:ResumeInit()
	self.iCurrNum = 0
	self.iTotalNum = 0
	self.captainId1 = 0
	self.captainId2 = 0
	self.dwLastSpecial = 0
end

function CAI_157:CreateMonsterGroup(uid)
	local id1
	local id2
	id1 = CreateNpc(self.ObjID, 166, 0, 0, 0)
	id2 = CreateNpc(self.ObjID, 167, 0, 0, 0)
	
	AddTeamToHateList(id1, uid, 1)
	AddTeamToHateList(id2, uid, 1)
	
	self.iTotalNum = self.iTotalNum + 1
	Say(self.ObjID, L("msg_script_157_onactive"))
	
	self.captainId1 = id1
	self.captainId2 = id2
end

function CAI_157:OnInteractive(uid, event)
	local content
	if event=="defaulttalk" then
		self:ResumeInit()
		content = GetFileContent("talk/npc_talk_157.xml")
		content = ReplaceUserName(content, uid)
		content = ReplaceNpcObjId(content, self.ObjID)
	elseif event=="Step2" then
		LockInteractive(self.ObjID)
		self:CreateMonsterGroup(uid)
		--GotoState("Special")
	end
	
	return content
end

function CAI_157:OnCreate_toRelated(fromnid, fromnoid, creatorid)
	if creatorid~=self.ObjID then
		return
	end
	
	if self.iCurrNum>=2 then
		OutputLog("OnCreate_toRelated Error: self.iCurrNum>=2")
		return
	end
	
	self.iCurrNum = self.iCurrNum + 1
	--OutputLog("OnCreate_toRelated : self.iCurrNum=="..self.iCurrNum)
end

function CAI_157:OnDead_toRelated(fromnid, fromnoid, killer)
	self.iCurrNum = self.iCurrNum - 1
	--OutputLog("OnDead_toRelated : self.iCurrNum=="..self.iCurrNum)
	if self.iCurrNum==0 then
		if self.iTotalNum>=3 then
			--OutputLog("OnDead_toRelated : self.iTotalNum=="..self.iTotalNum..", Over")
			ModifyAttackFlag(self.ObjID, 1)
			AddTeamToHateList(self.ObjID, killer, 1)
			GotoState(self.ObjID, "Combat")
			return
		end
		--OutputLog("OnDead_toRelated : self.iTotalNum=="..self.iTotalNum)
		self:CreateMonsterGroup(killer)
	end
end

function CAI_157:OnSpecialState(dwNow)
end


AITable[157] = CAI_157
---------------------------------------------------------