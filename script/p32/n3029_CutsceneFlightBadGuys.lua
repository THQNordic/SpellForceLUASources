-----------------------------------------------------------------------
--
--	Flight Bad Guys
--
-----------------------------------------------------------------------

CameraFlightBadGuysI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p32\\n3029_CameraFlightBadGuysI.lua")
   	Camera:ScriptStart()
]]

CameraFlightBadGuysII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p32\\n3029_CameraFlightBadGuysII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "FlightBadGuys", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- IsGlobalFlagTrue {Name = "Stopper"},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		LookAtDirection {NpcId = 4202, Direction = South},
		LookAtDirection {NpcId = 3028, Direction = South},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] = 
		{ 
			-- die ersten zwei sekunden ohne kamera:				
		},
		[20] = 
		{ 
			ExecuteCameraScript{Script = CameraFlightBadGuysI},			
		},			
		[40] = 
		{ 
			CutSceneSay {Tag = "cutsoulforgerShwd001", NpcId = 4202, String = "Dies ist die letzte Schlacht, Meister!"},
		},
		[80] = 
		{
			WaitForEndOfSpeech,						
			CutSceneSay {Tag = "cutdunklerShwd001", NpcId = 3028, String = "Das Zeitportal ist fast vollendet!"}
		},
		[110] = 
		{
			WaitForEndOfSpeech,						
			CutSceneSay {Tag = "cutdunklerShwd002", NpcId = 3028, String = "Folgt mir nach, sobald Ihr könnt! In der Vergangenheit - oder sollte ich sagen: in der Zukunft - nützt Ihr mir mehr als auf diesem Schlachtfeld!"},
		},
		[180] =
		{
			Goto {NpcId = 3028, X = 380, Y = 362, WalkMode = Run},	-- raith rennt zum tor.
		},
		[250] = 
		{
			WaitForEndOfSpeech,						
			CutSceneSay {Tag = "cutsoulforgerShwd002", NpcId = 4202, String = "Ich werde Euch nicht enttäuschen, Meister!"},
		},
		[320] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "SoulfRaithIdleOn"},	
			SetGlobalFlagTrue {Name = "RaithDespawn"},				
		},
	},
}

