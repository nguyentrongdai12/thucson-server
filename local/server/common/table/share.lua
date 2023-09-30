SceneClassTable = {}
SceneObjTable = {}

function CreateScene(nTypeId, nObjId)
    if SceneClassTable[nTypeId] == nil then
        return nil
    end   

    if SceneObjTable[nObjId] == nil then
    	SceneObjTable[nObjId] = SceneClassTable[nTypeId].new(nTypeId, nObjId)
    end
		
    return SceneObjTable[nObjId]
end

function OnCreateScene(nTypeId, nObjId)
    local Scene = CreateScene(nTypeId, nObjId)
    if Scene == nil then
        return 1
    end

    return Scene:OnCreateScene()
end

function OnDestroyScene(nTypeId, nObjId)
    local Scene = CreateScene(nTypeId, nObjId)
    if Scene == nil then
        return
    end

    Scene:OnDestroyScene()

    SceneObjTable[nObjId] = nil
end

function OnTimer(nTypeId, nObjId, dwTimerId, dwNow)
    local Scene = CreateScene(nTypeId, nObjId)
    if Scene == nil then
        return
    end

    Scene:OnTimer(dwTimerId, dwNow)
end

function OnEvent(nTypeId, nObjId, szEvent, ...)
    local Scene = CreateScene(nTypeId, nObjId)
    if Scene == nil then
        return
    end

    Scene:OnEvent(szEvent, unpack(arg))
end

function OnNpcRemove(nTypeId, nObjId, nNpcId, nNpcObjId)
    local Scene = CreateScene(nTypeId, nObjId)
    if Scene == nil then
        return
    end

    Scene:OnNpcRemove(nNpcId, nNpcObjId)
end

function OnCreTriggerAreaChange(nTypeId, nObjId, nCreId, nOldAreaId, nNewAreaId)
    local Scene = CreateScene(nTypeId, nObjId)
    if Scene == nil then
        return
    end

    Scene:OnCreTriggerAreaChange(nCreId, nOldAreaId, nNewAreaId)
end

--------------------------------------------------------------------------------

AITable = {}
AIObjTable = {}
AILanguage = {}

function GetAIType(idx)
	if AITable[idx]~=nil then
		return AITable[idx]
	else
		return nil
	end
end

function CreateAI(idx, objid)
	if AITable[idx] then
		if AIObjTable[objid]==nil then
			AIObjTable[objid] = AITable[idx].new(idx, objid)
			--OutputLog("�ű�ai���󱻴�����npcId="..idx..", objId="..objid)
		end
		return AIObjTable[objid]
	else
		return nil
	end
end

function DeleteAI(idx, objid)
	if AIObjTable[objid] then
		AIObjTable[objid]=nil
		--OutputLog("�ű�ai�������٣�npcId="..idx..", objId="..objid)
	end
end

--------------------------------------------------------------------
--�ַ����滻����  ��$USER_NAME�滻Ϊ�������
--src��Դ�ַ���
--uid��user ʵ��ID
--------------------------------------------------------------------
function ReplaceUserName(src, uid)
	local username = GetUserNameByObjId(uid)
	return string.gsub(src, "$USER_NAME",  username)
end

--------------------------------------------------------------------
--�ַ����滻����  ��$NPC_OBJID�滻Ϊnpc object id
--src��Դ�ַ���
--noid��npc ʵ��ID
--------------------------------------------------------------------
function ReplaceNpcObjId(src, noid)
	return string.gsub(src, "$NPC_OBJID", noid)
end

-------------------------------------------------------------------------------
-- �ű�ai��c���ԵĽӿں���
-------------------------------------------------------------------------------

--------------------------------------------------------------------
--�¼� ��OnDestroy��
--OnDestroy �ݻٽű�ai����ĳЩ�����Ҫ
--��ʽ noid   / nid    
--     ʵ��ID / ���ID
--------------------------------------------------------------------
function OnDestroy(noid, nid)
	local aitype = GetAIType(nid)
	if aitype then
		if AIObjTable[noid] then
			AIObjTable[noid]=nil
			--OutputLog("�ű�ai����ǿ�����٣�npcId="..nid.." noid="..noid)
		end
	end
end

--------------------------------------------------------------------
--�¼� ��OnCreate��
--OnCreate npc������������ʱ��
--��ʽ noid   / nid    
--     ʵ��ID / ���ID 
--------------------------------------------------------------------
function OnCreate(noid, nid, creatorid)
	--OutputLog("OnCreate called nid="..nid.."noid="..noid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnCreate(creatorid)
	end
end

--------------------------------------------------------------------
--�¼� ��OnDead��
--OnDead ����ʱ�򴥷�
--��ʽ noid   / nid    /    killer
--     ʵ��ID / ���ID /   ��˭ɱ��
--------------------------------------------------------------------
function OnDead(noid, nid, killer)
	local aitype = GetAIType(nid)
	if aitype then
		local ai = CreateAI(nid, noid)
		ai:OnDead(killer)
		DeleteAI(nid, noid)
	end
end

--------------------------------------------------------------------
--�¼� ��OnFirstBeAttacked��
--OnFirstBeAttacked npc��һ���ܵ�������ʱ�򴥷�
--��ʽ noid   / nid    /    enemy
--     ʵ��ID / ���ID /   ��˭���
--------------------------------------------------------------------
function OnFirstBeAttacked(noid, nid, enemy)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnFirstBeAttacked(enemy)
	end
end

--------------------------------------------------------------------
--�¼� ��OnArrive��
--OnArrive Ѳ��npc����ĳһ��Ѳ�ߵ�ʱ�򴥷�
--��ʽ noid   / nid    /      n      / IsEndPoint   / unused
--     ʵ��ID / ���ID / ��n��Ѳ�ߵ� / �Ƿ�Ѳ���յ� / δʹ��
--------------------------------------------------------------------
function OnArrive(noid, nid, n, IsEndPoint, unused)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnArrive(n, IsEndPoint)
	end
end

--------------------------------------------------------------------
--�¼� ��OnArrivePoint��
--OnArrivePoint npc�Ѿ�����Ԥ���趨�õĵ�
--��ʽ noid   / nid    
--     ʵ��ID / ���ID 
--------------------------------------------------------------------
function OnArrivePoint(noid, nid, x, y)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnArrivePoint(x, y)
	end
end

--------------------------------------------------------------------
--�¼� ��OnBeCaptured��
--OnArrivePoint ��ĳ����Ҳ���
--��ʽ noid   / nid    
--     ʵ��ID / ���ID 
--------------------------------------------------------------------
function OnBeCaptured(noid, nid, uid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnBeCaptured(uid)
	end
end

--------------------------------------------------------------------
--�¼� ��OnHpLower��
--OnHpLower npcѪ���͵�ĳһ���ٷֱȴ�����ֻ����һ��
--��ʽ  noid  /   nid  /   rate
--     ʵ��ID / ���ID / Ѫ���ٷֱ�
--------------------------------------------------------------------
function OnHpLower(noid, nid, rate)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnHpLower(rate)
	end
end

--------------------------------------------------------------------
--OnTalk : ָnpc����˵������OnInteractive��ͬ
--��ʽ noid   / nid    /   dwNow 
--     ʵ��ID / ���ID / ��ǰʱ��
--------------------------------------------------------------------
function OnTalk(noid, nid, dwNow)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnTalk(dwNow)
	end
end

function OnBlast(noid, nid, dwNow)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnBlast(dwNow)
	end
end

--------------------------------------------------------------------
--OnInteractive ��npc�����ĺ�����ָ�����Ի���֮��Ľ�������OnTalk��ͬ
--uid: int (user object id)
--nid: int (npc id)
--event: string
--����ֵ string
--------------------------------------------------------------------
function OnInteractive(noid, nid, uid, event)
	local ai = CreateAI(nid, noid)
	if ai then
		return ai:OnInteractive(uid, event)
	else
		return ""
	end
end

--------------------------------------------------------------------
--OnTaskAccept : �������񴥷�
--��ʽ noid   / nid    /   uid   / taskid
--     ʵ��ID / ���ID / ���id  / ���ܵ�����id
--------------------------------------------------------------------
function OnTaskAccept(noid, nid, uid, taskid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnTaskAccept(uid, taskid)
	end
end

--------------------------------------------------------------------
--OnTaskFinish : ������񴥷�
--��ʽ noid   / nid    /   uid   / taskid
--     ʵ��ID / ���ID / ���id  / ��ɵ�����id
--------------------------------------------------------------------
function OnTaskFinish(noid, nid, uid, taskid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnTaskFinish(uid, taskid)
	end
end

--------------------------------------------------------------------
--OnSpecialState : ��������״̬����
--��ʽ noid   / nid    /   dwNow 
--     ʵ��ID / ���ID / ��ǰʱ��
--------------------------------------------------------------------
function OnSpecialState(noid, nid, dwNow)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnSpecialState(dwNow)
	end
end

--------------------------------------------------------------------
--OnUpdate :
--��ʽ noid   / nid    /   dwNow 
--     ʵ��ID / ���ID / ��ǰʱ��
--------------------------------------------------------------------
function OnUpdate(noid, nid, dwNow)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnUpdate(dwNow)
	end
end

--------------------------------------------------------------------
--OnLeaveBattle : ����ս������
--��ʽ noid   / nid    /   dwNow 
--     ʵ��ID / ���ID / ��ǰʱ��
--------------------------------------------------------------------
function OnLeaveBattle(noid, nid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnLeaveBattle()
	end
end

--------------------------------------------------------------------
--OnEnterBattle : ����ս������
--��ʽ noid   / nid    /   dwNow 
--     ʵ��ID / ���ID / ��ǰʱ��
--------------------------------------------------------------------
function OnEnterBattle(noid, nid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnEnterBattle()
	end
end

--------------------------------------------------------------------
--OnRunaway : ���ܴ���
--��ʽ noid   / nid    /   dwNow 
--     ʵ��ID / ���ID / ��ǰʱ��
--------------------------------------------------------------------
function OnRunaway(noid, nid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnRunaway(nid, noid)
	end
end

--------------------------------------------------------------------
--OnStartDuel : ������ʼ����
--��ʽ noid   / nid    /   tar 
--     ʵ��ID / ���ID / Ŀ��
--------------------------------------------------------------------
function OnStartDuel(noid, nid, tar)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnStartDuel(nid, noid, tar)
	end
end

--------------------------------------------------------------------
--OnEndDuel : ������������
--��ʽ noid   / nid    /   rate / tar 
--     ʵ��ID / ���ID / Ŀ��
--------------------------------------------------------------------
function OnEndDuel(noid, nid, rate, tar)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnEndDuel(nid, noid, rate, tar)
	end
end

--------------------------------------------------------------------
--OnOpen : ���Ŵ���
--��ʽ noid   / nid    /   rate / tar 
--     ʵ��ID / ���ID / Ŀ��
--------------------------------------------------------------------
function OnOpen(noid, nid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnOpen(nid, noid)
	end
end

--------------------------------------------------------------------
--OnClose : ���Ŵ���
--��ʽ noid   / nid    /   rate / tar 
--     ʵ��ID / ���ID / Ŀ��
--------------------------------------------------------------------
function OnClose(noid, nid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnClose(nid, noid)
	end
end

--------------------------------------------------------------------
--OnEnterView : ������Ұ
--��ʽ noid   / nid    /   tar 
--     ʵ��ID / ���ID / Ŀ��
--------------------------------------------------------------------
function OnEnterView(noid, nid, tar)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnEnterView(tar)
	end
end

--------------------------------------------------------------------
--OnLeaveView : �뿪��Ұ
--��ʽ noid   / nid    /   tar 
--     ʵ��ID / ���ID / Ŀ��
--------------------------------------------------------------------
function OnLeaveView(noid, nid, tar)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnLeaveView(tar)
	end
end

--------------------------------------------------------------------
--OnRecvDamage : �ܵ���������
--��ʽ noid   / nid    / srcoid   / damage
--     ʵ��ID / ���ID / ������   / �˺�ֵ
--------------------------------------------------------------------
function OnRecvDamage(noid, nid, nsrcid, ndamage)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnRecvDamage(nsrcid, ndamage)
	end
end

--------------------------------------------------------------------
-- ���£���������npc��
--------------------------------------------------------------------

--------------------------------------------------------------------
--�¼� ��OnCreate��
--OnCreate npc������������ʱ��
--��ʽ noid   / nid    
--     ʵ��ID / ���ID 
--------------------------------------------------------------------
function OnCreate_toRelated(noid, nid, fromnoid, fromnid, creatorid)
	--OutputLog("OnCreate called nid="..nid.."noid="..noid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnCreate_toRelated(fromnid, fromnoid, creatorid)
	end
end

--------------------------------------------------------------------
--�¼� ��OnDead��
--OnArrive Ѳ��npc����ĳһ��Ѳ�ߵ�ʱ�򴥷�
--��ʽ noid   / nid    /    killer
--     ʵ��ID / ���ID /   ��˭ɱ��
--------------------------------------------------------------------
function OnDead_toRelated(noid, nid, fromnoid, fromnid, killer)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnDead_toRelated(fromnid, fromnoid, killer)
	end
end

--------------------------------------------------------------------
--�¼� ��OnFirstBeAttacked��
--OnFirstBeAttacked npc��һ���ܵ�������ʱ�򴥷�
--��ʽ noid   / nid    /    enemy
--     ʵ��ID / ���ID /   ��˭���
--------------------------------------------------------------------
function OnFirstBeAttacked_toRelated(noid, nid, fromnoid, fromnid, enemy)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnFirstBeAttacked_toRelated(fromnid, fromnoid, enemy)
	end
end

--------------------------------------------------------------------
--�¼� ��OnArrive��
--OnArrive Ѳ��npc����ĳһ��Ѳ�ߵ�ʱ�򴥷�
--��ʽ noid   / nid    /      n      / IsEndPoint   / unused
--     ʵ��ID / ���ID / ��n��Ѳ�ߵ� / �Ƿ�Ѳ���յ� / δʹ��
--------------------------------------------------------------------
function OnArrive_toRelated(noid, nid, fromnoid, fromnid, n, IsEndPoint, unused)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnArrive_toRelated(fromnid, fromnoid, n, IsEndPoint)
	end
end

--------------------------------------------------------------------
--�¼� ��OnArrivePoint��
--OnArrivePoint npc�Ѿ�����Ԥ���趨�õĵ�
--��ʽ noid   / nid    
--     ʵ��ID / ���ID 
--------------------------------------------------------------------
function OnArrivePoint_toRelated(noid, nid, fromnoid, fromnid, x, y)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnArrivePoint_toRelated(fromnid, fromnoid, x, y)
	end
end

--------------------------------------------------------------------
--�¼� ��OnBeCaptured��
--OnBeCaptured ��ĳ����Ҳ���
--��ʽ noid   / nid    
--     ʵ��ID / ���ID 
--------------------------------------------------------------------
function OnBeCaptured_toRelated(noid, nid, fromnoid, fromnid, uid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnBeCaptured_toRelated(fromnid, fromnoid, uid)
	end
end

--------------------------------------------------------------------
--�¼� ��OnHpLower��
--OnHpLower npcѪ���͵�ĳһ���ٷֱȴ�����ֻ����һ��
--��ʽ  noid  /   nid  /   rate
--     ʵ��ID / ���ID / Ѫ���ٷֱ�
--------------------------------------------------------------------
function OnHpLower_toRelated(noid, nid, fromnoid, fromnid, rate)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnHpLower_toRelated(fromnid, fromnoid, rate)
	end
end

--------------------------------------------------------------------
--OnTalk : ָnpc����˵������OnInteractive��ͬ
--��ʽ noid   / nid    /   dwNow 
--     ʵ��ID / ���ID / ��ǰʱ��
--------------------------------------------------------------------
function OnTalk_toRelated(noid, nid, fromnoid, fromnid, dwNow)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnTalk_toRelated(fromnid, fromnoid, dwNow)
	end
end

--------------------------------------------------------------------
--OnInteractive ��npc�����ĺ�����ָ�����Ի���֮��Ľ�������OnTalk��ͬ
--uid: int (user object id)
--nid: int (npc id)
--event: string
--����ֵ string
--------------------------------------------------------------------
function OnInteractive_toRelated(noid, nid, fromnoid, fromnid, uid, event)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnInteractive_toRelated(fromnid, fromnoid, uid, event)
	end
end

--------------------------------------------------------------------
--OnTaskAccept : �������񴥷�
--��ʽ noid   / nid    /   uid   / taskid
--     ʵ��ID / ���ID / ���id  / ���ܵ�����id
--------------------------------------------------------------------
function OnTaskAccept_toRelated(noid, nid, fromnoid, fromnid, uid, taskid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnTaskAccept_toRelated(fromnid, fromnoid, uid, taskid)
	end
end

--------------------------------------------------------------------
--OnTaskFinish : ������񴥷�
--��ʽ noid   / nid    /   uid   / taskid
--     ʵ��ID / ���ID / ���id  / ��ɵ�����id
--------------------------------------------------------------------
function OnTaskFinish_toRelated(noid, nid, fromnoid, fromnid, uid, taskid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnTaskFinish_toRelated(fromnid, fromnoid, uid, taskid)
	end
end

--------------------------------------------------------------------
--OnSpecialState : ��������״̬����
--��ʽ noid   / nid    /   dwNow 
--     ʵ��ID / ���ID / ��ǰʱ��
--------------------------------------------------------------------
function OnSpecialState_toRelated(noid, nid, fromnoid, fromnid, dwNow)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnSpecialState_toRelated(fromnid, fromnoid, dwNow)
	end
end

--------------------------------------------------------------------
--�¼� ��OnOpen��
--��ʽ noid   / nid    /   
--     ʵ��ID / ���ID /   
--------------------------------------------------------------------
function OnOpen_toRelated(noid, nid, fromnoid, fromnid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnOpen_toRelated(fromnid, fromnoid)
	end
end

--------------------------------------------------------------------
--�¼� ��OnClose��
--��ʽ noid   / nid    /   
--     ʵ��ID / ���ID /   
--------------------------------------------------------------------
function OnClose_toRelated(noid, nid, fromnoid, fromnid)
	local ai = CreateAI(nid, noid)
	if ai then
		ai:OnClose_toRelated(fromnid, fromnoid)
	end
end
