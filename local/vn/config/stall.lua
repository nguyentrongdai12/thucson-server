OpenFlag = 1 --��̯ϵͳ�Ƿ񿪷�, 1 : ����, 0 : �ر�

MinStallLevel = 10 --��̯��С�ȼ�

CanBuyWhenStall = 0 --��̯ʱ�Ƿ�����������̯λ�Ķ�����1 : ����, 0 : ������

MaxSloganTextSize = 24 --��̯���Ƶ�����ֽڳ���

MaxStallTalkPageItemSize = 20 --��������ֽڳ���

MaxStallTalkPageItemCount = 32 --�����������

StallArea = {2} --���԰�̯������Id

MinStallInterval = 80 --��̯��С���

function OnStallStateChanged(nUserId, nStallState, nLevel, nSex)

	if nStallState == 1 then
	   if nLevel < 30 then
	     if nSex == 0 then
		SetModel(nUserId, 5063)
             else
                SetModel(nUserId, 5064)
	     end
	   elseif nLevel >= 30 then
	     if nSex == 0 then
		SetModel(nUserId, 5065)
	     else
		SetModel(nUserId, 5066)
             end
	   end
	else
		ResetModel(nUserId)
	end

end

