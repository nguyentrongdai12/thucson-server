CAI_5374 = class(CAIObject)
function CAI_5374:ctor(id, objid)
end

function CAI_5374:OnDead(killer)
        for i=1,8 do
         local Random = math.random(-8, 8);
         local Random1 = math.random(-8, 8);
         CreateNpc(self.ObjID,5442,250+Random,-140+Random1,15)
        end
        for j=1,3 do
          local Random = math.random(-8, 8);
          local Random1 = math.random(-8, 8);
          CreateNpc(self.ObjID,5461,250+Random,-140+Random1,15)
        end
        local DoorId = GetNpcIdByTypeId(self.ObjID, 5362);
	Die(DoorId)
	DisappearNpcRebornArea(21, 7)
        ActiveNpcRebornArea(21, 7, 0)
        
end

function CAI_5374:OnEnterBattle()
	Say(self.ObjID, L("msg_script_5374"))
end

AITable[5374] = CAI_5374