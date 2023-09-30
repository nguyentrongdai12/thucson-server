CAI_5177 = class(CAIObject)
function CAI_5177:ctor(id, objid)
end

function CAI_5177:OnInteractive(uid, event)	
	local content=""

	if event=="defaulttalk" then
		content = GetFileContent("talk/npc_talk_5177_01.xml")
	elseif event=="duel" then
		local dwNpc5172Id = GetNpcIdByTypeId(self.ObjID, 5172)
		if dwNpc5172Id == 0 then
			return
		end
		if AIObjTable[dwNpc5172Id] == nil then
			return
		end
		AIObjTable[dwNpc5172Id].dwTar = 0
		SetPosition(uid, 369, 606)
	end

	return content
end

AITable[5177] = CAI_5177

---------------------------------------------------------

CAI_5172 = class(CAIObject)
function CAI_5172:ctor(id, objid)
    self.dwTar = 0
end

function CAI_5172:OnInteractive(uid, event)
    local content=""

	if event=="defaulttalk" then

		if self.dwTar ~= 0 then
			content = GetFileContent("talk/npc_talk_5172.xml")
		else
			content = GetFileContent("talk/npc_talk_5172_01.xml")
		end

	elseif event=="duel" then
		self.dwTar = uid
		SetPosition(uid, 354, 587)
	end

	return content
end

AITable[5172] = CAI_5172

------------------------------------------------------------------------------------------------------------------
CAI_5178 = class(CAIObject)
function CAI_5178:ctor(id, objid)
end

function CAI_5178:OnInteractive(uid, event)	
	local content=""

	if event=="defaulttalk" then
		content = GetFileContent("talk/npc_talk_5177_01.xml")
	elseif event=="duel" then
		local dwNpc5173Id = GetNpcIdByTypeId(self.ObjID, 5173)
		if dwNpc5173Id == 0 then
			return
		end
		if AIObjTable[dwNpc5173Id] == nil then
			return
		end
		AIObjTable[dwNpc5173Id].dwTar = 0
		SetPosition(uid, 355, 623)
	end

	return content
end

AITable[5178] = CAI_5178

---------------------------------------------------------

CAI_5173 = class(CAIObject)
function CAI_5173:ctor(id, objid)
    self.dwTar = 0
end

function CAI_5173:OnInteractive(uid, event)
    local content=""

	if event=="defaulttalk" then

		if self.dwTar ~= 0 then
			content = GetFileContent("talk/npc_talk_5172.xml")
		else
			content = GetFileContent("talk/npc_talk_5173_01.xml")
		end

	elseif event=="duel" then
		self.dwTar = uid
		SetPosition(uid, 334, 628)
	end

	return content
end

AITable[5173] = CAI_5173
------------------------------------------------------------------------------------------------------------------
CAI_5179 = class(CAIObject)
function CAI_5179:ctor(id, objid)
end

function CAI_5179:OnInteractive(uid, event)	
	local content=""

	if event=="defaulttalk" then
		content = GetFileContent("talk/npc_talk_5177_01.xml")
	elseif event=="duel" then
		local dwNpc5174Id = GetNpcIdByTypeId(self.ObjID, 5174)
		if dwNpc5174Id == 0 then
			return
		end
		if AIObjTable[dwNpc5174Id] == nil then
			return
		end
		AIObjTable[dwNpc5174Id].dwTar = 0
		SetPosition(uid, 371, 644)
	end

	return content
end

AITable[5179] = CAI_5179

---------------------------------------------------------

CAI_5174 = class(CAIObject)
function CAI_5174:ctor(id, objid)
    self.dwTar = 0
end

function CAI_5174:OnInteractive(uid, event)
    local content=""

	if event=="defaulttalk" then

		if self.dwTar ~= 0 then
			content = GetFileContent("talk/npc_talk_5172.xml")
		else
			content = GetFileContent("talk/npc_talk_5174_01.xml")
		end

	elseif event=="duel" then
		self.dwTar = uid
		SetPosition(uid, 369, 664)
	end

	return content
end

AITable[5174] = CAI_5174
------------------------------------------------------------------------------------------------------------------
CAI_5180 = class(CAIObject)
function CAI_5180:ctor(id, objid)
end

function CAI_5180:OnInteractive(uid, event)	
	local content=""

	if event=="defaulttalk" then
		content = GetFileContent("talk/npc_talk_5177_01.xml")
	elseif event=="duel" then
		local dwNpc5175Id = GetNpcIdByTypeId(self.ObjID, 5175)
		if dwNpc5174Id == 0 then
			return
		end
		if AIObjTable[dwNpc5175Id] == nil then
			return
		end
		AIObjTable[dwNpc5175Id].dwTar = 0
		SetPosition(uid, 395, 634)
	end

	return content
end

AITable[5180] = CAI_5180

---------------------------------------------------------

CAI_5175 = class(CAIObject)
function CAI_5175:ctor(id, objid)
    self.dwTar = 0
end

function CAI_5175:OnInteractive(uid, event)
    local content=""

	if event=="defaulttalk" then

		if self.dwTar ~= 0 then
			content = GetFileContent("talk/npc_talk_5172.xml")
		else
			content = GetFileContent("talk/npc_talk_5175_01.xml")
		end

	elseif event=="duel" then
		self.dwTar = uid
		SetPosition(uid, 414, 644)
	end

	return content
end

AITable[5175] = CAI_5175
------------------------------------------------------------------------------------------------------------------
CAI_5181 = class(CAIObject)
function CAI_5181:ctor(id, objid)
end

function CAI_5181:OnInteractive(uid, event)	
	local content=""

	if event=="defaulttalk" then
		content = GetFileContent("talk/npc_talk_5177_01.xml")
	elseif event=="duel" then
		local dwNpc5176Id = GetNpcIdByTypeId(self.ObjID, 5176)
		if dwNpc5176Id == 0 then
			return
		end
		if AIObjTable[dwNpc5176Id] == nil then
			return
		end
		AIObjTable[dwNpc5176Id].dwTar = 0
		SetPosition(uid, 394, 609)
	end

	return content
end

AITable[5181] = CAI_5181

---------------------------------------------------------

CAI_5176 = class(CAIObject)
function CAI_5176:ctor(id, objid)
    self.dwTar = 0
end

function CAI_5176:OnInteractive(uid, event)
    local content=""

	if event=="defaulttalk" then

		if self.dwTar ~= 0 then
			content = GetFileContent("talk/npc_talk_5172.xml")
		else
			content = GetFileContent("talk/npc_talk_5176_01.xml")
		end

	elseif event=="duel" then
		self.dwTar = uid
		SetPosition(uid, 412, 596)
	end

	return content
end

AITable[5176] = CAI_5176
-------------------------------------------------------------------------------

CAI_5158 = class(CAIObject)
function CAI_5158:ctor(id, objid)
end

function CAI_5158:OnHpLower(rate)
	if rate<=20 then
	CreateNpc(self.ObjID, 5159, 0, 0, 0)
	Disappear(self.ObjID)

	end
end

AITable[5158] = CAI_5158
-------------------------------------------------------------------------------

CAI_5159 = class(CAIObject)
function CAI_5159:ctor(id, objid)
end

function CAI_5159:OnDead(nKillerId)
	CreateNpc(self.ObjID, 5160, 0, 0, 0)
	Disappear(self.ObjID)
end

AITable[5159] = CAI_5159

-----------------------------------------------------------------------------------------
CAI_5192 = class(CAIObject)
function CAI_5192:ctor(id, objid)
	self.dwTime = 0
end
function CAI_5192:OnCreate(rate)
	GotoState(self.ObjID, "Special")
end

function CAI_5192:OnSpecialState(dwNow)
	if self.dwTime ==0 then
		self.dwTime = dwNow
		PlayPose(self.ObjID, "effect", false)
		return
	end

	if dwNow-self.dwTime >2 then
		local id
		id = CreateNpcDis(self.ObjID, 5193,0,0)
		CopyHateList_Ex(self.ObjID, id, true)
		Disappear(self.ObjID)
	end
end

AITable[5192] = CAI_5192

-------------------------------------------------------------------------------
--id= 5161 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5161 = class(CAIObject)
function CAI_5161:ctor(id, objid)
end

function CAI_5161:OnDead(nid, noid)

	if (IsDead(GetNpcIdByTypeId(self.ObjID, 5162)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5163)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5164)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5165)) == 1) then

		local Door5171 = GetNpcIdByTypeId(self.ObjID, 5171);
		Disappear(Door5171)

		local Door5194 = GetNpcIdByTypeId(self.ObjID, 5194);
		Disappear(Door5194)

		local Door5195 = GetNpcIdByTypeId(self.ObjID, 5195);
		Disappear(Door5195)

		local Door5196 = GetNpcIdByTypeId(self.ObjID, 5196);
		Disappear(Door5196)

	end
end

function CAI_5161:OnHpLower(rate)
	if rate<=20 then
		Say(self.ObjID, L("msg_script_5161_onhplower_0"))
		CheckUseSkill(self.ObjID, 1268, 0, 0)
	elseif rate>20 and rate<=40 then
		Say(self.ObjID, L("msg_script_5161_onhplower_20"))
		CheckUseSkill(self.ObjID, 1265, 0, 0)
	elseif rate>40 and rate<=60 then
		Say(self.ObjID, L("msg_script_5161_onhplower_40"))
		CheckUseSkill(self.ObjID, 1268, 0, 0)
	elseif rate>60 and rate<80 then
		Say(self.ObjID, L("msg_script_5161_onhplower_60"))
		CheckUseSkill(self.ObjID, 1265, 0, 0)
	elseif rate>80 and rate<100 then
		Say(self.ObjID, L("msg_script_5161_onhplower_80"))
		CheckUseSkill(self.ObjID, 1268, 0, 0)

	end
end

function CAI_5161:OnEnterBattle()
	Say(self.ObjID, L("msg_script_5161_onarrive"))
	CheckUseSkill(self.ObjID, 1266, 0, 0)
end

AITable[5161] = CAI_5161

-------------------------------------------------------------------------------
--id= 5162 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5162 = class(CAIObject)
function CAI_5162:ctor(id, objid)
end

function CAI_5162:OnDead(nid, noid)
	if (IsDead(GetNpcIdByTypeId(self.ObjID, 5161)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5163)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5164)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5165)) == 1) then

		local Door5171 = GetNpcIdByTypeId(self.ObjID, 5171);
		Disappear(Door5171)

		local Door5194 = GetNpcIdByTypeId(self.ObjID, 5194);
		Disappear(Door5194)

		local Door5195 = GetNpcIdByTypeId(self.ObjID, 5195);
		Disappear(Door5195)

		local Door5196 = GetNpcIdByTypeId(self.ObjID, 5196);
		Disappear(Door5196)

	end
end

function CAI_5162:OnHpLower(rate)
	if rate<=20 then
		Say(self.ObjID, L("msg_script_5162_onhplower_0"))
		CheckUseSkill(self.ObjID, 1272, 0, 0)
	elseif rate>20 and rate<=40 then
		Say(self.ObjID, L("msg_script_5162_onhplower_20"))
		CheckUseSkill(self.ObjID, 1271, 0, 0)
	elseif rate>40 and rate<=60 then
		Say(self.ObjID, L("msg_script_5162_onhplower_40"))
		CheckUseSkill(self.ObjID, 1272, 0, 0)
	elseif rate>60 and rate<80 then
		Say(self.ObjID, L("msg_script_5162_onhplower_60"))
		CheckUseSkill(self.ObjID, 1271, 0, 0)
	elseif rate>80 and rate<100 then
		Say(self.ObjID, L("msg_script_5162_onhplower_80"))
		CheckUseSkill(self.ObjID, 1272, 0, 0)

	end
end
function CAI_5162:OnEnterBattle()
	Say(self.ObjID, L("msg_script_5162_onarrive"))
	CheckUseSkill(self.ObjID, 1271, 0, 0)
end

AITable[5162] = CAI_5162
-------------------------------------------------------------------------------
--id= 5163 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5163 = class(CAIObject)
function CAI_5163:ctor(id, objid)
end

function CAI_5163:OnDead(nid, noid)
	if (IsDead(GetNpcIdByTypeId(self.ObjID, 5162)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5161)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5164)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5165)) == 1) then

		local Door5171 = GetNpcIdByTypeId(self.ObjID, 5171);
		Disappear(Door5171)

		local Door5194 = GetNpcIdByTypeId(self.ObjID, 5194);
		Disappear(Door5194)

		local Door5195 = GetNpcIdByTypeId(self.ObjID, 5195);
		Disappear(Door5195)

		local Door5196 = GetNpcIdByTypeId(self.ObjID, 5196);
		Disappear(Door5196)

	end
end

AITable[5163] = CAI_5163

-------------------------------------------------------------------------------
--id= 5164 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5164 = class(CAIObject)
function CAI_5164:ctor(id, objid)
end

function CAI_5164:OnDead(nid, noid)
	if (IsDead(GetNpcIdByTypeId(self.ObjID, 5162)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5163)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5161)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5165)) == 1) then

		local Door5171 = GetNpcIdByTypeId(self.ObjID, 5171);
		Disappear(Door5171)

		local Door5194 = GetNpcIdByTypeId(self.ObjID, 5194);
		Disappear(Door5194)

		local Door5195 = GetNpcIdByTypeId(self.ObjID, 5195);
		Disappear(Door5195)

		local Door5196 = GetNpcIdByTypeId(self.ObjID, 5196);
		Disappear(Door5196)

	end
end

function CAI_5164:OnHpLower(rate)
	if rate<=20 then
		Say(self.ObjID, L("msg_script_5164_onhplower_0"))
		CheckUseSkill(self.ObjID, 1278, 0, 0)
	elseif rate>20 and rate<=40 then
		Say(self.ObjID, L("msg_script_5164_onhplower_20"))
		CheckUseSkill(self.ObjID, 1277, 0, 0)
	elseif rate>40 and rate<=60 then
		Say(self.ObjID, L("msg_script_5164_onhplower_40"))
		CheckUseSkill(self.ObjID, 1278, 0, 0)
	elseif rate>60 and rate<80 then
		Say(self.ObjID, L("msg_script_5164_onhplower_60"))
		CheckUseSkill(self.ObjID, 1277, 0, 0)
	elseif rate>80 and rate<100 then
		Say(self.ObjID, L("msg_script_5164_onhplower_80"))
		CheckUseSkill(self.ObjID, 1278, 0, 0)

	end
end
function CAI_5164:OnEnterBattle()
	Say(self.ObjID, L("msg_script_5164_onarrive"))
	CheckUseSkill(self.ObjID, 1277, 0, 0)
end

AITable[5164] = CAI_5164
-------------------------------------------------------------------------------

--5167
-------------------------------------------------------------------------------
CAI_5167 = class(CAIObject)
function CAI_5167:ctor(id, objid)
end

function CAI_5167:OnDead(nKillerId)
	CreateNpc(self.ObjID, 5182, 93, 158, 8)
end

AITable[5167] = CAI_5167
-------------------------------------------------------------------------------
--5166
-------------------------------------------------------------------------------
CAI_5166 = class(CAIObject)
function CAI_5166:ctor(id, objid)
end
function CAI_5166:OnDead(nKillerId)
	local DoorId = GetNpcIdByTypeId(self.ObjID, 5451);
	GotoState(DoorId, "Open")
end


AITable[5166] = CAI_5166
-------------------------------------------------------------------------------
--5168
-------------------------------------------------------------------------------
CAI_5168 = class(CAIObject)
function CAI_5168:ctor(id, objid)
end
function CAI_5168:OnDead(nKillerId)
	local DoorId = GetNpcIdByTypeId(self.ObjID, 5452);
	GotoState(DoorId, "Open")
end


AITable[5168] = CAI_5168
-------------------------------------------------------------------------------
--id= 5165 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5165 = class(CAIObject)
function CAI_5165:ctor(id, objid)
end

function CAI_5165:OnDead(nid, noid)
	if (IsDead(GetNpcIdByTypeId(self.ObjID, 5162)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5163)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5164)) == 1) and (IsDead(GetNpcIdByTypeId(self.ObjID, 5161)) == 1) then

		local Door5171 = GetNpcIdByTypeId(self.ObjID, 5171);
		Disappear(Door5171)

		local Door5194 = GetNpcIdByTypeId(self.ObjID, 5194);
		Disappear(Door5194)

		local Door5195 = GetNpcIdByTypeId(self.ObjID, 5195);
		Disappear(Door5195)

		local Door5196 = GetNpcIdByTypeId(self.ObjID, 5196);
		Disappear(Door5196)

	end
end

function CAI_5165:OnHpLower(rate)
	if rate<=20 then
		Say(self.ObjID, L("msg_script_5165_onhplower_0"))
		CheckUseSkill(self.ObjID, 1282, 0, 0)
	elseif rate>20 and rate<=40 then
		Say(self.ObjID, L("msg_script_5165_onhplower_20"))
		CheckUseSkill(self.ObjID, 1281, 0, 0)
	elseif rate>40 and rate<=60 then
		Say(self.ObjID, L("msg_script_5165_onhplower_40"))
		CheckUseSkill(self.ObjID, 1282, 0, 0)
	elseif rate>60 and rate<80 then
		Say(self.ObjID, L("msg_script_5165_onhplower_60"))
		CheckUseSkill(self.ObjID, 1281, 0, 0)
	elseif rate>80 and rate<100 then
		Say(self.ObjID, L("msg_script_5165_onhplower_80"))
		CheckUseSkill(self.ObjID, 1282, 0, 0)

	end
end
function CAI_5165:OnEnterBattle()
	Say(self.ObjID, L("msg_script_5165_onarrive"))
	CheckUseSkill(self.ObjID, 1281, 0, 0)
end

AITable[5165] = CAI_5165

-------------------------------------------------------------------------------
--id= 5169 的脚本ai实现
-------------------------------------------------------------------------------
CAI_5169 = class(CAIObject)
function CAI_5169:OnDead(killer)
local strUsername = GetUserNameByObjId(killer);
local strBossBroad = string.format(L("msg_media_killboss70"), strUsername);
if UserIsGM(killer) == false then
	BroadcastMedia(strBossBroad,3);
       OutputLog("false");
end

end

AITable[5169] = CAI_5169
