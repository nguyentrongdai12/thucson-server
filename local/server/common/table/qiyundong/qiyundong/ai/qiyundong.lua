CAI_5550 = class(CAIObject)
function CAI_5550:ctor(id, objid)
end

function CAI_5550:OnInteractive(uid, event)	
	local content
	if event=="defaulttalk" then
		content = GetFileContent("talk/npc_talk_5550.xml")
		content = ReplaceUserName(content, uid)
		content = ReplaceNpcObjId(content, self.ObjID)
		print(content)
	elseif event=="Step2" then
		print("hello world")
		local Npc5551Id = CreateNpc(self.ObjID , 5551, 604, 594, 8)
		GotoState(Npc5551Id, "Special")
		Disappear(self.ObjID)
	end
	
	return content
end

AITable[5550] = CAI_5550

-------------------------------------------------------------------------------------------------------------


CAI_5551 = class(CAIObject)
function CAI_5551:ctor(id, objid)
	self.dwLastSpecial = 0
	self.dw1GroupMonster = 0
	self.dw2GroupMonster = 0
	self.dw3GroupMonster = 0
	self.dw4GroupMonster = 0
	self.dw5GroupMonster = 0
end

function CAI_5551:OnDead(killer)
    Say(self.ObjID, L("msg_script_5551"))
    CreateNpc(self.ObjID , 5561, 604, 594, 8)
end


function CAI_5551:OnSpecialState(dwNow)
    if self.dwLastSpecial == -1 then
		return
	end

	if self.dwLastSpecial == 0 then
		self.dwLastSpecial = dwNow
	end
	
	local NpcId = 0;

	if dwNow - self.dwLastSpecial > 1 then
		if self.dw1GroupMonster == 0 then
		    self.dw1GroupMonster = 1
		    NpcId = CreateNpc(self.ObjID , 5553, 603, 548, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5553, 602, 548, 8)
		    --ActivePatrol(NpcId)
		    NpcId = CreateNpc(self.ObjID , 5554, 565, 617, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5554, 564, 617, 8)
		    --ActivePatrol(NpcId)
		    NpcId = CreateNpc(self.ObjID , 5555, 644, 617, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5555, 643, 617, 8)
		    --ActivePatrol(NpcId)
		end
	end
	
	if dwNow - self.dwLastSpecial > 20 then
		if self.dw2GroupMonster == 0 then
		    self.dw2GroupMonster = 1
		    NpcId = CreateNpc(self.ObjID , 5556, 564, 572, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5556, 563, 572, 8)
		    --ActivePatrol(NpcId)
		    NpcId = CreateNpc(self.ObjID , 5557, 604, 640, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5557, 603, 640, 8)
		    --ActivePatrol(NpcId)
		    NpcId = CreateNpc(self.ObjID , 5558, 644, 572, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5558, 643, 572, 8)
		    --ActivePatrol(NpcId)
		end
	end
	
	if dwNow - self.dwLastSpecial > 40 then
		if self.dw3GroupMonster == 0 then
		    self.dw3GroupMonster = 1
		    NpcId = CreateNpc(self.ObjID , 5553, 603, 548, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5553, 602, 548, 8)
		    --ActivePatrol(NpcId)
		    NpcId = CreateNpc(self.ObjID , 5554, 565, 617, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5554, 564, 617, 8)
		    --ActivePatrol(NpcId)
		    NpcId = CreateNpc(self.ObjID , 5555, 644, 617, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5555, 643, 617, 8)
		    --ActivePatrol(NpcId)
		end
	end
	
	if dwNow - self.dwLastSpecial > 60 then
		if self.dw4GroupMonster == 0 then
		    self.dw4GroupMonster = 1
		    NpcId = CreateNpc(self.ObjID , 5556, 564, 572, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5556, 563, 572, 8)
		    --ActivePatrol(NpcId)
		    NpcId = CreateNpc(self.ObjID , 5557, 604, 640, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5557, 603, 640, 8)
		    --ActivePatrol(NpcId)
		    NpcId = CreateNpc(self.ObjID , 5558, 644, 572, 8)
		    ActivePatrol(NpcId)
		    --NpcId = CreateNpc(self.ObjID , 5558, 643, 572, 8)
		    --ActivePatrol(NpcId)
		end
	end
	
	if dwNow - self.dwLastSpecial > 80 then
		if self.dw5GroupMonster == 0 then
		    self.dw5GroupMonster = 1
		    NpcId = CreateNpc(self.ObjID , 5559, 580, 635, 8)
		    ActivePatrol(NpcId)
		end
	end
end

AITable[5551] = CAI_5551


------------------------------------------------------------------------------------------------

CAI_5559 = class(CAIObject)
function CAI_5559:ctor(id, objid)
end

function CAI_5559:OnDead(killer)
    if IsDead(GetNpcIdByTypeId(self.ObjID, 5551)) == 0 then
        local DoorId = GetNpcIdByTypeId(self.ObjID, 5552);
		Die(DoorId)
	Say(self.ObjID, L("msg_script_5559"))
    end
end

AITable[5559] = CAI_5559
