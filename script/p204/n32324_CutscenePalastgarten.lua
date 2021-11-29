n32324_CameraPalastgarten = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32324_CameraPalastgarten.lua")
   	Camera:ScriptStart()
]]

n32324_CameraPalastgarten1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P204\\n32324_CameraPalastgarten1.lua")
   	Camera:ScriptStart()
]]

n32324_CameraPalastgarten2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P204\\n32324_CameraPalastgarten2.lua")
   	Camera:ScriptStart()
]]

n32324_CameraPalastgarten3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P204\\n32324_CameraPalastgarten3.lua")
   	Camera:ScriptStart()
]]

n32324_CameraPalastgarten4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P204\\n32324_CameraPalastgarten4.lua")
   	Camera:ScriptStart()
]]

n32324_CameraPalastgarten5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P204\\n32324_CameraPalastgarten5.lua")
   	Camera:ScriptStart()
]]

n32324_CameraPalastgarten6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P204\\n32324_CameraPalastgarten6.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P204_Palastgarten_Cutscene", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions = 
	{
			IsGlobalFlagTrue{Name = "g_P204_PalastgartenCutsceneStart", UpdateInterval = 10},	
	},
	
	BeginActions = 	{},
	
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32324_CameraPalastgarten},
			SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},				
			LookAtFigure{NpcId = 9964, Target = 9965},
			LookAtFigure{NpcId = 9965, Target = 9964},	
		},
	
		[10] =
		{
			CutSceneSay {Tag = "csa213soldier_001" , NpcId = 9964, String = "Sergeant! Was hat das mit dem Tor und dem Schlüssel zu bedeuten?"},
		},		

		[40] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32324_CameraPalastgarten1},			
			CutSceneSay {Tag = "csa213sergeant_002" , NpcId = 9965, String = "Na was wohl? Der Garten der Dryade wird verschlossen, du Tölpel!"},
		},	
		
		[80] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "csa213sergeant_003" , NpcId = 9965, String = "Keiner darf mehr die Frau unter dem Baum sehen, es sei denn, es ist der Kaiser persönlich!"},
		},	
		
		[120] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32324_CameraPalastgarten2},			
			CutSceneSay {Tag = "csa213soldier_004" , NpcId = 9964, String = "Aber warum muss ich hier eine dumme Kiste bewachen? Soll der Kaiser seinen Schlüssel doch selbst herumschleppen!"},
		},	
		
		[140] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32324_CameraPalastgarten3},			
			CutSceneSay {Tag = "csa213sergeant_005" , NpcId = 9965, String = "Du hast das nicht zu hinterfragen, Kerl! Irgendjemand wird den Schlüssel schon abholen, bis dahin bewachst du diese Kiste, Mann! Ist das klar?"},
		},	
		
		[160] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32324_CameraPalastgarten2},			
			CutSceneSay {Tag = "csa213soldier_006" , NpcId = 9964, String = "Ja."},
		},	
		
		[180] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32324_CameraPalastgarten4},			
			CutSceneSay {Tag = "csa213sergeant_007" , NpcId = 9965, String = "Ja, was?"},
		},	
		
		[200] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32324_CameraPalastgarten5},			
			CutSceneSay {Tag = "csa213soldier_008" , NpcId = 9964, String = "Jawohl, Sergeant!"},
		},	
		
		
		[220] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32324_CameraPalastgarten3},				
			CutSceneSay {Tag = "csa213sergeant_009" , NpcId = 9965, String = "Na also!"},
			Goto {X = 181, Y = 340, NpcId = 9965, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},			
		},	
		
		[240] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32324_CameraPalastgarten6},				
			CutSceneSay {Tag = "csa213soldier_010" , NpcId = 9964, String = "Ja, leg dich wieder hin, du Stinktier! Geh zur Palastwache, haben sie gesagt ... da erlebst du was, haben sie gesagt ... Kisten bewachen, pah!"},
		},	
				
		[260] =
		{
			WaitForEndOfSpeech,		
			SetGlobalFlagTrue{Name = "g_P204_PalastgartenPatrol"},
			SetGlobalFlagTrue{Name = "g_P204_DryadengartenXP"},
			SetGlobalFlagFalse{Name = "g_P204_PalastgartenCutsceneStart"},
			SetGlobalFlagFalse{Name = "g_P204_NandiniNervNicht"},				
			QuestBegin {QuestId = 864},
			QuestSolve {QuestId = 816},			
		},
	},
}

