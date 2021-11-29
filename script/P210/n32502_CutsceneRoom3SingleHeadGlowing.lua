-----------------------------------------------------------------------
--
--	P210 Clockwork Crypts Room 3 Single Head Glowing
--
-----------------------------------------------------------------------


n32502_CameraRoom3SingleHeadGlowing = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P210\\n32502_CameraRoom3SingleHeadGlowing.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P210_CutsceneRoom3SingleHead", CameraScript = "", PlayOnlyOnce = FALSE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_nP210_ShowHeadGlow", UpdateInterval = 30},
		
	},
	BeginActions =
	{
		SetGlobalFlagFalse {Name = "g_nP210_ShowHeadGlow"},
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32502_CameraRoom3SingleHeadGlowing},		
		},
	
		[100] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
		},		
	},
}



