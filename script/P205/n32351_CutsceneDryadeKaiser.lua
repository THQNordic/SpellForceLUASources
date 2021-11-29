n32351_CameraDryadeKaiser1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32351_CameraDryadeKaiser1.lua")
   	Camera:ScriptStart()
]]

n32351_CameraDryadeKaiser2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32351_CameraDryadeKaiser2.lua")
   	Camera:ScriptStart()
]]

n32351_CameraDryadeKaiser3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32351_CameraDryadeKaiser3.lua")
   	Camera:ScriptStart()
]]

n32351_CameraDryadeKaiser4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32351_CameraDryadeKaiser4.lua")
   	Camera:ScriptStart()
]]

n32351_CameraDryadeKaiser5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32351_CameraDryadeKaiser5.lua")
   	Camera:ScriptStart()
]]

n32351_CameraDryadeKaiser6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,8,1,"script\\P205\\n32351_CameraDryadeKaiser6.lua")
   	Camera:ScriptStart()
]]

n32351_CameraDryadeKaiser7 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32351_CameraDryadeKaiser7.lua")
   	Camera:ScriptStart()
]]

n32351_CameraDryadeKaiser8 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32351_CameraDryadeKaiser8.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P205_CutsceneDryadeKaiser", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions = {},
	
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			SetEffect{Effect = "FogForever", X = 223, Y = 302, Length = 0 , TargetType = World},	
			SetEffect{Effect = "FogForever", X = 233, Y = 238, Length = 0 , TargetType = World},					
			SetEffect{Effect = "FogForever", X = 264, Y = 333, Length = 0 , TargetType = World},
			SetEffect{Effect = "FogForever", X = 302, Y = 246, Length = 0 , TargetType = World},
			SetEffect{Effect = "FogForever", X = 198, Y = 276, Length = 0 , TargetType = World},
			SetEffect{Effect = "FogForever", X = 257, Y = 258, Length = 0 , TargetType = World},
			SetEffect{Effect = "FogForever", X = 187, Y = 280, Length = 0 , TargetType = World},
			SetEffect{Effect = "FogForever", X = 156, Y = 289, Length = 0 , TargetType = World},
				
			SetGlobalFlagTrue{Name ="PleaseRemoveDialog_9250"},
			ExecuteCameraScript{Script = n32351_CameraDryadeKaiser1},
			LookAtFigure{NpcId = 9250, Target = 9320},
			LookAtFigure{NpcId = 9320, Target = 9250},
		},
	
		[20] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa214emperor_001" , NpcId = 9320, String = "Du bist schwach! Dein Hain verwelkt, deine Macht schwindet!"},
		},			
		
		[90] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = n32351_CameraDryadeKaiser2},			
			CutSceneSay {Tag = "csa214dryad_002" , NpcId = 9250, String = "Das Wasser ist voller Gift! Es tötet den Hain ... und mich mit ihm!"},
		},
		
		[110] =
		{
			ExecuteCameraScript{Script = n32351_CameraDryadeKaiser3},	
		},		

		[150] =
		{
			ExecuteCameraScript{Script = n32351_CameraDryadeKaiser4},	
			Goto {X = 226, Y = 279, NpcId = 9320, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},					
			CutSceneSay {Tag = "csa214emperor_003" , NpcId = 9320, String = "Dann komm mit mir! Sei endlich meine Kaiserin! Ich kann dich schützen!"},
		},		
		
		[200] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32351_CameraDryadeKaiser5},				
			CutSceneSay {Tag = "csa214dryad_004" , NpcId = 9250, String = "Ihr könnt mich nicht besitzen, Kaiser, die Gunst einer Dryade kann nicht erzwungen werden! Und ich bin an diesen Hain gebunden!"},
		},	
						
		[220] =
		{
			WaitForEndOfSpeech,		
			Goto {X = 225, Y = 277, NpcId = 9320, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},			
			CutSceneSay {Tag = "csa214emperor_005" , NpcId = 9320, String = "Pah! Gärten und Pflanzen! Ich kann dich in Gold und Geschmeide hüllen!"},
		},	
		
		[240] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32351_CameraDryadeKaiser6},			
			CutSceneSay {Tag = "csa214dryad_006" , NpcId = 9250, String = "Dieser Hain ist eine Erinnerung an das, was Xu früher einmal war! Er ist wichtiger als alles Gold Eures Reiches!"},
		},
				
		[260] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32351_CameraDryadeKaiser7},			
			CutSceneSay {Tag = "csa214emperor_007" , NpcId = 9320, String = "Er kümmert mich nicht, nur du! Und bald wirst du mich nicht mehr abweisen!"},
			Goto {X = 230, Y = 255, NpcId = 9320, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
		},

		[280] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32351_CameraDryadeKaiser8},			
			CutSceneSay {Tag = "csa214dryad_008" , NpcId = 9250, String = "Das Gift ... ist so stark ... Ihr Götter, auch wenn ihr mich verflucht habt, helft mir!"},
		},
		
		[380] =
		{
			QuestBegin{QuestId = 846},
			QuestBegin{QuestId = 847},
			RevealUnExplored{X = 226, Y = 273, Range = 20},
			SetGlobalFlagTrue{Name ="PleaseEnableMainQuestDialog_9250"},	
		},

	},
}



