CScene = class()

function CScene:ctor(nTypeId, nObjId)
	self.nTypeId = nTypeId
	self.nObjId = nObjId
end

function CScene:OnCreateScene()
    return 1
end

function CScene:OnDestroyScene()
end

function CScene:OnTimer(dwTimerId, dwNow)
end

function CScene:OnEvent(szEvent, ...)
end

function CScene:OnNpcRemove(nNpcId, nNpcObjId)
end

function CScene:OnCreTriggerAreaChange(nCreId, nOldAreaId, nNewAreaId)
end


