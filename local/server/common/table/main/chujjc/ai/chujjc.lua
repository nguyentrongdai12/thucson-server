CAI_5290 = class(CAIObject)
function CAI_5290:ctor(id, objid)
end

function CAI_5290:OnCreate(creatorid)
	SendMedia(L("msg_script_5290"), 3)
end

AITable[5290] = CAI_5290

---------------------------------------------------------
CAI_5291 = class(CAIObject)
function CAI_5291:ctor(id, objid)
end

function CAI_5291:OnCreate(creatorid)
	SendMedia(L("msg_script_5291"), 3)
end

AITable[5291] = CAI_5291

---------------------------------------------------------