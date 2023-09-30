include("script/dungeon/dungeon_object.lua")

CDungeon_HuSong = class(CDungeonObject)

DungeonTable[2] = CDungeon_HuSong

function CDungeon_HuSong:ctor(idx, objectId)
    RegisterDungeonEvent(objectId, EV_DUNGEON_BEGIN);
    RegisterDungeonEvent(objectId, EV_DUNGEON_END);
    RegisterDungeonEvent(objectId, EV_DUNGEON_ACTOR_REVIVE);
    RegisterDungeonEvent(objectId, EV_DUNGEON_ACTOR_APPLYQUIT);
    --RegisterDungeonEvent(objectId, EV_DUNGEON_1SEC_TIMER);
    --RegisterDungeonEvent(objectId, EV_DUNGEON_1SEC_TIMER_DEAD);
    --RegisterDungeonEvent(objectId, EV_DUNGEON_ACTOR_DEAD);
    --RegisterDungeonEvent(objectId, EV_DUNGEON_MASS_CREATE);
    RegisterDungeonEvent(objectId, EV_DUNGEON_MASS_DEAD);

    self.AvgLevel = 0;                  -- ��ҵ�ƽ���ȼ�
    self.Protector = 0;                 -- ���͵�NPC
end

function CDungeon_HuSong:CalcAvgLevel()
    local total = DungeonFactionGetActorCount(self.ObjectId, DUNGEON_FACTION1);
    local MaxLevel = 0;
    local AllLevel = 0;
    local AvgLevel = 0;
    if (total > 0) then
        for i=0,total-1 do
            local oneActor = DungeonFactionGetActor(self.ObjectId, DUNGEON_FACTION1, i);
            local lev = GetCreLev(oneActor)
            if ( lev > MaxLevel ) then
                MaxLevel = lev
            end

            AllLevel = lev + AllLevel
        end
        AvgLevel = math.floor( AllLevel / total);
        if ( AvgLevel < MaxLevel - 5 ) then
            AvgLevel = MaxLevel - 5
        end

        if (AvgLevel < 1) then
            AvgLevel = 1;
        end
    end

    return AvgLevel;
end

function CDungeon_HuSong:OnDungeonBegin(dungeon)

    self.AvgLevel = self:CalcAvgLevel();

    self.Protector = CreateNpcInDungeon(self.ObjectId, 6666, DUNGEON_FACTION1, 563, 221, 4, self.AvgLevel, 10, 1);
    --self.Protector = CreateNpcInDungeon(self.ObjectId, 6666, DUNGEON_FACTION1, 615, -237, 4, self.AvgLevel, 10, 1);
    Say(self.Protector, "��л��λ�ɼҵĶ������������˴���;������֣���·��ħ�ڶ࣬��ʱ�������Ŀ��ܡ��������ڻ��з��ڵĻ��ᣨ���Ե��˳���������˼�����С�");
    Say(self.Protector, "������Ǿ����Ѷ������ǾͿ�ʼ�����ң����ҶԻ���");
end

function CDungeon_HuSong:OnDungeonActorRevive(dungeon, actorId)
    AddEffectEx(actorId,2094,0,0,0,0)
end

function CDungeon_HuSong:OnDungeonActorApplyQuit(dungeon, actorId)
    LeaveDungeon(self.ObjectId, actorId);
end

function CDungeon_HuSong:OnDungeonEnd(dungeon,winner)
    local content = "";
    if (winner == DUNGEON_FACTION1) then
        content = RICH_TEXT_BEGIN..GetFileContent("dungeon/husong_success.xml")..RICH_TEXT_END;
    elseif (winner == DUNGEON_FACTION2) then
        content = RICH_TEXT_BEGIN..GetFileContent("dungeon/husong_fail.xml")..RICH_TEXT_END;
    end
    DungeonShowMsg(dungeon, DUNGEON_FACTION_ALL, content, 1, 1);
end

function CDungeon_HuSong:OnDungeonMassDead(dungeon, massId, killer, faction)
    if (massId == self.Protector) then
        EndDungeon(self.ObjectId, DUNGEON_FACTION2);
    end
end






local HS_SpawnNpc = {4817,4818,4820,4821,4823,4824,4825,4826,4828,4827,4829,4830,4831,4832};
local ScenePosition = {
                        { x = 1, y = 1 },
                      };

local ScenePositionCount = math.random(table.getn(ScenePosition));


-- ������Ӣ��ʼ
-- ÿ��һ��·������һЩNPC��������Ӣ��
-- Ϊ������Ȥζ�ԣ������ظ�����Ĳ���������һЩ�������
-- ����1 -  ˢ����ͨ����6ֻ��ǿ�� *0.8
-- ����2 -  ˢ����ͨ����6ֻ��ǿ�� *1��������������1��ը��8���ը����ұ����ڸ���ʱ���ڴ��ը���������ը����Ӣ��
-- ����3 -  8��ǿ��Ѳ�߹֣�ǿ�� *1.5�����ѹأ�������Һ���Ӣ��ͨ�������Ҫͨ�����֣�һһ����
-- ����4 -  ��Ӣ����1�����䲢��֪���ȥ�񣨱��������Ʒ��������ã���
-- ����5 -  ˢ����ͨ����10ֻ��ǿ�� *1.2
-- ����6 -  ˢ����ͨ����4ֻ��ǿ�� *1.8���������2ֻԪ�ؿ��ԣ�����Ԫ��������ظߵĹ��Ŀ����������ҵ�ְҵ���ܼ�ֵ��
-- ����7 -  ˢ��6ֻ��ǿ�ȹ��ǿ�� *5������ܼ��20���ϵͳ����1����ǿBOSS��ǿ�� *30��������ҹ��ز��ҽ����Ⲩ�����ʧ��
-- ����8 -  ��Ӣ��������ǰ�������������Ҫ����ȥ�����������ը����Ӣ��
-- ����9 -  ���3��Ԫ�ع����ظߵĹ��Ŀ����������ҵķ���װ����ֵ�������⻹��4����ͨ���ǿ�� *2
-- ����10 - ˢ����ͨ����8ֻ��ǿ�� *2
-- ����11 - ˢ����ͨ����8ֻ��ǿ�� *2.5
-- ����12 - ˢ����ͨ����8ֻ��ǿ�� *3 ��1����֮��ϵͳ���ɱ���͵Ϯ��һ��boss����6��npc��׷����
-- ����Ŀ��ص��ͽ���������ʤ���������;ȫ���˳�������Ӣ��������ʧ�ܣ�

function CDungeon_HuSong:SceneBegin(sceneId)
    OutputLog("[SceneBegin]               Scene = "..sceneId)

    if (sceneId == 1) then
        local ability = 0.8;
        local creCount = 6;
        local spawnPos = { 
                            { x = 1, y = 1 }, 
                         };
        for i=1,creCount do
            CreateNpcInDungeon(self.ObjectId, HS_SpawnNpc[1], DUNGEON_FACTION2, spawnPos[i].x, spawnPos[i].y, 0, self.AvgLevel , ability)
        end
    elseif (sceneId == 2) then

    elseif (sceneId == 3) then

    elseif (sceneId == 4) then

    elseif (sceneId == 5) then

    elseif (sceneId == 6) then

    elseif (sceneId == 7) then

    elseif (sceneId == 8) then

    elseif (sceneId == 9) then

    elseif (sceneId == 10) then

    elseif (sceneId == 11) then

    elseif (sceneId == 12) then

    end

    self.CurrScene = sceneId;
    self.bSceneRunning = true;

    DisActivePatrol(self.Protector);
end


function CDungeon_HuSong:SceneEnd(sceneId)
    OutputLog("[SceneEnd]               Scene = "..sceneId)

    self.bSceneRunning = false;

    ActivePatrol(self.Protector);
end


function CDungeon_HuSong:SceneRun(sceneId)
    local bEnd = false;

    if (DungeonFactionGetAliveMassesCount(self.ObjectId, DUNGEON_FACTION2) == 0) then
        bEnd = true;
    end

    if (bEnd) then
        self:SceneEnd(sceneId);
    end
end

function CDungeon_HuSong:OnDungeonMassCreate(dungeon, massId)
    --OutputLog("[CDungeon_HuSong:OnDungeonMassCreate]  Dungeon = "..dungeon.." CreId = "..massId)

end




function CDungeon_HuSong:SpawnMonster(npcId, x, y, level, ability)
    OutputLog("[CDungeon_HuSong:SpawnMonster]  npc = "..npcId.." x = "..x.." y = "..y);

    CreateNpcInDungeon(self.ObjectId, npcId, DUNGEON_FACTION2, x, y, 0, level, ability)
end
