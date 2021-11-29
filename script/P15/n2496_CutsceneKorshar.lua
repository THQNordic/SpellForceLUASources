-----------------------------------------------------------------------
--
--	Korshar
--
-----------------------------------------------------------------------

-- skelett kommt angelaufen
CameraKorsharI = 
[[
  	Camera:ScriptReset()
 	Camera:ScriptAddSpline(0,10,1,"script\\p15\\n2496_CameraKorsharI.lua")
   	Camera:ScriptStart()
]]

-- fahrt um gruppe
CameraKorsharII = 
[[
  	Camera:ScriptReset()
 	Camera:ScriptAddSpline(0,10,1,"script\\p15\\n2496_CameraKorsharII.lua")
   	Camera:ScriptStart()
]]

-- das zweite tor
CameraKorsharIII = 
[[
  	Camera:ScriptReset()
 	Camera:ScriptAddSpline(0,15,1,"script\\p15\\n2496_CameraKorsharIII.lua")
   	Camera:ScriptStart()
]]

-- feldherr 3447
CameraKorsharIV = 
[[
  	Camera:ScriptReset()
 	Camera:ScriptAddSpline(0,10,1,"script\\p15\\n2496_CameraKorsharIV.lua")
   	Camera:ScriptStart()
]]

-- feldherr 3449
CameraKorsharV = 
[[
  	Camera:ScriptReset()
 	Camera:ScriptAddSpline(0,10,1,"script\\p15\\n2496_CameraKorsharV.lua")
   	Camera:ScriptStart()
]]

-- feldherr 3448
CameraKorsharVI = 
[[
  	Camera:ScriptReset()
 	Camera:ScriptAddSpline(0,10,1,"script\\p15\\n2496_CameraKorsharVI.lua")
   	Camera:ScriptStart()
]]

-- armee
CameraKorsharVII = 
[[
  	Camera:ScriptReset()
 	Camera:ScriptAddSpline(0,10,1,"script\\p15\\n2496_CameraKorsharVII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Korshar", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet zu beginn der map!!!
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetNoFightFlagTrue {NpcId = 0},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- opening cutscene, startet sofort mit camera.				
			LookAtFigure{Target = 2496, NpcId = 2508}, 		
			LookAtFigure{Target = 2508, NpcId = 2496}, 					
			ExecuteCameraScript{Script = CameraKorsharI},
			Goto {NpcId = 2508, X = 447, Y = 231, WalkMode = Run},			
		},
		[30] = 
		{ 
			CutSceneSay {Tag = "cutkorsharHowl001", NpcId = 2496, String = "Menschenfleisch!"},
		},
		[60] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraKorsharII},		
			--LookAtFigure{Target = 2496, NpcId = 2508}, 		
			--LookAtFigure{Target = 2508, NpcId = 2496}, 									
			CutSceneSay {Tag = "cutskelettHowl001",NpcId = 2508, String = "Die Lebenden... sind hier!"},				
		},
		[90] = 
		{
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "cutkorsharHowl002", NpcId = 2496, String = "Bereitet die Streitkräfte vor! Gebt Nachricht an meine fünf Feldherren! Sie sollen die Lebenden aufhalten, bis wir bereit sind!"},	
		},
		[120] =
		{
			ExecuteCameraScript{Script = CameraKorsharVI},			
		},
		[150] =
		{
			ExecuteCameraScript{Script = CameraKorsharIV},			
		},
		[170] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cutskelettHowl002", NpcId = 2508, String = "Und wenn die Fünf geschlagen werden, Herr?"},	
		},
		[180] =
		{
			ExecuteCameraScript{Script = CameraKorsharV},			
		},
		[230] = 
		{
			WaitForEndOfSpeech,					
			ExecuteCameraScript{Script = CameraKorsharIII},				
			CutSceneSay {Tag = "cutkorsharHowl003", NpcId = 2496, String = "Dann werden wir das Tor öffnen und die Lebenden in ihrem Blut ertränken! Noch haben sie unsere wahre Stärke nicht kennengelernt!"},
		},
		[330] = 
		{
			WaitForEndOfSpeech,	
			SetNoFightFlagFalse {NpcId = 0},					
		},
	},
}

