--------------------------------------------------
--事件的真相任务脚本（ID:1810）
--------------------------------------------------
--脚本1（赤霞）
--------------------------------------------------
CAI_5610 = class(CAIObject)
function CAI_5610:ctor(id, objid)
end

function CAI_5610:OnInteractive(uid, event)
	local content="";
	if event=="defaulttalk" then
		content = GetFileContent("talk/npc_talk_5610.xml")
		content = ReplaceUserName(content, uid)
	end
	return content
end

function CAI_5610:OnTaskAccept(uid, taskid)
	local name = GetUserNameByObjId(uid)
	--Say(self.ObjID, name..L("msg_script_5610_ontaskaccept"))
	LockInteractive(self.ObjID)
	ActivePatrol(self.ObjID)

end

function CAI_5610:OnArrive(n, IsEndPoint)	
	if IsEndPoint==1 then
		--Say(self.ObjID, L("msg_script_5610_onarrive"))
		--if CheckDoingTask(self.ObjID)~=0 then
			--FinishTask(self.ObjID)
			UnLockInteractive(self.ObjID)			
		        Disappear(self.ObjID)
			--CreateMyEnemy(self.ObjID, 5629, 80, 1)
			CreateNpc(self.ObjID , 5629, -1127, -229, 1)

		--end
		DisActivePatrol(self.ObjID)		
	end	
end

AITable[5610] = CAI_5610;
--------------------------------------------------
--脚本2（鬼祟的采石者）
--------------------------------------------------
CAI_5629 = class(CAIObject)
function CAI_5629:ctor(id, objid)

end

function CAI_5629:OnDead(killer)
    --if CheckDoingTask(self.ObjID)~=0 then
    --     FinishTask(self.ObjID) 
    --	 CreateNpc(self.ObjID , 5610, 565, 617, 8)
    --end
    Say(self.ObjID, L("msg_script_5629_ondead"))
end

function CAI_5629:OnArrive(n, IsEndPoint)	
	if IsEndPoint==1 then
		Say(self.ObjID, L("msg_script_5629_onarrive"))
		DisActivePatrol(self.ObjID)		
	end	
end

AITable[5629] = CAI_5629
-----------------------------------------------
--灵石佛像任务脚本（ID:1807）随机给予任务奖励BUFF
-----------------------------------------------
CAI_5602 = class(CAIObject)
function CAI_5602:ctor(id, objid)

end

function CAI_5602:OnTaskFinish(uid,taskid)    
    if taskid == 1807 then
        local Random=math.random(1,100);
        if Random>75 then
            AddEffectEx(uid,2083,0,2,5,60);
        elseif 	Random>50 then
            AddEffectEx(uid,2084,0,2,10,60);   
        elseif  Random>25 then
            AddEffectEx(uid,2062,0,2,20,60);  
        else
            AddEffectEx(uid,2063,0,2,10,60); 
        end         	    
    end
end


AITable[5602] = CAI_5602;
----------------------------------------------------------------------------------------
--重整旗鼓任务脚本（ID:1823）
----------------------------------------------------------------------------------------
--脚本1 （获得苍龙居士的信）
-------------------------------------------------------------------------------
CAI_5608 = class(CAIObject)
function CAI_5608:ctor(id, objid)
end

function CAI_5608:OnInteractive(uid, event)	
	local content
	if event=="defaulttalk" then
		if CheckUserDoingTask(uid, 1823) == 1 then
			    if CheckUserHaveItem(uid,5130) == 0 then
			    	Say(self.ObjID, L("msg_script_5608"))
			        AddItem(uid,5130,0,0,1)
			    end
		end
		content = GetFileContent("talk/npc_talk_5608.xml")
		--content = ReplaceUserName(content, uid)
	end
	return content
end

AITable[5608] = CAI_5608


