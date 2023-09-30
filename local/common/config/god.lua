OpenFlag = 1 --Ԫ��ϵͳ�Ƿ񿪷�, 1 : ����, 0 : �ر�

GodSysNeedMinLevel = 10 							--Ԫ��ϵͳ��Ҫ��С�ȼ�
GodPowerRecoverPerMinute = 1			--Ԫ����ÿ���ӻظ�
PractiseConsumeGodPowerPerHour = 20		--�չ�ʱÿСʱ���ĵ�Ԫ����

ZxMinUseLev = 0	--������ʹ�õ���С�ȼ�

--ȡ��ÿ�ȼ��ıչ�����ʱ��
function GetHourByLevel(nLevel)
	  return nLevel*2
end

--Ԫ�������б�
GodSkillSet = {1300}

--��������Ԫ������������Ԫ��ȼ�
function GetMaxGodPower(nGodLevel)
	local nMaxGodPower = 0;
    nMaxGodPower = 100 + math.floor(nGodLevel/10)*10;
	return nMaxGodPower
end

--���ɴ����ľ���
function GetMaxStoredExp(nLevel, nGodLevel)
		return GetLevelExp(nLevel)
end

--���ɴ洢������
function GetMaxStoredNimbus(nLevel, nGodLevel)
		return GetLevelNimbus(nLevel)*2
end

--�չ�ʱÿСʱ��������,Ԫ��ȼ�����Ч��
function GetGodExpInc(nLevel, nGodLevel)
		local added = GetLevelExp(nLevel)/GetHourByLevel(nLevel)*0.2
		if(added < 30) then
			added = 30
		end
		return added
end

--�չ���ÿСʱ��������,Ԫ��ȼ�����Ч��
function GetGodNimbusInc(nLevel, nGodLevel)
    local added = GetLevelNimbus(nLevel)/GetHourByLevel(nLevel)*0.2
    if(added < 20) then
    	added = 20
    end
    return added
end

--������+exp
function GetZiXuanGuoExpIncPerHour(nLevel, nGodLevel)
    local added = GetLevelExp(nLevel)/GetHourByLevel(nLevel)
    if(added < 30) then
    	added = 30
    end
    return added
end

--+nimbus
function GetZiXuanGuoNimbusIncPerHour(nLevel, nGodLevel)
    local added = GetLevelNimbus(nLevel)/GetHourByLevel(nLevel)
    if(added < 20) then
    	added = 20
    end
    return added
end

--��������ÿСʱ
function GetZiXuanGuoExpandPerHour(nLevel, nGodLevel)
    local num = nLevel/2
    if(num < 1) then
    	num = 1
    end
    return num
end

--Ԫ�龫��
function GetYuanLingJingHunNimbusIncPerHour(nLevel, nGodLevel)
    local added = GetLevelNimbus(nLevel)/GetHourByLevel(nLevel)*2
    if(added < 100) then
    		added = 100
    end
    return added
end

--����
function GetYuanLingJingHunExpandPerHour(nLevel, nGodLevel)
    local num = nLevel/2
    if(num < 1) then
    	num = 1
    end
    return num
end

--Ԫ������
function OnGodLevUp(nUserId, nGodLev, nParty)
    if nGodLev == 2 then
        AddGodSkill(nUserId, 1300)
    end
end

--��ҽ�����Ϸ
function OnCreEnterWorld(nUserId, nLevel, nGodLev, nParty)
    if nGodLev >= 2 then
        AddGodSkill(nUserId, 1300)
    end
end

--Ԫ��ƺ�
function GetGodTitle(nGodLevel)    
  if nGodLevel >=1 and nGodLevel <= 3 then
    	return "msg_god1_1";
 	elseif nGodLevel >= 4 and nGodLevel <= 6 then
			return "msg_god1_2";
	elseif nGodLevel >= 7 and nGodLevel <= 10 then
			return "msg_god1_3";
	
	elseif nGodLevel >= 11 and nGodLevel <= 13 then
			return "msg_god2_1";
	elseif nGodLevel >= 14 and nGodLevel <= 16 then
			return "msg_god2_2";
	elseif nGodLevel >= 17 and nGodLevel <= 20 then
			return "msg_god2_3";
	
	elseif nGodLevel >= 21 and nGodLevel <= 23 then
			return "msg_god3_1";
	elseif nGodLevel >= 24 and nGodLevel <= 26 then
			return "msg_god3_2";
	elseif nGodLevel >= 27 and nGodLevel <= 30 then
			return "msg_god3_3";
	
	elseif nGodLevel >= 31 and nGodLevel <= 33 then
			return "msg_god4_1";
	elseif nGodLevel >= 34 and nGodLevel <= 36 then
			return "msg_god4_2";
	elseif nGodLevel >= 37 and nGodLevel <= 40 then
			return "msg_god4_3";
	
	elseif nGodLevel >= 41 and nGodLevel <= 43 then
			return "msg_god5_1";
	elseif nGodLevel >= 44 and nGodLevel <= 46 then
			return "msg_god5_2";
	elseif nGodLevel >= 47 and nGodLevel <= 50 then
			return "msg_god5_3";
	
	elseif nGodLevel >= 51 and nGodLevel <= 53 then
			return "msg_god6_1";
	elseif nGodLevel >= 54 and nGodLevel <= 56 then
			return "msg_god6_2";
	elseif nGodLevel >= 57 and nGodLevel <= 60 then
			return "msg_god6_3";
	
	elseif nGodLevel >= 61 and nGodLevel <= 63 then
			return "msg_god7_1";
	elseif nGodLevel >= 64 and nGodLevel <= 66 then
			return "msg_god7_2";
	elseif nGodLevel >= 67 and nGodLevel <= 70 then
			return "msg_god7_3";
	
	elseif nGodLevel >= 71 and nGodLevel <= 73 then
			return "msg_god8_1";
	elseif nGodLevel >= 74 and nGodLevel <= 76 then
			return "msg_god8_2";
	elseif nGodLevel >= 77 and nGodLevel <= 80 then
			return "msg_god8_3";
	
	elseif nGodLevel >= 81 and nGodLevel <= 83 then
			return "msg_god9_1";
	elseif nGodLevel >= 84 and nGodLevel <= 86 then
			return "msg_god9_2";
	elseif nGodLevel >= 87 and nGodLevel <= 90 then
			return "msg_god9_3";   	
   
	else
	    return "msg_god1";
	end
end

--ģ��
function GetGodModel(nGodLevel)
    return "god"
end

function GetGodHint(nGodLevel, nGodState)
    if(nGodLevel==30 and nGodState<1) then
    	 	return "msg_godblock"
    elseif (nGodLevel==60 and nGodState<2) then	
    		return "msg_godblock"
    elseif (nGodLevel==90 and nGodState<3) then	
    		return "msg_godblock"
    else 
		    return "msg_godok"
		end
end



