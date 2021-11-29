mask="mesh\\*.msh" 
-- dofile('..\\..\\tool\\bin\\tool_convertmeshes.lua')

function OnGameViewInit()
	--SetupGlobals()
	--print("Jirka Init")
	--Lightmap:Set32Bit(true)
	doscript("!test\\contestfigures")
	--doscript('!test\\contesteffects')
	--doscript("!test\\contestanims")
	--FigureJobs:SetNoManaUsage(1)

	--doscript("object_effect_test2")
end

function TestAtmo()
	Atmosphere:TimeLock(1)
	Atmosphere:SetAngle(10)
	Atmosphere:WeatherActivate(0,1,1)
	camfree()
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

function effect(iFigure, iAction, iSpellId, iLength)
  	Effect:Test(iFigure, iAction, iSpellId, iLength)
end

function camfree()
	GameControl:SetCameraMode(kDrwCameraModeFree)
end

function camnorm()
	GameControl:SetCameraMode(kDrwCameraModeStandard)
end

function Skymap()
	Lightmap:SunSkyRatio(0)
	Lightmap:SkyColor(255, 255, 255)
end

function Sunmap()
	Lightmap:SunSkyRatio(1)
	Lightmap:SunColor(255, 255, 255)
end

function Screenshot(piMinutes)
	Application:GetAppMenu():ScreenShot()
	Atmosphere:SetHour(0,piMinutes)
end

function Screenshots(piMinutes)
	if (piMinutes == nil) then piMinutes = 60 end
	liTime = 0
	liTimer = 0

	while liTime <= 24*60 do
		Application:AddTimer(liTimer, "Screenshot", liTime)
		liTime = liTime + piMinutes
		liTimer = liTimer + 2
	end
	
	Application:StartTimer()
end


function Lan1()
	AppMenu:LANHostInit('Jirka1', 'SessionJ', 'map\\test\\testwithgoods.map', 10, '')
end
		
function Lan2()
	AppMenu:LANClientJoinGameTest('Jirka2','SessionJ', '')
end

function Lan3()
	AppMenu:LANHostStartGame()
end

