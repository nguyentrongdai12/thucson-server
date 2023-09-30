--------------------------------------------------------
--白骨神君进入战斗脚本
--------------------------------------------------------
CAI_5659 = class(CAIObject)
function CAI_5659:ctor(id,objid)	
end

function CAI_5659:OnEnterBattle()
    --self.dwSpawnFlag = 1
    Say(self.ObjID,L( "msg_script_5659"))
    Npc5693_ObjId = GetNpcIdByTypeId(self.ObjID,5693)
    ActivePatrol(Npc5693_ObjId)
end
AITable[5659] = CAI_5659
--------------------------------------------------------
--枯骨魔自动走路脚本
--------------------------------------------------------
CAI_5693 = class(CAIObject)

function CAI_5693:ctor(id,objid)	   
end

AITable[5693] = CAI_5693

--AITable[5675] = CAI_5675