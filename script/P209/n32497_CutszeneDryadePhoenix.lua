-----------------------------------------------------------------------
--
--	P209KathaiCutszeneDryadePhoenix
--
-----------------------------------------------------------------------


n32499_CameraDryade1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32499_CameraDryade1.lua")
   	Camera:ScriptStart()
]]

n32499_CameraDryade2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32499_CameraDryade2.lua")
   	Camera:ScriptStart()
]]

n32499_CameraDryade3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32499_CameraDryade3.lua")
   	Camera:ScriptStart()
]]

n32499_CameraDryade4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32499_CameraDryade4.lua")
   	Camera:ScriptStart()
]]

n32499_CameraDryade5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32499_CameraDryade5.lua")
   	Camera:ScriptStart()
]]

n32499_CameraDryade6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32499_CameraDryade6.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P209KathaiCutszeneDryadePhoenix", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_sP209ClockworkTold", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 10},
		
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588" },
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		LookAtFigure{ Target = 0, NpcId = 8588}, --Uru
		LookAtFigure{ Target = 0, NpcId = 8587}, --Xalabar
		Goto {X = 411, Y = 254, NpcId = 0, Range = 1, WalkMode = Walk, GotoMode = GotoForced},	
		Goto {X = 408, Y = 253, NpcId = 8576, Range = 1, WalkMode = Walk, GotoMode = GotoForced},	
		Goto {X = 408, Y = 257, NpcId = 10085, Range = 1, WalkMode = Walk, GotoMode = GotoForced},	
		Goto {X = 408, Y = 254, NpcId = 8590, Range = 1, WalkMode = Walk, GotoMode = GotoForced},	
		Goto {X = 410, Y = 256, NpcId = 8588, Range = 1, WalkMode = Walk, GotoMode = GotoForced},	
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[10] =
		{
				
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade1},
				SetGlobalFlagTrue {Name = "g_sP209DryadeSpawned"},
				
		},
		[50] =
		{
				LookAtFigure{ Target = 11466, NpcId = 0}, --Avatar
				LookAtFigure{ Target = 11466, NpcId = 8588}, --Uru
				LookAtFigure{ Target = 11466, NpcId = 8587}, --Xalabar
				LookAtFigure{ Target = 11466, NpcId = 8576}, --Jenquai
				LookAtFigure{ Target = 11466, NpcId = 10085}, --Khal
				LookAtFigure{ Target = 11466, NpcId = 8590}, --Aliah
				
		},
		[80] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade6},
				CutSceneSay {Tag = "csa235dryad_001" , NpcId = 11466, String = "Runenkrieger, Uru ... ich sende meinen Geist zu Euch!"},
				
		},
		[150] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa235dryad_002" , NpcId = 11466, String = "Ich weiß nun endlich, wie der Phönixstein geöffnet werden kann!"},	
				
		},
		[220] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade3},
				CutSceneSay {Tag = "csa235dryad_003" , NpcId = 11466, String = "Meine Vögel berichten von einer Klinge die nicht von dieser Welt ist, geführt von einem Runenkrieger! Der schwarze Kristall, aus dem sie besteht, kann den Phönixstein brechen!"},
					
		},
		[350] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade1},
				CutSceneSay {Tag = "csa235avatar_004" , NpcId = 0, String = "Wo finde ich diesen Krieger und seine Waffe?"},
				
		},
		[410] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade6},
				CutSceneSay {Tag = "csa235dryad_005" , NpcId = 11466, String = "Er ist ein Gefangener Hokans! Er wird in der Wachfeste in den Dunkelwehrbergen festgehalten!"},
				
		},
		[480] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa235dryad_006" , NpcId = 11466, String = "Ihr müsst ihn befreien! Mit ihm gemeinsam müsst ihr dann dem Gott zur Hilfe eilen, den Hokan gefangen hält!"},
				
		},
		[560] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade4},
				CutSceneSay {Tag = "csa235dryad_007" , NpcId = 11466, String = "Ihr kennt ihn als Darius, doch sein wahrer Name ist Ereon, der Gerechte! Er wurde aus dem Kreis der Götter ausgestoßen, weil er den Völkern in der Schlacht um Fiara geholfen hat!"},
				
				
		},
		[690] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa235dryad_008" , NpcId = 11466, String = "Hokan hat ihn in seiner sterblichen Form in den Tempel gelockt! Nun nutzt er sein Blut für den Essenztrank!"},
				
		},
		[760] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade6},
				CutSceneSay {Tag = "csa235dryad_009" , NpcId = 11466, String = "Ich bitte Euch, findet ihn schnell! Darius braucht nun Eure Hilfe!"},
				
				
		},
		[820] =
		{
				LookAtFigure{ Target = 0, NpcId = 8588}, --Uru
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade5},
				CutSceneSay {Tag = "csa235uru_010" , NpcId = 8588, String = "Der Geist Belials ergreift durch die Maske von Hokan Besitz! Wenn Hokan ihm seinen Körper als Heimstatt anbietet, dann wird Belial Ereons göttliche Seele verschlingen und noch machtvoller werden!"},
		},
		[970] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade6},
				CutSceneSay {Tag = "csa235dryad_011" , NpcId = 11466, String = "Ich bitte Euch Runenkrieger, beeilt Euch! Findet die Klinge und rettet Ereon! Macht all dem ein Ende!"},
				
		},
		[1050] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade5},
				CutSceneSay {Tag = "csa235uru_012" , NpcId = 8588, String = "Der Geist der Bäume hat recht! Brecht in die Uhrwerkhallen auf, die Zeit drängt!"},
				
		},
		[1120] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade1},
				SetGlobalFlagTrue{Name = "g_sP209DryadeDespawn"}, 
				
				
		},
		[1160] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				SetGlobalFlagTrue{Name = "g_sP209CutszeneDryadeEnded"},
				SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
				
		},
		
	},
}



