mask="mesh\\*.msh" 

function OnGameViewInit()
	SetupGlobals()
	print("Sven's Init")
	dofile('script\\gdsbase.lua')
	high()
	doscript('!test\\ConTestEffects.lua')
	Runes(0)
	FigureJobs:SetNoManaUsage(1)
	Atmosphere:SetHour(5,40)
	Render:SetFogDensity(10, 120, 0.7, 200, 0.2)
	pause()
end


-- In this file each user can put his own preferences and init values

function camfree()
	Camera:SetMode(kDrwCameraModeFree)
end

function camnorm()
	Camera:SetMode(kDrwCameraModeStandard)
end

function high()
	Lightmap:Set32Bit(1)
	Lightmap:SetLinesPerFrame(16)
	Terrain:SetMinimumResolution(10)
	Terrain:SetQuality(10)
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