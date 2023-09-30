
include("script/dungeon/dungeon_object.lua")


CDungeon_GuildWar = class(CDungeonObject)


DungeonTable[4] = CDungeon_GuildWar


-- ��ߺ��ұߵ�Ѳ��·��
local PatrolPathLeft = "";
local PatrolPathRight = "";

local SpawnNpc = { 4682,4683,4684,4685,4686,4687,4688,4689,4690,4691 }
local SpawnBoss = { 4725,4737,4729,4738,4730,4740,4741,4739,4742,4743 }

local SpawnGiftPos = {
                        { x = 630, y = 41 },
                        { x = 625, y = 41 },
                        { x = 620, y = 41 },
                        { x = 615, y = 41 },
                        { x = 610, y = 41 },
                        { x = 605, y = 41 },
                     };
local SpawnGiftNpc = { 142,136,137,138,139,140,141 };


local BeKill_Actor = {};    -- ÿ�������߱�ɱ������
local Kill_Actor = {};      -- ÿ��������ɱ���ĶԷ�����������


function CDungeon_GuildWar:ctor(idx, objectId)
    OutputLog("[CDungeon_GuildWar:ctor]               Index = "..self.Index.." ObjectId "..self.ObjectId)

    -- ��ʼ������ 
    --LOAD_LAN("msg_script_protect_spawn");

    -- ע���¼�������Ҫ���¼���Ҫע�ᣡ��
    RegisterDungeonEvent(objectId, EV_DUNGEON_BEGIN);
    RegisterDungeonEvent(objectId, EV_DUNGEON_END);
    RegisterDungeonEvent(objectId, EV_DUNGEON_1SEC_TIMER);
    RegisterDungeonEvent(objectId, EV_DUNGEON_1SEC_TIMER_DEAD);
    RegisterDungeonEvent(objectId, EV_DUNGEON_ACTOR_DEAD);
    RegisterDungeonEvent(objectId, EV_DUNGEON_ACTOR_REVIVE);
    RegisterDungeonEvent(objectId, EV_DUNGEON_MASS_CREATE);
    RegisterDungeonEvent(objectId, EV_DUNGEON_MASS_DEAD);
    RegisterDungeonEvent(objectId, EV_DUNGEON_ACTOR_APPLYQUIT);

    -- ��ʼ������
    self.now = 0;

    self.Protector_Faction1 = 0;        -- ��Ӫ1�Ĵ�Ӫ
    self.Protector_Faction2 = 0;        -- ��Ӫ2�Ĵ�Ӫ
    self.AvgLevel_Faction1 = 0;         -- ����ʱ��Ӫ1��ƽ���ȼ�
    self.AvgLevel_Faction2 = 0;         -- ����ʱ��Ӫ2��ƽ���ȼ�
    self.AvgLevel = 0;                  -- �����ڽ�ɫ��ƽ���ȼ�

    -- ˢ��
    self.CurrMassLevel = 0;             -- ��ǰˢ�¹���ĵȼ�
    self.CurrMassIndex = 0;             -- ��ǰˢ�¹����Index
    self.SpawnMonsterLeft = 0;          -- ��ǰʣ���ˢ�ֵ�����
    self.SpawnBossLeft = 0;             -- ��ǰʣ���ˢBOSS������
    self.CurrSpawnState = 2;            -- ��ǰˢ�ֵ�״̬��1-ˢ�ֹ�����   2-ˢ�ֽ�����
    self.NextSpawnTime = 0;             -- ��һ��ˢ�ֵ�ʱ��
    self.SpawnSecondsCounter = 0;       -- ˢ�ֵ�����������10����ˢ����һ����

    self.ProtectorHint1 = 0;            -- ��һ��֪ͨ��Ӫ�����ʱ��1
    self.ProtectorHint2 = 0;            -- ��һ��֪ͨ��Ӫ�����ʱ��2
    self.ProtectorHp1 = 0;              -- ��һ�δ�Ӫ��HP 1
    self.ProtectorHp2 = 0;              -- ��һ�δ�Ӫ��HP 2
end


function CDungeon_GuildWar:On1SecTimer(dungeon, now)
    --OutputLog("[CDungeon_GuildWar:On1SecTimer]        Dungeon = "..dungeon.." Now = "..now)

    self.now = now;

    -- ˢ�¹����BOSS
    if (self.CurrSpawnState == 1) then

        if (self.SpawnSecondsCounter > 0) then
            self.SpawnSecondsCounter = self.SpawnSecondsCounter - 1;
        else
            if (self.SpawnMonsterLeft > 0) then
                self:SpawnMass();
            elseif (self.SpawnBossLeft > 0) then
                self:SpawnBoss();
            else 
                self:UpdateStateAfterSpawn()
            end

            self.SpawnSecondsCounter = 2;
        end

    elseif (self.CurrState == 2) then

        if (self.NextSpawnTime == 0) then
            self.NextSpawnTime = now + 5;
        elseif (now >= self.NextSpawnTime) then -- ����ʱ��ͽ���ˢ��״̬
            self.CurrSpawnState = 1;
            self.CurrMassLevel = self.CurrMassLevel + 1
            self.CurrMassIndex = self.CurrMassIndex + 1
            self.SpawnMonsterLeft = 3;
            self.SpawnBossLeft = 0;
            self.SpawnSecondsCounter = 0;
        end

    end

    -- ˢ�±���
    -- @@@@@ if (math.random(900) == 1) then -- ƽ��15����ˢ1��
    if (math.random(30) == 1) then
        self:SpawnGift();
    end

    -- ˫���Ĵ�Ӫ�Ƿ��ܵ������ˣ�����Ǿ�֪ͨ�Է�
    if (now > self.ProtectorHint1 + 5) then
        local hp = GetCreHp(self.Protector_Faction1);
        if (hp < self.ProtectorHp1) then
            local str = "��Ĵ�ӪĿǰ�����ܵ�������"; -- @@@@@
            DungeonFactionReceiveMsg(self.ObjectId, DUNGEON_FACTION1, str, CHANNEL_SYS);
        end

        self.ProtectorHp1 = hp;
    end

    if (now > self.ProtectorHint2 + 5) then
        local hp = GetCreHp(self.Protector_Faction2);
        if (hp < self.ProtectorHp2) then
            local str = "��Ĵ�ӪĿǰ�����ܵ�������"; -- @@@@@
            DungeonFactionReceiveMsg(self.ObjectId, DUNGEON_FACTION2, str, CHANNEL_SYS);
        end

        self.ProtectorHp2 = hp;
    end

end


function CDungeon_GuildWar:On1SecTimer_Dead(dungeon, now)
    --OutputLog("[CDungeon_GuildWar:On1SecTimer_Dead]   Dungeon = "..dungeon)

end


function CDungeon_GuildWar:OnDungeonBegin(dungeon)
    OutputLog("[CDungeon_GuildWar:OnDungeonBegin]     Dungeon = "..dungeon)

    -- ����ƽ���ȼ�
    self.AvgLevel_Faction1 = self:CalcAvgLevel(DUNGEON_FACTION1);
    self.AvgLevel_Faction2 = self:CalcAvgLevel(DUNGEON_FACTION2);
    self.AvgLevel = math.floor((self.AvgLevel_Faction1 + self.AvgLevel_Faction2) / 2);

    self.CurrMassLevel = self.AvgLevel - 1;
    self.CurrMassIndex = 0;

    -- ����˫����Ӫ����̨
    self.Protector_Faction1 = CreateNpcInDungeon(self.ObjectId, 4692, DUNGEON_FACTION1, 627, 41, 0, self.AvgLevel, 10); -- @@@@@
    self.Protector_Faction2 = CreateNpcInDungeon(self.ObjectId, 4692, DUNGEON_FACTION2, 629, 43, 0, self.AvgLevel, 10); -- @@@@@
    -- @@@@@ ��̨
end


function CDungeon_GuildWar:OnDungeonEnd(dungeon,winner)
    OutputLog("[CDungeon_GuildWar:OnDungeonEnd]       Dungeon = "..dungeon)

    -- ��ʾ�Ի���
    local content = RICH_TEXT_BEGIN..GetFileContent("dungeon/3c_end.xml")..RICH_TEXT_END;
    DungeonShowMsg(dungeon, DUNGEON_FACTION_ALL, content, 1, 1);

    -- ����ʤ����������
    -- @@@@@

end

function CDungeon_GuildWar:OnDungeonActorDead(dungeon, actorId, killer, faction)
    OutputLog("[CDungeon_GuildWar:OnDungeonActorDead] Dungeon = "..dungeon.." CreId = "..actorId)

    self:AddKillActor(killer, actorId);

    Revive(actorId);
end


function CDungeon_GuildWar:OnDungeonActorRevive(dungeon, actorId)
    OutputLog("[CDungeon_GuildWar:OnDungeonActorRevive] Dungeon = "..dungeon.." CreId = "..actorId)

    AddEffectEx(actorId,2094,0,0,0,0)
end


function CDungeon_GuildWar:OnDungeonMassCreate(dungeon, massId)
    OutputLog("[CDungeon_GuildWar:OnDungeonMassCreate]  Dungeon = "..dungeon.." CreId = "..massId)

end


function CDungeon_GuildWar:OnDungeonMassDead(dungeon, massId, killer, faction)
    OutputLog("[CDungeon_GuildWar:OnDungeonMassDead]   Dungeon = "..dungeon.." CreId = "..massId)

    if (massId == self.Protector_Faction1) then
        EndDungeon(self.ObjectId, DUNGEON_FACTION2);
    elseif (massId == self.Protector_Faction2) then
        EndDungeon(self.ObjectId, DUNGEON_FACTION1);
    end
end


function CDungeon_GuildWar:OnDungeonActorApplyQuit(dungeon, actorId)
    OutputLog("[CDungeon_GuildWar:OnDungeonActorApplyQuit]  Dungeon = "..dungeon.." CreId = "..actorId)

    LeaveDungeon(self.ObjectId, actorId);

end


function CDungeon_GuildWar:CalcAvgLevel(faction)
    return 10; --@@@@@
end


function CDungeon_GuildWar:AddKillActor(killer, dead)
    if (killer ~= 0) then
        if (Kill_Actor[killer] == nil) then
            Kill_Actor[killer] = 1;
        else
            Kill_Actor[killer] = Kill_Actor[killer] + 1;
        end

        DungeonActorSetDataInt(killer, "k", Kill_Actor[killer], 1);
    end

    if (dead ~= 0) then
        if (BeKill_Actor[dead] == nil) then
            BeKill_Actor[dead] = 1;
        else
            BeKill_Actor[dead] = BeKill_Actor[dead] + 1;
        end

        DungeonActorSetDataInt(dead, "bk", BeKill_Actor[dead], 1);
    end
end


function CDungeon_GuildWar:UpdateStateAfterSpawn()
    if (self.CurrState == 1) then
        if (self.SpawnMonsterLeft <= 0 and self.SpawnBossLeft <= 0) then
            self.CurrState = 2;
            self.NextSpawnTime = self.now + 10;
        end
    end
end


function CDungeon_GuildWar:SpawnMass()
    local x1 = 621;
    local y1 = 189;
    local x2 = 621;
    local y2 = 189;

    -- �м�
    CreateNpcInDungeon(self.ObjectId, SpawnNpc[self.CurrMassIndex], DUNGEON_FACTION1, x1, y1, 0, self.CurrMassLevel, 0.5 + self.CurrMassIndex * 0.1)
    CreateNpcInDungeon(self.ObjectId, SpawnNpc[self.CurrMassIndex], DUNGEON_FACTION2, x2, y2, 0, self.CurrMassLevel, 0.5 + self.CurrMassIndex * 0.1)

    -- ��� @@@@@

    -- �ұ� @@@@@

    if (self.SpawnMonsterLeft > 0) then
        self.SpawnMonsterLeft = self.SpawnMonsterLeft - 1;
    end

    self:UpdateStateAfterSpawn();
end


function CDungeon_GuildWar:SpawnBoss()
    local x1 = 621;
    local y1 = 189;
    local x2 = 621;
    local y2 = 189;

    CreateNpcInDungeon(self.ObjectId, SpawnBoss[self.CurrMassIndex], DUNGEON_FACTION1, x1, y1, 0, self.CurrMassLevel, 0.5 + self.CurrMassIndex * 0.1)
    CreateNpcInDungeon(self.ObjectId, SpawnBoss[self.CurrMassIndex], DUNGEON_FACTION2, x2, y2, 0, self.CurrMassLevel, 0.5 + self.CurrMassIndex * 0.1)

    if (self.SpawnBossLeft > 0) then
        self.SpawnBossLeft = self.SpawnBossLeft - 1;
    end

    self:UpdateStateAfterSpawn();
end


function CDungeon_GuildWar:SpawnGift()
    local r = math.random(table.getn(SpawnGiftPos));

    local x = SpawnGiftPos[r].x;
    local y = SpawnGiftPos[r].y;

    local npcCount = table.getn(SpawnGiftNpc);
    local i = (npcCount * self.CurrMassIndex) / 30 + math.random(-2, 2);
    if (i < 1) then
        i = 1;
    elseif (i > npcCount) then
        i = npcCount;
    end

    CreateNpcInDungeon(self.ObjectId, SpawnGiftNpc[i], DUNGEON_FACTION_NEUTRAL, x, y, 0, 0, 0);

    local str = "���ϵ��������Ͽ�ȥ������λ����%d,%d"; -- @@@@@
    str = string.format(str, x, y);
    DungeonFactionReceiveMsg(self.ObjectId, DUNGEON_FACTION_ALL, str, CHANNEL_SYS);

    OutputLog("[CDungeon_GuildWar:SpawnGift]  Gift Pos = ("..x..", "..y.."), Npc = "..SpawnGiftNpc[i]);
end

