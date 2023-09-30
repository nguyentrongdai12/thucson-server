---------------------------------------------------------------
--金牙族长（NPC_ID: 5675）脚本
---------------------------------------------------------------
CAI_5675 = class(CAIObject)
function CAI_5675:ctor(id, objid)	
    self.dwBeginTime = 0;
    self.dwSkillTime = 0;
end

function CAI_5675:OnCreate(createid)
    GotoState(self.ObjID, "Special")
    ModifyAttackFlag(self.ObjID, 0);
end

function CAI_5675:OnSpecialState(dwNow)
    if self.dwBeginTime == 0 then
        self.dwSkillTime = GetServerTime();
        self.dwBeginTime = 1 ;      
        --ModifyAttackFlag(self.ObjID, 1);
        --CheckUseSkill(self.ObjID,1341,0,0);
	    return;
    end 
    
    

    if dwNow - self.dwSkillTime >= 2 and self.dwBeginTime == 1 then    	
	 
	
	 self.dwBeginTime = 2;
	 ModifyAttackFlag(self.ObjID, 1);
         CheckUseSkill(self.ObjID,1341,0,0);
	 
	 GotoState(self.ObjID, "Combat")
	  
	 
    end
end

function CAI_5675:OnHpLower(rate)	
	if rate<=80 then
		CheckUseSkill(self.ObjID, 1342, 0, 0)
	elseif rate<=50 then
		CheckUseSkill(self.ObjID, 1342, 0, 0)
	elseif rate<=30 then
		CheckUseSkill(self.ObjID, 1342, 0, 0)
	end	
end


function CAI_5675:OnDead(nKillerId)
	
	Npc5683ObjId = GetNpcIdByTypeId(self.ObjID, 5683)
	Disappear(Npc5683ObjId)

	Npc5680ObjId = GetNpcIdByTypeId(self.ObjID, 5680)
	Disappear(Npc5680ObjId)
	
	CreateNpc(self.ObjID, 5684, 795, 1682, 4)
end

AITable[5675] = CAI_5675
---------------------------------------------------------------
--牢笼1
---------------------------------------------------------------
CAI_5681 = class(CAIObject)
function CAI_5681:ctor(id, objid)
end

function CAI_5681:OnInteractive(uid, event)	
		if CheckUserHaveItem(uid,5138) == 1 then
			Say(self.ObjID, L("msg_script_5681_1"))
			RemoveItem(uid,5138,1)
			
			Npc5678ObjId = GetNpcIdByTypeId(self.ObjID, 5678)
			Disappear(Npc5678ObjId)
			
			Npc5682ObjId = GetNpcIdByTypeId(self.ObjID, 5682)
			print("5681:"..tostring(Npc5682ObjId));
			if IsDead(Npc5682ObjId) == 1 then
			    CreateNpc(self.ObjID, 5675, 827, 1680, 12);
			end
			
			Disappear(self.ObjID)
		else 
			Say(self.ObjID, L("msg_script_5681_2"))
		end
end

function CAI_5681:OnDead(nKillerId)
--	Npc4682ObjId = GetNpcIdByTypeId(self.ObjID, 5682)
--	Dead = IsDead(Npc5682ObjId)
--	if Dead == 1 then
--	CreateNpc(self.ObjID, 5675, 827, 1680, 12)
--	end
end
AITable[5681] = CAI_5681
---------------------------------------------------------------
--牢笼2
---------------------------------------------------------------
CAI_5682 = class(CAIObject)
function CAI_5682:ctor(id, objid)
end

function CAI_5682:OnInteractive(uid, event)	
		if CheckUserHaveItem(uid,5137) == 1 then
			Say(self.ObjID, L("msg_script_5682_1"))
			RemoveItem(uid,5137,1)
			
			Npc5679ObjId = GetNpcIdByTypeId(self.ObjID, 5679)
			Disappear(Npc5679ObjId)
			
			Npc5681ObjId = GetNpcIdByTypeId(self.ObjID, 5681)
			print("5682:"..tostring(Npc5681ObjId));
			if IsDead(Npc5681ObjId) == 1 then
			    CreateNpc(self.ObjID, 5675, 827, 1680, 12);
			end
			
			Disappear(self.ObjID)
		else 
			Say(self.ObjID, L("msg_script_5682_2"))
		end
end

function CAI_5682:OnDead(nKillerId)
--	Npc5681ObjId = GetNpcIdByTypeId(self.ObjID, 5681)
--	Dead = IsDead(Npc5681ObjId)
--	if Dead == 1  then
--	CreateNpc(self.ObjID, 5675, 827, 1680, 12)
--	end
end
AITable[5682] = CAI_5682
---------------------------------------------------------------
--护送
---------------------------------------------------------------
CAI_5684 = class(CAIObject)

function CAI_5684:ctor(id, objid)
	--OutputLog("ai脚本 CAIBaoHuTask 构造完毕 by "..objid)
end

function CAI_5684:OnInteractive(uid, event)
	local content=""

	if event=="defaulttalk" then
		content = GetFileContent("talk/npc_talk_5684.xml")
		content = ReplaceUserName(content, uid)
	end

	return content
end

function CAI_5684:OnHpLower(rate)
	if rate<=20 then
		Say(self.ObjID, L("msg_script_5684_onhplower_0"))
	elseif rate>20 and rate<=40 then
		Say(self.ObjID, L("msg_script_5684_onhplower_20"))
	elseif rate>40 and rate<=60 then
		Say(self.ObjID, L("msg_script_5684_onhplower_40"))
	elseif rate>60 and rate<80 then
		Say(self.ObjID, L("msg_script_5684_onhplower_60"))
	elseif rate>80 and rate<100 then
		Say(self.ObjID, L("msg_script_5684_onhplower_80"))
	end
end

function CAI_5684:OnTaskAccept(uid, taskid)
	local name = GetUserNameByObjId(uid)
	Say(self.ObjID, name..L("msg_script_5684_ontaskaccept"))
	LockInteractive(self.ObjID)
	ActivePatrol(self.ObjID)
end

function CAI_5684:OnArrive(n, IsEndPoint)
	if IsEndPoint==1 then
		Say(self.ObjID, L("msg_script_5684_onarrive"))
		if CheckDoingTask(self.ObjID)~=0 then
			FinishTask(self.ObjID)
			UnLockInteractive(self.ObjID)
		end
		DisActivePatrol(self.ObjID)
		Disappear(self.ObjID)
	end

	local rnd = math.random(2)
	
	if n==3 then
		Say(self.ObjID, L("msg_script_5684_onarrive_3"))
		CreateMyEnemy(self.ObjID, 5674, 80, 3)
		if rnd==1 then
			CreateMyEnemy(self.ObjID,5674, 80, 1)
		end
		GotoState(self.ObjID, "Wait")

	elseif n==9 then
		Say(self.ObjID, L("msg_script_5684_onarrive_9"))
		CreateMyEnemy(self.ObjID, 5674, 80, 3)
		if rnd==1 then
			CreateMyEnemy(self.ObjID,5674, 80, 1)
		end
		GotoState(self.ObjID, "Wait")

	elseif n==14 then
		Say(self.ObjID, L("msg_script_5684_onarrive_14"))
		CreateMyEnemy(self.ObjID, 5674, 80, 3)
		if rnd==1 then
			CreateMyEnemy(self.ObjID,5674, 80, 1)
		end
		GotoState(self.ObjID, "Wait")
	elseif n==18 then
		Say(self.ObjID, L("msg_script_5684_onarrive_18"))
		CreateMyEnemy(self.ObjID, 5674, 80, 3)
		if rnd==1 then
			CreateMyEnemy(self.ObjID,5674, 80, 1)
		end
		GotoState(self.ObjID, "Wait")
	end
end

function CAI_5684:OnDead(killer)
	if CheckDoingTask(self.ObjID)~=0 then
		Say(self.ObjID, L("msg_script_5684_ondead"))
		TaskFailed(self.ObjID)
	end
end

AITable[5684] = CAI_5684