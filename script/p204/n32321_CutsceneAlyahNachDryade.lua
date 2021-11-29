 n32321_CameraAlyahNachDryade = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\P204\\n32321_CameraAlyahNachDryade.lua")
   	Camera:ScriptStart()
]]

n32321_CameraAlyahNachDryade1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32321_CameraAlyahNachDryade1.lua")
   	Camera:ScriptStart()
]]


n32321_CameraAlyahNachDryade2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32321_CameraAlyahNachDryade2.lua")
   	Camera:ScriptStart()
]]

n32321_CameraAlyahNachDryade3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32321_CameraAlyahNachDryade3.lua")
   	Camera:ScriptStart()
]]

n32321_CameraAlyahNachDryade4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32321_CameraAlyahNachDryade4.lua")
   	Camera:ScriptStart()
]]

n32321_CameraAlyahNachDryade5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P204\\n32321_CameraAlyahNachDryade5.lua")
   	Camera:ScriptStart()
]]

n32321_CameraAlyahNachDryade6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32321_CameraAlyahNachDryade6.lua")
   	Camera:ScriptStart()
]]

n32321_CameraAlyahNachDryade7 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P204\\n32321_CameraAlyahNachDryade7.lua")
   	Camera:ScriptStart()
]]



CreateCutScene
{
	Name = "P204_AlyahNachDryade", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_CutsceneAlyahNachDryadeStart", UpdateInterval = 10},-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
	},
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			LookAtFigure{NpcId = 8787, Target = 8794},
			LookAtFigure{NpcId = 8794, Target = 8787},		
			SetGlobalFlagFalse{Name = "g_P204_OroHomepoint"},		
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8787"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8791"},
			SetGlobalFlagTrue{Name = "g_P204_AlyahCutsceneKeinKampf"},
			SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},						
			ExecuteCameraScript{Script = n32321_CameraAlyahNachDryade},
		},
		
		[10] =
		{
			Goto {X = 176, Y = 194, NpcId = 8683, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},		
		},	
	
		[20] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa222haran_001" , NpcId = 8794, String = "Das Ohr Eures Vaters ist taub für uns Kathai geworden, Alyah."},
		},		
		
		[40] =
		{
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "csa222alyah_002" , NpcId = 8787, String = "Aber er braucht die freien Völker! So ein Dummkopf!"},
		},	
		
		[60] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32321_CameraAlyahNachDryade1},				
			CutSceneSay {Tag = "csa222haran_003" , NpcId = 8794, String = "Die Einflüsterungen seines Beraters machen ihn hochmütig, Prinzessin."},
		},	
		
		[90] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32321_CameraAlyahNachDryade3},			
			CutSceneSay {Tag = "csa222alyah_004" , NpcId = 8787, String = "Diese maskierte Schlange, die Ahnen mögen ihn verdammen!"},
		},	
		
		[120] =
		{
			Goto {X = 166, Y = 196, NpcId = 8787, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
		},				
		
		[130] =
		{
			WaitForEndOfSpeech,						
			Goto {X = 166, Y = 198, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},			
			CutSceneSay {Tag = "csa222alyah_005" , NpcId = 8787, String = "Es tut mir leid, Botschafter, dass Ihr umsonst nach Empyria gekommen seid. Grüßt mir die Kinder des Windes."},
		},	
		
		[150] =
		{
			WaitForEndOfSpeech,		
			SetGlobalFlagTrue{Name = "g_P204_IshtarSpawnt"},			
			ExecuteCameraScript{Script = n32321_CameraAlyahNachDryade4},	
			CutSceneSay {Tag = "csa222haran_006" , NpcId = 8794, String = "Ich werde meinem Volk Eure Grüße bringen, Prinzessin. Sollte es mein Volk noch geben, wenn ich dort ankomme ..."},
		},	
		
		[170] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 8791, Target = 9877},					
			CutSceneSay {Tag = "csa222alyah_007" , NpcId = 8787, String = "Ah, der Runenkrieger!"},
			LookAtFigure{NpcId = 8794, Target = 0},
		},		
		
		[190] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32321_CameraAlyahNachDryade2},			
			LookAtFigure{NpcId = 8787, Target = 8795},
			LookAtFigure{NpcId = 8794, Target = 8795},	
			LookAtFigure{NpcId = 8791, Target = 9877},
			LookAtFigure{NpcId = 0, Target = 8795},	
			CutSceneSay {Tag = "csa222urias_011" , NpcId = 8791, String = "Vorsicht, es tut sich was!"},
		},	
		
		[210] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 8791, Target = 9877},			
			ExecuteCameraScript{Script = n32321_CameraAlyahNachDryade5},
			Goto {X = 165, Y = 195, NpcId = 8683, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
			CutSceneSay {Tag = "csa222flink_012" , NpcId = 8683, String = "Alyah! Schnell! Fort! Es ist der Hauptmann der Wache!"},
		},	
		
		[240] =
		{
			WaitForEndOfSpeech,	
			LookAtFigure{NpcId = 8795, Target = 8787},	
			LookAtFigure{NpcId = 8683, Target = 9877},				
			CutSceneSay {Tag = "csa222isthar_013" , NpcId = 9877, String = "Halt, Ruhe, McWinter! Wenn ich Euch verhaften wollte, wäre ich kaum alleine hier!"},
		},	
		
		[280] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 8787, Target = 9877},	
			LookAtFigure{NpcId = 9877, Target = 8787},	
			LookAtFigure{NpcId = 0, Target = 9877},
			LookAtFigure{NpcId = 8794, Target = 9877},	
			LookAtFigure{NpcId = 8683, Target = 9877},	
			LookAtFigure{NpcId = 8791, Target = 9877},								
			ExecuteCameraScript{Script = n32321_CameraAlyahNachDryade6},
			CutSceneSay {Tag = "csa222alyah_014" , NpcId = 8787, String = "Und was bringt dich dann hierher, Bruder?"},
		},	
		
		[300] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32321_CameraAlyahNachDryade7},			
			CutSceneSay {Tag = "csa222isthar_015" , NpcId = 9877, String = "Irgend jemand ist in den Palastgarten eingedrungen! General Yrmir kocht vor Wut! Er glaubt, da deine Handschrift zu erkennen!"},
		},
	
		[360] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa222isthar_016" , NpcId = 9877, String = "Sie sammeln die Palastgarde! Du musst hier verschwinden! Schnell!"},
		},
	
		[380] =
		{
			WaitForEndOfSpeech,	
			LookAtFigure{NpcId = 9877, Target = 0},				
			CutSceneSay {Tag = "csa222isthar_017" , NpcId = 9877, String = "Und Ihr, Runenkrieger, tätet auch nicht schlecht daran, zu verschwinden! Zeugen meinen Euch im Palast gesehen zu haben!"},
		},
	
		[420] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32321_CameraAlyahNachDryade4},			
			LookAtFigure{NpcId = 8787, Target = 8794},
			LookAtFigure{NpcId = 8794, Target = 8787},
			CutSceneSay {Tag = "csa222haran_019" , NpcId = 8794, String = "Prinzessin! Begleitet mich zu den Kathai! Und Ihr ebenfalls, Runenkrieger! Dort seid Ihr sicher vor den Häschern des Kaisers!"},
		},	
		
		[440] =
		{
			LookAtFigure{NpcId = 8794, Target = 0},
		},
				
		[450] =
		{
			WaitForEndOfSpeech,			
			LookAtFigure{NpcId = 9877, Target = 8787},					
			CutSceneSay {Tag = "csa222isthar_020" , NpcId = 9877, String = "Beeilt Euch! Viel Glück!"},
		},	
			
			
		[455] =
		{
			SetGlobalFlagTrue{Name = "g_P204_IshtarZumTor"},			
		},		
				
		[460] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32321_CameraAlyahNachDryade3},			
			CutSceneSay {Tag = "csa222alyah_021" , NpcId = 8787, String = "Ich komme mit Euch, Botschafter! Runenkrieger, wie steht es mit Euch?"},
		},	
		
		[470] =
		{
			LookAtFigure{NpcId = 8787, Target = 0},
		},
		
		
		[500] =
		{
			WaitForEndOfSpeech,		
			SetGlobalFlagTrue{Name = "g_P204_OroHomepoint"},			
			SetGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert"},	
			SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8787"},	
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9878"},	
			SetGlobalFlagFalse{Name = "g_P204_NandiniNervNicht"},	
			TransferItem {TakeItem = 4630, Flag = Take},								
		    QuestSolve {QuestId = 846},
		    QuestSolve {QuestId = 872},		    
		    QuestBegin {QuestId = 890},
			SetGlobalTimeStamp{Name = "c_P204_YrmirOutcry"},	 		    
		 },	
	},
}



