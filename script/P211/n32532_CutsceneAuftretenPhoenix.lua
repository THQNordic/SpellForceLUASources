-----------------------------------------------------------------------
--
--	P211_CutsceneAuftreten Phoenix
--
-----------------------------------------------------------------------


n32532_CameraAuftretenPhoenixI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P211\\n32532_CameraAuftretenPhoenixI.lua")
   	Camera:ScriptStart()
]]


n32532_CameraAuftretenPhoenixII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P211\\n32532_CameraAuftretenPhoenixII.lua")
   	Camera:ScriptStart()
]]

n32532_CameraAuftretenPhoenixIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P211\\n32532_CameraAuftretenPhoenixIII.lua")
   	Camera:ScriptStart()
]]

n32532_CameraAuftretenPhoenixIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,18,1,"script\\P211\\n32532_CameraAuftretenPhoenixIV.lua")
   	Camera:ScriptStart()
]]

n32532_CameraAuftretenPhoenixV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P211\\n32532_CameraAuftretenPhoenixV.lua")
   	Camera:ScriptStart()
]]

n32532_CameraAuftretenPhoenixVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\P211\\n32532_CameraAuftretenPhoenixVI.lua")
   	Camera:ScriptStart()
]]

n32532_CameraAuftretenPhoenixVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P211\\n32532_CameraAuftretenPhoenixVII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P211_CutsceneAuftreten Phoenix", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler", UpdateInterval = 30},
		IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen", UpdateInterval = 30},
		IsGlobalFlagTrue {Name = "g_P211EbeneErrreicht", UpdateInterval = 30}, --Tor offen
		
		ODER9{
			PlayerUnitInRange {X = 235, Y = 153, Range = 5, FigureType = FigureAll, UpdateInterval = 24},
			PlayerUnitInRange {X = 232, Y = 155, Range = 5, FigureType = FigureAll, UpdateInterval = 22},
			PlayerUnitInRange {X = 237, Y = 150, Range = 5, FigureType = FigureAll, UpdateInterval = 22},
			},
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
	
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetGlobalFlagTrue {Name = "g_P211InitSpawnPhoenixkrieger"},
		SetNoFightFlagTrue{NpcId = Avatar},
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			TeleportAvatar{X = 228, Y = 146},
			ExecuteCameraScript{Script = n32532_CameraAuftretenPhoenixI},	
			Goto {X = 224, Y = 138, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},
		
	
		[30] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			--3sek
			CutSceneSay {Tag = "csa242phoenixguard_001", NpcId = 10286, String = "Halt! Runenkrieger, wartet!"},
			Goto {X = 227, Y = 138, NpcId = 10286, Range = 0, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0}, --Phoenixkrieger kommt auf Avatar zu
		},
		
		[45] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, --Avatar fährt herum
		},
		[50] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, --Avatar fährt herum
		},
		[55] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, --Avatar fährt herum
		},
		[60] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, --Avatar fährt herum
		},
		[65] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, --Avatar fährt herum
		},
		[70] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
			CutSceneSay {Tag = "csa242avatar_002", NpcId = 0, String = "Wer seid Ihr?"},
		},

		[75] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
		},

		[80] =
		{
			--8sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32532_CameraAuftretenPhoenixVI},	
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
			CutSceneSay {Tag = "csa242phoenixguard_003", NpcId = 10286, String = "Ein Freund! Jenquai sagte mir, dass ich Euch hier finden werde, Gefährte der Rune."},
			
		},
		
		[90] =
		{
			--10sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
			CutSceneSay {Tag = "csa242avatar_004", NpcId = 0, String = "Dann seid Ihr der Runenkrieger, der den Phönixstein bewacht? Kommt Ihr endlich, um das aufzuhalten, was Ihr begonnen habt?"},
		},
		
		[100] =
		{
			--8sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32532_CameraAuftretenPhoenixII},	--Kamera fährt an Phoenixkrieger heran
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
			CutSceneSay {Tag = "csa242phoenixguard_005", NpcId = 10286, String = "Ich habe getan, was ich tun musste! Und ich bin nicht gekommen, um mich von Euch verspotten zu lassen!"},
		},
		
		[125] =
		{
			Goto {X = 225, Y = 137, NpcId = 10286, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0}, --Phönix näher an Avatar
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
		},
		
		[130] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
		},
		[135] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
		},
		[140] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
		},
		[145] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
		},
		
		[150] =
		{
			ExecuteCameraScript{Script = n32532_CameraAuftretenPhoenixIII},	--Kamera noch näher
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
		},
		
		[155] =
		{
			--7
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtDirection {Direction = 0, NpcId = 10286},
			CutSceneSay {Tag = "csa242phoenixguard_006", NpcId = 10286, String = "Ich will Rache an denjenigen, die mein Lebensblut an diese Rune geschmiedet ..."},
		},
		
		[190] =
		{
			--7
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa242phoenixguard_007", NpcId = 10286, String = "... und mich zu Jahrhunderten des Krieges und des Leids verdammt haben!"},
		},
		
		[230] =
		{
			--6,5
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32532_CameraAuftretenPhoenixVII},	
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
			CutSceneSay {Tag = "csa242phoenixguard_008", NpcId = 10286, String = "Ich will den Zirkel für seine Taten richten! Endgültig!"},
		},
		
		
		[270] =
		{
			--10
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32532_CameraAuftretenPhoenixIV},	
			CutSceneSay {Tag = "csa242avatar_009", NpcId = 0, String = "Dann lasst uns gemeinsam die Scharfrichter sein, Wächter des Phönix! Kommt, sie warten bereits auf uns!"},
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286}, 
		},

		[320] =
		{
			Goto {X = 220, Y = 125, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0}, --Avatar ein stück in die Ebene
		},
		[330] =
		{
			Goto {X = 219, Y = 125, NpcId = 10286, Range = 0, WalkMode = Run, GotoMode = GotoNormal, XRand = 0, YRand = 0}, --Avatar ein stück in die Ebene
		},
		
		[370] =
		{
			WaitForEndOfSpeech,	
			SetGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen"},
			QuestBegin{QuestId = 971, SubQuestActivate = FALSE}, -- Finde einen Weg in den Schlund
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			SetNoFightFlagFalse{NpcId = Avatar},
			SetNoFightFlagFalse{NpcId = 10286},
		},
	},
}



