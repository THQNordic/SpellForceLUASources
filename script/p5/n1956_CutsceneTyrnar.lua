-----------------------------------------------------------------------
--
--	Tynar
--
-----------------------------------------------------------------------

CameraTyrnarI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p5\\n1956_CameraTyrnarI.lua")
   	Camera:ScriptStart()
]]

CameraTyrnarII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,10,1,"script\\p5\\n1956_CameraTyrnarII.lua")
   	Camera:ScriptStart()
]]

CameraTyrnarIII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,15,1,"script\\p5\\n1956_CameraTyrnarIII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Tynar", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue{Name = "Q96MonumentCutscene" , UpdateInterval = 5},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},	
		SetNoFightFlagTrue {NpcId = 1956},	
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:		
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraTyrnarI},
		},		
		[40] = 
		{
			CutSceneSay {Tag = "cuttynarShiel001", NpcId = 1956, String = "Eine Postenkette spannt sich zwischen dem Monumentfeld und dem Hauptlager von Brannigans Nordarmee!"},
		},
		[120] = 
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cuttynarShiel002", NpcId = 1956, String = " Wenn die Posten die Hauptarmee alarmieren, seid Ihr verloren!"},
		},
		[170] = 
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cuttynarShiel003", NpcId = 1956, String = "Unterbrecht ihre Kette, bevor die Nachricht weitergegeben wird!"},
		},
		[200] =
		{
			WaitForEndOfSpeech,				
			ExecuteCameraScript{Script = CameraTyrnarII},		
		},
		[220] = 
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cuttynarShiel004", NpcId = 1956, String = "Umrundet das Monumentfeld und fallt von Süden her ein, dann könnt Ihr die Posten erschlagen, bevor sie die Warnung weitergeben!"},
		},
		[300] =
		{
			WaitForEndOfSpeech,				
			ExecuteCameraScript{Script = CameraTyrnarIII},		
		},
		[310] = 
		{
			CutSceneSay {Tag = "cuttynarShiel005", NpcId = 1956, String = "Nehmt den Weg, der zwischen den Steinen hindurchführt! Er wird Euch direkt an die Postenkette heranbringen. Viel Glück!"},
			
		},
		[380] = 
		{
			WaitForEndOfSpeech,			
			RevealUnExplored {X = 192, Y = 359, Range = 5},
			RevealUnExplored {X = 236, Y = 349, Range = 5},
			RevealUnExplored {X = 273, Y = 343, Range = 5},
			RevealUnExplored {X = 309, Y = 346, Range = 5},
		},
		[410] =
		{
			WaitForEndOfSpeech,	
			SetNoFightFlagFalse {NpcId = 0},	
			SetNoFightFlagFalse {NpcId = 1956},					
		},
	},
}

