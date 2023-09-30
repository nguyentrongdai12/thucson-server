-------------------------------------------------------------------------------
--id= 5339 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5339 = class(CAIObject)
function CAI_5339:ctor(id, objid)
end

function CAI_5339:OnInteractive(uid, event)	
	local content
	if event=="defaulttalk" then
		if CheckUserDoingTask(uid, 1682) == 1 then
			if GetItemCount(uid, 5576) > 1 then
			    Say(self.ObjID, L("msg_script_5339_1"))
			else
			    Say(self.ObjID, L("msg_script_5339_2"))
			    AddItem(uid,5576,0,0,1)
			end
		end
	end
	return content
end

AITable[5339] = CAI_5339

-------------------------------------------------------------------------------
--id= 5340 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5340 = class(CAIObject)
function CAI_5340:ctor(id, objid)
end

function CAI_5340:OnInteractive(uid, event)	
	local content
	if event=="defaulttalk" then
		if CheckUserDoingTask(uid, 1682) == 1 then
			if GetItemCount(uid, 5577) > 1 then
			    Say(self.ObjID, L("msg_script_5340_1"))
			else
			    Say(self.ObjID, L("msg_script_5340_2"))
			    AddItem(uid,5577,0,0,1)
			end
		end
	end
	return content
end

AITable[5340] = CAI_5340

-------------------------------------------------------------------------------
--id= 5341 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5341 = class(CAIObject)
function CAI_5341:ctor(id, objid)
end

function CAI_5341:OnInteractive(uid, event)	
	local content
	if event=="defaulttalk" then
		if CheckUserDoingTask(uid, 1682) == 1 then
			if GetItemCount(uid, 5578) > 1 then
			    Say(self.ObjID, L("msg_script_5341_1"))
			else
			    Say(self.ObjID, L("msg_script_5341_2"))
			    AddItem(uid,5578,0,0,1)
			end
		end
	end
	return content
end

AITable[5341] = CAI_5341

-------------------------------------------------------------------------------
--id= 5342 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5342 = class(CAIObject)
function CAI_5342:ctor(id, objid)
end

function CAI_5342:OnInteractive(uid, event)	
	local content
	if event=="defaulttalk" then
		if CheckUserDoingTask(uid, 1682) == 1 then
			if GetItemCount(uid, 5579) > 1 then
			    Say(self.ObjID, L("msg_script_5342_1"))
			else
			    Say(self.ObjID, L("msg_script_5342_2"))
			    AddItem(uid,5579,0,0,1)
			end
		end
	end
	return content
end

AITable[5342] = CAI_5342