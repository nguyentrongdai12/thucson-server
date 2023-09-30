CAI_5406 = class(CAIObject)
function CAI_5406:ctor(id, objid)
end

function CAI_5406:OnDead(killer)
    for i=1,15 do
      local Random1 = math.random(-15, 15);
      local Random2 = math.random(-15, 15);
      CreateNpc(self.ObjID,5442,554+Random1,-447+Random2,15)
    end
    for j=1,5 do
      local Random1 = math.random(-15, 15);
       local Random2 = math.random(-15, 15);
      CreateNpc(self.ObjID,5461,554+Random1,-447+Random2,15)
    end
    if(IsDead(GetNpcIdByTypeId(self.ObjID, 5407)) == 1) then
       local NpcId = GetNpcIdByTypeId(self.ObjID, 5421);
        Disappear(NpcId);
       CreateNpc(self.ObjID,5441,565,-454,12)
    end
end

AITable[5406] = CAI_5406;

---------------------------------------------------------------------------------

CAI_5407 = class(CAIObject)
function CAI_5407:ctor(id, objid)
end

function CAI_5407:OnDead(killer)
    
     for i=1,15 do
       local Random1 = math.random(-15, 15);
       local Random2 = math.random(-15, 15);
       CreateNpc(self.ObjID,5442,554+Random1,-447+Random2,15)
     end
    for j=1,5 do
      local Random1 = math.random(-15, 15);
      local Random2 = math.random(-15, 15);
      CreateNpc(self.ObjID,5461,554+Random1,-447+Random2,15)
    end
    if(IsDead(GetNpcIdByTypeId(self.ObjID, 5406)) == 1) then
       local NpcId = GetNpcIdByTypeId(self.ObjID, 5421);
        Disappear(NpcId);
      CreateNpc(self.ObjID,5441,565,-454,12)
    end
end

AITable[5407] = CAI_5407;

