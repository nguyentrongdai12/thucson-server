CScene_Main = class(CScene)

function CScene_Main:ctor(nTypeId, nObjId)
end

function CScene_Main:OnCreateSceneSub()
    return 1
end

function CScene_Main:OnCreateScene()
    if self.OnCreateSceneSub(self) == 0 then
        return 0;
    end

    self.nActiveTianJiangCaiZhu1 = 0;
    self.nActiveTianJiangCaiZhu2 = 0;
    self.nSendMediaFlag = 0;
    SceneSetTimer(self.nObjId, 1002, 60000);

    return 1
end

function CScene_Main:OnDestroyScene()
end

function CScene_Main:OnTimerSub(dwTimerId, dwNow)
end

function CScene_Main:OnTimer(dwTimerId, dwNow)
    self.OnTimerSub(self, dwTimerId, dwNow);

    if dwTimerId == 1002 then
	local DayOfWeek = GetServerDayOfWeek();
	local NowHour = GetServerHour();
	if NowHour == 20 and (DayOfWeek == 2 or DayOfWeek == 4 or DayOfWeek == 0) then
            if self.nSendMediaFlag == 0 then
		SendMedia(L("msg_worldcaizhu"), 6);
		self.nSendMediaFlag = 1
	    end

	    local RandNum = math.random(1, 2);
	    if RandNum == 1 then
	        if self.nActiveTianJiangCaiZhu1 == 0 then
		    ActiveNpcRebornArea(1, 31, 1)
                    ActiveNpcRebornArea(1, 32, 1)
		    ActiveNpcRebornArea(1, 33, 1)
                    ActiveNpcRebornArea(17, 34, 1)

                    self.nActiveTianJiangCaiZhu1 = 1
                end

		if self.nActiveTianJiangCaiZhu2 == 1 then
		    ActiveNpcRebornArea(1, 35, 0)
                    ActiveNpcRebornArea(1, 36, 0)
		    ActiveNpcRebornArea(1, 37, 0)
                    ActiveNpcRebornArea(17, 38, 0)

                    self.nActiveTianJiangCaiZhu2 = 0
                end

            elseif RandNum == 2 then
                if self.nActiveTianJiangCaiZhu2 == 0 then
		    ActiveNpcRebornArea(1, 35, 1)
                    ActiveNpcRebornArea(1, 36, 1)
		    ActiveNpcRebornArea(1, 37, 1)
                    ActiveNpcRebornArea(17, 38, 1)

                    self.nActiveTianJiangCaiZhu2 = 1
                end

		if self.nActiveTianJiangCaiZhu1 == 1 then
		    ActiveNpcRebornArea(1, 31, 0)
                    ActiveNpcRebornArea(1, 32, 0)
		    ActiveNpcRebornArea(1, 33, 0)
                    ActiveNpcRebornArea(17, 34, 0)

                    self.nActiveTianJiangCaiZhu1 = 0
                end

	    end
	    
        else
      	    self.nSendMediaFlag = 0;

            if self.nActiveTianJiangCaiZhu1 == 1 then
		ActiveNpcRebornArea(1, 31, 0)
                ActiveNpcRebornArea(1, 32, 0)
		ActiveNpcRebornArea(1, 33, 0)
                ActiveNpcRebornArea(17, 34, 0)

                self.nActiveTianJiangCaiZhu1 = 0
	    elseif self.nActiveTianJiangCaiZhu2 == 1 then
		ActiveNpcRebornArea(1, 35, 0)
                ActiveNpcRebornArea(1, 36, 0)
		ActiveNpcRebornArea(1, 37, 0)
                ActiveNpcRebornArea(17, 38, 0)

                self.nActiveTianJiangCaiZhu2 = 0
            end
        end
    end
end

function CScene_Main:OnEventSub(szEvent, ...)
end

function CScene_Main:OnEvent(szEvent, ...)
    self.OnEventSub(self, szEvent, unpack(arg));
end

SceneClassTable[1] = CScene_Main
