  ------------------------------------------------------------------------
 --------------------------------------------------------------------------
-- Rohen kommt durchs Portal mit seiner Armee, und zieht Richtung Spieler --
 --------------------------------------------------------------------------
  ------------------------------------------------------------------------
  
Camera001 =		-- Kamera zeigt auf erscheinenden Geist Rohens
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera001.lua")
   	Camera:ScriptStart()
]]
Camera002 =		-- Kamera zeigt auf Avatar von rechts
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera002.lua")
   	Camera:ScriptStart()
]]
Camera003 =		-- Kamera zeigt auf Rohen von links
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera003.lua")
   	Camera:ScriptStart()
]]
Camera004 =		-- Kamera zeigt auf Avatar und Alyah von vorn
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera004.lua")
   	Camera:ScriptStart()
]]
Camera005 =		-- Kamera zeigt Oberkörper des Avatar aus der Nähe
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera005.lua")
   	Camera:ScriptStart()
]]
Camera006 =		-- Kamera zeigt Oberkörper Alyahs aus der Nähe
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera006.lua")
   	Camera:ScriptStart()
]]
Camera007 =		-- Kamera zeigt das Portal
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera007.lua")
   	Camera:ScriptStart()
]]
Camera008 =		-- Kamera kreist um Rohen
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera008.lua")
   	Camera:ScriptStart()
]]
Camera009 =		-- Kamera zeigt Urias
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera009.lua")
   	Camera:ScriptStart()
]]
Camera010 =		-- Kamera zeigt alle(Kamera hinter Avatar)
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera010.lua")
   	Camera:ScriptStart()
]]
Camera011 =		-- Kamera zeigt Rohen von vorn
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera011.lua")
   	Camera:ScriptStart()
]]
Camera012 =		-- Kamera zeigt alle(Kamera hinter Rohen)
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera012.lua")
   	Camera:ScriptStart()
]]
Camera013 =		-- Kamera zeigt Alyah(etwas höher, weiter weg und weiter rechts)
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p207\\n32415_cutscene_rohens_geist_Camera013.lua")
   	Camera:ScriptStart()
]]
CreateCutScene
{
	Name = "P207_Rohens_Geist_Ist_Frei_Shadow", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_p207_Rohen_Has_Left_The_Building"},
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
		FigureInRange {X = 273, Y = 48, Range = 5, NpcId = Avatar},
	},
	BeginActions =
	{		
		SetGlobalFlagTrue {Name = "g_P207_Last_Cutscene_Has_Started"},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetGlobalFlagTrue {Name = "g_p207_stop_follow_in_cutscenes"},	
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = Camera012},                       
			Goto {NpcId = Avatar, X = 271, Y = 43, WalkMode = Run}, -- Avatar
			Goto {NpcId = 10060, X = 273, Y = 44, WalkMode = Run}, -- Alyah
			Goto {NpcId = 10061, X = 275, Y = 43, WalkMode = Run}, -- Urias
		},
		[50] =
		{
			WaitForEndOfSpeech,
			LookAtDirection{NpcId = 0, Direction = SouthEast}, 
			LookAtDirection{NpcId = 10060, Direction = South},
		    LookAtDirection{NpcId = 10061, Direction = SouthWest},
			ExecuteCameraScript{Script = Camera005},
			CutSceneSay {Tag = "csa229avatar_001" ,NpcId = Avatar, String = "Flammender Barga Gor! Das war einer des Zirkels!"},
		},
		[70] =
		{
			WaitForEndOfSpeech,
			LookAtDirection{NpcId = 0, Direction = SouthEast}, 
			LookAtDirection{NpcId = 10060, Direction = South},
		    LookAtDirection{NpcId = 10061, Direction = SouthWest},
			ExecuteCameraScript{Script = Camera001},
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohens_Geist_Spawn"},			
		},
		[90] =
		{
			LookAtDirection{NpcId = 11176, Direction = North},
			CutSceneSay {Tag = "csa229rohen_002" ,NpcId = 11176, String = "... endlich frei ..."},
		},
		[110] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera009},
			CutSceneSay {Tag = "csa229urias_003" ,NpcId = 10061, String = "Meister Rohen!"},
		},
		[130] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera011},
			CutSceneSay {Tag = "csa229rohen_004" ,NpcId = 11176, String = "Urias, mein Freund ... ihr dürft nicht zaudern! ...ich habe nicht viel Zeit .."},
		},
		[150] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera008},
			CutSceneSay {Tag = "csa229rohen_005" ,NpcId = 11176, String = "Hokan Ashir erweckt die Magier des Zirkels mit dem Trank der Lebensessenz!"},
		},
		[170] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa229rohen_006" ,NpcId = 11176, String = "Sie werden dadurch zu ebenso willenlosen Sklaven seines Geistes wie ich!"},
		},
		[190] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera010},
			CutSceneSay {Tag = "csa229rohen_007" ,NpcId = 11176, String = "Doch ihre Macht erneuert sich mit jedem Tag! Bald werden sie wieder so mächtig sein wie zur Zeit des Zirkels!"},
		},
		[210] =
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 11176, Target = 0}, -- Rohen schaut Avatar an
			ExecuteCameraScript{Script = Camera010},
			CutSceneSay {Tag = "csa229rohen_008" ,NpcId = 11176, String = "Du musst dich beeilen, Freund! Diese Untoten sind nur die Vorhut, was jenseits dieser Berge lauert wird das Kaiserreich zu Staub zermalmen!"},
		},
		[230] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera012},
			LookAtFigure{NpcId = 0, Target = 10061}, -- Avatar schaut Urias an
			CutSceneSay {Tag = "csa229avatar_009" ,NpcId = Avatar, String = "Urias, woher wissen wir, das wir ihm trauen können?"},
		},
		[250] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera010},
			LookAtFigure{NpcId = 0, Target = 11176}, -- Avatar schaut Rohen an
			CutSceneSay {Tag = "csa229rohen_010" ,NpcId = 11176, String = "Zweifelt nicht, hört zu ..."},
		},
		[270] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera003},
			CutSceneSay {Tag = "csa229rohen_011" ,NpcId = 11176, String = "Ihr müsst ... den Phönix ... freisetzen"},
		},
		[310] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera003},
			CutSceneSay {Tag = "csa229avatar_012" ,NpcId = Avatar, String = "Der Phönixstein! Wie können wir ihn finden?"},
		},
		[330] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera010},
			CutSceneSay {Tag = "csa229rohen_013" ,NpcId = 11176, String = "... er ... findet ... Euch! Rettet ... Darius."},
		},
		[340] =
		{
			SetEffect {Effect = "OccludeWhite", X = 273, Y = 41, Length = 7000, TargetType = World},
		},
		[350] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "g_P207_Undead_Rohens_Geist_Despawn"},
		},
		[370] =
		{
			ExecuteCameraScript{Script = Camera012},
			CutSceneSay {Tag = "csa229urias_014" ,NpcId = 10061, String = "Darius? Wo ist er?"},
		},
		[390] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera005},
			CutSceneSay {Tag = "csa229avatar_015" ,NpcId = Avatar, String = "Geist! Kommt zurück!"},
		},
		[410] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera010},
			CutSceneSay {Tag = "csa229avatar_016" ,NpcId = 10061, String = "Er ist fort. Ruht in Frieden, Meister Rohen."},
		},
		[430] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera006},
			CutSceneSay {Tag = "csa229alyah_017" ,NpcId = 10060, String = "Ha-hem!"},
		},
		[450] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera012},
			CutSceneSay {Tag = "csa229alyah_018" ,NpcId = 10060, String = "Oh ja, dankt mir nur nicht alle auf einmal!"},
		},
		[470] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera013},
			CutSceneSay {Tag = "csa229alyah_019" ,NpcId = 10060, String = "Nun steht nicht da und gafft, davon wird er nicht wieder lebendig! Wir müssen weiter, Kathai wird bereits belagert!"},
		},
		[490] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa229alyah_020" ,NpcId = 10060, String = "Durch das Portal! Los kommt!"},
		},
		[510] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera007},
			Goto {NpcId = 10060, X = 273, Y = 36, WalkMode = Run},		
		},
		[550] =
		{
			Follow { NpcId = 10061, Target = Avatar},
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},		
			SetGlobalFlagTrue{Name = "g_p207_Alyah_Despawn_After_Leaving_Map_Trough_Portal"},
			SetGlobalFlagFalse {Name = "g_p207_stop_follow_in_cutscenes"},	
		},
	},
}

CreateCutScene
{
	Name = "P207_Rohens_Geist_Ist_Frei_Phoenix", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_p207_Rohen_Has_Left_The_Building"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
		FigureInRange {X = 273, Y = 46, Range = 5, NpcId = Avatar},
	},
	BeginActions =
	{	
		SetGlobalFlagTrue {Name = "g_P207_Last_Cutscene_Has_Started"},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetGlobalFlagTrue {Name = "g_p207_stop_follow_in_cutscenes"},	
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = Camera012},
			Goto {NpcId = Avatar, X = 271, Y = 43, WalkMode = Run}, -- Avatar
			Goto {NpcId = 10060, X = 273, Y = 44, WalkMode = Run}, -- Alyah
			Goto {NpcId = 10061, X = 275, Y = 43, WalkMode = Run}, -- Urias		
		},
		[40] =
		{
			ExecuteCameraScript{Script = Camera002},
			CutSceneSay {Tag = "csa228avatar_001" ,NpcId = Avatar, String = "Rohen ... Was ist nur aus Euch geworden."},
		},
		[45] =
		{
			ExecuteCameraScript{Script = Camera001},
			WaitForEndOfSpeech,
			SetGlobalFlagTrue{Name = "g_P207_Undead_Rohens_Geist_Spawn"},
		},
		[65] =
		{
			LookAtDirection{NpcId = 0, Direction = SouthEast}, 
			LookAtDirection{NpcId = 10060, Direction = South},
		    LookAtDirection{NpcId = 10061, Direction = SouthWest},
		    LookAtDirection{NpcId = 11176, Direction = North},
		},
		[80] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera001},
			CutSceneSay {Tag = "csa228rohen_002" ,NpcId = 11176, String = "... endlich frei ..."},
			LookAtDirection{NpcId = 0, Direction = SouthEast}, 
			LookAtDirection{NpcId = 10060, Direction = South},
		    LookAtDirection{NpcId = 10061, Direction = SouthWest},
		    LookAtDirection{NpcId = 11176, Direction = North},
		},
		[90] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera002},
			CutSceneSay {Tag = "csa228avatar_003" ,NpcId = Avatar, String = "Rohen? Seid Ihr der Rohen, den ich kannte?"},
		},
		[110] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera003},
			LookAtFigure{NpcId = 11176, Target = 0}, -- Rohen schaut Avatar an
			CutSceneSay {Tag = "csa228rohen_004" ,NpcId = 11176, String = "Ja, Freund! Mein Geist ist nun frei ... doch ich habe nicht viel Zeit ..."},
		},
		[130] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera003},
			CutSceneSay {Tag = "csa228rohen_005" ,NpcId = 11176, String = "Hokan Ashir erweckt die Magier des Zirkels mit dem Trank der Lebensessenz!"},
		},
		[150] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera008},
			CutSceneSay {Tag = "csa228rohen_006" ,NpcId = 11176, String = "Sie werden dadurch zu ebenso willenlosen Sklaven seines Geistes wie ich!"},
		},
		[170] =
		{
			WaitForEndOfSpeech,
			--ExecuteCameraScript{Script = Camera003},
			CutSceneSay {Tag = "csa228rohen_007" ,NpcId = 11176, String = "Doch ihre Macht erneuert sich mit jedem Tag! Bald werden sie wieder so mächtig sein wie zur Zeit des Zirkels!"},
		},
		[190] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera010},
			CutSceneSay {Tag = "csa228rohen_008" ,NpcId = 11176, String = "Du musst dich beeilen, Freund! Diese Untoten sind nur die Vorhut, was jenseits dieser Berge lauert wird das Kaiserreich zu Staub zermalmen!"},
		},
		[210] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera002},
			CutSceneSay {Tag = "csa228avatar_009" ,NpcId = Avatar, String = "Aber wie kann ich Hokan aufhalten?"},
		},
		[230] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera003},
			CutSceneSay {Tag = "csa228rohen_010" ,NpcId = 11176, String = "Du hast noch den Phönixstein ... du musst ..."},
		},
		[250] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera012},
			CutSceneSay {Tag = "csa228avatar_011" ,NpcId = Avatar, String = "Wie kann ich ihn einsetzen?"},
		},
		[270] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa228rohen_012" ,NpcId = 11176, String = "Du musst ...ihn öffnen ... den Phönix befreien ..."},
		},
		[290] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera002},
			CutSceneSay {Tag = "csa228avatar_013" ,NpcId = Avatar, String = "Wie? Der Stein ist unzerstörbar!"},
		},
		[310] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera010},
			CutSceneSay {Tag = "csa228rohen_014" ,NpcId = 11176, String = "Finde ... das Schwert ..."},
		},
		[320] =
		{
			SetEffect {Effect = "OccludeWhite", X = 273, Y = 41, Length = 7000, TargetType = World},
		},
		[330] =
		{
			WaitForEndOfSpeech,
			--ExecuteCameraScript{Script = Camera001},
			SetGlobalFlagTrue {Name = "g_P207_Undead_Rohens_Geist_Despawn"},
		},
		[350] =
		{
			ExecuteCameraScript{Script = Camera002},
			CutSceneSay {Tag = "csa228avatar_015" ,NpcId = Avatar, String = "Rohen!"},
		},
		[370] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera009},
			CutSceneSay {Tag = "csa228urias_016" ,NpcId = 10061, String = "Er ist fort."},
		},
		[390] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera005},
			CutSceneSay {Tag = "csa228avatar_017" ,NpcId = Avatar, String = "Ruht in Frieden, alter Freund."},
		},
		[410] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera006},
			CutSceneSay {Tag = "csa228alyah_018" ,NpcId = 10060, String = "Ha-hem!"},
		},
		[430] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera006},
			CutSceneSay {Tag = "csa228alyah_019" ,NpcId = 10060, String = "Oh ja, dankt mir nur nicht alle auf einmal!"},
		},
		[450] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera013},
			CutSceneSay {Tag = "csa228alyah_020" ,NpcId = 10060, String = "Nun steht nicht da und gafft, davon wird er nicht wieder lebendig! Wir müssen weiter, Kathai wird bereits belagert!"},
		},
		[470] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa228alyah_021" ,NpcId = 10060, String = "Durch das Portal! Los kommt!"},
		},
		[490] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = Camera007},
			Goto {NpcId = 10060, X = 273, Y = 36, WalkMode = Run},		
		},
		[530] =
		{
			Follow { NpcId = 10061, Target = Avatar},
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			SetGlobalFlagTrue{Name = "g_p207_Alyah_Despawn_After_Leaving_Map_Trough_Portal"},
			SetGlobalFlagFalse {Name = "g_p207_stop_follow_in_cutscenes"},	
		},
	},
}