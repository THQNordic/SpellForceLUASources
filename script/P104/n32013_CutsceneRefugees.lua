-----------------------------------------------------------------------
--
--	Refugees
--
-----------------------------------------------------------------------

-- am portal
CameraRefugeesI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p104\\n5428_CameraRefugeesI.lua")
   	Camera:ScriptStart()
]]

-- nahrungsinsel
CameraRefugeesII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p104\\n5428_CameraRefugeesII.lua")
   	Camera:ScriptStart()
]]

-- portal 3 - intro camera
CameraRefugeesIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p104\\n5428_CameraRefugeesIII.lua")
   	Camera:ScriptStart()
]]

-- portal 2 - spawn verdeckt
CameraRefugeesIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p104\\n5428_CameraRefugeesIV.lua")
   	Camera:ScriptStart()
]]

-- fahrt rueckwaerts
CameraRefugeesV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p104\\n5428_CameraRefugeesV.lua")
   	Camera:ScriptStart()
]]

-- still totale alle
CameraRefugeesVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p104\\n5428_CameraRefugeesVI.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Refugees", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "FirstFugitiveGroupComingThroughPortal"},
		IsGlobalTimeElapsed{Name = "FugitiveCutsceneDelay", Seconds = 8, UpdateInterval = 10},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene: 
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 5428},
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
			ExecuteCameraScript{Script = CameraRefugeesIV},
		},
		[40] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs11LenaP104_001" , NpcId = 5428, String = "Die Flüchtlinge kommen!"},
		},		
		[70] =
		{
			WaitForEndOfSpeech,
			--ExecuteCameraScript{Script = CameraRefugeesIV},
			CutSceneSay {Tag = "cs11LenaP104_002" , NpcId = 5428, String = "Aedar wird sie zu einem brauchbaren Lagerplatz führen."},
		},	
		[120] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraRefugeesVI},
			CutSceneSay {Tag = "cs11MainCharP104_001" , NpcId = 0, String = "Warum ein Lagerplatz? Sie sollen gleich in die Berge weiterziehen, es bleibt keine Zeit für eine Rast!"},
		},	
		[170] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraRefugeesV},
			CutSceneSay {Tag = "cs11LenaP104_003" , NpcId = 5428, String = "Die meisten seiner Leute waren nie gut genährt und die letzten Tage haben es nicht besser gemacht. Sie sind völlig erschöpft."},
		},					
		[230] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs11LenaP104_004" , NpcId = 5428, String = "Du solltest den Flüchtlingen etwas von der Nahrung deiner Runenheere geben. Dann sind sie bald wieder marschbereit."},
		},		
		[290] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraRefugeesII},			
			CutSceneSay {Tag = "cs11MainCharP104_002" , NpcId = 0, String = "Sie sollen sich nehmen, was sie brauchen. Allerdings muss ich erst einmal Nahrung auftreiben in diesem stinkenden Loch!"},
		},						
		[350] = 
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 5428},			
			QuestBegin {QuestId = 576},
		},
	},
}
