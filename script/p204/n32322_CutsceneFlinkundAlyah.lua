n32322_CameraFlinkundAlyah = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32322_CameraFlinkundAlyah.lua")
   	Camera:ScriptStart()
]]

n32322_CameraFlinkundAlyah1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32322_CameraFlinkundAlyah1.lua")
   	Camera:ScriptStart()
]]

n32322_CameraFlinkundAlyah2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32322_CameraFlinkundAlyah2.lua")
   	Camera:ScriptStart()
]]

n32322_CameraFlinkundAlyah3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32322_CameraFlinkundAlyah3.lua")
   	Camera:ScriptStart()
]]

n32322_CameraFlinkundAlyah4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32322_CameraFlinkundAlyah4.lua")
   	Camera:ScriptStart()
]]

n32322_CameraFlinkundAlyah5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32322_CameraFlinkundAlyah5.lua")
   	Camera:ScriptStart()
]]

n32322_CameraFlinkundAlyah6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32322_CameraFlinkundAlyah6.lua")
   	Camera:ScriptStart()
]]



CreateCutScene
{
	Name = "P204_Cutscene_Flink_und_Alyah", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_CutsceneFlinkUndAlyah", UpdateInterval = 10},-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
	},
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8791"},
		},
		
		[10] =
		{
			LookAtFigure{NpcId = 8787, Target = 8683},			
			ExecuteCameraScript{Script = n32322_CameraFlinkundAlyah},
			SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},			

		},
	
		[20] =
		{
			Goto {X = 167, Y = 195, NpcId = 8683, Range = 0, WalkMode = Run, GotoMode = GotoNormal},				
			Goto {X = 167, Y = 198, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},				
			CutSceneSay {Tag = "csa212alyah_001" , NpcId = 8787, String = "Na, wen haben wir denn da?"},
		},		
		
		[50] =
		{
			WaitForEndOfSpeech,	
			LookAtFigure{NpcId = 8787, Target = 8683},
			LookAtFigure{NpcId = 8683, Target = 8787},				
			ExecuteCameraScript{Script = n32322_CameraFlinkundAlyah1},				
			CutSceneSay {Tag = "csa212flink_002" , NpcId = 8683, String = "Königin der Diebe! Ich entbiete Euch meine Grüße!"},
		},	
		
		[90] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 8787, Target = 8683},
			LookAtFigure{NpcId = 8683, Target = 8787},
			LookAtFigure{NpcId = 8791, Target = 8683},
			ExecuteCameraScript{Script = n32322_CameraFlinkundAlyah2},			
			CutSceneSay {Tag = "csa212alyah_003" , NpcId = 8787, String = "Und?"},
		},	
		
	
		[95] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 0, Target = 8683},			
			ExecuteCameraScript{Script = n32322_CameraFlinkundAlyah3},			
		},	
		
		[100] =
		{
			CutSceneSay {Tag = "csa212avatar_004" , NpcId = 0, String = "Flink ..."},
		},
		
		[140] =
		{
			WaitForEndOfSpeech,		
			Goto {X = 166, Y = 196, NpcId = 8683, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},			
			ExecuteCameraScript{Script = n32322_CameraFlinkundAlyah1},			
		},	
		
		[150] =
		{
			LookAtFigure{NpcId = 8683, Target = 8787},
			CutSceneSay {Tag = "csa212flink_005" , NpcId = 8683, String = "Und untertänigst die fünfzehn Goldstücke als meinen Beitrag für Eure Gilde natürlich!"},
		},		
		
		[170] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32322_CameraFlinkundAlyah2},				
			CutSceneSay {Tag = "csa212alyah_006" , NpcId = 8787, String = "Na also! McWinter auf dem rechten Pfad, dass ich das noch erleben darf! Danke, Runenkrieger!"},
		},	
		
		[200] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 0, Target = 8683},
			LookAtFigure{NpcId = 8683, Target = 0},				
			ExecuteCameraScript{Script = n32322_CameraFlinkundAlyah5},			
			CutSceneSay {Tag = "csa212flink_007" , NpcId = 8683, String = "Ja ... Danke, Runenkrieger ..."},
		},	
		
		[220] =
		{
			--Goto {X = 166, Y = 194, NpcId = 8683, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},		
		},			
		
		[240] =
		{
			WaitForEndOfSpeech,		
			RevealUnExplored { X = 177 , Y = 315 , Range = 15 },
			SetGlobalFlagTrue{Name = "g_P204_FlinkBeiAlyah"},
			SetGlobalFlagTrue{Name = "g_P204_AlyahAuftragEmpyria"},
			SetGlobalFlagFalse {Name = "g_P204_CutsceneFlinkUndAlyah"},
			SetGlobalFlagFalse{Name = "g_P204_NandiniNervNicht"},				
		    QuestSolve {QuestId = 811},
		    QuestSolve {QuestId = 897},
		    QuestBegin {QuestId = 951},
		    SetRewardFlagTrue {Name = "FlinkAbgeliefert"},	
			SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11251"}		    
		 },	
	},
}



