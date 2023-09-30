	local hidelist = 
	{
		"layWorld.frmLargescalePVE.1900",
		"layWorld.frmLargescalePVE.lbuserpoint",
		"layWorld.frmLargescalePVERank",
		"layWorld.frmLargescalePVE.btnUserContent",
		"layWorld.frmEntrust.16335",
		"layWorld.frmEntrust.1300",
		"layWorld.frmEntrust.ebxGold",	
		"layWorld.frmCalenderUserEventCreate.cbDoSync",
		"layWorld.frmCalenderUserEventCreate.edbRecever",	
		"layWorld.frmCalenderUserEventCreate.4244",	
		"layWorld.frmCalenderUserEventCreate.3027",	

	};

local op = nil;
local function Hide(name)
	op = uiGetglobal(name)
	if op == nil then
		uiError (string.format("widget not find error [%s]", name))
		return false;
	end
	op:Hide();
	return true;
end

for i, v in ipairs(hidelist) do
	print(Hide(v))
end
