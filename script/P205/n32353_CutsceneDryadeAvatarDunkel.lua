n32353_CameraDryadeAvatarDunkel1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel1.lua")
   	Camera:ScriptStart()
]]

n32353_CameraDryadeAvatarDunkel2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel2.lua")
   	Camera:ScriptStart()
]]

n32353_CameraDryadeAvatarDunkel3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel3.lua")
   	Camera:ScriptStart()
]]

n32353_CameraDryadeAvatarDunkel4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,6,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel4.lua")
   	Camera:ScriptStart()
]]

n32353_CameraDryadeAvatarDunkel5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel5.lua")
   	Camera:ScriptStart()
]]

n32353_CameraDryadeAvatarDunkel6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel6.lua")
   	Camera:ScriptStart()
]]


n32353_CameraDryadeAvatarDunkel7 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel7.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P205_CutsceneDryadeSchatten", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneDryadeSchattenStart", UpdateInterval = 10},-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
	},
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:

		[0] =
		{
			SetGlobalFlagTrue{Name = "g_P205_StopWaldschrat"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9250"},
		},
		
		[10] =
		{
			LookAtFigure{NpcId = 9250, Target = 0},				
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel1},
		},
	
		[20] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa217dryad_001" , NpcId = 9250, String = "Ihr ... Ihr seid nicht der Versprochene! Ihr seid voller ... Finsternis und Schmerz! Ihr seid hier, um Tod zu säen!"},
			TeleportAvatar{ X = 244, Y = 279},
			Goto {X = 228, Y = 281, NpcId = 0, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
		},			
		
		[30] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel2},			
			CutSceneSay {Tag = "csa217avatar_002" , NpcId = 0, String = "Ich finde keinen Gefallen daran, aber ich muss Euch töten!"},
		},

		[60] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel3},	
			CutSceneSay {Tag = "csa217dryad_003" , NpcId = 9250, String = "Dann tut Euer Werk! Doch Ihr wisst, dass der Maskierte Euch nie freigeben wird! Er kann Euch nicht von diesem Schwert erlösen ... nur Eure Schmerzen lindern!"},
		},		
		
		[80] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel5},			
			CutSceneSay {Tag = "csa217avatar_004" , NpcId = 0, String = "Aber diese Schmerzen sind unerträglich! Er ist der Einzige, der mir helfen kann! Ich kann nicht anders!"},
		},	
		
		[120] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel4},			
			CutSceneSay {Tag = "csa217dryad_005" , NpcId = 9250, String = "Dann schlagt zu!"},
		},
				
		[140] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel5},		
			Goto {X = 226, Y = 281, NpcId = 0, Range = 1, WalkMode = Run, GotoMode = GotoNormal},					
		},
		
		[170] =
		{
			Goto {X = 227, Y = 281, NpcId = 0, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},					
		},
		
		[200] =
		{
			LookAtFigure{NpcId = 9250, Target = 0},
			LookAtFigure{NpcId = 0, Target = 9250},
			CutSceneSay {Tag = "csa217avatar_006" , NpcId = 0, String = "Ich ... Ach, verflucht sollst du sein, maskierte Schlange! Ich kann es nicht!"},
		},
		
		[260] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel3},	
			CutSceneSay {Tag = "csa217dryad_007" , NpcId = 9250, String = "Euer Herz ist noch nicht verdorben, Runenkrieger. Lasst mich Euch helfen."},
		},

		[280] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel6},		
			CastSpell{Spell = 1959, Target = Avatar, TargetType = Figure, NpcId = 9250, X = 0, Y = 0},								
			
		},
		
		[320] =
		{
			CutSceneSay {Tag = "csa217avatar_008" , NpcId = 0, String = "Der Schmerz! Er lässt nach!"},
		},
		
		[360] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa217dryad_009" , NpcId = 9250, String = "Ihr seht, der Maskierte ist nicht der Einzige, der Euch helfen kann ... Deswegen versucht er auch, mich zu töten!"},
		},
						
		[380] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel5},			
			CutSceneSay {Tag = "csa217avatar_010" , NpcId = 0, String = "Hat er noch weitere Mörder geschickt?"},
		},	
		
		[400] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel3},				
			CutSceneSay {Tag = "csa217dryad_011" , NpcId = 9250, String = "Einen Giftmischer! Er hat das Wasser dieses Hains vergiftet ... und mit ihm sieche auch ich dahin... "},
		},

		[420] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel5},				
			CutSceneSay {Tag = "csa217avatar_012" , NpcId = 0, String = "Dann lasst mich Euch helfen, so wie Ihr mir geholfen habt! Was kann ich tun?"},
		},
		
		[440] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel3},				
			CutSceneSay {Tag = "csa217dryad_013" , NpcId = 9250, String = "Sucht die Quell des Giftes! Findet den, der diesen Hain zerstört! Eilt Euch!"},
		},
						
		[460] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel7},				
			CutSceneSay {Tag = "csa217avatar_014" , NpcId = 0, String = "Seid unbesorgt, Geist der Bäume, ich werde das Gift und seinen Urheber aus Eurem Hain fortschaffen! Ihr sollt leben!"},
		},		
		
		[480] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa217avatar_015" , NpcId = 0, String = "Und dann ist dieser maskierte Lügner an der Reihe!"},
		},		
		
		[500] =
		{
			WaitForEndOfSpeech,		
			QuestChangeState {QuestId = 831, State = StateUnsolvable},
			QuestChangeState {QuestId = 1085, State = StateUnsolvable},						
			SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9250"},
			SetGlobalFlagFalse {Name = "g_P205_CutsceneDryadeSchattenStart"},
			SetGlobalFlagTrue{Name = "g_P205_Dryadenquest"},
			QuestSolve {QuestId = 847},
			QuestBegin {QuestId = 866},
			SetGlobalFlagTrue{Name = "g_P205_DialogDryadeFertig"},
			SetGlobalFlagTrue{Name = "g_StoryQuestShadowCantKillDryad"},
		},		
	},
}



