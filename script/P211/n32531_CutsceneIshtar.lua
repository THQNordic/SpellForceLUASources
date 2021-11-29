-----------------------------------------------------------------------
--
--	P211_CutsceneIshtar
--
-----------------------------------------------------------------------


n32531_CameraIshtarI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P211\\n32531_CameraIshtarI.lua")
   	Camera:ScriptStart()
]]


n32531_CameraIshtarII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,8,1,"script\\P211\\n32531_CameraIshtarII.lua")
   	Camera:ScriptStart()
]]


n32531_CameraIshtarIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\P211\\n32531_CameraIshtarIII.lua")
   	Camera:ScriptStart()
]]


n32531_CameraIshtarIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,18,1,"script\\P211\\n32531_CameraIshtarIV.lua")
   	Camera:ScriptStart()
]]


n32531_CameraIshtarV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\P211\\n32531_CameraIshtarV.lua")
   	Camera:ScriptStart()
]]


n32531_CameraIshtarVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,22,1,"script\\P211\\n32531_CameraIshtarVI.lua")
   	Camera:ScriptStart()
]]


n32531_CameraIshtarVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P211\\n32531_CameraIshtarVII.lua")
   	Camera:ScriptStart()
]]

n32531_CameraIshtarVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P211\\n32531_CameraIshtarVIII.lua")
   	Camera:ScriptStart()
]]

n32531_CameraIshtarIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,28,1,"script\\P211\\n32531_CameraIshtarIX.lua")
   	Camera:ScriptStart()
]]

n32531_CameraIshtarX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,18,1,"script\\P211\\n32531_CameraIshtarX.lua")
   	Camera:ScriptStart()
]]

n32531_CameraIshtarXI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,18,1,"script\\P211\\n32531_CameraIshtarXI.lua")
   	Camera:ScriptStart()
]]

--OnOneTimeEvent
--{
--	Conditions = 
--	{
--	},
--	Actions = 
--	{
--		SetGlobalFlagTrue {Name = "g_P211_PortalKathaiAuf"},
--		SetGlobalTimeStamp{Name = "wait"},
--		SetGlobalTimeStamp {Name = "gt_P211_KathaiTimer"} ,
--		SetEffect{NpcId = Avatar, Effect = "Spawnboss", Length = 10000},
--		SetGlobalFlagTrue {Name = "g_P211_IshtarFaelltEin"}, --Ishtar und Truppen spawnen
--	}
--}
--OnOneTimeEvent
--{
--	Conditions = 
--	{
--		IsGlobalTimeElapsed{Name = "wait", Seconds = 3},
--	},
--	Actions = 
--	{
--		SetGlobalFlagTrue {Name = "g_nP211_InitCSIshtar"},
--		SetGlobalFlagTrue {Name = "g_P211_KathaiFallenEin"},
--	}
--}


CreateCutScene
{
	Name = "P211_CutsceneIshtar", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_nP211_InitCSIshtar", UpdateInterval = 10},
	},
	BeginActions =
	{
		SetGlobalFlagTrue {Name = "g_P211CSIshtarUmspawnInit"}, --umspawnen Jenquai und Alyah
		SetGlobalFlagTrue {Name = "g_P211_IshtarFaelltEin"}, --Ishtar und Truppen spawnen
		TeleportAvatar {X = 260, Y = 180},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetNoFightFlagTrue{NpcId = Avatar},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			--die ersten 3 sekunden ohne kamera
			--SetNoFightFlagTrue {NpcId = 0},
			--SetNoFightFlagTrue {NpcId = 10153},
			--SetNoFightFlagTrue {NpcId = 10100},
			--SetNoFightFlagTrue {NpcId = 9811}
			
		},
		
		
		[30] =
		{
			ExecuteCameraScript{Script = n32531_CameraIshtarI},	
		SetNoFightFlagTrue{NpcId = 9811},
			LookAtFigure {Target = 10153, NpcId = 9811},
			LookAtFigure {Target = 10153, NpcId = 0},
			LookAtFigure {Target = 10153, NpcId = 10100},
		},
		
		[35] =
		{
			--6sek
			Goto {X = 263, Y = 195, NpcId = 9811, Range = 0, WalkMode = Run, GotoMode = GotoContinuous}, --jenquai
			CutSceneSay {Tag = "csa241jenquai_001", NpcId = 9811, String = "Achtung! Truppen des Kaisers! Sie fallen uns in den Rücken!"},
		},
		
		
		[80] =
		{
			--5sek
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarII},	
			LookAtFigure {Target = 0, NpcId = 9811},
			LookAtFigure {Target = 9811, NpcId = 10153},
		SetNoFightFlagTrue{NpcId = 10100},
			Goto {X = 262, Y = 192, NpcId = 10100, Range = 0, WalkMode = Run, GotoMode = GotoContinuous}, --Alyah hinterher
			Goto {X = 266, Y = 188, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoContinuous}, --Avatar Ishtar entgegen
			CutSceneSay {Tag = "csa241avatar_002", NpcId = 0, String = "Krieger! Zurück! Bildet einen Schildwall!"},
		},
	
		
		[90] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarIII},	--Close Ishtar
		},
		
		[100] =
		{
			--6,5
			Goto {X = 269, Y = 188, NpcId = 10153, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous}, --Ishtar ein paar Schritte vor
			LookAtFigure {Target = 10153, NpcId = 0},
			LookAtFigure {Target = 10153, NpcId = 10100},
			LookAtFigure {Target = 10153, NpcId = 9811},
			CutSceneSay {Tag = "csa241ishtar_003", NpcId = 10153, String = "Ich bin nicht Euer Feind, Runenkrieger, das solltet Ihr inzwischen wissen!"},
		},

		[105] =
		{
			LookAtFigure {Target = 0, NpcId = 10153},
		},
		[110] =
		{
			LookAtFigure {Target = 0, NpcId = 10153},
		},
		[115] =
		{
			LookAtFigure {Target = 0, NpcId = 10153},
		},
		[120] =
		{
			LookAtFigure {Target = 0, NpcId = 10153},
		},
		[125] =
		{
			LookAtFigure {Target = 0, NpcId = 10153},
		},
		
		[130] =
		{
			--5,5
			WaitForEndOfSpeech,
			Goto {X = 269, Y = 190, NpcId = 9811, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous},
			CutSceneSay {Tag = "csa241ishtar_004", NpcId = 10153, String = "Ich bin hier, um meine Kaiserin nach Empyria zu geleiten!"},
			LookAtFigure {Target = 0, NpcId = 10153},
		},
		
		
		[160] =
		{
			--5,5
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarIV},	
			Goto {X = 267, Y = 190, NpcId = 10100, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous}, --Alyah zu Ishtar
			LookAtFigure {Target = 10100, NpcId = 9811},
			LookAtFigure {Target = 10153, NpcId = 10100},
			LookAtFigure {Target = 10100, NpcId = 0},
		},

		[170] =
		{
			--5,5
			CutSceneSay {Tag = "csa241alyah_005", NpcId = 10100, String = "Mich? Oh nein! ... Nein!"},
		},

		[175] =
		{
			LookAtFigure {Target = 10153, NpcId = 9811},
		},
		[180] =
		{
			LookAtFigure {Target = 10153, NpcId = 9811},
		},
		[185] =
		{
			LookAtFigure {Target = 10153, NpcId = 9811},
		},

		[190] =
		{
			--5,5
			WaitForEndOfSpeech,
			LookAtFigure {Target = 10100, NpcId = 9811},
		},

		
		[200] =
		{
			--6
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa241alyah_006", NpcId = 10100, String = "Ich bin eine Diebin! Ich kann doch kein Reich regieren!"},
			LookAtFigure {Target = 10100, NpcId = 9811},
			LookAtFigure {Target = 10100, NpcId = 0},
			LookAtFigure {Target = 10153, NpcId = 10100},
			LookAtFigure {Target = 10100, NpcId = 10153},
		},
		
		[250] =
		{
			--8,5
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarV},	--Close Ishtar
			Goto {X = 268, Y = 189, NpcId = 10153, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous},
			CutSceneSay {Tag = "csa241ishtar_007", NpcId = 10153, String = "Empyria braucht seine rechtmäßige Kaiserin! Ihr könnt vor Eurer Herkunft nicht fliehen, Alyah."},
			LookAtFigure {Target = 10153, NpcId = 10100},
			LookAtFigure {Target = 10100, NpcId = 10153},
		},
		
		[300] =
		{
			--7,5
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarIV},	--Close Alyah
			LookAtFigure {Target = 10100, NpcId = 10153},
			LookAtFigure {Target = 100153, NpcId = 10100},
			LookAtFigure {Target = 10153, NpcId = 10100},
			LookAtFigure {Target = 10100, NpcId = 0},
			Goto {X = 270, Y = 186, NpcId = 10100, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous},
			CutSceneSay {Tag = "csa241alyah_008", NpcId = 10100, String = "Hm, Urias hat gesagt, ich könne nicht immer nur weglaufen ..."},
		},

		[330] =
		{
			LookAtFigure {Target = 10100, NpcId = 10153},
			LookAtFigure {Target = 10100, NpcId = 9811},
			LookAtFigure {Target = 10100, NpcId = 0},
		},
		[335] =
		{
			LookAtFigure {Target = 10100, NpcId = 10153},
			LookAtFigure {Target = 10100, NpcId = 9811},
			LookAtFigure {Target = 10100, NpcId = 0},
		},
		[340] =
		{
			LookAtFigure {Target = 10100, NpcId = 10153},
			LookAtFigure {Target = 10100, NpcId = 9811},
			LookAtFigure {Target = 10100, NpcId = 0},
		},
		[345] =
		{
			LookAtFigure {Target = 10100, NpcId = 10153},
			LookAtFigure {Target = 10100, NpcId = 9811},
			LookAtFigure {Target = 10100, NpcId = 0},
		},
		
		[350] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {Target = 10100, NpcId = 10153},
		},
		
		[360] =
		{
			--4
			CutSceneSay {Tag = "csa241alyah_009", NpcId = 10100, String = "Dieser ... Dummkopf ..."},
		},
		
		[370] =
		{
			--7,5
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarVI},	--Avatar und Alyah
			LookAtFigure {Target = 10100, NpcId = 0},
			Goto {X = 269, Y = 186, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous}, --Avatar auf Alyah zu
		},

		[375] =
		{
			CutSceneSay {Tag = "csa241avatar_010", NpcId = 0, String = "Vielleicht solltet Ihr Euch seinetwillen dieser Aufgabe stellen ... Majestät."},
			LookAtFigure {Target = 10100, NpcId = 0},
		},
		[380] =
		{
			LookAtFigure {Target = 10100, NpcId = 0},
		},
		[385] =
		{
			LookAtFigure {Target = 10100, NpcId = 0},
		},
		[390] =
		{
			LookAtFigure {Target = 10100, NpcId = 0},
		},

		[400] =
		{
			--5
			WaitForEndOfSpeech,
		},
		
		[415] =
		{
			LookAtFigure {Target = 10100, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10100}, --dreht sich um
			CutSceneSay {Tag = "csa241alyah_011", NpcId = 10100, String = "Ja, das hätte er wohl so gewollt ..."},
		},
	
		[430] =
		{
			--7
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarVII}, --Close auf jenquai
			LookAtFigure {Target = 9811, NpcId = 10100},
			LookAtFigure {Target = 9811, NpcId = 0},
			Goto {X = 270, Y = 187, NpcId = 9811, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous}, 
			CutSceneSay {Tag = "csa241jenquai_012", NpcId = 9811, String = "Hathai! So hat also doch jemand Rabenhaars Herz gewonnen!"},
			LookAtFigure {Target = 10100, NpcId = 9811},
		},

		[435] =
		{
			LookAtFigure {Target = 10100, NpcId = 9811},
		},
		[440] =
		{
			LookAtFigure {Target = 10100, NpcId = 9811},
		},
		[445] =
		{
			LookAtFigure {Target = 10100, NpcId = 9811},
		},
		
		[450] =
		{
			--9
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarVI}, --Alyah und Avatar
			LookAtFigure {Target = 10100, NpcId = 9811},
			LookAtFigure {Target = 0, NpcId = 10100},
			LookAtFigure {Target = 10100, NpcId = 0},
			CutSceneSay {Tag = "csa241avatar_013", NpcId = 0, String = "Geht, Alyah! Seid den Menschen eine gute Kaiserin! Wohin ich gehe, wartet nur Tod und Vergessen."},
		},
		
		[480] =
		{
			--7
			WaitForEndOfSpeech,
			LookAtFigure {Target = 0, NpcId = 10100},
			LookAtFigure {Target = 10100, NpcId = 0},
			CutSceneSay {Tag = "csa241alyah_014", NpcId = 10100, String = "Lebt wohl, Freund ... Empyria wird sich an Euch erinnern, das schwöre ich!"},
			LookAtFigure {Target = 10100, NpcId = 9811},
		},
		
		[510] =
		{
			--4
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarVIII}, 
			LookAtFigure {Target = 10100, NpcId = 10153},
			LookAtFigure {Target = 10100, NpcId = 9811},
			LookAtFigure {Target = 10100, NpcId = 0},
			LookAtFigure {Target = 10153, NpcId = 10100},
			Goto {X = 272, Y = 190, NpcId = 10100, Range = 0, WalkMode = Run, GotoMode = GotoContinuous},
		},

		[520] =
		{
			LookAtFigure {Target = 10153, NpcId = 10100},
		},
		[525] =
		{
			LookAtFigure {Target = 10153, NpcId = 10100},
		},
		[530] =
		{
			LookAtFigure {Target = 10153, NpcId = 10100},
		},
		[535] =
		{
			LookAtFigure {Target = 10153, NpcId = 10100},
		},
		
		[540] =
		{
			--
			WaitForEndOfSpeech,
			LookAtFigure {Target = 10153, NpcId = 10100},
			LookAtFigure {Target = 10100, NpcId = 10153},
			LookAtFigure {Target = 10100, NpcId = 9811},
			LookAtFigure {Target = 10100, NpcId = 0},
			CutSceneSay {Tag = "csa241alyah_015", NpcId = 10100, String = "Hauptmann! Wir reisen nach Empyria!"},
		
			Follow {Target = 10100, NpcId = 10153}
		},
		
		
		[570] =
		{
			--4
			WaitForEndOfSpeech,
			Goto {X = 289, Y = 195, NpcId = 10100, Range = 0, WalkMode = Run, GotoMode = GotoContinuous}, --
			LookAtFigure {Target = 10153, NpcId = 10100},
			LookAtFigure {Target = 10100, NpcId = 9811},
			LookAtFigure {Target = 10100, NpcId = 0},
			CutSceneSay {Tag = "csa241ishtar_016", NpcId = 10153, String = "Wie Ihr wünscht, Kaiserin!"},
			
		},
		
		[585] =
		{
			--
			Goto {X = 269, Y = 455, NpcId = 10100, Range = 0, WalkMode = Run, GotoMode = GotoContinuous}, 
			SetGlobalFlagTrue {Name = "g_P211TruppeRuecktAb"},
			LookAtFigure {Target = 10100, NpcId = 0},
			LookAtFigure {Target = 10100, NpcId = 9811},
		},
		
		
		[595] =
		{
			Goto {X = 269, Y = 187, NpcId = 9811, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous}, 
		},

		[600] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarIX},--Avatar und jenquai
			LookAtFigure {Target = 10100, NpcId = 0},
			LookAtFigure {Target = 10100, NpcId = 9811},
		},
		
		[605] =
		{
			LookAtFigure {Target = 10100, NpcId = 9811},
		},
		[610] =
		{
			LookAtFigure {Target = 10100, NpcId = 9811},
		},

		[630] =
		{
			--5
			CutSceneSay {Tag = "csa241jenquai_017", NpcId = 9811, String = "Rabenhaar hat ihr Schicksal gefunden!"},
		},
		
		[660] =
		{
			--6
			WaitForEndOfSpeech,
			LookAtFigure {Target = 9811, NpcId = 0},	
			LookAtFigure {Target = 0, NpcId = 9811},
			CutSceneSay {Tag = "csa241jenquai_018", NpcId = 9811, String = "Nun ist es an Euch, das Eure zu vollenden, Runenkrieger!"},
		},
		
		[690] =
		{
			--7
			WaitForEndOfSpeech,
			LookAtFigure {Target = 9811, NpcId = 0},	
			LookAtFigure {Target = 0, NpcId = 9811},
			CutSceneSay {Tag = "csa241jenquai_019", NpcId = 9811, String = "Mein Weg ist hier zu Ende. Ich werde mit meinen Jägern die Feste sichern."},
			SetGlobalFlagTrue {Name = "g_P211_CSIshtarTorAuf"},
		},
		
		[720] =
		{
			--6,5
			WaitForEndOfSpeech,
			LookAtFigure {Target = 0, NpcId = 9811},
			LookAtFigure {Target = 9811, NpcId = 0},	
			ExecuteCameraScript{Script = n32531_CameraIshtarX}, --Fahrt über Dschungel, Treppe runter
			CutSceneSay {Tag = "csa241jenquai_020", NpcId = 9811, String = "Ihr aber müsst nun ins schwarze Herz des Dschungels hinein!"},
		},
		
		[750] =
		{
			--4
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa241jenquai_021", NpcId = 9811, String = "Wo der maskierte Tod auf Euch wartet!"},
		},
		
		[780] =
		{
			--7
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = n32531_CameraIshtarXI},
			Goto {X = 263, Y = 183, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoContinuous}, --
			CutSceneSay {Tag = "csa241avatar_022", NpcId = 0, String = "Ja, Zeit, sich dem Zirkel zu stellen! Ich greife an!"},
			LookAtFigure {Target = 0, NpcId = 9811},
		},
		
		[785] =
		{
			LookAtFigure {Target = 0, NpcId = 9811},
		},
		[790] =
		{
			LookAtFigure {Target = 0, NpcId = 9811},
		},
		[795] =
		{
			LookAtFigure {Target = 0, NpcId = 9811},
		},
		[800] =
		{
			LookAtFigure {Target = 0, NpcId = 9811},
		},
		
		[810] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtDirection {Direction = 3, NpcId = 0},
			SetGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen"},
			--SetNoFightFlagFalse {NpcId = 0},
			--SetNoFightFlagFalse {NpcId = 10153},
			--SetNoFightFlagFalse {NpcId = 10100},
			--SetNoFightFlagFalse {NpcId = 9811},
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			QuestBegin {QuestId = 1097, SubQuestActivate = FALSE},
			SetNoFightFlagFalse{NpcId = Avatar},
			SetNoFightFlagFalse{NpcId = 10100},
			SetNoFightFlagFalse{NpcId = 9811},
		},		
	},
}



