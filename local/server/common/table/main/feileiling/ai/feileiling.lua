-------------------------------------------------------------------------------
--突现的高塔护送任务(任务ID:1820)
-------------------------------------------------------------------------------
CAI_5605 = class(CAIObject)

function CAI_5605:ctor(id, objid)
	--OutputLog("ai脚本 CAIBaoHuTask1306 构造完毕 by "..objid)
end

function CAI_5605:OnInteractive(uid, event)
	local content=""

	if event=="defaulttalk" then
		content = GetFileContent("talk/npc_talk_5605.xml")
		content = ReplaceUserName(content, uid)
	end

	return content
end

function CAI_5605:OnHpLower(rate)
	if rate<=20 then
		Say(self.ObjID, L("msg_script_5605_onhplower_0"))
	elseif rate>20 and rate<=40 then
		Say(self.ObjID, L("msg_script_5605_onhplower_20"))
	elseif rate>40 and rate<=60 then
		Say(self.ObjID, L("msg_script_5605_onhplower_40"))
	elseif rate>60 and rate<80 then
		Say(self.ObjID, L("msg_script_5605_onhplower_60"))
	elseif rate>80 and rate<100 then
		Say(self.ObjID, L("msg_script_5605_onhplower_80"))
	end
end

function CAI_5605:OnTaskAccept(uid, taskid)
	local name = GetUserNameByObjId(uid)
	Say(self.ObjID, name..L("msg_script_5605_ontaskaccept"))
	LockInteractive(self.ObjID)
	ActivePatrol(self.ObjID)
end

function CAI_5605:OnArrive(n, IsEndPoint)
	if IsEndPoint==1 then
		Say(self.ObjID, L("msg_script_5605_onarrive"))
		if CheckDoingTask(self.ObjID)~=0 then
			FinishTask(self.ObjID)
			UnLockInteractive(self.ObjID)
		end
		DisActivePatrol(self.ObjID)
		Disappear(self.ObjID)
	end

	local rnd = math.random(2)
	
	if n==6 then
		Say(self.ObjID, L("msg_script_5605_onarrive_6"))
		CreateMyEnemy(self.ObjID, 5657, 80, 3)
		if rnd==1 then
			CreateMyEnemy(self.ObjID,5658, 80, 1)
		end
		GotoState(self.ObjID, "Wait")

	elseif n==14 then
		Say(self.ObjID, L("msg_script_5605_onarrive_9"))
		CreateMyEnemy(self.ObjID, 5657, 80, 3)
		if rnd==1 then
			CreateMyEnemy(self.ObjID,5658, 80, 1)
		end
		GotoState(self.ObjID, "Wait")

	elseif n==22 then
		Say(self.ObjID, L("msg_script_5605_onarrive_18"))
		CreateMyEnemy(self.ObjID, 5657, 80, 3)
		if rnd==1 then
			CreateMyEnemy(self.ObjID,5658, 80, 1)
		end
		GotoState(self.ObjID, "Wait")
	elseif n==30 then
		Say(self.ObjID, L("msg_script_5605_onarrive_24"))
		CreateMyEnemy(self.ObjID, 5657, 80, 3)
		if rnd==1 then
			CreateMyEnemy(self.ObjID,5658, 80, 1)
		end
		GotoState(self.ObjID, "Wait")
	end
end

function CAI_5605:OnDead(killer)
	if CheckDoingTask(self.ObjID)~=0 then
		Say(self.ObjID, L("msg_script_5605_ondead"))
		TaskFailed(self.ObjID)
	end
end

AITable[5605] = CAI_5605

-------------------------------------------------------------------------------
--克敌之法任务脚本（ID:1824）（天外飞石）
-------------------------------------------------------------------------------

CAI_5653 = class(CAIObject)
function CAI_5653:ctor(id, objid)	
    self.dwBeginTime = 0;
    self.dwWakeupTime = 0;
end

function CAI_5653:OnCreate(createid)       
    PlayPose(self.ObjID, "effect", false)
    GotoState(self.ObjID, "Special")
   
end

function CAI_5653:OnSpecialState(dwNow)
    if self.dwBeginTime == 0 then
        self.dwWakeupTime = GetServerTime();
        self.dwBeginTime = 1 ;
        CreateNpcAtMyPos(self.ObjID , 5046)   
        
	return;
    end 

    if dwNow - self.dwWakeupTime >= 0 then    
	
	 Disappear(self.ObjID);	
	 
    end
end

AITable[5653] = CAI_5653
------------------------------------------------------
--幽冥之花任务（ID: 1817）（炼丹炉）
------------------------------------------------------
CAI_5630 = class(CAIObject)
function CAI_5630:ctor(id, objid)	
    
end

function CAI_5630:OnInteractive(uid, event)
	local content=""	
	
	if event=="defaulttalk" then	        
		if CheckUserDoingTask(uid, 1817)~=0 then
			content = GetFileContent("talk/npc_talk_5630.xml")		
		end
        elseif event == "hecheng" then
             if(CheckUserHaveItem(uid,5108)==1 and CheckUserHaveItem(uid,5107)==1) then
             	if (CheckUserHaveItem(uid,5109)~=1) then
                RemoveItem(uid,5108,1);
                RemoveItem(uid,5107,1);
	                local Random=math.random(1,100);
	                if Random>95 then
	                	AddItem(uid,5109,0,0,1);   
	                else
	                	AddItem(uid,5106,0,0,1);   
	                end
	        else
                	ReceiveMsg(uid,L("msg_npc5630_1"), 7); 	        
	        end
             else
                ReceiveMsg(uid,L("msg_npc5630_2"), 7);        
             end        
	end		
	return 	content;
end

AITable[5630] = CAI_5630

------------------------------------------------------
--枣红马自动死亡脚本
------------------------------------------------------
CAI_5656 = class(CAIObject)
function CAI_5656:ctor(id, objid)	
    
end

function CAI_5656:OnArrive(n, IsEndPoint)
	if IsEndPoint==1 then
		DisActivePatrol(self.ObjID)
                Disappear(self.ObjID)
	end
end

AITable[5656] = CAI_5656
