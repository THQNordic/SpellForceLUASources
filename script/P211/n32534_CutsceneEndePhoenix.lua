-----------------------------------------------------------------------
--
--	P211_CutsceneEndePhoenix
--
-----------------------------------------------------------------------


n32534_CameraEndePhoenixI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P211\\n32534_CameraEndePhoenixI.lua")
   	Camera:ScriptStart()
]]


n32534_CameraEndePhoenixII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,35,1,"script\\P211\\n32534_CameraEndePhoenixII.lua")
   	Camera:ScriptStart()
]]

n32534_CameraEndePhoenixIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,28,1,"script\\P211\\n32534_CameraEndePhoenixIII.lua")
   	Camera:ScriptStart()
]]

n32534_CameraEndePhoenixIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P211\\n32534_CameraEndePhoenixIV.lua")
   	Camera:ScriptStart()
]]

n32534_CameraEndePhoenixV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,18,1,"script\\P211\\n32534_CameraEndePhoenixV.lua")
   	Camera:ScriptStart()
]]


n32534_CameraEndePhoenixVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P211\\n32534_CameraEndePhoenixVI.lua")
   	Camera:ScriptStart()
]]

n32534_CameraEndePhoenixVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P211\\n32534_CameraEndePhoenixVI.lua")
   	Camera:ScriptStart()
]]

--OnOneTimeEvent
--{
--	Conditions = 
--	{
--		FigureInRange {X = 91, Y = 100, NpcId = 0, Range = 10},
--	},
--	Actions = 
--	{
--		SetGlobalFlagTrue {Name = "g_P211CSInitEndePhoenix"},
--	},
--}


CreateCutScene
{
	Name = "P211_CutsceneEndePhoenix", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P211CSInitEndePhoenix", UpdateInterval = 10},
		FigureAlive{NpcId = 10106},
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetGlobalFlagTrue{Name = "g_P211SchattenkriegerCSEndeUmspawnInit"},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetNoFightFlagTrue{NpcId = Avatar},
		SetNoFightFlagTrue{NpcId = 10106},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
	
		[19] =
		{
			TeleportAvatar{X = 102, Y = 98},
		},
		
		[20] =
		{
			ExecuteCameraScript{Script = n32534_CameraEndePhoenixI},	
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[25] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		
		[40] =
		{
			--4sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
			CutSceneSay {Tag = "csa244avatar_001", NpcId = 0, String = "Er hat einen neuen Seelenschmied geschaffen!"},
			
		},
		
		[70] =
		{
			--7sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa244shadowwar_002", NpcId = 10106, String = "Und wenn er Hunderte von ihnen schickt, er kann meiner Klinge nicht entkommen!"},
			Goto {X = 98, Y = 92, NpcId = 10106, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},

		[75] =
		{
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[80] =
		{
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[85] =
		{
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[90] =
		{
			Goto {X = 98, Y = 95, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[95] =
		{
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		
		[110] =
		{
			--5sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32534_CameraEndePhoenixIII},
			LookAtDirection {Direction = 3, NpcId = 10106},
			CutSceneSay {Tag = "csa244avatar_003", NpcId = 0, String = "Wie wollt Ihr ihn verletzen? Das Allfeuer schützt ihn!"},
		},
		
		[115] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[120] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[125] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[130] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[135] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[140] =
		{
			--5sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
			CutSceneSay {Tag = "csa244shadowwar_004", NpcId = 10106, String = "Ja! Doch diese Klinge ist mächtig!"},
			
		},
		
		[170] =
		{
			--12sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
			CutSceneSay {Tag = "csa244shadowwar_005", NpcId = 10106, String = "Und selbst wenn ich versage, ich werde dem Zirkel mit dem letzten Atem meinen Hass ins Gesicht schleudern! So oder so, es hat endlich ein Ende!"},
			
		},
		
		[220] =
		{
			--4sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
			CutSceneSay {Tag = "csa244avatar_006", NpcId = 0, String = "Kennt Ihr den Phönixstein?"},
			ExecuteCameraScript{Script = n32534_CameraEndePhoenixII},	
		},

		[230] =
		{
			--5sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa244shadowwar_007", NpcId = 10106, String = "Ihr habt ihn in der Schlacht um Fiara errungen, nicht wahr?"},
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
			Goto {X = 98, Y = 94, NpcId = 10106, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},

		[270] =
		{
			--10 sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 10106},
			LookAtFigure {Target = 10106, NpcId = 0},
			CutSceneSay {Tag = "csa244avatar_008", NpcId = 0, String = "Ja! Der Phönix kann den Zirkel vernichten, denn er besteht aus reinem Allfeuer! Aber nichts kann diesen Stein brechen!"},
			Goto {X = 93, Y = 100, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},
		
		[277] =
		{
			Goto {X = 94, Y = 98, NpcId = 10106, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},
		[290] =
		{
			LookAtFigure {Target = 0, NpcId = 10106},
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[295] =
		{
			LookAtFigure {Target = 0, NpcId = 10106},
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[300] =
		{
			LookAtFigure {Target = 0, NpcId = 10106},
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[305] =
		{
			LookAtFigure {Target = 0, NpcId = 10106},
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[310] =
		{
			LookAtFigure {Target = 0, NpcId = 10106},
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[315] =
		{
			LookAtFigure {Target = 0, NpcId = 10106},
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[320] =
		{
			LookAtFigure {Target = 0, NpcId = 10106},
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		
		[325] =
		{
			--10 sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa244avatar_009", NpcId = 0, String = "Bis auf eine Klinge nicht von dieser Welt ... Und nach der Prophezeiung der Dryade führt sie ein Runenkrieger."},
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		
		[360] =
		{
			--10 sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32534_CameraEndePhoenixIV},	
			Goto {X = 94, Y = 99, NpcId = 10106, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			CutSceneSay {Tag = "csa244shadowwar_010", NpcId = 10106, String = "Ich trage die Schattenklinge, geschmiedet von Kreaturen jenseits des Sternengrunds! Dieser Runenkrieger bin ich!"},
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},

		[365] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[370] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[375] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		[380] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		
		[390] =
		{
			--11 sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32534_CameraEndePhoenixV},	
			CutSceneSay {Tag = "csa244avatar_011", NpcId = 0, String = "Also hatten wir beide von Beginn an nur einen Teil der Waffe, die es braucht, um den Zirkel zu vernichten! Aber jetzt sind wir bereit!"},
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
		},
		
		[440] =
		{
			--12 sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32534_CameraEndePhoenixVI},	
			LookAtFigure {Target = 0, NpcId = 10106}, 
			LookAtFigure {Target = 10106, NpcId = 0},
			CutSceneSay {Tag = "csa244shadowwar_012", NpcId = 10106, String = "Nun, zuerst müssen wir Hokan und den Zirkel finden ... kommt! Hinein in den Schlund des Dschungels! Der Knochentempel kann nicht weit sein!"},
		},

		[475] =
		{
			Goto {X = 86, Y = 100, NpcId = 10106, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},

		[495] =
		{
			Goto {X = 87, Y = 101, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},
		
		[530] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetGlobalFlagTrue {Name = "g_P211CSEndePhoenixGelaufen"},
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			SetGlobalFlagFalse {Name = "g_P211CSInitEndePhoenix"},
			SetNoFightFlagFalse{NpcId = Avatar},
			SetNoFightFlagFalse{NpcId = 10106},
		},
	},
}



