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

CreateCutScene
{
	Name = "P205_CutsceneSpinnenkoenigSchatten", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneSpinnenkoenigSchattenStart", UpdateInterval = 10},-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
	},
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			LookAtFigure{NpcId = 9251, Target = 0},	
		},
		
		[10] =
		{
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel1},
		},
	
		[20] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "csa219spider_001" , NpcId = 9251, String = "So, also hat der Meister einen weiteren Mörder geschickt! Oh, vertraut er mir nicht?"},
		},			
		
		[30] =
		{
			WaitForEndOfSpeech,	
			TeleportAvatar{ X = 128, Y = 303},			
			Goto {X = 124, Y = 320, NpcId = 0, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},	
			LookAtFigure{NpcId = 9251, Target = 0},						
			CutSceneSay {Tag = "csa219spider_002" , NpcId = 9251, String = "Ihr unsterbliches Blut schmeckt so süß ... Sie gehört mir! Verschwinde! Das ist mein Auftrag!"},
		},
		
		[60] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel2},		
		},		

		[90] =
		{
			CutSceneSay {Tag = "csa219avatar_003" , NpcId = 0, String = "Ich habe eine Nachricht für Euch."},
		},
				
		[120] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel3},			
			LookAtFigure{NpcId = 9251, Target = 0},
			LookAtFigure{NpcId = 0, Target = 9251},			
			CutSceneSay {Tag = "csa219spider_004" , NpcId = 9251, String = "Ach wirklich?"},
		},	
		
		[140] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel4},			
			CutSceneSay {Tag = "csa219avatar_005" , NpcId = 0, String = "Ja, merkt sie Euch gut! Ich bin Euer Tod und ebenso der Tod aller, die diese maskierte Schlange noch gedungen hat!"},
		},
				
		[160] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 9251, Target = 0},
			LookAtFigure{NpcId = 0, Target = 9251},
			CutSceneSay {Tag = "csa219avatar_006" , NpcId = 0, String = "Ich werde euch jagen ... Ich werde euch finden und keiner von euch wird mir entkommen! Ich diene dem Maskierten nicht mehr! Sagt ihm das!"},
		},

		
		[180] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa219avatar_007" , NpcId = 0, String = "Wenn Ihr ihn am Fluss der Seelen trefft!"},
		},
		
		[200] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32350_CameraSpinnenkoenigAvatarDunkel5},			
			Goto {X = 160, Y = 327, NpcId = 9251, Range = 1, WalkMode = Run, GotoMode = GotoNormal},
			CutSceneSay {Tag = "csa219spider_008" , NpcId = 9251, String = "Arr! Auf ihn, meine Kleinen! Auf ihn!"},
		},	
		
		[220] =
		{
			WaitForEndOfSpeech,		
			SetGlobalFlagFalse {Name = "g_P205_CutsceneSpinnenkoenigSchattenStart"},
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



