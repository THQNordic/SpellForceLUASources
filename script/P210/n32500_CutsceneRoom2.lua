-----------------------------------------------------------------------
--
--	P210 Clockwork Crypts Room 2 Lichtorgel
--
-----------------------------------------------------------------------


n32500_CameraRoom2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P210\\n32500_CameraRoom2.lua")
   	Camera:ScriptStart()
]]



CreateCutScene
{
	Name = "P210_CutsceneRoom2", CameraScript = "", PlayOnlyOnce = FALSE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_nP210_ShowLightCombo"},
		
	},
	BeginActions =
	{
		SetGlobalFlagFalse {Name = "g_nP210_ShowLightCombo"},
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32500_CameraRoom2},		
		},
	
		[20] =
		{
			SetEffect { Effect = "Torch",  Length = 2500, TargetType = Object, NpcId = 8643}
		},
	
		[40] =
		{
			SetEffect { Effect = "Torch",  Length = 2500, TargetType = Object, NpcId = 8649}
		},
	
		[60] =
		{
			SetEffect { Effect = "Torch",  Length = 2500, TargetType = Object, NpcId = 8641}
		},
	
		[80] =
		{
			SetEffect { Effect = "Torch",  Length = 2500, TargetType = Object, NpcId = 8651}
		},
	
		[100] =
		{
			SetEffect { Effect = "Torch",  Length = 2500, TargetType = Object, NpcId = 8645}
		},
	
---		[120] =
---		{
---			SetEffect { Effect = "Torch",  Length = 2500, TargetType = Object, NpcId = 8650}
---		},
---	
---		[140] =
---		{
---			SetEffect { Effect = "Torch",  Length = 2500, TargetType = Object, NpcId = 8647}
---		},
	
		[160] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
		},		
	},
}



