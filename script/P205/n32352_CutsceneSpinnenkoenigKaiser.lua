n32352_CameraSpinnenkoenigKaiser1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\P205\\n32352_CameraSpinnenkoenigKaiser1.lua")
   	Camera:ScriptStart()
]]

n32352_CameraSpinnenkoenigKaiser2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\P205\\n32352_CameraSpinnenkoenigKaiser2.lua")
   	Camera:ScriptStart()
]]

n32352_CameraSpinnenkoenigKaiser3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\P205\\n32352_CameraSpinnenkoenigKaiser3.lua")
   	Camera:ScriptStart()
]]

n32352_CameraSpinnenkoenigKaiser4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\P205\\n32352_CameraSpinnenkoenigKaiser4.lua")
   	Camera:ScriptStart()
]]

n32352_CameraSpinnenkoenigKaiser5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,6,1,"script\\P205\\n32352_CameraSpinnenkoenigKaiser5.lua")
   	Camera:ScriptStart()
]]

n32352_CameraSpinnenkoenigKaiser6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\P205\\n32352_CameraSpinnenkoenigKaiser6.lua")
   	Camera:ScriptStart()
]]

n32352_CameraSpinnenkoenigKaiser7 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\P205\\n32352_CameraSpinnenkoenigKaiser7.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P205_CutsceneSpinnenkoenigKaiser", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneSpinnenkoenigKaiserStart", UpdateInterval = 10},-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
	},
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			SetGlobalFlagTrue{Name = "g_P205_StopSpinnen"},
		},
	
		[10] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32352_CameraSpinnenkoenigKaiser1},				
			LookAtFigure{NpcId = 9304, Target = 9305},
			LookAtFigure{NpcId = 9305, Target = 9304},
		},			
		
		[40] =
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "csa220emperor_001" , NpcId = 9305, String = "Du hast versagt, Spinne!"},
		},

		[60] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32352_CameraSpinnenkoenigKaiser2},			
			CutSceneSay {Tag = "csa220spider_002" , NpcId = 9304, String = "Arr! Es ist ein verdammter Runenkrieger! Die kann man nicht aufhalten!"},
		},		
		
		[100] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32352_CameraSpinnenkoenigKaiser3},			
			CutSceneSay {Tag = "csa220emperor_003" , NpcId = 9305, String = "Habe ich dir nicht genug Mädchen meines Volkes geopfert, Kreatur?"},
		},	
		
		[120] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32352_CameraSpinnenkoenigKaiser5},			
			CutSceneSay {Tag = "csa220emperor_004" , NpcId = 9305, String = "Doch du konntest weder die Dryade in die Knie zwingen, noch diesen Krieger aufhalten!"},
			Goto {X = 236, Y = 422, NpcId = 9305, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
		},
				
		[140] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32352_CameraSpinnenkoenigKaiser4},			
			CutSceneSay {Tag = "csa220emperor_005" , NpcId = 9305, String = "Vielleicht sollte ich dem Maskierten von deinem kleinen, verräterischen Handel mit mir berichten? Mich braucht er noch, aber dich ..."},
		},
		
		[160] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32352_CameraSpinnenkoenigKaiser6},			
			CutSceneSay {Tag = "csa220spider_006" , NpcId = 9304, String = "Nein! Nein! Das dürft Ihr nicht, Ihr wisst nicht, was er mit Verrätern tut!"},
		},
		
		[180] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32352_CameraSpinnenkoenigKaiser7},			
			Goto {X = 233, Y = 422, NpcId = 9305, Range = 1, WalkMode = Run, GotoMode = GotoNormal},
		},
		
		[190] =
		{
			CutSceneSay {Tag = "csa220emperor_007" , NpcId = 9305, String = "Dann töte endlich diesen Runenkrieger! Wenn er fort ist, kann dein Gift wieder sein Werk tun! Ich will die Dryade! Sie soll zu mir kriechen wie ein folgsamer Hund!"},
		},
		
		[270] =
		{
			Goto {X = 231, Y = 446, NpcId = 9305, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},				
		},

		[340] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32352_CameraSpinnenkoenigKaiser6},			
			Goto {X = 231, Y = 414, NpcId = 9304, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},				
			CutSceneSay {Tag = "csa220spider_008" , NpcId = 9304, String = "Verdammt! Der Runenknecht muss sterben!"},
		},
			
		[380] =
		{
			Goto {X = 234, Y = 408, NpcId = 9304, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},				
		},
				
		[400] =
		{
			QuestBegin{QuestId = 868},
			QuestSolve{QuestId = 867},
			ChangeRace{Race = 150, NpcId = 9304},
			SetGlobalFlagTrue {Name = "g_P205_KaiserDespawnt"},
			SetGlobalFlagFalse {Name = "g_P205_CutsceneSpinnenkoenigKaiserStart"},
			RevealUnExplored{X = 231, Y = 421, Range = 20},			
		},		
	},
}



