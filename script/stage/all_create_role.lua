include "ui/api_global.lua"

local bDebug    = false
local fForward  = 464.4
local fYaw      = -0.087
local fRoll     = 7.85
local fUpOffset = 40.5
local fX		= 50
local fY		= 0
local fZ		= 0
local fShakeRadian = 0 -- �𶯵ĵ�ǰ���� (���ҽǶ�90�ȵ�0��<������1.57��0>�ĵݼ�)
--[[
local CameraList =
{
	["target"] = nil;
	["default"] = 
	{
		["fForward"] 	= 427.199,
		["fYaw"]     	= -0.052,
		["fRoll"]    	= 7.568,
		["fUpOffset"]	= -47.5,
		["fX"]			= 58,
		["fY"]			= 0,
		["fZ"]			= 0,
	};  
	[1] = -- ����
	{
		[1] = -- ��
		{
			["fForward"]  = 379.19860839844,
			["fYaw"]      = 2.683699131012e-005,
			["fRoll"]     = 7.8123593330383,
			["fUpOffset"] = 12.5,
			["fX"]			= 68,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
		[2] = -- Ů
		{
			["fForward"]  = 373.19854736328,
			["fYaw"]      = -0.087239563465118,
			["fRoll"]     = 7.7949061393738,
			["fUpOffset"] = 5.5,
			["fX"]			= 84,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	};
	[2] = -- ����
	{
		[1] = -- ��
		{
			["fForward"]  = 367.19848632813,
			["fYaw"]      = 0.034933399409056,
			["fRoll"]     = 7.8123593330383,
			["fUpOffset"] = 11.5,
			["fX"]			= 39,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	};
	[3] = -- ���
	{
		[1] = -- ��
		{
			["fForward"]  = 325.19808959961,
			["fYaw"]      = -0.10469284655664,
			["fRoll"]     = 7.8123593330383,
			["fUpOffset"] = 16.5,
			["fX"]			= 110,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	};
	[4] = -- �ٻ�
	{
		[2] = -- Ů
		{
			["fForward"]  = 296.39779663086,
			["fYaw"]      = -0.017426442354918,
			["fRoll"]     = 7.7949061393738,
			["fUpOffset"] = 3.5,
			["fX"]			= 36,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	};
	[5] = -- ����
	{
		[2] = -- Ů
		{
			["fForward"]  = 281.99765014648,
			["fYaw"]      = -0.052333001047373,
			["fRoll"]     = 7.7949061393738,
			["fUpOffset"] = 6.5,
			["fX"]			= 78,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	};
	["Role"] = -- ��ҽ�ɫ
	{
		[1] = 
		{
			["fForward"]  = 379.19860839844,
			["fYaw"]      = 2.683699131012e-005,
			["fRoll"]     = 7.8123593330383,
			["fUpOffset"] = 12.5,
			["fX"]			= 68,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
		[2] = 
		{
			["fForward"]  = 373.19854736328,
			["fYaw"]      = -0.087239563465118,
			["fRoll"]     = 7.7949061393738,
			["fUpOffset"] = 5.5,
			["fX"]			= 84,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
		[3] = 
		{
			["fForward"]  = 367.19848632813,
			["fYaw"]      = 0.034933399409056,
			["fRoll"]     = 7.8123593330383,
			["fUpOffset"] = 11.5,
			["fX"]			= 39,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	}
};
]]

local fForward  = 464.4
local fYaw      = -0.087
local fRoll     = 7.85
local fUpOffset = 40.5
local fX		= 50
local fY		= 0
local fZ		= 0
local CameraList =
{
	["target"] = nil;
	["default"] = 
	{
		["fForward"] 	= 464.4,
		["fYaw"]     	= -0.087,
		["fRoll"]    	= 7.85,
		["fUpOffset"]	= 40.5,
		["fX"]			= 50,
		["fY"]			= 0,
		["fZ"]			= 0,
	};  
	[1] = -- ����
	{
		[1] = -- ��
		{
			["fForward"]  = 400.8,
			["fYaw"]      = -0.0003,
			["fRoll"]     = 7.80,
			["fUpOffset"] = 19,
			["fX"]			= 66,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
		[2] = -- Ů
		{
			["fForward"]  = 386.4,
			["fYaw"]      = -0.067,
			["fRoll"]     = 7.812,
			["fUpOffset"] = 21.5,
			["fX"]			= 114,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	};
	[2] = -- ����
	{
		[1] = -- ��
		{
			["fForward"]  = 406.8,
			["fYaw"]      = -0.035,
			["fRoll"]     = 7.85,
			["fUpOffset"] = 36.5,
			["fX"]			= -1,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	};
	[3] = -- ���
	{
		[1] = -- ��
		{
			["fForward"]  = 348.39808959961,
			["fYaw"]      = -0.09069284655664,
			["fRoll"]     = 7.8623593330383,
			["fUpOffset"] = 33.5,
			["fX"]			= 137,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	};
	[4] = -- �ٻ�
	{
		[2] = -- Ů
		{
			["fForward"]  = 309.4,
			["fYaw"]      = -0.05,
			["fRoll"]     = 7.8449061393738,
			["fUpOffset"] = 24.5,
			["fX"]			= 21,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	};
	[5] = -- ����
	{
		[2] = -- Ů
		{
			["fForward"]  = 303.59765014648,
			["fYaw"]      = -0.07,
			["fRoll"]     = 7.88,
			["fUpOffset"] = 34.5,
			["fX"]			= 75,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	};
	["Role"] = -- ��ҽ�ɫ
	{
		[1] = 
		{
			["fForward"]  = 400.8,
			["fYaw"]      = -0.0003,
			["fRoll"]     = 7.80,
			["fUpOffset"] = 19,
			["fX"]			= 66,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
		[2] = 
		{
			["fForward"]  = 386.4,
			["fYaw"]      = -0.067,
			["fRoll"]     = 7.812,
			["fUpOffset"] = 21.5,
			["fX"]			= 114,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
		[3] = 
		{
			["fForward"]  = 406.8,
			["fYaw"]      = -0.035,
			["fRoll"]     = 7.85,
			["fUpOffset"] = 36.5,
			["fX"]			= -1,
			["fY"]			= 0,
			["fZ"]			= 0,
		};
	}
};
CameraList["target"] = CameraList["default"];

function OnStart()
    --RenderAddActor("login", "login002")
	BindCallBack ("CreateCharStage", "SelectCharater", "call", OnSelectCharacter);
	BindCallBack ("SelectCharStage", "SelectRole", "call", OnSelectRole);
	BindCallBack ("Camera", "Shake", "call", OnCameraShakeStart)
    ActorAdd("login", "hanguoxueren")
    ActorPlayPose("login", "scene", true)

    CameraSetProjParams(40, 0, 22, 25000.0);
    CameraSetPitch(0);
    CameraSetYaw(fYaw);
    CameraSetRoll(fRoll);
    CameraSetForward(fForward);
    CameraSetUpOffset(fUpOffset);

    StageOutputLog("OnStart");
end

function OnStop()
    StageOutputLog("OnStop");
end

local iFogR = 104;
local iFogG = 165;
local iFogB = 247;

--local iFogRi = 17;
--local iFogGi = 157;
--local iFogBi = 236;

function OnTick(iDelta)
end

function OnScriptHttpEvent(event)
	Receive(event);
end

function OnBeforeRender(iDelta)
    --RenderEnableLight(bool b);
    --RenderSetDirLight(int i, int r, int g, int b, float dx, float dy, float dz)
    --RenderSetEnvLight(int r, int g, int b)
    --RenderEnableFog(bool b)
    --RenderSetFog(int r, int g, int b, float fNear, float fFar)
    --RenderSetBaseColor(int r, int g, int b)

    RenderSetEnvLight(0, 70, 70)
    RenderSetBaseColor(0, 0, 0)

    RenderEnableLight(true)
    RenderSetDirLight(0, 200, 200, 200, -1, 1, -1)
    RenderSetDirLight(1, 150, 150, 150, -1, 1, -1)

    RenderEnableFog(true)
    RenderSetFog(256, 256, 256, 600, 6000)
	
	if bDebug then
	    CameraSetYaw(fYaw);
	    CameraSetRoll(fRoll);
	    CameraSetForward(fForward);
	    CameraSetUpOffset(fUpOffset);
		CameraSetPosition(fX, fY, fZ);
		return;
	end
	
	local speed = 100/math.sqrt(iDelta);
	if speed < 1 then speed = 1 end
    --StageOutputLog("OnTick");
	local tar_fYaw = CameraList["target"]["fYaw"];
	local tar_fRoll = CameraList["target"]["fRoll"];
	local tar_fForward = CameraList["target"]["fForward"];
	local tar_fUpOffset = CameraList["target"]["fUpOffset"];
	local tar_fX = CameraList["target"]["fX"];
	local tar_fY = CameraList["target"]["fY"];
	local tar_fZ = CameraList["target"]["fZ"];
	fYaw = fYaw + (tar_fYaw - fYaw) / speed;
	fRoll = fRoll + (tar_fRoll - fRoll) / speed;
	fForward = fForward + (tar_fForward - fForward) / speed;
	fUpOffset = fUpOffset + (tar_fUpOffset - fUpOffset) / speed;
	fX = fX + (tar_fX - fX) / speed;
	fY = fY + (tar_fY - fY) / speed;
	fZ = fZ + (tar_fZ - fZ) / speed;
    CameraSetYaw(fYaw);
    CameraSetRoll(fRoll);
    CameraSetForward(fForward);
    CameraSetUpOffset(fUpOffset);
	CameraSetPosition(fX, fY, fZ + Sin(fShakeRadian) * 10);
	local damp = 0; --  ˥��
	-- ����˥����
	if fShakeRadian > 0.04 or fShakeRadian < -0.04 then
		damp = 0.004 * iDelta;
	elseif fShakeRadian > 0.0005 or fShakeRadian < -0.0005 then
		damp = 0.00005 * iDelta;
	else
		damp = fShakeRadian;
	end
	-- ������������
	if (fShakeRadian < 0 and damp > 0) or (fShakeRadian > 0 and damp < 0) then damp = -damp end
	-- �������˥����
	if (fShakeRadian > 0 and fShakeRadian <= damp) or (fShakeRadian < 0 and fShakeRadian >= damp) then
		fShakeRadian = 0;
	else
		-- ִ��˥��
		fShakeRadian = (fShakeRadian - damp ) * -1;
	end
end

function OnAfterRender()
    if bDebug then
        RenderText(10, 10, 255, 0, 255, "forward "..fForward.."\nyaw     "..fYaw.."\nroll    "..fRoll.."\nup      "..fUpOffset.."\nX    "..fX)
    end
end

function OnBeforeRenderRole() -- ��ʼ��Ⱦ��ɫ
    --RenderEnableLight(bool b);
    --RenderSetDirLight(int i, int r, int g, int b, float dx, float dy, float dz)
    --RenderSetEnvLight(int r, int g, int b)
    --RenderEnableFog(bool b)
    --RenderSetFog(int r, int g, int b, float fNear, float fFar)
    --RenderSetBaseColor(int r, int g, int b)

    RenderSetEnvLight(70, 70, 100)
    RenderSetBaseColor(0, 0, 0)

    RenderEnableLight(true)
    RenderSetDirLight(0, 150, 150, 150, 0, 1, -0.1)
    RenderSetDirLight(1, 50, 50, 50, 0, 1, 0)

    RenderEnableFog(true)
    RenderSetFog(256, 256, 256, 1000, 6000)
end

function OnAfterRenderRole() -- ������Ⱦ��ɫ
end


function OnKeyDown(iKey)
end

function OnMouseWheel(iDelta)
    if bDebug then
        fForward = fForward + iDelta*0.01
        CameraSetForward(fForward);
    end
end

function OnMouseLDown(x, y)
end

function OnMouseLUp(x, y)
end

function OnMouseLDrag(x, y, ix, iy)
    if bDebug then
        fYaw = fYaw + 3.14159*ix/180.0
        fRoll = fRoll - 3.14159*iy/180.0
        CameraSetYaw(fYaw);
        CameraSetRoll(fRoll);
    end
end

function OnMouseRDrag(x, y, ix, iy)
    if bDebug then
        fUpOffset = fUpOffset - iy;
        CameraSetUpOffset(fUpOffset);
		fX = fX + ix;
		CameraSetPosition(fX, 0, 0);
    end
end

function OnSelectCharacter(argument)
	local party = tonumber(argument["party"]);
	local sex = tonumber(argument["sex"]);
	if party == nil or sex == nil then
		uiError("OnSelectParty : need argument of party and sex...");
		return;
	end
	local NewCamera = nil;
	if party > -1 and sex > -1 then
		party = party + 1;
		sex = sex + 1;
		if (CameraList[party] and CameraList[party][sex]) then
			NewCamera = CameraList[party][sex];
		end
	end
	if NewCamera == nil then
		NewCamera = CameraList["default"];
	end
	CameraList["target"] = NewCamera;
	if bDebug then
		fForward  = NewCamera["fForward"];
		fYaw      = NewCamera["fYaw"];
		fRoll     = NewCamera["fRoll"];
		fUpOffset = NewCamera["fUpOffset"];
		fX		= NewCamera["fX"];
		fY		= NewCamera["fY"];
		fZ		= NewCamera["fZ"];
	end
end

function OnSelectRole(argument)
	local index = tonumber(argument["index"]);
	if index == nil then
		uiError("OnSelectRole : need argument of index...");
		return;
	end
	local NewCamera = nil;
	if index >= 0 then
		NewCamera = CameraList["Role"][index+1];
	end
	if NewCamera == nil then
		NewCamera = CameraList["default"];
	end
	CameraList["target"] = NewCamera;
	if bDebug then
		fForward  = NewCamera["fForward"];
		fYaw      = NewCamera["fYaw"];
		fRoll     = NewCamera["fRoll"];
		fUpOffset = NewCamera["fUpOffset"];
		fX		= NewCamera["fX"];
		fY		= NewCamera["fY"];
		fZ		= NewCamera["fZ"];
	end
end

function OnCameraShakeStart(argument)
	fShakeRadian = 1; -- 45��
end

