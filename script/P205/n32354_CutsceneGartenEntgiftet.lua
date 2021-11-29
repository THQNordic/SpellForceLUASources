n32354_CameraGartenEntgiftet1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P205\\n32354_CameraGartenEntgiftet1.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P205_CutsceneGartenEntgiftet", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneGartenEntgiftetStart", UpdateInterval = 10},-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
	},
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32354_CameraGartenEntgiftet1},
			
			ChangeObject{X = 226, Y = 284, Object = 2611},
			
			ChangeObject{X = 262, Y = 325, Object = 2075},
			ChangeObject{X = 241, Y = 287, Object = 2075},
			ChangeObject{X = 222, Y = 250, Object = 2075},
			ChangeObject{X = 250, Y = 233, Object = 2075},
			ChangeObject{X = 264, Y = 264, Object = 2075},
			ChangeObject{X = 311, Y = 238, Object = 2075},
			ChangeObject{X = 204, Y = 266, Object = 2075},
			ChangeObject{X = 251, Y = 272, Object = 2075},


			ChangeObject{X = 224, Y = 232, Object = 2076},
			ChangeObject{X = 298, Y = 239, Object = 2076},
			ChangeObject{X = 250, Y = 255, Object = 2076},
			ChangeObject{X = 302, Y = 263, Object = 2076},
			ChangeObject{X = 258, Y = 299, Object = 2076},
			ChangeObject{X = 222, Y = 302, Object = 2076},
			ChangeObject{X = 278, Y = 255, Object = 2076},
		},
		
		[15] =
		{
		StopEffect{X = 156, Y = 289},
		StopEffect{X = 233, Y = 238},		
		},
		
		[40] =
		{
		StopEffect{X = 187, Y = 280},
		ChangeObject{X = 190, Y = 278, Object = 2075},
		},
		
		[60] =
		{
		StopEffect{X = 198, Y = 276},
		StopEffect{X = 223, Y = 302},		
		},
		
		[80] =
		{
		ChangeObject{X = 204, Y = 266, Object = 2075},
		ChangeObject{X = 227, Y = 280, Object = 2611},
		},
		
		[90] =
		{
		ChangeObject{X = 216, Y = 259, Object = 2076},
		},
		
		[100] =
		{
		ChangeObject{X = 214, Y = 285, Object = 2076},
		},
		
		[120] =
		{
			StopEffect{X = 264, Y = 333},
			StopEffect{X = 302, Y = 246},
			StopEffect{X = 257, Y = 258},
			SetGlobalFlagFalse {Name = "g_P205_CutsceneGartenEntgiftetStart"},
			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9342"},
			SetRewardFlagTrue { Name = "GartenEntgiftet"},
			SetGlobalTimeStamp{Name = "c_P205_DryadeOutcry"},			
		},		
	},
}



