include("script/game_script_base.lua")

DungeonEnable = true;                   -- ������������

DungeonDebug = false;                   -- ��������ϵͳ�Ƿ����ڵ���״̬

DungeonTeamCreateNeedLevel = 15;        -- �������鴴������Ҫ�ȼ�
DungeonTeamMaxMemberCount = 10;         -- ����������������

DungeonTeamScoreClearWeekDay = 0;       -- �������������������ݼ���0-6������-1��ʾ����
DungeonTeamScoreClearClock = 0;        -- �������������������ݼ��ļ��㣨0-23��

DungeonTeamWeekBonusCount_PvP = 20;     -- PVPÿ����ջ���ʱ������ǰx��
DungeonTeamWeekBonusCount_PvE = 20;     -- PVEÿ����ջ���ʱ������ǰx��

DungeonAutoPairInterval = 3 * 60 * 1000 --���ʱ��

-- PVP����
-- �����������������֣�������PvP����
function OnDungeonTeamWeekBonus_PvP(teamName, rank, score)
    if (score > 1000) then
	local pvp_rank = math.floor((score - 1000) /500) + 1; 
	local DUNGEON_PVP = 0;
        local socre_rank = 50;
	local p_score = 0;
	local i_num = 0;
	local s_mail = "v=1;s=1|i=4249;b=2;%=";
	local team_count = GetDungeonTeamMemberCount(teamName);
	local LAN_Text = "" ;
    	local LAN_Title = "" ;
    	LOAD_LAN("msg_script_PKbous_title");
    	LOAD_LAN("msg_script_PKbous_text");

	LAN_Title = LAN("msg_script_PKbous_title");
        LAN_Text = LAN("msg_script_PKbous_text");
        strBonusTitle = LAN_Title;
        strBonusText = LAN_Text;

	if (pvp_rank < 51) then
	   p_score =  pvp_rank * socre_rank;
	   i_num = pvp_rank;
        --CreateCodeItemAddMailToDungeonTeam(teamName, 11112, "v=1;s=1|i=404;b=2", "��������", "���ǽ�����Ĺ���������");
	else
	   p_score = 50*socre_rank;
	   i_num = 50;
	end

	s_mail = s_mail..i_num;
	OutputLog("s_mail = "..s_mail) ;

	--for i=0,team_count-1 do
	   --AddUserDungeonScore (GetDungeonTeamMemberId(teamName, i),DUNGEON_PVP,p_score);
	  
	   CreateCodeItemAddMailToDungeonTeam(teamName, 11112, s_mail, strBonusTitle, strBonusText);
	   
	--end
    end
end


-- PVE����
-- �����������������֣�������PvE����
function OnDungeonTeamWeekBonus_PvE(teamName, rank, score)
    local LAN_Text = "" ;
    local LAN_Title = "" ;
    LOAD_LAN("msg_script_bonus_title");
    LOAD_LAN("msg_script_bonus_text");
    --OutputLog("Bounce");
    if (score > 1000) then
            LAN_Title = LAN("msg_script_bonus_title");
            --"PVE��%d�����齱��"
            LAN_Text = LAN("msg_script_bonus_text");
            strBonusTitle = LAN_Title
            strBonusText = string.format(LAN_Text, rank);
        if (rank <= 5) then           
            CreateCodeItemAddMailToDungeonTeam(teamName, 11112, "v=1;s=1|i=3972;b=2;%=2", strBonusTitle, strBonusText);
        elseif (rank <= 10) then
            CreateCodeItemAddMailToDungeonTeam(teamName, 11112, "v=1;s=1|i=3971;b=2;%=2", strBonusTitle, strBonusText);
        elseif (rank <= 15) then
             CreateCodeItemAddMailToDungeonTeam(teamName, 11112, "v=1;s=1|i=3970;b=2;%=5", strBonusTitle, strBonusText);
        elseif (rank <= 20) then
             CreateCodeItemAddMailToDungeonTeam(teamName, 11112, "v=1;s=1|i=3969;b=2;%=5", strBonusTitle, strBonusText);
       end
    end
end

