PkPunish_GoldRate = {0,10,20};		-- pk�ͷ�����ʧ�Ľ�Ǯ����

PkPunish_ExpRate = {0,2,8};		-- pk�ͷ�����ʧ�ľ������

PkPunish_NimbusRate = {0,2,8};		-- pk�ͷ�����ʧ����������

PkPunish_DropEquipmentRate = {0,0,15};	-- pk�ͷ�������װ���ĸ���

PkPunish_DropMainTrump = false;		-- pk�ͷ����Ƿ���������������

PkPunish_DropSubTrump = false;		-- pk�ͷ����Ƿ���丱���������

DeBuffWeakTime = 30000;			-- DeBuffЧ���������Чʱ��

Ectype_MinRiderLevel = 7;		-- �ڸ���������޵���С����ȼ�

--int GetCreParty(int nCreId)
--int GetCreLev(int nCreId)
--int GetCreHp(int nCreId)
--int GetCreMaxHp(int nCreId)
--int GetCreMp(int nCreId)
--int GetCreMaxMp(int nCreId)
--int AddCreEff(int nCreId, int nAdderId, int nEffId)
--int GetCreSpeed(int nCreId)
--int GetCreDistance(int nCre1Id, int nCre2Id)
--int CreHasEff(int nCreId, int nEffId)
--int IfCreRideThenUnRide(int nCreId)
--int GetNpcTypeId(int nNpcId)

function OnNpcBackAttackUser(nEcyptId, nNpcId, nNpcTypeId, nNpcTitle, nUserId)
   if nEcyptId > 0 then
     Random = math.random(1, 100);
     if (Random < 30) then
        AddCreEff(nUserId, nNpcId, 9)
     end
   end
end

