-------------------------------------------------------------------------------
--id= 5370 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5370 = class(CAIObject)
function CAI_5370:ctor(id, objid)
end

function CAI_5370:OnCreate(creatorid)
   local ItemId = AddItem(self.ObjID, 5713, 3, 0, 0);
	if ItemId ~= 0 then
	   Ride(self.ObjID, ItemId)
	end
end

AITable[5370] = CAI_5370

-------------------------------------------------------------------------------
--id= 5372 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5372 = class(CAIObject)
function CAI_5372:ctor(id, objid)
end

function CAI_5372:OnCreate(creatorid)
   local ItemId = AddItem(self.ObjID, 5714, 3, 0, 0);
	if ItemId ~= 0 then
	   Ride(self.ObjID, ItemId)
	end
end

AITable[5372] = CAI_5372