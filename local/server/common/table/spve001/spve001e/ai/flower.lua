CAI_5381 = class(CAIObject)
function CAI_5381:ctor(id, objid)
end

function CAI_5381:OnDead(killer)
    if (IsDead(GetNpcIdByTypeId(self.ObjID, 5408)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5409)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5410)) == 1) then
		local NpcId = GetNpcIdByTypeId(self.ObjID, 5383);
		GotoState(NpcId, "Special")
	end
end

AITable[5381] = CAI_5381

------------------------------------------------------------

CAI_5408 = class(CAIObject)
function CAI_5408:ctor(id, objid)
end

function CAI_5408:OnDead(killer)
    if (IsDead(GetNpcIdByTypeId(self.ObjID, 5381)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5409)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5410)) == 1) then
		local NpcId = GetNpcIdByTypeId(self.ObjID, 5383);
		GotoState(NpcId, "Special")
	end
end

AITable[5408] = CAI_5408

------------------------------------------------------------

CAI_5409 = class(CAIObject)
function CAI_5409:ctor(id, objid)
end

function CAI_5409:OnDead(killer)
    if (IsDead(GetNpcIdByTypeId(self.ObjID, 5381)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5408)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5410)) == 1) then
		local NpcId = GetNpcIdByTypeId(self.ObjID, 5383);
		GotoState(NpcId, "Special")
	end
end

AITable[5409] = CAI_5409

------------------------------------------------------------

CAI_5410 = class(CAIObject)
function CAI_5410:ctor(id, objid)
end

function CAI_5410:OnDead(killer)
    if (IsDead(GetNpcIdByTypeId(self.ObjID, 5381)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5408)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5409)) == 1) then
		local NpcId = GetNpcIdByTypeId(self.ObjID, 5383);
		GotoState(NpcId, "Special")
	end
end

AITable[5410] = CAI_5410

------------------------------------------------------------

CAI_5383 = class(CAIObject)
function CAI_5383:ctor(id, objid)
    self.dwLastSpecial = 0
end

function CAI_5383:OnSpecialState(dwNow)
    if self.dwLastSpecial == -1 then
        return
    end

    if self.dwLastSpecial == 0 then
		self.dwLastSpecial = dwNow
		
		PlayPose(self.ObjID, "effect", false)
		
		return
	end
	
	if dwNow - self.dwLastSpecial > 2 then
	    self.dwLastSpecial = -1

	    CreateNpc(self.ObjID, 5379, 343, -444, 6)

	    CreateNpc(self.ObjID, 5380, 342, -447, 10)
	    CreateNpc(self.ObjID, 5411, 340, -444, 12)
	    CreateNpc(self.ObjID, 5412, 343, -442, 14)
	    CreateNpc(self.ObjID, 5413, 344, -442, 2)
	    CreateNpc(self.ObjID, 5414, 346, -444, 4)
	    CreateNpc(self.ObjID, 5415, 344, -447, 6)
	    
	    Disappear(self.ObjID)
	end
end

AITable[5383] = CAI_5383

----------------------------------------------------------

CAI_5379 = class(CAIObject)
function CAI_5379:ctor(id, objid)
    self.dwLastSpecial = 0
end

function CAI_5379:OnDead(killer)
    
    for i=1,40 do
    local Random = math.random(-25, 25);
    local Random1 = math.random(-25, 25);
    CreateNpc(self.ObjID,5442,347+Random,-443+Random1,15)
    end
    for j=1,10 do
    local Random = math.random(-25, 25);
    local Random1 = math.random(-25, 25);
    CreateNpc(self.ObjID,5461,347+Random,-443+Random1,15)
    end
    CreateNpc(self.ObjID,5440,343,-443,12)
    Disappear(GetNpcIdByTypeId(self.ObjID, 5380));
    Disappear(GetNpcIdByTypeId(self.ObjID, 5411));
    Disappear(GetNpcIdByTypeId(self.ObjID, 5412));
    Disappear(GetNpcIdByTypeId(self.ObjID, 5413));
    Disappear(GetNpcIdByTypeId(self.ObjID, 5414));
    Disappear(GetNpcIdByTypeId(self.ObjID, 5415));

    DisappearNpcRebornArea(21, 6)
    DisappearNpcRebornArea(21, 8)

    ActiveNpcRebornArea(21, 6, 0)
    ActiveNpcRebornArea(21, 8, 0)

 local DoorId = GetNpcIdByTypeId(self.ObjID, 5416);
	Die(DoorId)
	DoorId = GetNpcIdByTypeId(self.ObjID, 5417);
	Die(DoorId)
end



AITable[5379] = CAI_5379
------------------------------------------------------------------------
CAI_5354 = class(CAIObject)
function CAI_5354:ctor(id, objid)
end
function CAI_5354:OnDead(killer)
    for i=1,3 do
    CreateNpc(self.ObjID,5442,0,0,15)
    end
end
AITable[5354] = CAI_5354