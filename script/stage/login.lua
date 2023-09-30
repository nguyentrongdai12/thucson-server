local bDebug    = false
local fForward  = 412.4
local fYaw      = -0.018
local fRoll     = 1.6
local fUpOffset = 18

function OnStart()
    --RenderAddActor("login", "sdl_lintest")
    ActorAdd("logint", "sdl_abc123")
    ActorPlayPose("login", "scene", true)

    CameraSetProjParams(35, 1.333, 5.0, 10000.0);
    CameraSetPitch(0);
    CameraSetYaw(fYaw);
    CameraSetRoll(fRoll);
    CameraSetForward(fForward);
    CameraSetUpOffset(fUpOffset);

    PlayMusic("thematic.ogg");

    StageOutputLog("Login OnStart");
end

function OnStop()
    StageOutputLog("Login OnStop");
end

local iFogR = 104;
local iFogG = 165;
local iFogB = 247;

--local iFogRi = 17;
--local iFogGi = 157;
--local iFogBi = 236;

function OnTick(iDelta)
    --StageOutputLog("OnTick");
end

function OnBeforeRender() -- ��ʼ��Ⱦ����
    --RenderEnableLight(bool b);
    --RenderSetDirLight(int i, int r, int g, int b, float dx, float dy, float dz)
    --RenderSetEnvLight(int r, int g, int b)
    --RenderEnableFog(bool b)
    --RenderSetFog(int r, int g, int b, float fNear, float fFar)
    --RenderSetBaseColor(int r, int g, int b)

    RenderSetEnvLight(150, 150, 150)
    RenderSetBaseColor(0, 0, 0)

    RenderEnableLight(false)
    RenderSetDirLight(0, 68, 198, 241, -1, 1, -2)
    RenderSetDirLight(1, 0, 0, 0, 1, 1, -2)

    RenderEnableFog(true)
    RenderSetFog(240, 240, 243, 1000, 10500)
end

function OnAfterRender() -- ������Ⱦ����
    if bDebug then
        RenderText(10, 10, 255, 0, 255, "forward "..fForward.."\nyaw     "..fYaw.."\nroll    "..fRoll.."\nup      "..fUpOffset)
    end
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
    end
end
