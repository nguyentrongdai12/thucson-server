--      �ȼ�����ɵĴ��У��������������ȼ�����ɵ�MISS��
-- BOSS�����ɡ��⻷
-- ͬ������̫С���ܲ����ھ������мӴ�
--      �ֿ�Ŀǰû�ж�����BUFF������
-- ���ߵ�ɢ����ʽ
--      �������һ���־ͻص�Ѳ��λ��Ȼ���������һ��Ŀ�꣬�ܲ��ܴ����һ������������
-- ���������������Ŀǰ�����ڵ�
-- ��Ȫ��Ҫ��ʾѪ��������


-- ��Ȫģ�͵�BBox�ǲ���̫�����ڸ������õ�
-- �����⻷�ͷ����⻷�ŵ��²ȸ�Ч��
-- ��Ʒ���������1 ����3����̨����   2 ��ЧȺ������ߵ��ʣ�
-- ˫������̨λ�ò��Գ���ɲ���ƽ
--      ��������BUFF�͵������뿪������Ҫ���������һ��Ҫ��ϸ��飬�����������
--      ��Ӫû�й�����������Ҳû�й���
--      ��̨��������BUFF
--      ��Ʒ�ĵ���(��������)
-- ����ʱ�ĶԻ���ͽ���
-- �����Լ����ֲ���


include("script/dungeon/dungeon_object.lua")


CDungeon_3C = class(CDungeonObject)


DungeonTable[3] = CDungeon_3C


-- ��ߺ��ұߵ�Ѳ��·��
local PatrolPathCenter1_v1 = "624 120;644 120;664 120;684 120;704 120;718 122;730 126;746 128;764 130;784 130;804 130;824 130;844 130;864 130;884 130;904 130;924 130;931 127";
local PatrolPathCenter1_v2 = "624 114;644 114;664 114;684 114;704 116;718 120;730 122;746 120;764 122;784 122;804 122;824 122;844 122;864 122;884 122;904 122;924 122;931 127";
local PatrolPathCenter2_v1 = "924 130;904 130;884 130;864 130;844 130;824 130;804 130;784 130;764 130;746 128;730 124;718 120;704 120;684 120;664 120;644 120;624 120;613 118";
local PatrolPathCenter2_v2 = "924 122;904 122;884 122;864 122;844 122;824 122;804 122;784 122;764 122;746 120;730 118;718 118;704 118;684 114;664 114;644 114;624 114;613 118";
local PatrolPathTop1_v1 = "611 138;623 159;634 172;641 179;660 183;676 188;690 195;708 199;726 202;746 202;766 202;786 202;806 202;826 202;844 200;864 200;884 200;900 195;915 185;919 169;930 159;930 139;931 127";
local PatrolPathTop1_v2 = "621 144;623 166;634 180;641 185;660 190;676 194;690 200;708 205;726 208;746 208;766 208;786 208;806 208;826 208;844 206;864 206;884 206;900 201;915 191;919 175;930 165;930 145;931 127";
local PatrolPathTop2_v1 = "931 147;930 159;919 169;915 185;900 195;884 206;864 206;844 206;826 208;806 208;786 208;766 208;746 208;726 208;708 205;690 200;676 194;660 190;641 185;634 180;623 166;621 144;618 132;611 120";
local PatrolPathTop2_v2 = "931 157;930 167;919 175;915 191;900 201;884 211;864 211;844 211;826 214;806 214;786 214;766 214;746 214;726 214;708 211;690 206;676 200;660 196;641 191;634 186;623 172;621 150;618 135;611 120";
local PatrolPathBottom1_v1 = "611 95;617 81;621 70;631 58;650 53;668 51;684 47;700 41;716 37;736 37;756 37;776 37;796 37;816 37;836 37;854 39;872 43;892 43;909 49;924 59;932 70;932 87;932 107;932 126;";
local PatrolPathBottom1_v2 = "611 101;617 87;621 76;631 64;650 59;668 57;684 53;700 47;716 43;736 43;756 43;776 43;796 43;816 43;836 43;854 45;872 49;892 49;909 55;924 65;932 76;932 93;932 113;932 126;";
local PatrolPathBottom2_v1 = "933 104;932 87;932 70;924 59;909 49;892 43;872 43;854 39;836 37;816 37;796 37;776 37;756 37;736 37;716 37;700 41;684 47;668 51;650 53;631 58;621 70;617 81;611 98;611 116;";
local PatrolPathBottom2_v2 = "933 110;932 93;932 76;924 65;909 55;892 49;872 49;854 45;836 43;816 43;796 43;776 43;756 43;736 43;716 43;700 47;684 53;668 57;650 59;631 64;621 76;617 87;611 98;611 116;";

local SpawnNpc = { 4744,4745,4746,4747,4748,4749,4750,4751,4752,4753 }
local SpawnBossId = { 4810,4811,4812,4813,4814,4815,4816 }

local SpawnNpcCount = table.getn(SpawnNpc);
local SpawnBossCount = table.getn(SpawnBossId);

local SpawnNpcPos_Center1_v1 = { x = 624, y = 120 }
local SpawnNpcPos_Center1_v2 = { x = 624, y = 114 }
local SpawnNpcPos_Center2_v1 = { x = 924, y = 130 }
local SpawnNpcPos_Center2_v2 = { x = 924, y = 122 }
local SpawnNpcPos_Top1_v1 = { x = 611, y = 138 }
local SpawnNpcPos_Top1_v2 = { x = 621, y = 148 }
local SpawnNpcPos_Top2_v1 = { x = 931, y = 147 }
local SpawnNpcPos_Top2_v2 = { x = 931, y = 157 }
local SpawnNpcPos_Bottom1_v1 = { x = 611, y = 95 }
local SpawnNpcPos_Bottom1_v2 = { x = 611, y = 101 }
local SpawnNpcPos_Bottom2_v1 = { x = 933, y = 104 }
local SpawnNpcPos_Bottom2_v2 = { x = 933, y = 110 }


-- ����λ�úͱ��䣨NPC����ID
local SpawnGiftPos = {
                        { x = 779, y = 131 },
                        { x = 813, y = 143 },
                        { x = 766, y = 118 },
                        { x = 797, y = 96 },
                        { x = 763, y = 162 },
                        { x = 764, y = 221 },
                        { x = 795, y = 36 },
                     };
local SpawnGiftNpc = { 4805 };

-- �����ػ��ߵ�λ�ú�NPC��ID
local SpawnGiftProtectorPos = {
                        { x = 779, y = 128 },
                        { x = 813, y = 139 },
                        { x = 766, y = 121 },
                        { x = 794, y = 96 },
                        { x = 766, y = 162 },
                        { x = 764, y = 218 },
                        { x = 795, y = 39 },
                     };
local SpawnGiftProtectorNpc = 4808;

local RevivePos1 = { x = 583, y = 118 };
local RevivePos2 = { x = 966, y = 127 };

local BeKill_Actor = {};    -- ÿ�������߱�ɱ������
local Kill_Actor = {};      -- ÿ��������ɱ���ĶԷ�����������

local KillBonusItem = { 4137,4138,4139,4140 };
local KillBonusItemCount = table.getn(KillBonusItem);

local SpawnBossInterval = 14;


function CDungeon_3C:ctor(idx, objectId)
    OutputLog("[CDungeon_3C:ctor]               Index = "..self.Index.." ObjectId "..self.ObjectId)

    -- ��ʼ������ 
    --LOAD_LAN("msg_script_protect_spawn");
    LOAD_LAN("msg_script_warn_base");
    LOAD_LAN("msg_script_killer_gift");
    LOAD_LAN("msg_script_spawn_boss");
    LOAD_LAN("msg_script_spawn_box");
    LOAD_LAN("msg_script_spawn_monsternext");

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
    self.start = 0;

    self.Protector_Faction1 = 0;        -- ��Ӫ1�Ĵ�Ӫ
    self.Protector_Faction2 = 0;        -- ��Ӫ2�Ĵ�Ӫ
    self.ShopNpc_Faction1 = 0		-- ��Ӫ1���̵�
    self.ShopNpc_Faction2 = 0		-- ��Ӫ2���̵�
    self.AvgLevel_Faction1 = 0;         -- ����ʱ��Ӫ1��ƽ���ȼ�
    self.AvgLevel_Faction2 = 0;         -- ����ʱ��Ӫ2��ƽ���ȼ�
    self.AvgLevel = 0;                  -- �����ڽ�ɫ��ƽ���ȼ�
    self.TD_Score1 = 0;                  -- ��Ӫ1����ʱ�����ӵĻ���
    self.TD_Score2 = 0;                  -- ��Ӫ2����ʱ�����ӵĻ���
    self.TD_KillNum1 = 0;               -- ��Ӫ1�ܵ�ɱ����
    self.TD_KillNum2 = 0;               -- ��Ӫ2�ܵ�ɱ����
    self.TD_Exp1 = 0 ;                   -- ��Ӫ1��������
    self.TD_Nimbus1 = 0 ;                -- ��Ӫ1��������
    self.TD_Money1 = 0 ;                 -- ��Ӫ1������Ǯ
    self.TD_Exp2 = 0 ;                   -- ��Ӫ2��������
    self.TD_Nimbus2 = 0 ;                -- ��Ӫ2��������
    self.TD_Money2 = 0 ;                 -- ��Ӫ2������Ǯ
    self.TD_Team1 = "";                  -- ��Ӫ1������
    self.TD_Team2 = "";                  -- ��Ӫ2������
    self.TD_Winner = "";                 -- ʤ����
    self.pk_lev1 = 0;                    -- ��Ӫ1�����ȼ�
    self.pk_lev2 = 0;                    -- ��Ӫ2�����ȼ�
    self.Race_Score1 = 0;		 -- ��Ӫ1ս������
    self.Race_Score2 = 0;		 -- ��Ӫ2ս������
    self.Race_Player = 5;		 -- ɱ����ҵĻ�����
    self.Race_Monster = 1;     		 -- ɱ������Ļ�����
    self.TD_KillActor1 = 0;		 -- ��Ӫ1ɱ�������
    self.TD_KillActor2 = 0;              -- ��Ӫ2ɱ�������
    self.User1 = "";
    self.User1 = "";


    -- ˢ��
    self.CurrMassLevel = 0;             -- ��ǰˢ�¹���ĵȼ�
    self.CurrMassIndex = 0;             -- ��ǰˢ�¹����Index
    self.SpawnMonsterLeft = 0;          -- ��ǰʣ���ˢ�ֵ�����
    self.SpawnBossLeft = 0;             -- ��ǰʣ���ˢBOSS������
    self.CurrSpawnState = 2;            -- ��ǰˢ�ֵ�״̬��1-ˢ�ֹ�����   2-ˢ�ֽ�����
    self.NextSpawnTime = 0;             -- ��һ��ˢ�ֵ�ʱ��
    self.SpawnSecondsCounter = 0;       -- ˢ�ֵ�����������xx����ˢ����һ����
    self.NextBossIndex = 1;             -- ��һ��ˢBOSS��Index
    self.NextBossBoShu = SpawnBossInterval + math.random(-3, 3);    -- ��һ��ˢBOSSʱ��NPCǿ��

    self.ProtectorHint1 = 0;            -- ��һ��֪ͨ��Ӫ�����ʱ��1
    self.ProtectorHint2 = 0;            -- ��һ��֪ͨ��Ӫ�����ʱ��2
    self.ProtectorHp1 = 0;              -- ��һ�δ�Ӫ��HP 1
    self.ProtectorHp2 = 0;              -- ��һ�δ�Ӫ��HP 2
end


function CDungeon_3C:On1SecTimer(dungeon, now)
    --OutputLog("[CDungeon_3C:On1SecTimer]        Dungeon = "..dungeon.." Now = "..now)
  
    if (self.start == -1) then
        return
    end

    if (self.start == 0) then
        self.start = now
    end

    if ((now - self.start) > 3600) then
	if(self.Race_Score1 > self.Race_Score2) then
          EndDungeon(dungeon, DUNGEON_FACTION1);
        elseif (self.Race_Score1 < self.Race_Score2) then
	  EndDungeon(dungeon, DUNGEON_FACTION2);	
	end
	if (self.Race_Score1 == self.Race_Score2) then
	 local temp_random = math.random(0,100);
	 if  (self.TD_KillNum1 > self.TD_KillNum2) then
	  EndDungeon(dungeon, DUNGEON_FACTION2);
         elseif (self.TD_KillNum1 < self.TD_KillNum2) then
  	  EndDungeon(dungeon, DUNGEON_FACTION1);
	 elseif (temp_random > 50) then
	  --OutputLog("temp_random = "..temp_random)           
          EndDungeon(dungeon, DUNGEON_FACTION1);
	 else
          EndDungeon(dungeon, DUNGEON_FACTION2);
	 end
	end

        --self.start = -1
    end

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

    elseif (self.CurrSpawnState == 2) then

        if (self.NextSpawnTime == 0) then
            self.NextSpawnTime = now + 5;
        elseif (now >= self.NextSpawnTime) then -- ����ʱ��ͽ���ˢ��״̬
            self.CurrSpawnState = 1;
            self.CurrMassIndex = self.CurrMassIndex + 1
            self.SpawnMonsterLeft = 3;
            self.SpawnBossLeft = 0;
            self.SpawnSecondsCounter = 0;
            self:BroadcastSpawn();

            -- �ж��ǲ���ˢBOSS��ʱ����
            if (self.CurrMassIndex >= self.NextBossBoShu) then
                self.SpawnBossLeft = 1;
            end
        end

    end

    -- ˢ�±���
    if (math.random(900) == 1) then -- ƽ��15����ˢ1��
    --if (math.random(120) == 1) then
        self:SpawnGift();
    end

    -- ˫���Ĵ�Ӫ�Ƿ��ܵ������ˣ�����Ǿ�֪ͨ�Է�
    if (now > self.ProtectorHint1 + 8) then
        local hp = GetCreHp(self.Protector_Faction1); 
        
        if (hp < self.ProtectorHp1) then
            local LAN_Warn_Base = LAN("msg_script_warn_base"); -- "��Ĵ�ӪĿǰ�����ܵ�������";
            DungeonFactionReceiveMsg(self.ObjectId, DUNGEON_FACTION1, LAN_Warn_Base, CHANNEL_SYS);
        end

        self.ProtectorHp1 = hp;
    end

    if (now > self.ProtectorHint2 + 8) then
        local hp = GetCreHp(self.Protector_Faction2);
        if (hp < self.ProtectorHp2) then
            local LAN_Warn_Base = LAN("msg_script_warn_base"); -- "��Ĵ�ӪĿǰ�����ܵ�������";
            DungeonFactionReceiveMsg(self.ObjectId, DUNGEON_FACTION2, LAN_Warn_Base, CHANNEL_SYS);
        end

        self.ProtectorHp2 = hp;
    end

end


function CDungeon_3C:On1SecTimer_Dead(dungeon, now)

end


function CDungeon_3C:OnDungeonBegin(dungeon)

    -- ����ƽ���ȼ�
    self.AvgLevel_Faction1 = self:CalcAvgLevel(DUNGEON_FACTION1);
    self.AvgLevel_Faction2 = self:CalcAvgLevel(DUNGEON_FACTION2);
    self.AvgLevel = math.floor((self.AvgLevel_Faction1 + self.AvgLevel_Faction2) / 2);

    self.CurrMassLevel = self.AvgLevel;
    self.CurrMassIndex = 0;

    -- ����˫����Ӫ����̨
    self.Protector_Faction1 = CreateNpcInDungeon(self.ObjectId, 4806, DUNGEON_FACTION1, 617, 118, 4, self.AvgLevel, 1, 1);
    self.Protector_Faction2 = CreateNpcInDungeon(self.ObjectId, 4806, DUNGEON_FACTION2, 929, 127, 12, self.AvgLevel, 1, 1);

    --����˫����Ȫ
    local npc1 = CreateNpcInDungeon(self.ObjectId, 4809, DUNGEON_FACTION1, 598, 131, 4, self.AvgLevel, 10, 1);
    AddEffectEx( npc1, 2208, 0,  0, 0, 0);
    local npc2 = CreateNpcInDungeon(self.ObjectId, 4809, DUNGEON_FACTION2, 947, 104, 12, self.AvgLevel, 10, 1);
    AddEffectEx( npc2, 2208, 0,  0, 0, 0);
    
    --�����̵�
    self.ShopNpc_Faction1 = CreateNpcInDungeon(self.ObjectId, 4925, DUNGEON_FACTION1, 602, 110, 4, self.AvgLevel, 10, 1);
    self.ShopNpc_Faction2 = CreateNpcInDungeon(self.ObjectId, 4925, DUNGEON_FACTION2, 954, 132, 12, self.AvgLevel, 10, 1);
    

    local defendRate1 = 2;
    local defendRate2 = 3;
    local defendRate3 = 3;
    -- ����������̨
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 693, 129, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 695, 107, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 648, 126, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 648, 108, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 683, 129, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 685, 107, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 638, 126, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 638, 108, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£������٣�

    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 695, 210, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 695, 192, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 632, 189, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 639, 176, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 685, 210, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 685, 192, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 623, 184, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 629, 170, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£������٣�

    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 695, 55, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 695, 31, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 637, 62, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION1, 633, 48, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 685, 55, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 685, 31, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 627, 66, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION1, 621, 52, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£������٣�

    CreateNpcInDungeon(self.ObjectId, 4802, DUNGEON_FACTION1, 617, 109, 8, self.AvgLevel, defendRate3, 1);  -- ����1
    CreateNpcInDungeon(self.ObjectId, 4802, DUNGEON_FACTION1, 617, 129, 0, self.AvgLevel, defendRate3, 1);  -- ����2
    CreateNpcInDungeon(self.ObjectId, 4802, DUNGEON_FACTION1, 624, 150, 0, self.AvgLevel, defendRate3, 1);  -- ����3
    CreateNpcInDungeon(self.ObjectId, 4802, DUNGEON_FACTION1, 626, 90, 0, self.AvgLevel, defendRate3, 1);  -- ����4

    -- ���ɷ�����̨
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 851, 136, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 851, 116, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 902, 142, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 902, 116, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 861, 138, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 861, 118, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 912, 142, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 912, 116, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£������٣�

    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 851, 218, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 851, 198, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 902, 215, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 902, 195, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 861, 218, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 861, 198, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 912, 215, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 912, 195, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£������٣�

    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 851, 55, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 851, 31, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 902, 62, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ�
    CreateNpcInDungeon(self.ObjectId, 4801, DUNGEON_FACTION2, 902, 31, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 861, 55, 8, self.AvgLevel, defendRate1, 1);  -- ��·1���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 861, 31, 0, self.AvgLevel, defendRate1, 1);  -- ��·1���£������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 912, 62, 8, self.AvgLevel, defendRate2, 1);  -- ��·2���ϣ������٣�
    CreateNpcInDungeon(self.ObjectId, 4800, DUNGEON_FACTION2, 912, 36, 0, self.AvgLevel, defendRate2, 1);  -- ��·2���£������٣�

    CreateNpcInDungeon(self.ObjectId, 4802, DUNGEON_FACTION2, 925, 117, 8, self.AvgLevel, defendRate3, 1);  -- ����1
    CreateNpcInDungeon(self.ObjectId, 4802, DUNGEON_FACTION2, 925, 137, 0, self.AvgLevel, defendRate3, 1);  -- ����2
    CreateNpcInDungeon(self.ObjectId, 4802, DUNGEON_FACTION2, 925, 88, 0, self.AvgLevel, defendRate3, 1);  -- ����3
    CreateNpcInDungeon(self.ObjectId, 4802, DUNGEON_FACTION2, 923, 164, 0, self.AvgLevel, defendRate3, 1);  -- ����4
end


function CDungeon_3C:OnDungeonEnd(dungeon,winner)
    --OutputLog("[CDungeon_3C:OnDungeonEnd]       Dungeon = "..dungeon)
    local i;
    local faction1_actor ;
    local faction2_actor ;
    local delta_score1 = 0;
    local delta_score2 = 0;
    local temp_actor1 = 0;
    local temp_actor2 = 0;
    local strRed = L("msg_script_red_faction"); 
    local strBlue = L("msg_script_blue_faction"); 
    
    -- ��ʾ�Ի���
    local content = RICH_TEXT_BEGIN..GetFileContent("dungeon/3c_end.xml")..RICH_TEXT_END;

    -- ����ʤ����������
    self.TD_Exp1 = GetMonsterExp (self.AvgLevel) * self.TD_KillNum1*0.05;
    self.TD_Nimbus1 = GetMonsterNimbus (self.AvgLevel) * self.TD_KillNum1*0.1;
    self.TD_Money1 = GetMonsterGold (self.AvgLevel) * self.TD_KillNum1*0.05;
    self.TD_Exp2 = GetMonsterExp (self.AvgLevel) * self.TD_KillNum2*0.05;
    self.TD_Nimbus2 = GetMonsterNimbus (self.AvgLevel) * self.TD_KillNum2*0.1;
    self.TD_Money2 = GetMonsterGold (self.AvgLevel) * self.TD_KillNum2*0.05;
    local faction1_count = DungeonFactionGetActorCount(dungeon, DUNGEON_FACTION1);
    local faction2_count = DungeonFactionGetActorCount(dungeon, DUNGEON_FACTION2);
    --OutputLog(" faction1_count = "..faction1_count);
    --OutputLog(" faction2_count = "..faction2_count);
    if (faction1_count > 0 ) then 
        temp_actor1 = DungeonFactionGetActor(dungeon, DUNGEON_FACTION1, 0);
        self.TD_Team1 = GetUserDungeonTeam(temp_actor1);
        self.pk_lev1 = GetDungeonTeamLevel(self.TD_Team1,DUNGEON_PVP);
        OutputLog(" temp_actor1 = "..temp_actor1);
        self.TD_score1 = GetDungeonTeamScore (self.TD_Team1,DUNGEON_PVP);
    end
    
    if (faction2_count > 0 ) then 
        temp_actor2 = DungeonFactionGetActor(dungeon, DUNGEON_FACTION2, 0);
        self.TD_Team2 = GetUserDungeonTeam(temp_actor2);
        self.pk_lev2 = GetDungeonTeamLevel(self.TD_Team2,DUNGEON_PVP);
        self.TD_score2 = GetDungeonTeamScore (self.TD_Team2,DUNGEON_PVP);
    end
    --OutputLog(" pk_lev1 = "..self.pk_lev1);
    --OutputLog(" pk_lev2 = "..self.pk_lev2);
    if (winner == DUNGEON_FACTION1) then -- ��Ӫ1Ӯ�ˣ���Ӫ2����	
 		--OutputLog(" TD_Winner1 ");
                delta_score1 = 100 - (self.pk_lev1-self.pk_lev2)*20;
                delta_score2 = (100 - (self.pk_lev1-self.pk_lev2)*20)/2;
                if (delta_score1 < 20) then 
                    delta_score1 = 20;
                end
                if (delta_score1 > 200) then 
                    delta_score1 = 200;
                end
                if (delta_score2 < 10) then 
                    delta_score2 = 10;
                end
                if (delta_score2 > 100) then 
                    delta_score2 = 100;
                end
            self.TD_Score1 = 30;
            self.TD_Score2 = 15;
            for i=0,faction1_count-1 do
                faction1_actor = DungeonFactionGetActor(dungeon, DUNGEON_FACTION1, i);
                AddUserDungeonScore (faction1_actor,DUNGEON_PVP,self.TD_Score1);
                AddExp (faction1_actor,self.TD_Exp1,0);
                AddNimbus (faction1_actor,self.TD_Nimbus1,0);
                AddMoney (faction1_actor,self.TD_Money1);
            end
            
            for i=0,faction2_count-1 do
                faction2_actor = DungeonFactionGetActor(dungeon, DUNGEON_FACTION2, i);
                AddUserDungeonScore (faction2_actor,DUNGEON_PVP,self.TD_Score2);
                AddExp (faction2_actor,self.TD_Exp2,0);
                AddNimbus (faction2_actor,self.TD_Nimbus2,0);
                AddMoney (faction2_actor,self.TD_Money2);
            end
            
	     self.User1 = GetCreName(temp_actor1);
	     self.User2 = GetCreName(temp_actor2);
	     
            self.TD_Winner = strRed
            local teamScore1 = AddDungeonTeamScore(self.TD_Team1, DUNGEON_PVP, self.TD_Score1);
            local teamScore2 = AddDungeonTeamScore(self.TD_Team2, DUNGEON_PVP, self.TD_Score2);
	     local userScover1 = AddUserDungeonScore(self.TD_Team1, DUNGEON_PVP, self.TD_Score1);
            --OutputLog(" user1 = "..self.User1);
            --OutputLog(" winner = "..self.TD_Winner);
            content = string.gsub(content, "$TD_Winner", self.TD_Winner);
            content = string.gsub(content, "$TD_Team1", strRed);
            content = string.gsub(content, "$TD_Score1", self.TD_Score1);                        
            content = string.gsub(content, "$TD_Exp1", math.floor(self.TD_Exp1));
            content = string.gsub(content, "$TD_Nimbus1", math.floor(self.TD_Nimbus1));
            content = string.gsub(content, "$TD_Money1", math.floor(self.TD_Money1)); 
            
            content = string.gsub(content, "$TD_Team2", strBlue);
            content = string.gsub(content, "$TD_Score2", self.TD_Score2);                        
            content = string.gsub(content, "$TD_Exp2", math.floor(self.TD_Exp2));
            content = string.gsub(content, "$TD_Nimbus2", math.floor(self.TD_Nimbus2));
            content = string.gsub(content, "$TD_Money2", math.floor(self.TD_Money2));
            --OutputLog(" TD_Winner = "..self.TD_Winner);
	    --OutputLog(" TD_KillNum1 = "..self.TD_KillNum1);
            DungeonShowMsg(dungeon, DUNGEON_FACTION_ALL, content, 1, 1);

    elseif (winner == DUNGEON_FACTION2) then -- ��Ӫ1���� ��Ӫ2Ӯ��
                --OutputLog(" TD_Winner2 ");
                delta_score1 = (100 - (self.pk_lev2-self.pk_lev1)*20)/2;
                delta_score2 = 100 - (self.pk_lev2-self.pk_lev1)*20;
                if (delta_score2 < 20) then 
                    delta_score2 = 20;
                end
                if (delta_score2 > 200) then 
                    delta_score2 = 200;
                end
                if (delta_score1 < 10) then 
                    delta_score1 = 10;
                end
                if (delta_score1 > 100) then 
                    delta_score1 = 100;
                end
	     self.TD_Score1 = 15;
            self.TD_Score2 = 30;
           local faction1_count = DungeonFactionGetActorCount(dungeon, DUNGEON_FACTION1);
           local faction2_count = DungeonFactionGetActorCount(dungeon, DUNGEON_FACTION2);
            for i=0,faction1_count-1 do
                faction1_actor = DungeonFactionGetActor(dungeon, DUNGEON_FACTION1, i); 
                AddUserDungeonScore (faction1_actor,DUNGEON_PVP,self.TD_Score1);
                AddExp (faction1_actor,self.TD_Exp1,0);
                AddNimbus (faction1_actor,self.TD_Nimbus1,0);
                AddMoney (faction1_actor,self.TD_Money1);
            end
            
            for i=0,faction2_count-1 do
                faction2_actor = DungeonFactionGetActor(dungeon, DUNGEON_FACTION2, i);
                AddUserDungeonScore (faction2_actor,DUNGEON_PVP,self.TD_Score2);
                AddExp (faction2_actor,self.TD_Exp2,0);
                AddNimbus (faction2_actor,self.TD_Nimbus2,0);
                AddMoney (faction2_actor,self.TD_Money2);
            end
            
	     self.User1 = GetCreName(temp_actor1);
	     self.User2 = GetCreName(temp_actor2);
            self.TD_Winner = strBlue
            local teamScore1 = AddDungeonTeamScore(self.TD_Team1, DUNGEON_PVP, self.TD_Score1);
            local teamScore2 = AddDungeonTeamScore(self.TD_Team2, DUNGEON_PVP, self.TD_Score2);
 	     --OutputLog(" temp_actor2 = "..temp_actor2);
            --OutputLog(" user2 = "..self.User2);
            --OutputLog(" winner = "..self.TD_Winner);
            content = string.gsub(content, "$TD_Winner", self.TD_Winner);
            content = string.gsub(content, "$TD_Team1", strRed);
            content = string.gsub(content, "$TD_Score1", self.TD_Score1); 
            content = string.gsub(content, "$TD_Exp1", math.floor(self.TD_Exp1));
            content = string.gsub(content, "$TD_Nimbus1", math.floor(self.TD_Nimbus1));
            content = string.gsub(content, "$TD_Money1", math.floor(self.TD_Money1));
            
            content = string.gsub(content, "$TD_Team2", strBlue);
            content = string.gsub(content, "$TD_Score2", self.TD_Score2); 
            content = string.gsub(content, "$TD_Exp2", math.floor(self.TD_Exp2));
            content = string.gsub(content, "$TD_Nimbus2", math.floor(self.TD_Nimbus2));
            content = string.gsub(content, "$TD_Money2", math.floor(self.TD_Money2));
            
            DungeonShowMsg(dungeon, DUNGEON_FACTION_ALL, content, 1, 1);
    end
end

function CDungeon_3C:OnDungeonActorDead(dungeon, actorId, killer, faction)
    --OutputLog("[CDungeon_3C:OnDungeonActorDead] Dungeon = "..dungeon.." CreId = "..actorId)

    self:AddKillActor(killer, actorId);

   
	
    -- ��������ɱ���ģ��ͽ���killerһ������
    if (killer ~= 0 and IsUser(killer)~= 0) then
        local idx = math.random(KillBonusItemCount);
        AddItem(killer, KillBonusItem[idx], itemColor_White, 0, itemBind_NotBind);
	local str = LAN("msg_script_killer_gift"); -- "%s��ս���л�ɱ��%s�������ϵͳ��һ��������Ʒ";
        str = string.format(str, GetCreName(killer), GetCreName(actorId));
	
	if (faction == 1) then
	    self.Race_Score2 = self.Race_Score2 + self.Race_Player;
	    DungeonSetDataInt(dungeon, "S2", self.Race_Score2, 1);
	elseif (faction == 2) then
	    self.Race_Score1 = self.Race_Score1 + self.Race_Player;
	    DungeonSetDataInt(dungeon, "S1", self.Race_Score1, 1);
	end
        --OutputLog("[CDungeon_3C:OnDungeonActorDead] Dungeon = "..dungeon.." S1 = "..self.Race_Score1);
	--OutputLog("[CDungeon_3C:OnDungeonActorDead] Dungeon = "..dungeon.." S2 = "..self.Race_Score2);
	DungeonFactionReceiveMsg(self.ObjectId, DUNGEON_FACTION_ALL, str, CHANNEL_SYS);
    end
end


function CDungeon_3C:OnDungeonActorRevive(dungeon, actorId)
    --OutputLog("[CDungeon_3C:OnDungeonActorRevive] Dungeon = "..dungeon.." CreId = "..actorId)

    AddEffectEx(actorId,2207,0,0,0,0)
end


function CDungeon_3C:OnDungeonMassCreate(dungeon, massId)
    --OutputLog("[CDungeon_3C:OnDungeonMassCreate]  Dungeon = "..dungeon.." CreId = "..massId)

end


function CDungeon_3C:OnDungeonMassDead(dungeon, massId, killer, faction)
    --OutputLog("[CDungeon_3C:OnDungeonMassDead]   Dungeon = "..dungeon.." CreId = "..massId)
    if (faction == DUNGEON_FACTION2 and killer ~= 0 and IsUser(killer)~=0) then
	self.TD_KillNum1 = self.TD_KillNum1 +1;
	self.Race_Score1 = self.Race_Score1 + self.Race_Monster;
	DungeonSetDataInt(dungeon, "S1", self.Race_Score1, 1);
    end
    
    if (faction == DUNGEON_FACTION1 and killer ~= 0 and IsUser(killer)~=0) then
	self.TD_KillNum2 = self.TD_KillNum2 +1;
	self.Race_Score2 = self.Race_Score2 + self.Race_Monster;
	DungeonSetDataInt(dungeon, "S2", self.Race_Score2, 1);
    end

    --OutputLog("[CDungeon_3C:OnDungeonActorDead] Dungeon = "..dungeon.." S1 = "..self.Race_Score1);
    --OutputLog("[CDungeon_3C:OnDungeonActorDead] Dungeon = "..dungeon.." S2 = "..self.Race_Score2);
    if (massId == self.Protector_Faction1) then
        EndDungeon(self.ObjectId, DUNGEON_FACTION2);
    elseif (massId == self.Protector_Faction2) then
        EndDungeon(self.ObjectId, DUNGEON_FACTION1);
    end
end


function CDungeon_3C:OnDungeonActorApplyQuit(dungeon, actorId)
    OutputLog("[CDungeon_3C:OnDungeonActorApplyQuit]  Dungeon = "..dungeon.." CreId = "..actorId)

    LeaveDungeon(self.ObjectId, actorId);

end


function CDungeon_3C:CalcAvgLevel(faction)
    local total = DungeonFactionGetActorCount(self.ObjectId, faction);
    local MaxLevel = 0;
    local AllLevel = 0;
    local AvgLevel = 0;
    if (total > 0) then
        for i=0,total-1 do
            local oneActor = DungeonFactionGetActor(self.ObjectId, faction, i);
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


function CDungeon_3C:AddKillActor(killer, dead)
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


function CDungeon_3C:UpdateStateAfterSpawn()
    if (self.CurrSpawnState == 1) then
        if (self.SpawnMonsterLeft <= 0 and self.SpawnBossLeft <= 0) then
            self.CurrSpawnState = 2;

            local t = 80;
            if (self.CurrMassIndex < 10) then
                t = 60;
            elseif (self.CurrMassIndex > 50) then
                t = 120;
            end
            self.NextSpawnTime = self.now + t;
        end
    end
end


function CDungeon_3C:SpawnMass()
    --local idx = math.mod(self.CurrMassIndex - 1, SpawnNpcCount) + 1;
    local idx = 0;
    local npc = 0;

    local lev = self.CurrMassLevel;
    local ability = 0.6 + self.CurrMassIndex * 0.03;
    local bounsRiseRate = 0.6 + self.CurrMassIndex * 0.03 * 0.5;

    -- �м�
    idx = math.random(SpawnNpcCount);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION1, SpawnNpcPos_Center1_v1.x, SpawnNpcPos_Center1_v1.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathCenter1_v1);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION1, SpawnNpcPos_Center1_v2.x, SpawnNpcPos_Center1_v2.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathCenter1_v2);

    idx = math.random(SpawnNpcCount);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION2, SpawnNpcPos_Center2_v1.x, SpawnNpcPos_Center2_v1.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathCenter2_v1);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION2, SpawnNpcPos_Center2_v2.x, SpawnNpcPos_Center2_v2.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathCenter2_v2);

    -- �ϱ�
    idx = math.random(SpawnNpcCount);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION1, SpawnNpcPos_Top1_v1.x, SpawnNpcPos_Top1_v1.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathTop1_v1);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION1, SpawnNpcPos_Top1_v2.x, SpawnNpcPos_Top1_v2.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathTop1_v2);

    idx = math.random(SpawnNpcCount);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION2, SpawnNpcPos_Top2_v1.x, SpawnNpcPos_Top2_v1.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathTop2_v1);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION2, SpawnNpcPos_Top2_v2.x, SpawnNpcPos_Top2_v2.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathTop2_v2);

    -- �±�
    idx = math.random(SpawnNpcCount);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION1, SpawnNpcPos_Bottom1_v1.x, SpawnNpcPos_Bottom1_v1.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathBottom1_v1);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION1, SpawnNpcPos_Bottom1_v2.x, SpawnNpcPos_Bottom1_v2.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathBottom1_v2);

    idx = math.random(SpawnNpcCount);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION2, SpawnNpcPos_Bottom2_v1.x, SpawnNpcPos_Bottom2_v1.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathBottom2_v1);
    npc = CreateNpcInDungeon(self.ObjectId, SpawnNpc[idx], DUNGEON_FACTION2, SpawnNpcPos_Bottom2_v2.x, SpawnNpcPos_Bottom2_v2.y, 0, lev, ability, bounsRiseRate)
    SetNpcPatrolPath(npc, PatrolPathBottom2_v2);

    if (self.SpawnMonsterLeft > 0) then
        self.SpawnMonsterLeft = self.SpawnMonsterLeft - 1;
    end

    self:UpdateStateAfterSpawn();
end


function CDungeon_3C:SpawnBoss()
    if (self.NextBossIndex > SpawnBossCount) then       -- ����BOSS���������Ͳ�ˢ��
        if (self.SpawnBossLeft > 0) then
            self.SpawnBossLeft = self.SpawnBossLeft - 1;
        end

        self:UpdateStateAfterSpawn();

        return;
    end

    local npc = 0;

    local lev = self.CurrMassLevel;
    local ability = 0.6 + self.CurrMassIndex * 0.03;
    local bounsRiseRate = 0.6 + self.CurrMassIndex * 0.03 * 0.5;

    -- ����
    local r = math.random(1, 3);
    if (r == 1) then
        npc = CreateNpcInDungeon(self.ObjectId, SpawnBossId[self.NextBossIndex], DUNGEON_FACTION1, SpawnNpcPos_Center1_v1.x, SpawnNpcPos_Center1_v1.y, 0, lev, ability, bounsRiseRate)
        SetNpcPatrolPath(npc, PatrolPathCenter1_v1);
    elseif (r == 2) then
        npc = CreateNpcInDungeon(self.ObjectId, SpawnBossId[self.NextBossIndex], DUNGEON_FACTION1, SpawnNpcPos_Top1_v1.x, SpawnNpcPos_Top1_v1.y, 0, lev, ability, bounsRiseRate)
        SetNpcPatrolPath(npc, PatrolPathTop1_v1);
    elseif (r == 3) then
        npc = CreateNpcInDungeon(self.ObjectId, SpawnBossId[self.NextBossIndex], DUNGEON_FACTION1, SpawnNpcPos_Bottom1_v1.x, SpawnNpcPos_Bottom1_v1.y, 0, lev, ability, bounsRiseRate)
        SetNpcPatrolPath(npc, PatrolPathBottom1_v1);
    end

    -- ����
    local r = math.random(1, 3);
    if (r == 1) then
        npc = CreateNpcInDungeon(self.ObjectId, SpawnBossId[self.NextBossIndex], DUNGEON_FACTION2, SpawnNpcPos_Center2_v1.x, SpawnNpcPos_Center2_v1.y, 0, lev, ability, bounsRiseRate)
        SetNpcPatrolPath(npc, PatrolPathCenter2_v1);
    elseif (r == 2) then
        npc = CreateNpcInDungeon(self.ObjectId, SpawnBossId[self.NextBossIndex], DUNGEON_FACTION2, SpawnNpcPos_Top2_v1.x, SpawnNpcPos_Top2_v1.y, 0, lev, ability, bounsRiseRate)
        SetNpcPatrolPath(npc, PatrolPathTop2_v1);
    elseif (r == 3) then
        npc = CreateNpcInDungeon(self.ObjectId, SpawnBossId[self.NextBossIndex], DUNGEON_FACTION2, SpawnNpcPos_Bottom2_v1.x, SpawnNpcPos_Bottom2_v1.y, 0, lev, ability, bounsRiseRate)
        SetNpcPatrolPath(npc, PatrolPathBottom2_v1);
    end

    -- ����״̬
    if (self.SpawnBossLeft > 0) then
        self.SpawnBossLeft = self.SpawnBossLeft - 1;
    end

    self:UpdateStateAfterSpawn();

    self.NextBossIndex = self.NextBossIndex + 1;

    self.NextBossBoShu = (self.NextBossIndex * SpawnBossInterval) + math.random(-3, 3);

    -- ֪ͨ������
    local str = LAN("msg_script_spawn_boss"); -- "�������ص�BOSS�Ѿ��ֱ���ս������Э����ս��";
    DungeonFactionReceiveMsg(self.ObjectId, DUNGEON_FACTION_ALL, str, CHANNEL_SYS);
end


function CDungeon_3C:SpawnGift()
    local r = math.random(table.getn(SpawnGiftPos));

    local x = SpawnGiftPos[r].x;
    local y = SpawnGiftPos[r].y;
    local x1 = SpawnGiftProtectorPos[r].x;
    local y2 = SpawnGiftProtectorPos[r].y;

    local npcCount = table.getn(SpawnGiftNpc);
    local i = math.floor((npcCount * self.CurrMassIndex) / 30 + math.random(-2, 2));
    if (i < 1) then
        i = 1;
    elseif (i > npcCount) then
        i = npcCount;
    end

    CreateNpcInDungeon(self.ObjectId, SpawnGiftNpc[i], DUNGEON_FACTION_NEUTRAL, x, y, 0, 0, 0, 1);
    -- �����ػ���
    CreateNpcInDungeon(self.ObjectId, SpawnGiftProtectorNpc, DUNGEON_FACTION_NEUTRAL, x1, y1, 0, self.CurrMassLevel, 0.6 + self.CurrMassIndex * 0.03,  0.6 + self.CurrMassIndex * 0.03*0.5)

    local str = LAN("msg_script_spawn_box"); -- "һ�����������������������ص������ػ�����";
    DungeonFactionReceiveMsg(self.ObjectId, DUNGEON_FACTION_ALL, str, CHANNEL_SYS);

    OutputLog("[CDungeon_3C:SpawnGift]  Gift Pos = ("..x..", "..y.."), Npc = "..SpawnGiftNpc[i]);
end


function CDungeon_3C:BroadcastSpawn()
    
    local str = LAN("msg_script_spawn_monsternext"); -- "��һ�ֵĹ����Ѿ�ˢ�£�ǿ��Ϊ%d";
    str = string.format(str, self.CurrMassIndex);
    DungeonFactionReceiveMsg(self.ObjectId, DUNGEON_FACTION_ALL, str, CHANNEL_SYS);
end

