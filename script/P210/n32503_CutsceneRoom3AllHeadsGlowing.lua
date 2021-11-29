-----------------------------------------------------------------------
--
--	P210 Clockwork Crypts Room 3 Single Head Glowing
--
-----------------------------------------------------------------------


n32503_CameraRoom3AllHeadsGlowing = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P210\\n32503_CameraRoom3AllHeadsGlowing.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P210_CutsceneRoom3AllHeadsGlowing", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_P210_ShowFiveHeadGateOpen", UpdateInterval = 30},
		
	},
	BeginActions =
	{
		SetGlobalFlagFalse {Name = "g_P210_ShowFiveHeadGateOpen"},
		SetGlobalFlagTrue {Name = "g_P210_OpenFiveHeadGate"},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32503_CameraRoom3AllHeadsGlowing},		
		},
	
		[200] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
		},		
	},
}



