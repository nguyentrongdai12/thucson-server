
include("script/dungeon/dungeon_object.lua")


CDungeon_TD = class(CDungeonObject)


DungeonTable[1] = CDungeon_TD



local TD_SpawnNpc = { 4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,4682,4683,4684,4685,4686,4687,4688,4689,4690,4691,}
local TD_SpawnNpc_Left = { 4701,4702,4703,4704,4705,4706,4707,4708,4709,4710,4701,4702,4703,4704,4705,4706,4707,4708,4709,4710,4701,4702,4703,4704,4705,4706,4707,4708,4709,4710,4701,4702,4703,4704,4705,4706,4707,4708,4709,4710,4701,4702,4703,4704,4705,4706,4707,4708,4709,4710,4701,4702,4703,4704,4705,4706,4707,4708,4709,4710,4701,4702,4703,4704,4705,4706,4707,4708,4709,4710,4701,4702,4703,4704,4705,4706,4707,4708,4709,4710,4701,4702,4703,4704,4705,4706,4707,4708,4709,4710,4701,4702,4703,4704,4705,4706,4707,4708,4709,4710,4701,4702,4703,4704,4705,4706,4707,4708,4709,4710}
local TD_SpawnNpc_Right = { 4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720}
local TD_SpawnBoss = { 4725,4737,4729,4738,4730,4740,4741,4739,4742,4743,4725,4737,4729,4738,4730,4740,4741,4739,4742,4743,4725,4737,4729,4738,4730,4740,4741,4739,4742,4743}
local TD_MaxSpawnLevel = 100;



function CDungeon_TD:UpdateActorLevel()
    if (self.ActorLevel == 0) then
        local total = DungeonFactionGetActorCount(self.ObjectId, DUNGEON_FACTION1);
        local MaxLevel = 0 ;
        local AllLevel = 0 ;
        if (total > 0) then
            for i=0,total-1 do
                local oneActor = DungeonFactionGetActor(self.ObjectId, DUNGEON_FACTION1, i);
                self.ActorLevel = GetCreLev(oneActor) 
                if ( self.ActorLevel > MaxLevel ) then
                    MaxLevel = self.ActorLevel
                end

                AllLevel = self.ActorLevel + AllLevel
            end
            self.ActorLevel = math.floor( AllLevel / total);
            if ( self.ActorLevel <= MaxLevel - 5 ) then
                self.ActorLevel = MaxLevel - 5
            end

            if (self.ActorLevel < 1) then
                self.ActorLevel = 1;
            end

        end
    end
end


function CDungeon_TD:ctor(idx, objectId)
    --OutputLog("[CDungeon_TD:ctor]               Index = "..self.Index.." ObjectId "..self.ObjectId)

    -- ��ʼ������ 
    LOAD_LAN("msg_script_protect_spawn");
    LOAD_LAN("msg_script_protect_more");
    LOAD_LAN("msg_script_protect_boss");
	LOAD_LAN("msg_script_protect_bouns");
	LOAD_LAN("msg_script_protect_exp");
	LOAD_LAN("msg_script_protect_nimbus");
    LOAD_LAN("msg_script_protect_gold");
	LOAD_LAN("msg_script_protect_train");
	LOAD_LAN("msg_script_protect_stand");
	
    -- ע���¼�������Ҫ���¼���Ҫע�ᣡ��
    RegisterDungeonEvent(objectId, EV_DUNGEON_BEGIN);
    RegisterDungeonEvent(objectId, EV_DUNGEON_END);
    RegisterDungeonEvent(objectId, EV_DUNGEON_1SEC_TIMER);
    --RegisterDungeonEvent(objectId, EV_DUNGEON_1SEC_TIMER_DEAD);
    --RegisterDungeonEvent(objectId, EV_DUNGEON_ACTOR_DEAD);
    RegisterDungeonEvent(objectId, EV_DUNGEON_ACTOR_REVIVE);
    --RegisterDungeonEvent(objectId, EV_DUNGEON_MASS_CREATE);
    RegisterDungeonEvent(objectId, EV_DUNGEON_MASS_DEAD);
    RegisterDungeonEvent(objectId, EV_DUNGEON_ACTOR_APPLYQUIT);

    -- ��ʼ������
    self.Protector = 0 ;        -- ������NPC
    self.ActorLevel = 0 ;       -- ����ʱ��ҵĵȼ��������ж�ˢ�ֵĵȼ���
    self.TD_Score = 0;          -- ����ʱ�����ӵĻ���
    self.TD_KillNum = 0;        -- �ܵ�ɱ����
    self.TD_Exp = 0 ;           -- ��������
    self.TD_Nimbus = 0 ;        -- ��������
    self.TD_Money = 0 ;         -- ������Ǯ
    self.TD_God = 0 ;           -- ����Ԫ����

    self.CurrMassLevel = 0;      -- ��ǰˢ�µ�Level
	self.TenLevel = 0;			 --����10������
	self.Bouns = 0.5;	         --ÿ����10�ֽ���ϵ��

    self.CurrState = 2;         -- ��ǰ��״̬��0-�ȴ�ˢ��  1-ˢ�ֹ�����   2-ˢ�ֽ�����
    self.NextSpawnTime = 0      -- ��һ��ˢ�ֵ�ʱ��
    self.SpawnMonsterLeft = 0;  -- ����ʣ��û��ˢ�Ĺ�������
    self.SpawnBossLeft = 0;     -- ����ʣ��û��ˢ��BOSS����
    self.SpawnSecondsCounter = 0; -- ˢ�ֵ�����������10����ˢ����һ����
    self.TeamName = "";

end


function CDungeon_TD:On1SecTimer(dungeon, now)
    --OutputLog("[CDungeon_TD:On1SecTimer]        Dungeon = "..dungeon.." Now = "..now)

    if (self.ActorLevel <= 0) then
        EndDungeon(self.ObjectId, DUNGEON_FACTION2)
        return
    end
	
    if (self.CurrMassLevel > 10) then
		self.TenLevel = math.floor(self.CurrMassLevel/10) - 1;
    end
	
	if (self.TenLevel > 4) then
        self.TenLevel = 4
	end
	
	self.TD_Exp = GetMonsterExp (self.ActorLevel) * self.TD_KillNum * (1+ self.Bouns*self.TenLevel)
	self.TD_Nimbus = GetMonsterNimbus (self.ActorLevel) * self.TD_KillNum * (1+ self.Bouns*self.TenLevel)
	self.TD_Money = GetMonsterGold (self.ActorLevel) * self.TD_KillNum * (1+ self.Bouns*self.TenLevel)
	
    -- �Ƿ�������һ��NPC
    if self.CurrState == 0 then
        if (now >= self.NextSpawnTime) then
            self.CurrState = 1;

            self.NextSpawnTime = 0;

            self:SpawnMass();

            self:SpawnLeftAndRight();

            self.SpawnSecondsCounter = 1;
        end

    elseif self.CurrState == 1 then

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

            self.SpawnSecondsCounter = 1;
        end

    elseif self.CurrState == 2 then
        local aliveMassesCount = DungeonFactionGetAliveMassesCount(self.ObjectId, DUNGEON_FACTION2)

        if aliveMassesCount == 0 then
            if (self.CurrMassLevel >= TD_MaxSpawnLevel) then
                EndDungeon(dungeon, DUNGEON_FACTION1);

                --[[
                local content = RICH_TEXT_BEGIN..GetFileContent("dungeon/protect_success.xml")..RICH_TEXT_END;
                local passLevel = self.CurrMassLevel;
                content = string.gsub(content, "$DEFENCE_COUNT", passLevel);
		        content = string.gsub(content, "$TD_Score", self.TD_Score);
		        content = string.gsub(content, "$TD_Exp", self.TD_Exp);
	            content = string.gsub(content, "$TD_Nimbus", self.TD_Nimbus);
	            content = string.gsub(content, "$TD_Money", self.TD_Money);
                content = string.gsub(content, "$TD_God", self.TD_God);
                DungeonShowMsg(dungeon, DUNGEON_FACTION_ALL, content, 1, 1);
                --]]

            else
                self.CurrState = 0;
                self.NextSpawnTime = now + 10
                self.CurrMassLevel = self.CurrMassLevel + 1
                DungeonSetDataInt(self.ObjectId, "lev", self.CurrMassLevel, 1)

                --ÿ5������1����
                self.SpawnMonsterLeft = math.floor((self.CurrMassLevel ) / 5 + 3);

                if (math.mod(self.CurrMassLevel, 5) == 4) then
                    self.SpawnBossLeft = 1;
                else
                    self.SpawnBossLeft = 0;
                end
				
				
				--Bulletin�������ʾ
				if (DungeonIsTrainMode(dungeon) == 1) then --��ǰΪѵ��ģʽ
					local trainExp = self.TD_Exp * 0.1;
					local trainNimbus = self.TD_Nimbus * 0.2;
					local trainMoney = self.TD_Money * 0.1;
					
					local LAN_SPAWN_NEXT1 = LAN("msg_script_protect_train"); -- "ѵ��ģʽ";
					local strNextSpawn1 = string.format(LAN_SPAWN_NEXT1);
					--DungeonFactionReceiveBulletin(dungeon, DUNGEON_FACTION1, strNextSpawn1);
					
					--local LAN_SPAWN_NEXT2 = LAN("msg_script_protect_exp"); -- "Ŀǰ�ۼƽ�������%d";   
                    --local strNextSpawn2 = string.format(LAN_SPAWN_NEXT2, trainExp);
					--strNextSpawn1 = strNextSpawn1 .. string.format("\n") .. strNextSpawn2;
					--OutputLog(strNextSpawn1);
                    --DungeonFactionReceiveBulletin(dungeon, DUNGEON_FACTION1, strNextSpawn1);
					
					local LAN_SPAWN_NEXT2 = LAN("msg_script_protect_nimbus"); -- "Ŀǰ�ۼƽ�������%d";
                    local strNextSpawn2 = string.format(LAN_SPAWN_NEXT2, trainNimbus);
					strNextSpawn1 = strNextSpawn1 .. string.format("\n") .. strNextSpawn2;
                    DungeonFactionReceiveBulletin(dungeon, DUNGEON_FACTION1, strNextSpawn1);
					
					--local LAN_SPAWN_NEXT4 = LAN("msg_script_protect_gold"); -- "Ŀǰ�ۼƽ�����Ǯ%d";
                    --local strNextSpawn4 = string.format(LAN_SPAWN_NEXT4, trainMoney);
                    --DungeonFactionReceiveBulletin(dungeon, DUNGEON_FACTION1, strNextSpawn4);
					
				else 									  --��ǰΪ��ʽģʽ
					local standExp = self.TD_Exp * 0.5 * 1.5;
					local standNimbus = self.TD_Nimbus * 0.5 * 1.5*3;
					local standMoney = self.TD_Money * 0.5; 
					
					local LAN_SPAWN_NEXT1 = LAN("msg_script_protect_stand"); -- "����ģʽ";
					local strNextSpawn1 = string.format(LAN_SPAWN_NEXT1);
					--DungeonFactionReceiveBulletin(dungeon, DUNGEON_FACTION1, strNextSpawn1);
					
					local LAN_SPAWN_NEXT2 = LAN("msg_script_protect_bouns"); -- "��ǰ��������Ϊ%d,�ӵ�20����ʼÿ����10�������";
					local strNextSpawn2 = string.format(LAN_SPAWN_NEXT2, 100+self.Bouns*100*self.TenLevel);
					strNextSpawn1 = strNextSpawn1 .. string.format("\n") .. strNextSpawn2;
                    --DungeonFactionReceiveBulletin(dungeon, DUNGEON_FACTION1, strNextSpawn2);
					
					local LAN_SPAWN_NEXT3 = LAN("msg_script_protect_exp"); -- "Ŀǰ�ۼƽ�������%d";
                    local strNextSpawn3 = string.format(LAN_SPAWN_NEXT3, standExp);
					strNextSpawn1 = strNextSpawn1 .. string.format("\n") .. strNextSpawn3;
                    --DungeonFactionReceiveBulletin(dungeon, DUNGEON_FACTION1, strNextSpawn3);
					
					local LAN_SPAWN_NEXT4 = LAN("msg_script_protect_nimbus"); -- "Ŀǰ�ۼƽ�������%d";
                    local strNextSpawn4 = string.format(LAN_SPAWN_NEXT4, standNimbus);
					strNextSpawn1 = strNextSpawn1 .. string.format("\n") .. strNextSpawn4;
                    --DungeonFactionReceiveBulletin(dungeon, DUNGEON_FACTION1, strNextSpawn4);
					
					local LAN_SPAWN_NEXT5 = LAN("msg_script_protect_gold"); -- "Ŀǰ�ۼƽ�����Ǯ%d";
                    local strNextSpawn5 = string.format(LAN_SPAWN_NEXT5, standMoney);
					strNextSpawn1 = strNextSpawn1 .. string.format("\n") .. strNextSpawn5;
                    DungeonFactionReceiveBulletin(dungeon, DUNGEON_FACTION1, strNextSpawn1);
				end
				
            end
        end
    end

end


function CDungeon_TD:On1SecTimer_Dead(dungeon, now)
    --OutputLog("[CDungeon_TD:On1SecTimer_Dead]   Dungeon = "..dungeon)

end


function CDungeon_TD:OnDungeonBegin(dungeon)
    --OutputLog("[CDungeon_TD:OnDungeonBegin]     Dungeon = "..dungeon)
    self:UpdateActorLevel();
    self.Protector = CreateNpcInDungeon(self.ObjectId, 4692, DUNGEON_FACTION1, 627, 41, 0, self.ActorLevel , 10, 1)

    --�̵�
    --CreateNpcInDungeon(self.ObjectId, 4700, DUNGEON_FACTION_OBSERVER, 615, 41, 0, 0, 1, 1)
    DisActiveAI(self.Protector)
    --AddEffectEx(self.Protector, 1, 0, 0, 0, 0)
end


function CDungeon_TD:OnDungeonEnd(dungeon,winner)
    --OutputLog("[CDungeon_TD:OnDungeonEnd]       Dungeon = "..dungeon)

    -- ����ʤ����������
    local i;
    local actor;
    local total = DungeonFactionGetActorCount(dungeon, DUNGEON_FACTION1);
    local contentwt = RICH_TEXT_BEGIN..GetFileContent("dungeon/protect_success.xml")..RICH_TEXT_END;
    local contentlt = RICH_TEXT_BEGIN..GetFileContent("dungeon/protect_fail.xml")..RICH_TEXT_END;
    local contentws = RICH_TEXT_BEGIN..GetFileContent("dungeon/protect_success.xml")..RICH_TEXT_END;
    local contentls = RICH_TEXT_BEGIN..GetFileContent("dungeon/protect_fail.xml")..RICH_TEXT_END;
    
    local passLevel = self.CurrMassLevel - 1;
    if (passLevel < 0) then
        passLevel = 0  
    end

    --OutputLog("ActorLevel = "..self.ActorLevel)
    --OutputLog("CreateNum = "..self.TD_KillNum)
    
    self.TD_Nimbus = GetMonsterNimbus (self.ActorLevel) * self.TD_KillNum * (1+ self.Bouns*self.TenLevel)
	
  
	
	--OutputLog("TenLevel = "..self.TenLevel)
	self.TD_Exp = GetMonsterExp (self.ActorLevel) * self.TD_KillNum * (1+ self.Bouns*self.TenLevel)
    self.TD_Money = GetMonsterGold (self.ActorLevel) * self.TD_KillNum * (1+ self.Bouns*self.TenLevel)
	
    -- ѵ����
    if (DungeonIsTrainMode(dungeon) == 1) then
        if (winner == DUNGEON_FACTION1) then -- Ӯ��	

            local total = DungeonFactionGetActorCount(dungeon, DUNGEON_FACTION1);
            
            for i=0,total-1 do
                actor = DungeonFactionGetActor(dungeon, DUNGEON_FACTION1, i);

                --AddExp (actor,self.TD_Exp*0.1,0);
                AddNimbus (actor,self.TD_Nimbus*0.2,0);
                --AddMoney (actor,self.TD_Money*0.1);
            end
            
            contentwt = string.gsub(contentwt, "$DEFENCE_COUNT", passLevel);
            contentwt = string.gsub(contentwt, "$TD_Score", 0);                        
            contentwt = string.gsub(contentwt, "$TD_Exp", 0);
            contentwt = string.gsub(contentwt, "$TD_Nimbus", math.floor(self.TD_Nimbus*0.2));
            contentwt = string.gsub(contentwt, "$TD_Money", 0); 
            contentwt = string.gsub(contentwt, "$TD_God", 0);
            DungeonShowMsg(dungeon, DUNGEON_FACTION_ALL, contentwt, 1, 1);
            
        elseif (winner == DUNGEON_FACTION2) then -- ����
            if (self.CurrMassLevel >= 1) then

                local total = DungeonFactionGetActorCount(dungeon, DUNGEON_FACTION1);
                
                for i=0,total-1 do
                    actor = DungeonFactionGetActor(dungeon, DUNGEON_FACTION1, i);

                    --AddExp (actor,self.TD_Exp*0.1,0);
                    AddNimbus (actor,self.TD_Nimbus*0.2,0);
                    --AddMoney (actor,self.TD_Money*0.1);
                end

                contentlt = string.gsub(contentlt, "$DEFENCE_COUNT", passLevel);
                contentlt = string.gsub(contentlt, "$TD_Score", 0); 
                contentlt = string.gsub(contentlt, "$TD_Exp", 0);
                contentlt = string.gsub(contentlt, "$TD_Nimbus", math.floor(self.TD_Nimbus*0.2));
                contentlt = string.gsub(contentlt, "$TD_Money", 0);
                contentlt = string.gsub(contentlt, "$TD_God", 0);
                DungeonShowMsg(dungeon, DUNGEON_FACTION_ALL, contentlt, 1, 1);
                
            end
        end
    end

    --��ʽ��
    if (DungeonIsTrainMode(dungeon) ~= 1) then
        self.TD_Score = self.CurrMassLevel * 10

        if (winner == DUNGEON_FACTION1) then -- Ӯ��	
            
            for i=0,total-1 do
                actor = DungeonFactionGetActor(dungeon, DUNGEON_FACTION1, i);

                AddUserDungeonScore(actor, DUNGEON_PVE, self.TD_Score);
                AddExp (actor,self.TD_Exp*0.5*1.5,0);
                AddNimbus (actor,self.TD_Nimbus*0.5*1.5*3,0);
                AddMoney (actor,self.TD_Money*0.5);
                if ( self.CurrMassLevel > 10 ) then
                    self.TD_God = 100*(GetGodLev(actor)+29) /3 ;
                    AddGodExp (actor , self.TD_God )
                end
            end
            actor = DungeonFactionGetActor(dungeon, DUNGEON_FACTION1, 0);
            self.TeamName = GetUserDungeonTeam(actor);
            local teamScore = AddDungeonTeamScore(self.TeamName, DUNGEON_PVE, self.TD_Score*5);
            OutputLog(" teamScore = "..teamScore);
            contentws = string.gsub(contentws, "$DEFENCE_COUNT", passLevel);
            contentws = string.gsub(contentws, "$TD_Score", self.TD_Score);
            contentws = string.gsub(contentws, "$TD_Exp", math.floor(self.TD_Exp*0.5*1.5));
            contentws = string.gsub(contentws, "$TD_Nimbus", math.floor(self.TD_Nimbus*0.5*1.5*3));
            contentws = string.gsub(contentws, "$TD_Money", math.floor(self.TD_Money*0.5));
            contentws = string.gsub(contentws, "$TD_God", self.TD_God);
            DungeonShowMsg(dungeon, DUNGEON_FACTION_ALL, contentws, 1, 1);
            
        elseif (winner == DUNGEON_FACTION2) then -- ����
    	    self.TD_Score = (self.CurrMassLevel - 1) * 10
            if (self.TD_Score < 0) then
                self.TD_Score = 0  
            end

            if (self.CurrMassLevel >= 1) then
                local total = DungeonFactionGetActorCount(dungeon, DUNGEON_FACTION1);
                
                for i=0,total-1 do
                    actor = DungeonFactionGetActor(dungeon, DUNGEON_FACTION1, i);

                    AddUserDungeonScore(actor, DUNGEON_PVE, self.TD_Score);
                    AddExp (actor,self.TD_Exp*0.5*1.5,0);
                    AddNimbus (actor,self.TD_Nimbus*0.5*1.5*3,0);
                    AddMoney (actor,self.TD_Money*0.5);
                    if ( self.CurrMassLevel > 10 ) then
                        self.TD_God = 100*(GetGodLev(actor)+29) /3 ;
                        AddGodExp (actor , self.TD_God )
                    end
                end
                actor = DungeonFactionGetActor(dungeon, DUNGEON_FACTION1, 0);
                self.TeamName = GetUserDungeonTeam(actor);
                local teamScore = AddDungeonTeamScore(self.TeamName, DUNGEON_PVE, self.TD_Score*5);
                OutputLog(" teamScore = "..teamScore);
                contentls = string.gsub(contentls, "$DEFENCE_COUNT", passLevel);
                contentls = string.gsub(contentls, "$TD_Score", self.TD_Score);                    
                contentls = string.gsub(contentls, "$TD_Exp", math.floor(self.TD_Exp*0.5*1.5));
                contentls = string.gsub(contentls, "$TD_Nimbus", math.floor(self.TD_Nimbus*0.5*1.5*3));
                contentls = string.gsub(contentls, "$TD_Money", math.floor(self.TD_Money*0.5));
                contentls = string.gsub(contentls, "$TD_God", self.TD_God);
                DungeonShowMsg(dungeon, DUNGEON_FACTION_ALL, contentls, 1, 1);
                
            end
        end

    end
end

function CDungeon_TD:OnDungeonActorDead(dungeon, actorId, killer, faction)
    --OutputLog("[CDungeon_TD:OnDungeonActorDead] Dungeon = "..dungeon.." CreId = "..actorId)

end


function CDungeon_TD:OnDungeonActorRevive(dungeon, actorId)
    --OutputLog("[CDungeon_TD:OnDungeonActorRevive] Dungeon = "..dungeon.." CreId = "..actorId)
    AddEffectEx(actorId,2094,0,0,0,0)
end


function CDungeon_TD:OnDungeonMassCreate(dungeon, massId)
    --OutputLog("[CDungeon_TD:OnDungeonMassCreate]  Dungeon = "..dungeon.." CreId = "..massId)

end


function CDungeon_TD:OnDungeonMassDead(dungeon, massId, killer, faction)
    --OutputLog("[CDungeon_TD:OnDungeonMassDead]   Dungeon = "..dungeon.." CreId = "..massId)
    if (faction == DUNGEON_FACTION2) then
        self.TD_KillNum = self.TD_KillNum +1
    end

    if (massId == self.Protector) then
        EndDungeon(self.ObjectId, DUNGEON_FACTION2)
    end
end


function CDungeon_TD:OnDungeonActorApplyQuit(dungeon, actorId)
    --OutputLog("[CDungeon_TD:OnDungeonActorApplyQuit]  Dungeon = "..dungeon.." CreId = "..actorId)

    --CenterMsg(actorId, "���ڱ��������в������˳�");

    --[[EndDungeon(self.ObjectId, DUNGEON_FACTION2)

    local content = RICH_TEXT_BEGIN..GetFileContent("dungeon/protect_fail.xml")..RICH_TEXT_END;
    local passLevel = self.CurrMassLevel - 1;
    if (passLevel < 0) then
            passLevel = 0  
    end
    content = string.gsub(content, "$DEFENCE_COUNT", passLevel);
    content = string.gsub(content, "$TD_Score", self.TD_Score);
    content = string.gsub(content, "$TD_Exp", self.TD_Exp);
    content = string.gsub(content, "$TD_Nimbus", self.TD_Nimbus);
    content = string.gsub(content, "$TD_Money", self.TD_Money);
    content = string.gsub(content, "$TD_God", self.TD_God);
    DungeonShowMsg(dungeon, DUNGEON_FACTION_ALL, content, 1, 1);
    --]]

    LeaveDungeon(self.ObjectId, actorId);

end


function CDungeon_TD:SpawnMass()
    local x = 626;
    local y = 126;
    --local delta_x = 0;
    --local delta_y = -40;
    --local delta_x1 = 20;
    --local delta_y1 =  0;
    
    --for i=1,massCount do
        --CreateNpcInDungeon(self.ObjectId, TD_SpawnNpc[self.CurrMassLevel], DUNGEON_FACTION2, x + delta_x * i, y + delta_y * i, 0, self.ActorLevel , 0.6+self.CurrMassLevel * 0.2, 0.6+self.CurrMassLevel * 0.2)
    --end

    CreateNpcInDungeon(self.ObjectId, TD_SpawnNpc[self.CurrMassLevel], DUNGEON_FACTION2, x, y, 0, self.ActorLevel , 0.4+self.CurrMassLevel * 0.2, 0.6+self.CurrMassLevel * 0.2)

    if (self.SpawnMonsterLeft > 0) then
        self.SpawnMonsterLeft = self.SpawnMonsterLeft - 1;
    end

    self:UpdateStateAfterSpawn();
end


function CDungeon_TD:SpawnBoss()
    local x = 627;
    local y = 263;

    local temp = math.floor(self.CurrMassLevel / 5);
    CreateNpcInDungeon(self.ObjectId, TD_SpawnBoss[temp + 1], DUNGEON_FACTION2, x, y, 0, self.ActorLevel , 0.6+self.CurrMassLevel * 0.3, 0.6+self.CurrMassLevel * 0.3)

    --LAN_SPAWN_NEXT = "�Ⲩ����������boss��";
    local LAN_SPAWN_Boss = LAN("msg_script_protect_boss");
    DungeonFactionReceiveBulletin(self.ObjectId, DUNGEON_FACTION1, LAN_SPAWN_Boss);

    if (self.SpawnBossLeft > 0) then
        self.SpawnBossLeft = self.SpawnBossLeft - 1;
    end

    self:UpdateStateAfterSpawn();
end


function CDungeon_TD:SpawnLeftAndRight()
    local x_left = 576;
    local y_left = 36;
    local x_right = 680;
    local y_right = 36;
    local i

    if (math.mod(self.CurrMassLevel, 5) == 3) then
        -- ��3���͵�8�����߳���
        local spawn_left = 2
        local spawn_right = 2

        --LAN_SPAWN_More = "�Ⲩ���������������͵Ϯ�����ˡ�";
        local LAN_SPAWN_More = LAN("msg_script_protect_more");
        DungeonFactionReceiveBulletin(self.ObjectId, DUNGEON_FACTION1, LAN_SPAWN_More);

        for i=1,spawn_left do
            CreateNpcInDungeon(self.ObjectId, TD_SpawnNpc_Left[self.CurrMassLevel], DUNGEON_FACTION2, x_left, y_left, 0, self.ActorLevel , 0.4+self.CurrMassLevel * 0.2, 0.4+self.CurrMassLevel * 0.2)
        end

        for i=1,spawn_right do
            CreateNpcInDungeon(self.ObjectId, TD_SpawnNpc_Right[self.CurrMassLevel], DUNGEON_FACTION2, x_right, y_right, 0, self.ActorLevel , 0.4+self.CurrMassLevel * 0.2, 0.4+self.CurrMassLevel * 0.2)
        end
        
    end

end


function CDungeon_TD:UpdateStateAfterSpawn()
    if (self.CurrState == 1) then
        if (self.SpawnMonsterLeft <= 0 and self.SpawnBossLeft <= 0) then
            self.CurrState = 2;
        end
    end
end

