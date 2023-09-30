-------------------------------------------------------------------------------
--id= 5368 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5368 = class(CAIObject)
function CAI_5368:ctor(id, objid)
end

function CAI_5368:OnCreate(creatorid)
   local ItemId = AddItem(self.ObjID, 5710, 3, 0, 0);
	if ItemId ~= 0 then
	   Ride(self.ObjID, ItemId)
	end
end

AITable[5368] = CAI_5368

-------------------------------------------------------------------------------
--id= 5369 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5369 = class(CAIObject)
function CAI_5369:ctor(id, objid)
end

function CAI_5369:OnCreate(creatorid)
   local ItemId = AddItem(self.ObjID, 5712, 3, 0, 0);
	if ItemId ~= 0 then
	   Ride(self.ObjID, ItemId)
	end
end

AITable[5369] = CAI_5369
-------------------------------------------------------------------------------
--id= 5371 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5371 = class(CAIObject)
function CAI_5371:ctor(id, objid)
end

function CAI_5371:OnCreate(creatorid)
   local ItemId = AddItem(self.ObjID, 5711, 3, 0, 0);
	if ItemId ~= 0 then
	   Ride(self.ObjID, ItemId)
	end
end

AITable[5371] = CAI_5371