dwZhuNianMaoObjId = 0;
dwZhangLang1 = 0;
dwZhangLang2 = 0;
dwZhangLang3 = 0;  
dwZhangLang4 = 0;
dwZhangLang5 = 0;

function OnStart(pWorldEvent, nNow)
    SetWorldEventActiveFlag(pWorldEvent, 1);
    
    Random = math.random(1, 100);
    if (Random < 100) and (Random > 50) then
    
        dwZhuNianMaoObjId = WorldEventCreateNpc(5465, -1567, 172, 9, 1);
        if dwZhuNianMaoObjId == 0 then
            SetWorldEventActiveFlag(pWorldEvent, 0);
            return;
        end
        dwZhangLang1 = WorldEventCreateNpc(10018, -1555, 157, 9, 1);
        dwZhangLang2 = WorldEventCreateNpc(10019, -1576, 161, 9, 1);
        dwZhangLang3 = WorldEventCreateNpc(10020, -1595, 167, 9, 1);
        dwZhangLang4 = WorldEventCreateNpc(10021, -1527, 170, 9, 1);
    	dwZhangLang5 = WorldEventCreateNpc(10022, -1568, 141, 9, 1);
    else
    
         dwZhuNianMaoObjId = WorldEventCreateNpc(5465, -1592, -120, 1, 1);
        if dwZhuNianMaoObjId == 0 then
            SetWorldEventActiveFlag(pWorldEvent, 0);
            return;
        end
        dwZhangLang1 = WorldEventCreateNpc(10018, -1593, -89, 1, 1);
        dwZhangLang2 = WorldEventCreateNpc(10019, -1629, -100, 1, 1);
        dwZhangLang3 = WorldEventCreateNpc(10020, -1611, -93, 1, 1);
        dwZhangLang4 = WorldEventCreateNpc(10021, -1571, -96, 1, 1);
    	dwZhangLang5 = WorldEventCreateNpc(10022, -1594, -104, 1, 1);

    end
    
    SayAtMediaChannel("msg_worldevent4");
end

function OnCreatureDie(pWorldEvent, pGameCre, pKiller, nReason)
    dwCreObjId = GetCreatureObjId(pGameCre);
    if dwCreObjId == dwZhuNianMaoObjId then
        WorldEventDisappearNpc(dwZhangLang1);
        WorldEventDisappearNpc(dwZhangLang2);
        WorldEventDisappearNpc(dwZhangLang3);
        WorldEventDisappearNpc(dwZhangLang4);
	WorldEventDisappearNpc(dwZhangLang5);
        AddAllEnemyEffect(pGameCre, 2408);
	 SayAtMediaChannel("msg_worldevent4a");
    end
end

function OnCreatureLeaveWorld(pWorldEvent, pGameCre)
    dwCreObjId = GetCreatureObjId(pGameCre);
    if dwCreObjId == dwZhuNianMaoObjId then
        SetWorldEventActiveFlag(pWorldEvent, 0);
    end
end




