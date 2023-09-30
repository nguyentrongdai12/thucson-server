include("script/game_script_base.lua")

ItemMaxSmithingLevel                = 20;			        								-- ����������ȼ�

ItemSmithing_FailCounter_Enable     = true;                 					-- �Ƿ�����¼���ߵĴ���ʧ�ܴ���
ItemSmithing_FailCounter_Add        = { 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,3,3,3,3,2,2,2,2,1,1,1,1 }   			-- ����ɹ���(ʧ�ܴ��� * x%)
ItemSmithing_FailCounter_MaxAdd     = 100                    					-- ����ɹ�����󲻳���x%
ItemSmithing_TrumpEffect         		= "eff_wlev10";                   					-- �������ﵽ��ߵȼ�ʱ����Ч
ItemSmithing_TrumpLink           		= "root";                   					-- �������ﵽ��ߵȼ�ʱ����ЧLink��
ItemSmithing_ArmorEffect         		= "eff_alev10";               -- ���ߴﵽ��ߵȼ�ʱ����Ч
ItemSmithing_ArmorLink           		= "root";                   			-- ���ߴﵽ��ߵȼ�ʱ����ЧLink��
ItemSmithing_PlusAttrib_Trump       = { 0,0,0,0,0,0,251,252,253,254,255,256,496,497,498,499,500,501,502,503,523,524,525,526,527 } -- ���ߵ����ض�����ȼ���ÿ������һ����������
ItemSmithing_PlusAttrib_Armor       = { 0,0,0,0,0,0,261,262,263,264,265,266,504,505,506,507,508,509,510,511,512,513,514,515,516 } -- ���ߵ����ض�����ȼ���ÿ������һ����������
ItemSmithing_FailCounter_Clear 			= { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1 } 				-- ����ɹ������ɹ����Ƿ������
ItemSmithing_AddFailCounter 			= { 0,0,0,1,1,1,1,5,10,15,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }   --����ʧ�����ӵ�ʧ�ܴ���

CanSeeOtherEquipment                = true;

ItemEffectSmithingLevel							= 20;	        -- ���ߴﵽ�õȼ�ʱ���ӵ���Ч
ItemRiderEffect                     = "eff_ridelev10"   				-- ����ﵽһ���ȼ�ʱ����Ч
ItemRiderEffectLink                 = "root"      -- ����ﵽһ���ȼ�ʱ����Чlink��


-- ϵͳ��ʼ��
function ItemInit()
    -- ��ʼ������ 
    LOAD_LAN("MSG_SMITHING_SUCCESS")
    LOAD_LAN("MSG_SMITHING_FAIL")
    LOAD_LAN("msg_script_smithing_fail1")
end


-- ����ɹ�
function OnSmithingSuccess(user, item, origSmithingLevel, smithingLevel)
    ReceiveMsg(user, LAN("MSG_SMITHING_SUCCESS"), CHANNEL_SYS);
end


-- ����ʧ��
function OnSmithingFail(user, item, origSmithingLevel, smithingLevel, costGold, failedNum)
    ReceiveMsg(user, LAN("MSG_SMITHING_FAIL"), CHANNEL_SYS);
    
    --if (origSmithingLevel >= 0 and origSmithingLevel < 3) then
    --    ReceiveMsg(user, LAN("MSG_SMITHING_FAIL"), CHANNEL_SYS);
    --elseif (origSmithingLevel >= 3 and origSmithingLevel < 9) then
    --    ReceiveMsg(user, LAN("msg_script_smithing_fail1"), CHANNEL_SYS);
    --elseif (origSmithingLevel >= 9 and origSmithingLevel < 15) then
    --    ReceiveMsg(user, LAN("msg_script_smithing_fail1"), CHANNEL_SYS);
    --end


end

function CanItemEnchant(nItemType, nGemItemIndex)

    if nGemItemIndex == 4468 then
    	if nItemType < 3 or nItemType > 8 then
	  return 0
        end
        return 1
    end

    if nItemType < 1 or nItemType > 8 then
        return 0
    end
  
    return 1
end
