CScene_GuildLand = class(CScene)

function CScene_GuildLand:ctor(nTypeId, nObjId)
end

function CScene_GuildLand:OnCreateSceneSub()
    return 1
end

function CScene_GuildLand:OnCreateScene()
    if self.OnCreateSceneSub(self) == 0 then
        return 0;
    end

    return 1
end

function CScene_GuildLand:OnDestroyScene()
end

function CScene_GuildLand:OnTimerSub(dwTimerId, dwNow)
end

function CScene_GuildLand:OnTimer(dwTimerId, dwNow)
    self.OnTimerSub(self, dwTimerId, dwNow);
end

SceneClassTable[9] = CScene_GuildLand
