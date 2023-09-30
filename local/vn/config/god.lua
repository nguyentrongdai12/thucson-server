GodPowerRecoverPerMinute = 0.25				--Ԫ����ÿ���ӻظ�

ZxMinUseLev = 30	--������ʹ�õ���С�ȼ�
ExpIncMax = 10000
NimIncMax = 850

--�չ�ʱÿСʱ��������,Ԫ��ȼ�����Ч��
function GetGodExpInc(nLevel, nGodLevel)
		local added = GetLevelExp(nLevel)/GetHourByLevel(nLevel)*0.2
		if(added < 30) then
			added = 30
		end
		if(added > ExpIncMax) then
			added = ExpIncMax
		end
		return added
end

--�չ���ÿСʱ��������,Ԫ��ȼ�����Ч��
function GetGodNimbusInc(nLevel, nGodLevel)
    local added = GetLevelNimbus(nLevel)/GetHourByLevel(nLevel)*0.2
    if(added < 20) then
    	added = 20
    end
    if(added > NimIncMax) then
			added = NimIncMax
		end
    return added
end

--������+exp
function GetZiXuanGuoExpIncPerHour(nLevel, nGodLevel)
    --local added = GetLevelExp(nLevel)/GetHourByLevel(nLevel)
    local added = GetZxExpByTable(nLevel)
    if(added < 30) then
    	added = 30
    end
    return added
end

--+nimbus
function GetZiXuanGuoNimbusIncPerHour(nLevel, nGodLevel)
    --local added = GetLevelNimbus(nLevel)/GetHourByLevel(nLevel)
    local added = GetZxNimbusByTable(nLevel)
    if(added < 20) then
    	added = 20
    end
    return added
end

--��������ÿСʱ
function GetZiXuanGuoExpandPerHour(nLevel, nGodLevel)
    --local num = nLevel/2
    if(nLevel < 30) then
    	return 0
    end
    
    local num = GetZxExpandByTable(nLevel)
    return num
end

--Ԫ�龫��
function GetYuanLingJingHunNimbusIncPerHour(nLevel, nGodLevel)
    --local added = GetLevelNimbus(nLevel)/GetHourByLevel(nLevel)*2
    local added = GetYlNimbusByTable(nLevel)
    if(added < 100) then
    		added = 100
    end
    return added
end

--����
function GetYuanLingJingHunExpandPerHour(nLevel, nGodLevel)
    --local num = nLevel/2
    if(nLevel < 30) then
    	return 0
    end
    local num = GetYlExpandByTable(nLevel)
    return num
end


