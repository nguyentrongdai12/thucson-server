--int GetUserParty(int nUserId)
--int GetUserLevel(int nUserId)

--void CreateItemAndMail(
--    int nUserId,
--    int nItemClassId,
--    char *pszItemColor,
--    char *pszItemBind,
--    int nLimitTime,
--    int nUpdatelev,
--    int nSmithingLev,
--    int nAttributeId
--)

--void AddTeacherPoint(int nTeacherId, int nTeacherPoint)

--void AddUserExp(int nUserId, int nExp)

--void AddUserNimbus(int nUserId, int nNimbus)

--Npc function:
--rtl ��ʦ��
--graduate ��ʦ
--tptc ʦ��ֵ��ȡ����

OpenFlag = 1 --ʦͽϵͳ�Ƿ񿪷�, 1 : ����, 0 : �ر�

MinStduentReqLev = 5 --��Сͽ�ܵȼ�
MaxStduentReqLev = 20 --���ͽ�ܵȼ�
MinTeacherLev = 30 --��Сʦ���ȼ�
MaxUngraduateStduentCnt = 5 --���ѧͽ����
TeacherAwardExpRate = 0.10 --��ʦǰ��ѧͽÿ��һ����ʦ���õ��ĵ�ǰ�ȼ��������
TeacherAwardNimbusRate = 0.40 --��ʦǰ��ѧͽÿ��һ����ʦ���õ��ĵ�ǰ�ȼ���������
StudentAwardExpRate = 0.05 --��ʦǰ��ѧͽÿ��һ����ѧͽ�õ��ĵ�ǰ�ȼ��������
StudentAwardNimbusRate = 0.20 --��ʦǰ��ѧͽÿ��һ����ѧͽ�õ��ĵ�ǰ�ȼ���������
GraduateLev = 30 --��ʦ�ȼ�
AlertReportTimeInterval = 7*24*60*60 --ѧͽ�೤ʱ��û�л㱨�ɼ���ʦ�������޳ͷ��Ŀ�����
SchoolExpPunishRate = 0.05 --ѧͽ�뿪ʦ�Ż���ʦ���޹ʿ���ѧͽʱ����Ӧ�Ŀ۳���ǰ�ȼ�����ı���
UserForbidTimeDuration = 6*60*60 --ѧͽ�뿪ʦ�Ż���ʦ���޹ʿ���ѧͽʱ����ֹ����ʦͽϵͳ��ʱ��
CanAcceptStudent = 1

--[npc ����ID] = {����Id, 1��ʦ��ֵ��ȡ������ֵ}
TeacherPointToCredit = {
    [406] = {CreditId = 14, PerTeacherPointToCredit = 100},
    [407] = {CreditId = 17, PerTeacherPointToCredit = 100},
    [413] = {CreditId = 15, PerTeacherPointToCredit = 100},
    [414] = {CreditId = 16, PerTeacherPointToCredit = 100},
    [4447] = {CreditId = 29, PerTeacherPointToCredit = 100},
    [4865] = {CreditId = 29, PerTeacherPointToCredit = 100},	
    [4101] = {CreditId = 26, PerTeacherPointToCredit = 100},
    [4201] = {CreditId = 22, PerTeacherPointToCredit = 100},
    [4512] = {CreditId = 13, PerTeacherPointToCredit = 100},
    [4650] = {CreditId = 28, PerTeacherPointToCredit = 100},
    [4651] = {CreditId = 30, PerTeacherPointToCredit = 100},
    [4415] = {CreditId = 31, PerTeacherPointToCredit = 100},
    [4863] = {CreditId = 33, PerTeacherPointToCredit = 100},
    [4864] = {CreditId = 33, PerTeacherPointToCredit = 100},
    [5041] = {CreditId = 33, PerTeacherPointToCredit = 100},
}

function OnStudentLevelUp(nStudentId, nLevel, nState) --ѧͽ����
     iParty=GetUserParty(nStudentId)
     if nLevel == 10 then
       if iParty == 0 then
         CreateItemAndMail(nStudentId, 5, "blue", "binded", 0, 0, 0, 156)
	 CreateItemAndMail(nStudentId, 15, "blue", "binded", 0, 0, 0, 156)
       elseif iParty == 1 then
	 CreateItemAndMail(nStudentId, 25, "blue", "binded", 0, 0, 0, 156)
	 CreateItemAndMail(nStudentId, 35, "blue", "binded", 0, 0, 0, 156)
       elseif iParty == 2 then
	 CreateItemAndMail(nStudentId, 551, "blue", "binded", 0, 0, 0, 156)
	 CreateItemAndMail(nStudentId, 561, "blue", "binded", 0, 0, 0, 156)
       elseif iParty == 3 then
	 CreateItemAndMail(nStudentId, 55, "blue", "binded", 0, 0, 0, 156)
	 CreateItemAndMail(nStudentId, 45, "blue", "binded", 0, 0, 0, 156)
       elseif iParty == 4 then
	 CreateItemAndMail(nStudentId, 629, "blue", "binded", 0, 0, 0, 156)
	 CreateItemAndMail(nStudentId, 639, "blue", "binded", 0, 0, 0, 156)
       end
    elseif nLevel == 20 then
       CreateItemAndMailToTeacher(3970, "white", "binded", 0, 0, 0, 0)
       if iParty == 0 then
         CreateItemAndMail(nStudentId, 6, "blue", "binded", 0, 0, 0, 156)
	 CreateItemAndMail(nStudentId, 16, "blue", "binded", 0, 0, 0, 156)
       elseif iParty == 1 then
	 CreateItemAndMail(nStudentId, 26, "blue", "binded", 0, 0, 0, 156)
	 CreateItemAndMail(nStudentId, 36, "blue", "binded", 0, 0, 0, 156)
       elseif iParty == 2 then
	 CreateItemAndMail(nStudentId, 552, "blue", "binded", 0, 0, 0, 156)
	 CreateItemAndMail(nStudentId, 562, "blue", "binded", 0, 0, 0, 156)
       elseif iParty == 3 then
	 CreateItemAndMail(nStudentId, 56, "blue", "binded", 0, 0, 0, 156)
	 CreateItemAndMail(nStudentId, 46, "blue", "binded", 0, 0, 0, 156)
       elseif iParty == 4 then
	 CreateItemAndMail(nStudentId, 630, "blue", "binded", 0, 0, 0, 156)
	 CreateItemAndMail(nStudentId, 640, "blue", "binded", 0, 0, 0, 156)
       end
   elseif nLevel == 30 then
       CreateItemAndMailToTeacher(3971, "white", "binded", 0, 0, 0, 0)
   elseif nLevel == 40 then
       CreateItemAndMail(nStudentId, 3971, "white", "binded", 0, 0, 0, 0)
       CreateItemAndMail(nStudentId, 3971, "white", "binded", 0, 0, 0, 0)
       CreateItemAndMailToTeacher(382, "white", "unbinded", 0, 0, 0, 0)
       CreateItemAndMailToTeacher(382, "white", "unbinded", 0, 0, 0, 0)
       CreateItemAndMailToTeacher(382, "white", "unbinded", 0, 0, 0, 0)
       CreateItemAndMailToTeacher(402, "white", "unbinded", 0, 0, 0, 0)
   end
end

function OnGraduateTeacher(nTeacherId, nCurGraduateStudentCount) --ʦ����ѧͽ��ʦ
    nAddTeacherPoint = 10 + (nCurGraduateStudentCount - 1) * 2
    AddTeacherPoint(nTeacherId, nAddTeacherPoint)
end

function OnGraduateStudent(nStudentId, nLevel) --ѧͽ��ʦ
    iParty=GetUserParty(nStudentId)
    if iParty == 0 then
         CreateItemAndMail(nStudentId, 7, "green", "binded", 0, 0, 0, 153)
         CreateItemAndMail(nStudentId, 17, "green", "binded", 0, 0, 0, 153)
    elseif iParty == 1 then
         CreateItemAndMail(nStudentId, 27, "green", "binded", 0, 0, 0, 153)
	 CreateItemAndMail(nStudentId, 37, "green", "binded", 0, 0, 0, 153)
    elseif iParty == 2 then
	 CreateItemAndMail(nStudentId, 553, "green", "binded", 0, 0, 0, 153)
	 CreateItemAndMail(nStudentId, 563, "green", "binded", 0, 0, 0, 153)
    elseif iParty == 3 then
	 CreateItemAndMail(nStudentId, 57, "green", "binded", 0, 0, 0, 153)
	 CreateItemAndMail(nStudentId, 47, "green", "binded", 0, 0, 0, 153)
    elseif iParty == 4 then
	 CreateItemAndMail(nStudentId, 631, "green", "binded", 0, 0, 0, 153)
	 CreateItemAndMail(nStudentId, 641, "green", "binded", 0, 0, 0, 153)
    end
end


function OnReportGrade(nTeacherId, nStudentId, nReportLev)  --ѧͽ�㱨���ʦ��ֵ
    iStudentLv = GetUserLevel(nStudentId)
    iPreLv = iStudentLv - nReportLev    
    if iPreLv  >= 10 then
	 nAddTeacherPoint = nReportLev
         AddTeacherPoint(nTeacherId, nAddTeacherPoint)
    elseif iPreLv <10 then
	 if (iStudentLv - 10) > 0 then
	    nAddTeacherPoint = iStudentLv - 10
	    AddTeacherPoint(nTeacherId, nAddTeacherPoint)
         end
    end  
end