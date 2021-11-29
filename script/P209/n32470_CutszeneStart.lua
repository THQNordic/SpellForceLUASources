-----------------------------------------------------------------------
--
--	P209KathaiCutszeneStart
--
-----------------------------------------------------------------------


n32470_CameraStart1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\P209\\n32470_CameraStart1.lua")
   	Camera:ScriptStart()
]]

n32471_CameraStart2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\P209\\n32471_CameraStart2.lua")
   	Camera:ScriptStart()
]]

n32472_CameraStart3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32472_CameraStart3.lua")
   	Camera:ScriptStart()
]]

n32473_CameraStart4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\P209\\n32473_CameraStart4.lua")
   	Camera:ScriptStart()
]]

n32474_CameraStart5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\P209\\n32474_CameraStart5.lua")
   	Camera:ScriptStart()
]]

n32475_CameraStart6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\P209\\n32475_CameraStart6.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P209KathaiCutszeneStart", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_sP209CutszeneStartBegin", UpdateInterval = 10},
		
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		 SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[10] =
		{
				SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588" },
				SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8576" },
				SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8694" },
				ExecuteCameraScript{Script = n32471_CameraStart2},	
				Goto{ X = 117, Y = 454, NpcId = 8576, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
				Goto{ X = 121, Y = 454, NpcId = 0, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
				CutSceneSay {Tag = "csa231jenquai_001" , NpcId = 8576, String = "Rabenhaar! Du bist zurück!"},	
				
					
		},
	
		[50] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32470_CameraStart1},
				LookAtFigure {Target = 8590, NpcId = 8576},
				LookAtFigure {Target = 8576, NpcId = 0},
				Goto{ X = 119, Y = 454, NpcId = 8590, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
				Goto{ X = 117, Y = 456, NpcId = 8694, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
				CutSceneSay {Tag = "csa231alyah_002" , NpcId = 8590, String = "Was dachtest du? Im Gegensatz zu den meisten Männern halte ich meine Versprechen!"},		
				
				
		},	
		[100] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				LookAtFigure {Target = 8576, NpcId = 8590},
				LookAtFigure {Target = 8590, NpcId = 8694},
				CutSceneSay {Tag = "csa231urias_003" , NpcId = 8694, String = "Schluss mit dem Getändel! Wie ist die Lage, Freund?"},		
				
				
		},	
		[150] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32474_CameraStart5},
				CutSceneSay {Tag = "csa231jenquai_004" , NpcId = 8576, String = "Sie haben die Belagerung um unsere Stadt verstärkt! Knochenkrieger und Echsen aus dem schwarzen Dschungel!"},
				
		},		
		[230] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32472_CameraStart3},	
				CutSceneSay {Tag = "csa231jenquai_005" , NpcId = 8576, String = "Nachdem du weg warst, Rabenhaar, haben sie die Grenztore geschlossen! Es gibt kein Entrinnen mehr für mein Volk!"},	
		},		
		[300] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32473_CameraStart4},
				CutSceneSay {Tag = "csa231alyah_006" , NpcId = 8590, String = "Warte! Es gibt doch ein verstecktes Portal zwischen den Felsen, das direkt in die Stadt führt, das können wir nutzen, um in die Stadt zu kommen!"},		
		},		
		[400] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				LookAtFigure {Target = 0, NpcId = 8576},
				LookAtFigure {Target = 0, NpcId = 8590},
				LookAtFigure {Target = 0, NpcId = 8694},
				ExecuteCameraScript{Script = n32474_CameraStart5},
				Goto{ X = 123, Y = 448, NpcId = 0, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
				CutSceneSay {Tag = "csa231avatar_007" , NpcId = 0, String = "Aber nicht meine Runenheere! Ich kann die Belagerung um Kathai brechen, aber dazu muss ich diese Tore öffnen!"},		
		},		
		[490] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa231jenquai_008" , NpcId = 8576, String = "Die Grenztore lassen sich nur von der Stadt her öffnen! Von hier aus kommt Ihr nicht hinein!"},		
		},		
		[550] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32475_CameraStart6},
				CutSceneSay {Tag = "csa231avatar_009" , NpcId = 0, String = "Dann muss ich mit Euch durch dieses versteckte Portal in die Stadt reisen und die Tore von innen öffnen."},		
		},		
		[610] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa231avatar_010" , NpcId = 0, String = "Aber zuerst brauche ich ein Heer!"},		
				
		},		
		[660] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				SetGlobalFlagTrue{Name = "g_sP209CutszeneStartEnded"},
				SetPlatformFlagTrue {Name = "g_sP209JenquaiFollow"},
				SetPlatformFlagTrue {Name = "g_sP209UriasFollow"},
				SetPlatformFlagTrue {Name = "g_sP209AlyahFollow"},
				SetGlobalFlagTrue {Name = "g_sP209JenquaiFollow"},
				SetGlobalFlagTrue {Name = "g_sP209UriasFollow"},
				SetGlobalFlagTrue {Name = "g_sP209AlyahFollow"},
				SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
		},		
	},
}



