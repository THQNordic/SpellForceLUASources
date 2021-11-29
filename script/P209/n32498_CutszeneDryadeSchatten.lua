-----------------------------------------------------------------------
--
--	P209KathaiCutszeneDryadeSchatten
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
	Name = "P209KathaiCutszeneDryadeSchatten", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_sP209ClockworkTold", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler", UpdateInterval = 10},
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
				CutSceneSay {Tag = "csa236dryad_001" , NpcId = 11466, String = "Runenkrieger, Uru ... ich sende meinen Geist zu Euch!"},
				
		},
		[150] =
		{
				SetGlobalFlagTrue{Name = "g_sP209PhoenixLaufLos"},	
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade2},
				CutSceneSay {Tag = "csa236dryad_002" , NpcId = 11466, String = "Ich habe den Wächter des Phönixsteins gefunden!"},	
				
		},
		[210] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa236dryad_003" , NpcId = 11466, String = "Er ist bereits auf dem Weg zu Euch!"},
					
		},
		[280] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa236avatar_004" , NpcId = 0, String = "Wo werde ich ihn treffen?"},
				
		},
		[350] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade1},
				CutSceneSay {Tag = "csa236dryad_005" , NpcId = 11466, String = "Er reist zur Wachfeste in den Dunkelwehrbergen! Sie liegt auf Eurem Weg."},
				
		},
		[410] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade6},
				CutSceneSay {Tag = "csa236dryad_006" , NpcId = 11466, String = "Eilt Euch, der Gott, den Hokan gefangen hält braucht Eure Hilfe!"},
				
		},
		[470] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade4},
				CutSceneSay {Tag = "csa236dryad_007" , NpcId = 11466, String = "Ihr kennt ihn als Darius, doch sein wahrer Name ist Ereon, der Gerechte! Er wurde aus dem Kreis der Götter ausgestoßen, weil er den Völkern in der Schlacht um Fiara geholfen hat!"},
				
				
		},
		[620] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa236dryad_008" , NpcId = 11466, String = "Hokan hat ihn in seiner sterblichen Form in den Tempel gelockt! Nun nutzt er sein Blut für den Essenztrank!"},
				
		},
		[680] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade6},
				CutSceneSay {Tag = "csa236dryad_009" , NpcId = 11466, String = "Ich bitte Euch, findet ihn schnell! Darius braucht nun Eure Hilfe!"},
				
				
		},
		[740] =
		{
				LookAtFigure{ Target = 0, NpcId = 8588}, --Uru
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade5},
				CutSceneSay {Tag = "csa236uru_010" , NpcId = 8588, String = "Der Geist Belials ergreift durch die Maske von Hokan Besitz! Wenn Hokan ihm seinen Körper als Heimstatt anbietet, dann wird Belial Ereons göttliche Seele verschlingen und noch machtvoller werden!"},
		},
		[890] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade6},
				CutSceneSay {Tag = "csa236dryad_011" , NpcId = 11466, String = "Ich bitte Euch Runenkrieger, beeilt Euch! Findet die Klinge und rettet Ereon! Macht all dem ein Ende!"},
				
		},
		[960] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade5},
				CutSceneSay {Tag = "csa236uru_012" , NpcId = 8588, String = "Der Geist der Bäume hat recht! Brecht in die Uhrwerkhallen auf, die Zeit drängt!"},
				
		},
		[1020] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32499_CameraDryade1},			
				SetGlobalFlagTrue{Name = "g_sP209DryadeDespawn"},
				
				
		},
		[1060] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				SetGlobalFlagTrue{Name = "g_sP209CutszeneDryadeEnded"},
				SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
		},
		
	},
}



