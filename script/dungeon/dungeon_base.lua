
include("script/game_script_base.lua")

DungeonTable = {}
DungeonObjectTable = {}


-- ������������¼� -- 

EV_MIN                              = 0

EV_DUNGEON_BEGIN                    = 1     -- ������ʼ
EV_DUNGEON_END                      = 2     -- ��������
EV_DUNGEON_1SEC_TIMER               = 3     -- ÿ���Ӵ����������У�
EV_DUNGEON_1SEC_TIMER_DEAD          = 4     -- ÿ���Ӵ���������������

EV_DUNGEON_ACTOR_DEAD               = 20    -- ����������
EV_DUNGEON_ACTOR_REVIVE             = 21    -- �����߸���
EV_DUNGEON_ACTOR_APPLYQUIT          = 22    -- �����߱��������������˳�

EV_DUNGEON_MASS_CREATE              = 50    -- ��ͨNPC����
EV_DUNGEON_MASS_DEAD                = 51    -- ��ͨNPC����



-- ������������Ӫ --
DUNGEON_FACTION_INVALID             = 0
DUNGEON_FACTION1                    = 1     -- ��Ӫ1��ͨ���������巽��
DUNGEON_FACTION2                    = 2     -- ��Ӫ2��ͨ������а�񷽣�
DUNGEON_FACTION_OBSERVER            = 4     -- ����
DUNGEON_FACTION_NEUTRAL             = 8     -- ������Ӫ��ֻ��NPC��û����ң�
DUNGEON_FACTION_ALL                 = 255


DUNGEON_PVP                         = 0     -- PvP
DUNGEON_PVE                         = 1     -- PvE


RICH_TEXT_BEGIN     = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><UiRichText>";
RICH_TEXT_END       = "</UiRichText>";


-- �������� --

function GetDungeonScriptType(idx)
    if DungeonTable[idx]~=nil then
        return DungeonTable[idx]
    else
        return nil
    end
end


function CreateDungeonObject(idx, objid)
	if DungeonTable[idx] then
		if DungeonObjectTable[objid]==nil then
			DungeonObjectTable[objid] = DungeonTable[idx].new(idx, objid)
			--OutputLog("����DungeonObject��dungeonIndex = "..idx..", objId = "..objid)
		end
		return DungeonObjectTable[objid]
	else
		return nil
	end
end


function DestroyDungeonObject(idx, objid)
	if DungeonObjectTable[objid] then
		DungeonObjectTable[objid]=nil
		--OutputLog("����DungenObject��dungeonIndex = "..idx..", objId = "..objid)
	end
end

