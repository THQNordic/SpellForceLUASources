-----------------------------------------------------------------------
--
--	P202_CutsceneMassenSpawn
--
-----------------------------------------------------------------------


n32261_CameraMassenSpawn_I = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P202\\n32261_CameraMassenSpawn_I.lua")
   	Camera:ScriptStart()
]]

n32261_CameraMassenSpawn_II = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P202\\n32261_CameraMassenSpawn_II.lua")
   	Camera:ScriptStart()
]]

n32261_CameraMassenSpawn_III = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,8,1,"script\\P202\\n32261_CameraMassenSpawn_III.lua")
   	Camera:ScriptStart()
]]





CreateCutScene
{
	Name = "P202_CutsceneMassenSpawn", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalTimeElapsed {Name = "gt_P202SpawnwellenTimer", Seconds = 3, UpdateInterval = 20},
		
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32261_CameraMassenSpawn_I},		
		},
		
		[30] =
		{
			ExecuteCameraScript{Script = n32261_CameraMassenSpawn_II},		
			CutSceneSay {Tag = "csa205masked_001", NpcId = 9010, String = "Da! Ihr habt Ihren Zorn geweckt! Sie greifen an! Flieht! Lauft nach Süden!"}
		},
		
		[70] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32261_CameraMassenSpawn_III},
			CutSceneSay {Tag = "csa205masked_002", NpcId = 9010, String = "Die ganze Stadt ist hinter Euch her! Lauft so schnell Ihr könnt!"}		
		},
		
		[110] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetGlobalFlagTrue{Name = "g_sP202CSMassenSpawnEnded"},
			QuestBegin {QuestId = 832, SubQuestActivate = FALSE}, --Q Rückzug
		},
		
			
	},
}



