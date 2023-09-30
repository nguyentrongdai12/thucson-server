CAI_5363 = class(CAIObject)
function CAI_5363:ctor(id, objid)
    self.dwSpawnFlag = 0;
    self.dwLastSpecial = 0;
    
    self.dwBeginWakeupTime = 0;
    self.dwWakeupTime = 0;
end

function CAI_5363:OnCreate(createid)
    SetEnterViewEvent(self.ObjID, 1)
    ModifyAttackFlag(self.ObjID, 0)
    PlayPose(self.ObjID, "sleep", true)
    GotoState(self.ObjID, "Special")
end

function CAI_5363:OnEnterView(otherid)
    if IsNpc(otherid) == 1 then
        return
    end
    
    if self.dwBeginWakeupTime == 0 then
        self.dwBeginWakeupTime = GetServerTime();
    end
    
    AddToHateList_Ex(self.ObjID, otherid, 1, 0)
end

function CAI_5363:OnSpecialState(dwNow)
    if self.dwBeginWakeupTime == 0 and self.dwWakeupTime == 0 then
        return
    end

    if self.dwBeginWakeupTime ~= 0 then
        if dwNow - self.dwBeginWakeupTime > 10 then
            SetEnterViewEvent(self.ObjID, 0)
            PlayPose(self.ObjID, "stand", false);
            self.dwBeginWakeupTime = 0;
            self.dwWakeupTime = GetServerTime();
        end
        
        return
    end

    if dwNow - self.dwWakeupTime > 8 then
        ModifyAttackFlag(self.ObjID, 1)
	    GotoState(self.ObjID, "Combat")
	    self.dwWakeupTime = 0;
    end
end

function CAI_5363:OnEnterBattle()
    self.dwSpawnFlag = 1
end

function CAI_5363:OnUpdate(dwNow)
    if self.dwSpawnFlag == 0 then
        return
    end

	if self.dwLastSpecial == -1 then
		return
	end

	if self.dwLastSpecial == 0 then
		self.dwLastSpecial = dwNow
		return
	end

	local NpcId = 0;

	if dwNow - self.dwLastSpecial > 3 * 60 then
	    self.dwLastSpecial = dwNow

 	   NpcId = CreateNpc(self.ObjID , 5392, 464 , -167, 8)
		ActivePatrol(NpcId)
	

 	  	NpcId = CreateNpc(self.ObjID , 5393, 459 , -174, 8)
		ActivePatrol(NpcId)
	  

	   NpcId = CreateNpc(self.ObjID , 5394, 493 , -168, 8)
		ActivePatrol(NpcId)
	   NpcId = CreateNpc(self.ObjID , 5394, 493 , -168, 8)
		ActivePatrol(NpcId)


 	  	NpcId = CreateNpc(self.ObjID , 5395, 491 , -157, 8)
		ActivePatrol(NpcId)


 	   NpcId = CreateNpc(self.ObjID , 5398, 498 , -188, 8)
		ActivePatrol(NpcId)


		NpcId = CreateNpc(self.ObjID , 5399, 417 , -919, 8)
		ActivePatrol(NpcId)
	   	NpcId = CreateNpc(self.ObjID , 5399, 417 , -919, 8)
		ActivePatrol(NpcId)


	   NpcId = CreateNpc(self.ObjID , 5400, 432 , -184, 8)
		ActivePatrol(NpcId)
	   NpcId = CreateNpc(self.ObjID , 5400, 432 , -184, 8)
		ActivePatrol(NpcId)


		NpcId = CreateNpc(self.ObjID , 5401, 442 , -179, 8)
		ActivePatrol(NpcId)
	  	NpcId = CreateNpc(self.ObjID , 5401, 442 , -179, 8)
		ActivePatrol(NpcId)


	   NpcId = CreateNpc(self.ObjID , 5402, 443 , -193, 8)
		ActivePatrol(NpcId)
	   NpcId = CreateNpc(self.ObjID , 5402, 443 , -193, 8)
		ActivePatrol(NpcId)


 		NpcId = CreateNpc(self.ObjID , 5403, 483 , -188, 8)
		ActivePatrol(NpcId)
	   	NpcId = CreateNpc(self.ObjID , 5403, 483 , -188, 8)
		ActivePatrol(NpcId)


	end
end

function CAI_5363:OnDead(killer)
    
    for i=1,14 do
     local Random = math.random(-14, 14);
     local Random1 = math.random(-14, 14);
     CreateNpc(self.ObjID,5442,453+Random,-228+Random1,15)
    end
    for j=1,6 do
       local Random = math.random(-14, 14);
       local Random1 = math.random(-14, 14);
       CreateNpc(self.ObjID,5461,453+Random,-228+Random1,15)
    end
    CreateNpc(self.ObjID,5439,467,-222,12)
    local DoorId = GetNpcIdByTypeId(self.ObjID, 5361);
	Die(DoorId)
	DoorId = GetNpcIdByTypeId(self.ObjID, 5464);
        Die(DoorId)
end

AITable[5363] = CAI_5363
