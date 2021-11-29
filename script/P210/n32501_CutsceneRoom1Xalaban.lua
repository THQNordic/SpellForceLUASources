-----------------------------------------------------------------------
--
--	P210 Clockwork Crypts Room 1 Xalaban-Cutscene (Hebel-Tutorial)
--
-----------------------------------------------------------------------


n32501_CameraRoom1z = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P210\\n32501_CameraRoom1z.lua")
   	Camera:ScriptStart()
]]

n32501_CameraRoom1a = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\P210\\n32501_CameraRoom1a.lua")
   	Camera:ScriptStart()
]]

n32501_CameraRoom1b = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P210\\n32501_CameraRoom1b.lua")
   	Camera:ScriptStart()
]]

n32501_CameraRoom1c = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P210\\n32501_CameraRoom1c.lua")
   	Camera:ScriptStart()
]]

n32501_CameraRoom1d = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\P210\\n32501_CameraRoom1d.lua")
   	Camera:ScriptStart()
]]

n32501_CameraRoom1e = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\P210\\n32501_CameraRoom1e.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P210_CutsceneRoom1Xalaban", CameraScript = "", PlayOnlyOnce = FALSE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_nP210_ShowXalabanCutscene"},
		
	},
	BeginActions =
	{
		SetGlobalFlagFalse {Name = "g_nP210_ShowXalabanCutscene"},
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			ExecuteCameraScript{Script = n32501_CameraRoom1z},
		},
		
		[150] =
		{
			ExecuteCameraScript{Script = n32501_CameraRoom1a},
			LookAtFigure{NpcId = 9561, Target = 9565}, -- Xalabans schaut seine Gefolgsleute an
			LookAtFigure{NpcId = 9569, Target = 9561}, -- Xalabans Männer schauen auf ihren Chef
			LookAtFigure{NpcId = 9568, Target = 9561}, -- Xalabans Männer schauen auf ihren Chef
			LookAtFigure{NpcId = 9564, Target = 9561}, -- Xalabans Männer schauen auf ihren Chef
			LookAtFigure{NpcId = 9567, Target = 9561}, -- Xalabans Männer schauen auf ihren Chef
			LookAtFigure{NpcId = 9566, Target = 9561}, -- Xalabans Männer schauen auf ihren Chef
			LookAtFigure{NpcId = 9562, Target = 9561}, -- Xalabans Männer schauen auf ihren Chef
			LookAtFigure{NpcId = 9563, Target = 9561}, -- Xalabans Männer schauen auf ihren Chef
			LookAtFigure{NpcId = 9565, Target = 9561}, -- Xalabans Männer schauen auf ihren Chef
			ChangeRace{Race = 152, NpcId = 9561 }, -- Xalaban wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9562 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9569 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9568 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9564 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9567 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9566 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9563 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9565 }, -- Gefolgsmann wird TestNeutral
		},
	
		[170] =
		{
			CutSceneSay {Tag = "csa237xalabar_001" , NpcId = 9561, String = "Die Uhrwerkhallen! Der Runenkrieger wird versuchen, sie zu durchqueren. Wir werden ihn aufhalten!"},
		},
	
		[230] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa237xalabar_002" , NpcId = 9561, String = "Und wir müssen das Szepter der Winde finden! Ohne es können wir nicht mehr zu unserem Volk zurückkehren!"},
		},
	
		[290] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa237xalabar_003" , NpcId = 9561, String = "Also weiter hinein! Aber seid vorsichtig, die Zerbiten haben hier überall Fallen angebracht!"},
		},
	
		[370] =
		{
			ExecuteCameraScript{Script = n32501_CameraRoom1b},
			Goto{X = 127, Y = 344, NpcId = 9562, Range = 0, WalkMode = Walk}, --Einer der Gefolgsleute geht los
		},
		
		[380] =
		{
			Goto{X = 135, Y = 344, NpcId = 9562, Range = 0, WalkMode = Walk}, --Gefolgsmann läuft über Bodenplatte
			LookAtFigure{NpcId = 9561, Target = 9562}, -- Xalabans schaut ihm nach
		},
	
		[400] =
		{
			CutSceneSay {Tag = "csa237xalabar_004" , NpcId = 9561, String = "Warte! Dieses Licht! Das bedeutet Gefahr!"},
		},
	
		[425] =
		{
			SetEffect{Effect = "AreaHit", X = 132 , Y = 344, Length = 3000}, -- Gefolgsmann löst Falle aus
		},
		
		[460] =
		{
			ExecuteCameraScript{Script = n32501_CameraRoom1c},
			SetGlobalFlagTrue {Name = "g_nP210_CutsceneSkeletonSpawn"}, -- Die Skelette erscheinen
		},
		
		[485] =
		{
			ChangeRace{Race = 210, NpcId = 9562 }, -- Gefolgsmann wird aggro
		},
		
		[550] =
		{
			Goto{X = 125, Y = 344, NpcId = 9570, Range = 1, WalkMode = Run}, -- Skelette gehen zu Kathai
			Goto{X = 125, Y = 344, NpcId = 9571, Range = 1, WalkMode = Run}, -- Skelette gehen zu Kathai
			Goto{X = 125, Y = 344, NpcId = 9572, Range = 1, WalkMode = Run}, -- Skelette gehen zu Kathai
		},
		
		[570] =
		{
			ExecuteCameraScript{Script = n32501_CameraRoom1e},
		},
		
		[575] =
		{
			ChangeRace{Race = 210, NpcId = 9568 }, -- Gefolgsmann wird aggro
			ChangeRace{Race = 210, NpcId = 9567 }, -- Gefolgsmann wird aggro
			ChangeRace{Race = 210, NpcId = 9566 }, -- Gefolgsmann wird aggro
			ChangeRace{Race = 210, NpcId = 9569 }, -- Gefolgsmann wird aggro
			ChangeRace{Race = 210, NpcId = 9564 }, -- Gefolgsmann wird aggro
			ChangeRace{Race = 210, NpcId = 9563 }, -- Gefolgsmann wird aggro
			ChangeRace{Race = 210, NpcId = 9565 }, -- Gefolgsmann wird aggro
		},
		
		[650] =
		{
			CutSceneSay {Tag = "csa237xalabar_005" , NpcId = 9561, String = "Eine Falle! Das Licht ruft Skelette herbei!"},
		},
		
		[710] =
		{
			Goto{X = 130, Y = 338, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 1. Hebel
		},
		
		[720] =
		{
			CutSceneSay {Tag = "csa237xalabar_006" , NpcId = 9561, String = "Vielleicht können diese Hebel die Falle ausschalten ..."},
		},
		
		[800] =
		{
			ExecuteCameraScript{Script = n32501_CameraRoom1d},
		},
		
		[900] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		SetGlobalFlagTrue { Name = "g_P210Room1aSwitch01On"}, -- Hebel 1 umschalten
		SetGlobalFlagFalse { Name = "g_P210Room1aEye01On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye02On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye04On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye05On"},
		},
		
		[920] =
		{
		SetGlobalFlagFalse { Name = "g_P210Room1aSwitch01On"}, -- Hebel 1 zurückschalten
		SetGlobalFlagTrue { Name = "g_P210Room1aEye01On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye02On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye04On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye05On"},
		},
		
		[940] =
		{
		Goto{X = 132, Y = 338, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 2. Hebel
		},
		
		[960] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		SetGlobalFlagTrue { Name = "g_P210Room1aSwitch02On"}, -- Hebel 2 umschalten
		SetGlobalFlagFalse { Name = "g_P210Room1aEye01On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye02On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye03On"},
		},
		
		[980] =
		{
		SetGlobalFlagFalse { Name = "g_P210Room1aSwitch02On"}, -- Hebel 2 umschalten
		SetGlobalFlagTrue { Name = "g_P210Room1aEye01On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye02On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye03On"},
		},
		
		[1000] =
		{
		Goto{X = 134, Y = 338, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 3. Hebel
		},
		
		[1020] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		SetGlobalFlagTrue { Name = "g_P210Room1aSwitch03On"}, -- Hebel 3 umschalten
		SetGlobalFlagFalse { Name = "g_P210Room1aEye02On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye03On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye05On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye06On"},
		},
		
		[1040] =
		{
		SetGlobalFlagFalse { Name = "g_P210Room1aSwitch03On"}, -- Hebel 3 umschalten
		SetGlobalFlagTrue { Name = "g_P210Room1aEye02On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye03On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye05On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye06On"},
		},
		
		[1060] =
		{
		Goto{X = 134, Y = 336, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 6. Hebel
		},
		
		[1080] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		SetGlobalFlagTrue { Name = "g_P210Room1aSwitch06On"}, -- Hebel 6 umschalten
		SetGlobalFlagFalse { Name = "g_P210Room1aEye03On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye06On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye09On"},
		},
		
		[1100] =
		{
		SetGlobalFlagFalse { Name = "g_P210Room1aSwitch06On"}, -- Hebel 6 umschalten
		SetGlobalFlagTrue { Name = "g_P210Room1aEye03On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye06On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye09On"},
		},
		
		[1120] =
		{
		Goto{X = 132, Y = 336, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 5. Hebel
		},
		
		[1140] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		SetGlobalFlagTrue { Name = "g_P210Room1aSwitch05On"}, -- Hebel 5 umschalten
		SetGlobalFlagFalse { Name = "g_P210Room1aEye02On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye04On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye05On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye06On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye08On"},
		},
		
		[1160] =
		{
		SetGlobalFlagFalse { Name = "g_P210Room1aSwitch05On"}, -- Hebel 5 umschalten
		SetGlobalFlagTrue { Name = "g_P210Room1aEye02On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye04On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye05On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye06On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye08On"},
		},
		
		[1180] =
		{
		Goto{X = 130, Y = 336, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 4. Hebel
		},
		
		[1200] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		SetGlobalFlagTrue { Name = "g_P210Room1aSwitch04On"}, -- Hebel 4 umschalten
		SetGlobalFlagFalse { Name = "g_P210Room1aEye01On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye04On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye07On"},
		},
		
		[1220] =
		{
		SetGlobalFlagFalse { Name = "g_P210Room1aSwitch04On"}, -- Hebel 4 umschalten
		SetGlobalFlagTrue { Name = "g_P210Room1aEye01On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye04On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye07On"},
		},
		
		[1240] =
		{
		Goto{X = 130, Y = 334, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 7. Hebel
		},
		
		[1260] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		SetGlobalFlagTrue { Name = "g_P210Room1aSwitch07On"}, -- Hebel 7 umschalten
		SetGlobalFlagFalse { Name = "g_P210Room1aEye04On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye05On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye07On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye08On"},
		},
		
		[1280] =
		{
		SetGlobalFlagFalse { Name = "g_P210Room1aSwitch07On"}, -- Hebel 7 umschalten
		SetGlobalFlagTrue { Name = "g_P210Room1aEye04On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye05On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye07On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye08On"},
		},
		
		[1300] =
		{
		Goto{X = 132, Y = 334, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 8. Hebel
		},
		
		[1320] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		SetGlobalFlagTrue { Name = "g_P210Room1aSwitch08On"}, -- Hebel 8 umschalten
		SetGlobalFlagFalse { Name = "g_P210Room1aEye07On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye08On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye09On"},
		},
		
		[1340] =
		{
		SetGlobalFlagFalse { Name = "g_P210Room1aSwitch08On"}, -- Hebel 8 umschalten
		SetGlobalFlagTrue { Name = "g_P210Room1aEye07On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye08On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye09On"},
		},
		
		[1360] =
		{
		Goto{X = 134, Y = 334, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 9. Hebel
		},
		
		[1380] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		SetGlobalFlagTrue { Name = "g_P210Room1aSwitch09On"}, -- Hebel 9 umschalten
		SetGlobalFlagFalse { Name = "g_P210Room1aEye05On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye06On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye08On"},
		SetGlobalFlagFalse { Name = "g_P210Room1aEye09On"},
		},
		
		[1400] =
		{
		SetGlobalFlagFalse { Name = "g_P210Room1aSwitch09On"}, -- Hebel 9 umschalten
		SetGlobalFlagTrue { Name = "g_P210Room1aEye05On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye06On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye08On"},
		SetGlobalFlagTrue { Name = "g_P210Room1aEye09On"},
		},
		
		[1430] =
		{
		FlipGlobalFlag { Name = "g_P210Room1aSwitch09On"}, -- Hebel 9 umschalten
		FlipGlobalFlag { Name = "g_P210Room1aEye05On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye06On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye08On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye09On"},
		},
		
		[1450] =
		{
		Goto{X = 130, Y = 334, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 7. Hebel
		},
		
		[1490] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		FlipGlobalFlag { Name = "g_P210Room1aSwitch07On"}, -- Hebel 7 umschalten
		FlipGlobalFlag { Name = "g_P210Room1aEye04On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye05On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye07On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye08On"},
		},
		
		[1510] =
		{
			Goto{X = 130, Y = 338, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 1. Hebel
		},
		
		[1550] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		FlipGlobalFlag { Name = "g_P210Room1aSwitch01On"}, -- Hebel 1 umschalten
		FlipGlobalFlag { Name = "g_P210Room1aEye01On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye02On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye04On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye05On"},
		},
		
		[1570] =
		{
		Goto{X = 134, Y = 338, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 3. Hebel
		},
		
		[1610] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		FlipGlobalFlag { Name = "g_P210Room1aSwitch03On"}, -- Hebel 3 umschalten
		FlipGlobalFlag { Name = "g_P210Room1aEye02On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye03On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye05On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye06On"},
		},
		
		[1630] =
		{
		Goto{X = 132, Y = 336, NpcId = 9561, Range = 1, WalkMode = Walk}, -- Xalaban geht zu 5. Hebel
		},
		
		[1670] =
		{
		LookAtDirection{Direction = North, NpcId = 9561}, -- Xalaban schaut Hebel an
		FlipGlobalFlag { Name = "g_P210Room1aSwitch05On"}, -- Hebel 5 umschalten
		FlipGlobalFlag { Name = "g_P210Room1aEye02On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye04On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye05On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye06On"},
		FlipGlobalFlag { Name = "g_P210Room1aEye08On"},
		},
		
		[1690] =
		{
		StopEffect { X = 132 , Y = 344 , TargetType = World },
		},
		
		[1710] =
		{
			CutSceneSay {Tag = "csa237xalabar_007" , NpcId = 9561, String = "Das Licht ist fort, die Falle ist entschärft! Kommt jetzt!"},
			ChangeRace{Race = 152, NpcId = 9561 }, -- Xalaban wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9569 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9568 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9564 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9567 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9566 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9563 }, -- Gefolgsmann wird TestNeutral
			ChangeRace{Race = 152, NpcId = 9565 }, -- Gefolgsmann wird TestNeutral
		},
		
		[1770] =
		{
			Goto{X = 148, Y = 352, NpcId = 9561, Range = 2, WalkMode = Run}, -- Xalabar geht los
			Goto{X = 148, Y = 350, NpcId = 9565, Range = 2, WalkMode = Walk}, -- Gefolgsleute gehen los
			Goto{X = 148, Y = 348, NpcId = 9566, Range = 2, WalkMode = Walk}, -- Gefolgsleute gehen los
			Goto{X = 148, Y = 346, NpcId = 9567, Range = 2, WalkMode = Walk}, -- Gefolgsleute gehen los
			Goto{X = 148, Y = 345, NpcId = 9568, Range = 2, WalkMode = Walk}, -- Gefolgsleute gehen los
			Goto{X = 148, Y = 344, NpcId = 9569, Range = 2, WalkMode = Walk}, -- Gefolgsleute gehen los
			Goto{X = 148, Y = 343, NpcId = 9564, Range = 2, WalkMode = Walk}, -- Gefolgsleute gehen los
			Goto{X = 148, Y = 342, NpcId = 9563, Range = 2, WalkMode = Walk}, -- Gefolgsleute gehen los
		},
		
		[1950] =
		{
		SetGlobalFlagTrue {Name = "g_210_CutsceneXalabarArmyVanish"},
		SetGlobalFlagTrue {Name = "g_P210_CutsceneGhostSpawn"}
		},
		
		[1970] =
		{
			LookAtDirection{Direction = North, NpcId = 9574},
			CutSceneSay {Tag = "csa237zerbiteghost_008" , NpcId = 9574, String = "Besucher?"},
		},
		
		[2020] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa237zerbiteghost_009" , NpcId = 9574, String = "Bleibt eine Weile ..."},
			FlipGlobalFlag { Name = "g_P210Room1aSwitch05On"},
			FlipGlobalFlag { Name = "g_P210Room1aSwitch09On"},
			FlipGlobalFlag { Name = "g_P210Room1aSwitch01On"},
			FlipGlobalFlag { Name = "g_P210Room1aSwitch03On"},
			FlipGlobalFlag { Name = "g_P210Room1aSwitch07On"},
			FlipGlobalFlag { Name = "g_P210Room1aEye01On"},
			FlipGlobalFlag { Name = "g_P210Room1aEye02On"},
			FlipGlobalFlag { Name = "g_P210Room1aEye03On"},
			FlipGlobalFlag { Name = "g_P210Room1aEye04On"},
			FlipGlobalFlag { Name = "g_P210Room1aEye05On"},
			FlipGlobalFlag { Name = "g_P210Room1aEye06On"},
			FlipGlobalFlag { Name = "g_P210Room1aEye07On"},
			FlipGlobalFlag { Name = "g_P210Room1aEye08On"},
			FlipGlobalFlag { Name = "g_P210Room1aEye09On"},
		},
		
		[2050] =
		{
			SetEffect { X = 132 , Y = 344 , Effect = "Lightning", Length = 0, TargetType = World },
		},
		
		[2080] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			CutSceneSay {Tag = "csa237zerbiteghost_010" , NpcId = 9574, String = "Bleibt für immer!"},
		},
		
		[2140] =
		{
			SetEffect {Effect ="DeMaterialize", TargetType = Figure, NpcId = 9574},
			SetGlobalFlagTrue {Name = "g_P210_CutsceneGhostVanish"},
			QuestBegin {QuestId = 902}, -- Unterquest "Durchquere die Halle der Augen"
		},
		
		[2200] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
		},		
	},
}



