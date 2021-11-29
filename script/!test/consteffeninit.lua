dofile('script\\!test\\contesteffects.lua')
mask="mesh\\*.msh" 

function OnGameViewInit()
	SetupGlobals()
	print("Steffen's Init")
	AppSession:SetTimeMultiplier(2)
	--dofile('script\\gdsbase.lua')
	SetBestQuality()
	-- camfree()
	-- dofile('script\\!test\\contestfigures.lua')
	-- dofile('script\\!test\\contesteffects.lua')
	-- dofile('script\\!test\\contestanims.lua')
	-- FigureJobs:SetNoManaUsage(1)
end
 
function sven()
	dofile('script\\consveninit.lua')
end

function pit()
	dofile('script\\conpitinit.lua')
end

-- use this function to reload the Drw Init files
function ReloadDrw()
	ObjectLibrary:Done()
	ObjectLibrary:Init()
end

function camfree()
	GameControl:SetCameraMode(kDrwCameraModeFree)
end

function camnorm()
	GameControl:SetCameraMode(kDrwCameraModeStandard)
end

function speed(iMultiplier)
	AppSession:SetTimeMultiplier(iMultiplier)
end

-- -------------------------------------------------
function fogsim()
 Atmosphere:SetHour(19)
 Atmosphere:TimeLock(1)
 Render:SetFogDensity(10, 30, 0.7, 40, 0.2)
 Render:SetFogColor(10,10,20)
end

function now()
	Atmosphere:SetNow()
end

function lock()
	if bTimeLock == 0 or bTimeLock == nil then
		bTimeLock = 1
		print("Einstein defeated - Time locked!")
	else 
		bTimeLock = 0
		print("Time passes by and you wonder why...")
	end

	Atmosphere:TimeLock(bTimeLock)
end

function pause()
	if bPaused == 0 or bPaused == nil then
		bPaused = 1
		print("Matz defeated - Game Paused!")
	else 
		bPaused = 0
		print("The show must go on...")
	end

	AppSession:SetPauseMode(bPaused)
end

-- Hour Zeitraffer ..........

function hour(iHour, iMinute)
	if iMinute == nil then
		iMinute = 0
	end
	if iHour > 23 then
		iHour = mod(iHour,24)
	end
	Atmosphere:SetHour(iHour, iMinute)
--	GdMain:SetTimeOfDay(hms(iHour, iMinute))
--	Atmosphere:SetNow()
	print("Atmosphere is set to: ", iHour," o'clock")
end

function timelapse(iNumHours, iSpeed)
	-- iNumHours max. 48 Stunden, sonst möglicherweise zuviele timer!
	if iNumHours > 48 then
		iNumHours = 48
	end
	
	-- time sollte mind. 1 sein, sonst gibts hässliche sprünge/hänger
	if iSpeed < 1 then
		iSpeed = 1
	end

	print("Zeitraffer von ", iNumHours," Stunden, speed: ", iSpeed)	
	for i = 0, iNumHours do
		Application:AddTimer(iSpeed*i+1, "hour", i)
	end

	Application:StartTimer()
	Atmosphere:TimeLock(1)
	Lightmap:SetLinesPerFrame(16)
end


-- Angle Zeitraffer ..........

function angle(iAngle)
	Atmosphere:SetAngle(iAngle)
	print("Sun Angle is set to: ", iAngle," degrees")
end

function timelapse2(iNumAngles, iSpeed)
	-- max. 180 grad
	if iNumAngles > 179 then
		iNumAngles = 179
	end
	
	-- time sollte mind. 1 sein, sonst gibts hässliche sprünge/hänger
	if iSpeed < 1 then
		iSpeed = 1
	end

	print("Zeitraffer von 0 - ", iNumAngles," Grad, speed: ", iSpeed)	
	for i = 0, iNumAngles do
		Application:AddTimer(iSpeed*i+1, "angle", i)
	end

	Application:StartTimer()
	Atmosphere:TimeLock(1)
end


function fog()
	if bDrawFog == 0 or bDrawFog == nil then
		bDrawFog = 1
		print("Fog on!")
	else 
		bDrawFog = 0
		print("Fog off!")
	end

	Render:EnableFog(bDrawFog)
end

-- -------------------------

CurHour = 12

function AdvanceTimeH()
	CurHour = CurHour + 1
	if CurHour == 24 then
		CurHour = 0
	end
	hour(CurHour)
end

function DecreaseTimeH()
	CurHour = CurHour - 1
	if CurHour < 0 then
		CurHour = 23
	end
	hour(CurHour)
end

-- -----------------------------------------------

function psycho()
	print("bitte etwas geduld...")
	Atmosphere:TimeLock(1)
	Atmosphere:SetHour(12)
	Lightmap:BumpContrast(7)
	Lightmap:ShadowBlur(0.01)
	Lightmap:SkyColor(64,200,0)
	Lightmap:SunAngle(77)
	Lightmap:SunColor(255,0,100)
	Lightmap:SunSkyRatio(0.66)
	Lightmap:UpdateInc(2)
	Render:SetFogColor(100,64,200)
	Sky:SetColor(1, 3, 99, 32, 222, 100)
	Sky:SetDarkColor(77, 0, 124)
	Sky:SetLightColor(222, 0, 222)
	Sky:SetFogDensity(0.003)
	Terrain:Mode_DetailMapsOff()
	Terrain:SetQuality(0)
end


---------------------------------------------------------------

function screenshothour(iHour)
	print("screenshothour at hour: ", iHour)	
	hour(iHour)
	Application:GetAppMenu():ScreenShot()
end

function hourshots()
	iNumShots = 23

	hour(0)	
	Atmosphere:TimeLock(1)

	for i = 0, iNumShots do
		Application:AddTimer(1+i*8, "screenshothour", i)
	end

	Application:StartTimer()
end


function screenshotangle(iAngle)
	print("screenshotangle at angle: ", iAngle)	
	angle(iAngle)
	Application:GetAppMenu():ScreenShot()
end

function angleshots(iAngleStep)
	if iAngleStep == nil then
		iAngleStep = 1
	end
	
	iSteps			= 180 / iAngleStep
	iNumShotsDay	= iSteps
	iNumShotsNight	= iSteps / 2 - 1
	
	angle(358)
	Atmosphere:TimeLock(1)

	for i = 0, iNumShotsDay do
		iTimerDay = 2 + i * 8
		Application:AddTimer(iTimerDay, "screenshotangle", i * iAngleStep)
		print("dayshot no: ", i, " at angle ", i * iAngleStep)	
	end
	for i = 1, iNumShotsNight do
		iTimerNight = 2 + i * 8 + iTimerDay
		Application:AddTimer(iTimerNight, "screenshotangle", i * iAngleStep * 2 + 180)
		print("nightshot no: ", i, " at angle ", i * iAngleStep * 2 + 180)
	end

	Application:StartTimer()
end


---------------------------------------------------------------

function panorama(iHour, iMinute)
	if (iHour == nil) then
		iHour = 18
	end
	if (iMinute == nil) then
		iMinute = 30
	end

	hour(iHour, iMinute)

	Camera:SetOrientation(0.0000, 0, 0)
	Camera:SetViewAngles(0.7854, 0.8)
	Camera:SetScrollSpeed(50, 50)
	Atmosphere:TimeLock(1)
	AppSession:SetPauseMode(1)

	for i = 1, 9 do
		Application:AddTimer((i-0.9)*4, "panoramaturnview", i)
	end

	Application:StartTimer()
end


function panoramaturnview(index)
	if (index == 1) then
		Camera:SetOrientation(0.0000, 0, 0)
	elseif (index == 2) then
		panoramashot()
		Camera:SetOrientation(0.7854, 0, 0)
	elseif (index == 3) then
		panoramashot()
		Camera:SetOrientation(1.5708, 0, 0)
	elseif (index == 4) then
		panoramashot()
		Camera:SetOrientation(2.3562, 0, 0)
	elseif (index == 5) then
		panoramashot()
		Camera:SetOrientation(3.1416, 0, 0)
	elseif (index == 6) then
		panoramashot()
		Camera:SetOrientation(3.9270, 0, 0)
	elseif (index == 7) then
		panoramashot()
		Camera:SetOrientation(4.7124, 0, 0)
	elseif (index == 8) then
		panoramashot()
		Camera:SetOrientation(5.4978, 0, 0)
	else
		panoramashot()
--		AppSession:SetPauseMode(0)
	end

	print("turning view...")
end

function panoramashot()
	print("taking shot...")
	Application:GetAppMenu():ScreenShot()
end


function SetBestQuality()
	Lightmap:Set32Bit(1)
	Lightmap:SetLinesPerFrame(16)

	Terrain:SetMinimumResolution(10)
	Terrain:SetQuality(10)
	
	--Terrain:SetDetailTextureMix()
comment = [[
setzt das Mischverhältnis zwischen den beiden Detailtexturen
Zwischen _fMinDistance und _fMaxDistance wird der Wert zwischen _fMin und _fMax je nach Entfernung ermittelt.
Außerhalb des Bereichs wird geclampt, d.h. _fMin oder _fMax benutzt.
Entfernungen wie immer in Meter und Mischfaktor von [0..1]
Für den 1st/3rd Person View wird der letzte Parameter benutzt

Declaration:
void SetDetailTextureMix(f32 _fMinDistance, f32 _fMin, f32 _fMaxDistance, f32 _fMax, f32 _fXPersonView)
]]
comment = nil

	--Terrain:SetMipMapLodBias(float)
	--Terrain:SetWorldDetailScale(float)
end

-- DEBUGGING STUFF --
function WatchVar(_VarName)
	if bWatchVar then
		bWatchVar = nil
		GdsMain:UnwatchVar(_VarName)
		print("No longer watching var: " .. _VarName)
	else 
		bWatchVar = 1
		GdsMain:WatchVar(_VarName, CGdsDebug.kModify)
		print("Watching for Modify var: " .. _VarName)
	end
end

-- das hier geht nicht...
CurDumpVar = ""
function DumpVar(_VarName)
	Application:AddTimer(1, "EndDumpVar", 0)
	Application:StartTimer()
	CurDumpVar = _VarName
	print("watching")
	GdsMain:WatchVar(_VarName, CGdsDebug.kNoise)
end

function EndDumpVar()
	print("unwatching")
	GdsMain:UnwatchVar(CurDumpVar)
end

function WatchNpc(_NpcId)
	if bWatchNpc then
		bWatchNpc = nil
		GdsMain:UnwatchNpc(_VarName)
		print("No longer watching NPC: " .. _VarName)
	else 
		bWatchNpc = 1
		GdsMain:WatchNpc(_VarName, CGdsDebug.kModify)
		print("Watching for Modify NPC: " .. _VarName)
	end
end

