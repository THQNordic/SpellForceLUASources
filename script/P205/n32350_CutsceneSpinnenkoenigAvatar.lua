n32350_CameraSpinnenkoenigAvatarDunkel1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P205\\n32350_CameraSpinnenkoenigAvatarDunkel1.lua")
   	Camera:ScriptStart()
]]


n32350_CameraSpinnenkoenigAvatarDunkel2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32350_CameraSpinnenkoenigAvatarDunkel2.lua")
   	Camera:ScriptStart()
]]

n32350_CameraSpinnenkoenigAvatarDunkel3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32350_CameraSpinnenkoenigAvatarDunkel3.lua")
   	Camera:ScriptStart()
]]

n32350_CameraSpinnenkoenigAvatarDunkel4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32350_CameraSpinnenkoenigAvatarDunkel4.lua")
   	Camera:ScriptStart()
]]

n32350_CameraSpinnenkoenigAvatarDunkel5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\P205\\n32350_CameraSpinnenkoenigAvatarDunkel5.lua")
   	Camera:ScriptStart()
]]

n32350_CameraSpinnenkoenigAvatarDunkel6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\P205\\n32350_CameraSpinnenkoenigAvatarDunkel6.lua")
   	Camera:ScriptStart()
]]




CreateCutScene
{
	Name = "P205_CutsceneSpinnenkoenigPhoenix", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneSpinnenkoenigPhoenixStart", UpdateInterval = 10},-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
	},
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel3},			
			LookAtFigure{NpcId = 9251, Target = 0},	
		},
		
		[10] =
		{
			TeleportAvatar{ X = 128, Y = 303},
			Goto {X = 124, Y = 320, NpcId = 0, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},	
			CutSceneSay {Tag = "csa218spider_001" , NpcId = 9251, String = "Sieh an, ein alter Freund!"},					
		},
		
		[30] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 9251, Target = 0},			
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel2},				
			CutSceneSay {Tag = "csa218avatar_002" , NpcId = 0, String = "Spinnenmann? So weit weg vom Wildland Pass?"},
		},
		
		[60] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel6},			
			CutSceneSay {Tag = "csa218spider_003" , NpcId = 9251, String = "Vom Wildland Pass und meiner alten Existenz, die dort ein so unrühmliches Ende fand!"},
		},		
		
		[80] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 9251, Target = 0},
			CutSceneSay {Tag = "csa218spider_004" , NpcId = 9251, String = "Aber diese neue Form ist ... berauschend! Ihr solltet das mal versuchen!"},
		},	
		
		[120] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa218spider_005" , NpcId = 9251, String = "Ach, ich vergaß, wir sind ja Feinde! Wie lästig!"},
		},
				
		[140] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel4},			
			LookAtFigure{NpcId = 9251, Target = 0},
			LookAtFigure{NpcId = 0, Target = 9251},
			CutSceneSay {Tag = "csa218avatar_006" , NpcId = 0, String = "Nehmt Euer Gift und Eure acht Beine in die Hand und verschwindet! Dann werdet Ihr vielleicht leben!"},
		},	
		
		[160] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel3},			
			CutSceneSay {Tag = "csa218spider_007" , NpcId = 9251, String = "Dem kann ich leider nicht zustimmen! Dazu macht es einfach viel zu viel Spaß!"},
		},
		
		[180] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel5},			
			Goto {X = 160, Y = 327, NpcId = 9251, Range = 1, WalkMode = Run, GotoMode = GotoNormal},
			CutSceneSay {Tag = "csa218spider_008" , NpcId = 9251, String = "Und ich brauche frisches Blut! Tut mir leid, alter Freund! Das hier wird Euer Grab!"},
		},	
		
		[200] =
		{
			WaitForEndOfSpeech,		
			SetGlobalFlagFalse {Name = "g_P205_CutsceneSpinnenkoenigPhoenixStart"},
			SetGlobalFlagTrue{Name = "g_P205_SpinnenAttacke"},
			SetGlobalFlagTrue{Name = "g_P205_KoenigDerZweite"},
			SetGlobalFlagTrue{Name = "g_P205_KaiserDerZweite"},
			ChangeRace{Race = 150, NpcId = 9251},
		},	
		
		[260] =
		{
			ChangeBuildingRace {X = 121, Y = 324, Race = 109},
			ChangeBuildingRace {X = 129, Y = 329, Race = 109},
			ChangeBuildingRace {X = 137, Y = 331, Race = 109},
			ChangeBuildingRace {X = 129, Y = 315, Race = 109},
			ChangeBuildingRace {X = 138, Y = 317, Race = 109},
			ChangeBuildingRace {X = 145, Y = 324, Race = 109},															
		},	
	},
}



