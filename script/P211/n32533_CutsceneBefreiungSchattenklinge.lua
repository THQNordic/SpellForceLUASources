-----------------------------------------------------------------------
--
--	P211_CutsceneBefreiungSchattenklinge
--
-----------------------------------------------------------------------


n32533_CameraBefreiungSchattenklingeI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\P211\\n32533_CameraBefreiungSchattenklingeI.lua")
   	Camera:ScriptStart()
]]


n32533_CameraBefreiungSchattenklingeII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,35,1,"script\\P211\\n32533_CameraBefreiungSchattenklingeII.lua")
   	Camera:ScriptStart()
]]

n32533_CameraBefreiungSchattenklingeIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P211\\n32533_CameraBefreiungSchattenklingeIII.lua")
   	Camera:ScriptStart()
]]

n32533_CameraBefreiungSchattenklingeIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\P211\\n32533_CameraBefreiungSchattenklingeIV.lua")
   	Camera:ScriptStart()
]]

n32533_CameraBefreiungSchattenklingeV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P211\\n32533_CameraBefreiungSchattenklingeV.lua")
   	Camera:ScriptStart()
]]

n32533_CameraBefreiungSchattenklingeVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P211\\n32533_CameraBefreiungSchattenklingeVI.lua")
   	Camera:ScriptStart()
]]

--OnOneTimeEvent
--{
--	Conditions =
--	{
--		FigureInRange{NpcId = Avatar, X = 192, Y = 142, Range = 3},
--	},
--	Actions =
--	{
--		SetGlobalFlagTrue {Name = "g_P211GefaengnisTorOeffneDich" },
--	}
--}

CreateCutScene
{
	Name = "P211_CutsceneBefreiungSchattenklinge", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		--bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungInit", UpdateInterval = 10},
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetNoFightFlagTrue{NpcId = Avatar},
		SetNoFightFlagTrue{NpcId = 10106},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32533_CameraBefreiungSchattenklingeI},	
			Goto {X = 187, Y = 136, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0}, --zum gefangenen
		},

		[23] =
		{
			Goto {X = 187, Y = 136, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0}, --zum gefangenen
		},
		[30] =
		{
			LookAtDirection {Direction = East, NpcId = 10106}, --Schattenkrieger auf Avatar
		},
		
		[40] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
			CutSceneSay {Tag = "cs243shadowwar_001", NpcId = 10106, String = "Nehmt den Dank eines Verdammten, Kamerad."},
		},

		[45] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
		
		[60] =
		{
			--9sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			StopEffect {TargetType = Figure, NpcId = 10106}, --ketten ab
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
			CutSceneSay {Tag = "cs243avatar_002", NpcId = 0, String = "Ihr seid ein mächtiger Runenkrieger ... und Ihr seid frei! Frei wie ich! Wer seid Ihr?"},
			
		},
		
		[80] =
		{
			--2,5sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32533_CameraBefreiungSchattenklingeVI},
			Goto {X = 190, Y = 134, NpcId = 10106, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},--raus aus gefängniszelle
			CutSceneSay {Tag = "cs243shadowwar_003", NpcId = 10106, String = "Frei? Ha!"},
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},

		[85] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
		[90] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
		[95] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
		[100] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
		[105] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
				
		[110] =
		{
			--15sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			Goto {X = 188, Y = 135, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			LookAtFigure {Target = 10106, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10106},
			CutSceneSay {Tag = "cs243shadowwar_004", NpcId = 10106, String = "Ja, er kann mir meine Rune nicht mehr nehmen ... aber seht Ihr diese Klinge hier? Sie frisst meine Seele! Tag für Tag wird ihr eisiger Griff um meinen Geist stärker!"},
		},

		[115] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
		[120] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
		[125] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
		[130] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
		[135] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --Schattenkrieger auf Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --Schattenkrieger auf Avatar
		},
		
		[140] =
		{
			--6sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32533_CameraBefreiungSchattenklingeII},
			Goto {X = 191, Y = 145, NpcId = 10106, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},--raus aus gefängniszelle
			LookAtFigure {Target = 10106, NpcId = 0},
		},

		[150] =
		{
			CutSceneSay {Tag = "cs243shadowwar_005", NpcId = 10106, String = "Und Hokan Ashir ist der Einzige, der mir Heilung geben kann!"},
		},
		[160] =
		{
			Goto {X = 189, Y = 144, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0}, --hinterher
		},

		
		[170] =
		{
			--11sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtDirection {Direction = 6, NpcId = 10106},
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
			CutSceneSay {Tag = "cs243shadowwar_006", NpcId = 10106, String = "Aber er hat nur mit mir gespielt! Und mich schließlich hier angekettet, um zu sehen, wie das Schwert mich langsam zu einem Schatten werden lässt!"},
			
		},

		[200] =
		{
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
		},
		[205] =
		{
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
		},
		[210] =
		{
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
		},
		[215] =
		{
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
		},
		[220] =
		{
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
		},
		[225] =
		{
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
		},
		[230] =
		{
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
		},
		[235] =
		{
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
		},
		[240] =
		{
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
		},
		
		[245] =
		{
			--8sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			LookAtFigure {Target = 0, NpcId = 10106},
			ExecuteCameraScript{Script = n32533_CameraBefreiungSchattenklingeIV},
			CutSceneSay {Tag = "cs243shadowwar_007", NpcId = 10106, String = "Bitte! Nehmt die Hilfe eines Verfluchten an! Ich habe nicht mehr viel Zeit, bis meine Seele gefriert!"},
			
		},

		[250] =
		{
			--9sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 10106}, --dreht sich um zu Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
			CutSceneSay {Tag = "cs243shadowwar_008", NpcId = 10106, String = "Lasst mich meine letzten Atemzüge nutzen, um dem Zirkel heimzuzahlen, was er mir angetan hat! Nehmt mich mit!"},
			
		},
		
		
		[270] =
		{
			--5sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32533_CameraBefreiungSchattenklingeV},
			CutSceneSay {Tag = "cs243avatar_009", NpcId = 0, String = "Ja, es wird Zeit, die Rechnung zu begleichen. Kommt!"},
			LookAtFigure {Target = 0, NpcId = 10106}, --dreht sich um zu Avatar
			LookAtFigure {Target = 10106, NpcId = 0}, --dreht sich um zu Avatar
		},


		[290] =
		{
			Goto {X = 198, Y = 150, NpcId = 0, Range = 1, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			LookAtFigure {Target = 0, NpcId = 10106}, --dreht sich um zu Avatar
		},
		[295] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --dreht sich um zu Avatar
		},
		[300] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --dreht sich um zu Avatar
		},
		[305] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --dreht sich um zu Avatar
		},
		[310] =
		{
			LookAtFigure {Target = 0, NpcId = 10106}, --dreht sich um zu Avatar
			Goto {X = 197, Y = 150, NpcId = 10106, Range = 1, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},
		
		[380] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 10106}, --dreht sich um zu Avatar
			SetGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen"},
			SetRewardFlagTrue {Name = "SchattenklingeBefreit"},
			SetGlobalFlagTrue {Name = "g_P211HoehlenSpawnAusFuerImmer"},
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			SetNoFightFlagFalse{NpcId = Avatar},
			SetNoFightFlagFalse{NpcId = 10106},
		},
		
	},
}



