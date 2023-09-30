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
    
        dwZhuNianMaoObjId = WorldEventCreateNpc(10006, 2184, 2431, 1, 1);
        if dwZhuNianMaoObjId == 0 then
            SetWorldEventActiveFlag(pWorldEvent, 0);
            return;
        end
        dwZhangLang1 = WorldEventCreateNpc(4733, 2189, 2440, 1, 1);
        dwZhangLang2 = WorldEventCreateNpc(4733, 2189, 2435, 1, 1);
        dwZhangLang3 = WorldEventCreateNpc(4733, 2189, 2430, 1, 1);
        dwZhangLang4 = WorldEventCreateNpc(4733, 2189, 2425, 1, 1);
    	dwZhangLang5 = WorldEventCreateNpc(4733, 2189, 2420, 1, 1);
    else
    
         dwZhuNianMaoObjId = WorldEventCreateNpc(10006, 2162, 2432, 1, 1);
        if dwZhuNianMaoObjId == 0 then
            SetWorldEventActiveFlag(pWorldEvent, 0);
            return;
        end
        dwZhangLang1 = WorldEventCreateNpc(4733, 2155, 2440, 1, 1);
        dwZhangLang2 = WorldEventCreateNpc(4733, 2155, 2435, 1, 1);
        dwZhangLang3 = WorldEventCreateNpc(4733, 2155, 2430, 1, 1);
        dwZhangLang4 = WorldEventCreateNpc(4733, 2155, 2425, 1, 1);
    	dwZhangLang5 = WorldEventCreateNpc(4733, 2155, 2420, 1, 1);

    end
    
    SayAtMediaChannel("msg_worldevent5");
end

function OnCreatureDie(pWorldEvent, pGameCre, pKiller, nReason)
    dwCreObjId = GetCreatureObjId(pGameCre);
    if dwCreObjId == dwZhuNianMaoObjId then
        WorldEventDisappearNpc(dwZhangLang1);
        WorldEventDisappearNpc(dwZhangLang2);
        WorldEventDisappearNpc(dwZhangLang3);
        WorldEventDisappearNpc(dwZhangLang4);
	WorldEventDisappearNpc(dwZhangLang5);
        AddAllEnemyEffect(pGameCre, 2409);
	 SayAtMediaChannel("msg_worldevent5a");
    end
end

function OnCreatureLeaveWorld(pWorldEvent, pGameCre)
    dwCreObjId = GetCreatureObjId(pGameCre);
    if dwCreObjId == dwZhuNianMaoObjId then
        SetWorldEventActiveFlag(pWorldEvent, 0);
    end
end




