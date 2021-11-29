-----------------------------------------------------------------------
--
--	P211_CutsceneEndeSchattenklinge
--
-----------------------------------------------------------------------


n32535_CameraEndeSchattenklingeI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,28,1,"script\\P211\\n32535_CameraEndeSchattenklingeI.lua")
   	Camera:ScriptStart()
]]


n32535_CameraEndeSchattenklingeII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,35,1,"script\\P211\\n32535_CameraEndeSchattenklingeII.lua")
   	Camera:ScriptStart()
]]

n32535_CameraEndeSchattenklingeIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,35,1,"script\\P211\\n32535_CameraEndeSchattenklingeIII.lua")
   	Camera:ScriptStart()
]]

n32535_CameraEndeSchattenklingeIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P211\\n32535_CameraEndeSchattenklingeIV.lua")
   	Camera:ScriptStart()
]]

n32535_CameraEndeSchattenklingeV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,18,1,"script\\P211\\n32535_CameraEndeSchattenklingeV.lua")
   	Camera:ScriptStart()
]]

n32535_CameraEndeSchattenklingeVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P211\\n32535_CameraEndeSchattenklingeVI.lua")
   	Camera:ScriptStart()
]]

n32535_CameraEndeSchattenklingeVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P211\\n32535_CameraEndeSchattenklingeVII.lua")
   	Camera:ScriptStart()
]]

--OnOneTimeEvent
--{
--	NotInDialog = FALSE, UpdateInterval = 20,
--	Conditions = 
--	{
--		FigureInRange {X = 91, Y = 100, NpcId = 0, Range = 10},
--	},
--	Actions = 
--	{
--		SetGlobalFlagTrue {Name = "g_P211InitSpawnPhoenixkrieger"},
--		SetGlobalFlagTrue {Name = "g_P211CSInitEndeShadowblade"},
--	},
--}

CreateCutScene
{
	Name = "P211_CutsceneEndeSchattenklinge", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_P211CSInitEndeShadowblade", UpdateInterval = 10},
		FigureAlive{NpcId = 10286},
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetGlobalFlagTrue{Name = "g_P211PhoenixCSEndeUmspawnInit"},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetNoFightFlagTrue{NpcId = Avatar},
		SetNoFightFlagTrue{NpcId = 10286},
	},
	
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[20] =
		{
			TeleportAvatar{X = 102, Y = 98},
			ExecuteCameraScript{Script = n32535_CameraEndeSchattenklingeI},	
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286},
		},
		
		[21] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286},
		},
		
		[30] =
		{
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286},
			CutSceneSay {Tag = "csa245phoenixguard_001", NpcId = 10286, String = "Er hat einen neuen Seelenschmied geschaffen!"},
		},
		
		[70] =
		{
			--8sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286},
			CutSceneSay {Tag = "csa245avatar_002", NpcId = 0, String = "Hoffen wir, dass es nur dieser eine war! Sagt, Ihr wisst, dass die Zirkelmagier das Allfeuer beherrschen?"},
		},
		
		[110] =
		{
			--5sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			Goto {X = 98, Y = 92, NpcId = 10286, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			LookAtFigure {Target = 10286, NpcId = 0}, 
			LookAtFigure {Target = 0, NpcId = 10286},
			CutSceneSay {Tag = "csa245phoenixguard_003", NpcId = 10286, String = "Und dass sie dadurch unsterblich sind, ja."},
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
			--6sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			Goto {X = 98, Y = 95, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			ExecuteCameraScript{Script = n32535_CameraEndeSchattenklingeIII},	
			CutSceneSay {Tag = "csa245avatar_004", NpcId = 0, String = "Was ist Euer Plan? Wie wollt Ihr gegen sie kämpfen?"},
			LookAtFigure {Target = 10286, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10286},
		},
		
		[190] =
		{
			--9sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 10286, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10286}, --dreht sich um
			CutSceneSay {Tag = "csa245phoenixguard_005", NpcId = 10286, String = "Ich besitze einen magischen Kristall, in dem eine mächtige Kreatur eingeschlossen ist. Den Phönixstein."},
		},
		
		[230] =
		{
			--10sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 0, NpcId = 10286},
			CutSceneSay {Tag = "csa245phoenixguard_006", NpcId = 10286, String = "Diese Kreatur ist uralt und besteht aus dem reinsten Allfeuer. Nur dies kann die Zirkelmagier vernichten!"},
		},
		
		[270] =
		{
			--6sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			Goto {X = 101, Y = 95, NpcId = 10286, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			LookAtFigure {Target = 10286, NpcId = 0},
		},

		[280] =
		{
			ExecuteCameraScript{Script = n32535_CameraEndeSchattenklingeII},	
			CutSceneSay {Tag = "csa245phoenixguard_007", NpcId = 10286, String = "Ich muss den Phönix freisetzen, aber ich kann den Stein nicht öffnen!"},
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[285] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[290] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[295] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[300] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		
		[310] =
		{
			--12sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa245phoenixguard_008", NpcId = 10286, String = "Die Dryade sprach von einer Klinge nicht von dieser Welt ... die es vermag, den Phönixstein zu brechen. Sie sagte, ich würde sie hier finden."},
			Goto {X = 99, Y = 95, NpcId = 10286, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			LookAtFigure {Target = 10286, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10286},
		},

		[320] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10286},
		},
		[325] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10286},
		},
		[330] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[335] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[340] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[350] =
		{
			Goto {X = 93, Y = 100, NpcId = 10286, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[355] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[360] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[365] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
			Goto {X = 94, Y = 98, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},
		
		[380] =
		{
			--6sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa245avatar_009", NpcId = 0, String = "Dann hat uns mehr als nur Rache zusammengeführt, Freund."},
			LookAtFigure {Target = 10286, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10286},
		},
		[385] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10286},
		},
		[390] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10286},
		},
		[395] =
		{
			LookAtFigure {Target = 10286, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10286},
		},
		
		[400] =
		{
			--12sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32535_CameraEndeSchattenklingeIV},	
			LookAtFigure {Target = 0, NpcId = 10286},
			LookAtFigure {Target = 10286, NpcId = 0},
			Goto {X = 94, Y = 99, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			CutSceneSay {Tag = "csa245avatar_010", NpcId = 0, String = "Das Schwert, das ich trage, ist die Schattenklinge! Geschmiedet von dunklen Kräften jenseits des Sternengrunds! Es ist die Klinge, die Ihr sucht."},
		},

		[405] =
		{
			LookAtFigure {Target = 0, NpcId = 10286},
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[410] =
		{
			LookAtFigure {Target = 0, NpcId = 10286},
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[415] =
		{
			LookAtFigure {Target = 0, NpcId = 10286},
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[420] =
		{
			LookAtFigure {Target = 0, NpcId = 10286},
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		[425] =
		{
			LookAtFigure {Target = 0, NpcId = 10286},
			LookAtFigure {Target = 10286, NpcId = 0},
		},
		
		[430] =
		{
			--10sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32535_CameraEndeSchattenklingeV},	
			LookAtFigure {Target = 0, NpcId = 10286},
			LookAtFigure {Target = 10286, NpcId = 0},
			CutSceneSay {Tag = "csa245phoenixguard_011", NpcId = 10286, String = "Also hatten wir beide von Beginn an nur einen Teil der Waffe, die es braucht, um den Zirkel zu vernichten! Aber jetzt sind wir bereit!"},
			
		},
		
		[470] =
		{
			--10sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			ExecuteCameraScript{Script = n32535_CameraEndeSchattenklingeVI},	
			LookAtFigure {Target = 0, NpcId = 10286},
			CutSceneSay {Tag = "csa245avatar_012", NpcId = 0, String = "Noch ist es nicht an der Zeit ... wir müssen weiter, in den Schlund des Dschungels! Der Knochentempel kann nicht weit sein!"},
			
		},
		
		[520] =
		{
			Goto {X = 86, Y = 100, NpcId = 0, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},

		[530] =
		{
			Goto {X = 87, Y = 101, NpcId = 10286, Range = 0, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
		},

		[580] =
		{
			--10sek
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			LookAtFigure {Target = 10186, NpcId = 0},
			LookAtFigure {Target = 0, NpcId = 10286},
			SetGlobalFlagTrue {Name = "g_P211CSEndeSchattenklingeGelaufen"},
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			SetGlobalFlagFalse {Name = "g_P211CSInitEndeShadowblade"},
			SetNoFightFlagFalse{NpcId = Avatar},
			SetNoFightFlagFalse{NpcId = 10286},
		},
	},
}



