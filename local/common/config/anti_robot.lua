Version = 1 --ϵͳ�汾
OpenFlag = 1 --ϵͳ�Ƿ񿪷�, 1 : ��, 0 : ��
AutoAskFlag = 1 --�Ƿ�������ش�����, 1 : ��, 0 : ��
MaxAskCount = 3 --���ѯ�ʴ���
AskInterval = 30 * 60 --�漴�ش���������ⷢ�ͼ������λ��
AnswerTimeLimit = 180 --�ش�ʱ�ޣ���λ��
LockDuration = 10 * 60 --��ֹʱ�䣬��λ��
LockAskInterval = 5 * 60 --����ʱ���������ʱ��������λ��
TimeoutAnswerWrongFlag = 1 --��ʱ��Ϊ���

--int GetUserParty(int nUserId);��ȡ����
--int GetUserLevel(int nUserId);��ȡ�ȼ�
--void AddUserExp(int nUserId, int nAddExp);�Ӿ���
--void AddUserNimbus(int nUserId, int nAddNimbus);������
--void AddUserMoney(int nUserId, int nAddMoney);�ӽ�Ǯ
--void AddEffect(int nUserId, int nEffectId);��Buffer

function OnAnswerOk(nUserId)
    if IsGMAsk(nUserId) == 1 then
        return
    end

    iLev = GetUserLevel(nUserId);
    if (iLev < 10) then
        AntiAddUserExp(nUserId, 300)
	AntiAddUserNimbus(nUserId, 150)
    elseif (iLev >= 10 and iLev < 30) then
        AntiAddUserExp(nUserId, 800)
	AntiAddUserNimbus(nUserId, 400)
    elseif (iLev >= 30 and iLev < 60) then
        AntiAddUserExp(nUserId, 1200)
	AntiAddUserNimbus(nUserId, 600)
    else 
	AntiAddUserExp(nUserId, 1800)
	AntiAddUserNimbus(nUserId, 900)
    end
end

function OnAnswerWrong(nUserId, nAskCnt)
    if (nAskCnt == 1) then
        AskUser(nUserId);
        return;
    end

    ClearAskCount(nUserId);

    nOneDayWrongCnt = IncOneDayWrongCnt(nUserId);
    if (nOneDayWrongCnt == 1) then
        LockUser(nUserId, 10 * 60)
    elseif (nOneDayWrongCnt == 2) then
        BlockAccount(nUserId, 60 * 60);
        KickUser(nUserId);
    elseif (nOneDayWrongCnt == 3) then
        BlockAccount(nUserId, 360 * 60);
        KickUser(nUserId);
    else
        BlockAccount(nUserId, 2880 * 60);
        KickUser(nUserId);
    end
end

