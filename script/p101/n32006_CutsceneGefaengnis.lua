-----------------------------------------------------------------------
--
--	Gefaengnis
--
-----------------------------------------------------------------------

-- totale gefaengnis
CameraGefaengnisI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,110,1,"script\\p101\\n5536_CameraGefaengnisI.lua")
  	Camera:ScriptStart()
]]

-- totale feuertor
CameraGefaengnisII = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,40,1,"script\\p101\\n5536_CameraGefaengnisII.lua")
   	Camera:ScriptStart()
]]

-- grim oeffnet das gefaengnistor
CameraGefaengnisIII = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraGefaengnisIII.lua")
   	Camera:ScriptStart()
]]

-- grim laeuft durch das gefaengnistor, avatar und lena kommen von hinten
CameraGefaengnisIV = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraGefaengnisIV.lua")
   	Camera:ScriptStart()
]]

-- fial darg nah
CameraGefaengnisV = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraGefaengnisV.lua")
   	Camera:ScriptStart()
]]

-- avatar nah
CameraGefaengnisVI = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraGefaengnisVI.lua")
   	Camera:ScriptStart()
]]

-- grim nah mit kran runter
CameraGefaengnisVII = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraGefaengnisVII.lua")
   	Camera:ScriptStart()
]]

-- grim und lena
CameraGefaengnisVIII = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraGefaengnisVIII.lua")
   	Camera:ScriptStart()
]]

-- grim und fial darg hauen ab
CameraGefaengnisIX = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraGefaengnisIX.lua")
   	Camera:ScriptStart()
]]

-- feuertor halbtotale
CameraGefaengnisX = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraGefaengnisX.lua")
   	Camera:ScriptStart()
]]

-- elune kommt angerannt vogelperspektive
CameraGefaengnisXI = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraGefaengnisXI.lua")
   	Camera:ScriptStart()
]]

-- lena nah mit elune
CameraGefaengnisXII = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraGefaengnisXII.lua")
   	Camera:ScriptStart()
]]

-- elune nah 
CameraGefaengnisXIII = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraGefaengnisXIII.lua")
   	Camera:ScriptStart()
]]

-- feuerarmee
CameraGefaengnisXIV = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraGefaengnisXIV.lua")
   	Camera:ScriptStart()
]]

-- grim detail
CameraGefaengnisXV = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraGefaengnisXV.lua")
   	Camera:ScriptStart()
]]

-- lena detail
CameraGefaengnisXVI = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraGefaengnisXVI.lua")
   	Camera:ScriptStart()
]]

-- fial bedrohliche fahrt nah
CameraGefaengnisXVII = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraGefaengnisXVII.lua")
   	Camera:ScriptStart()
]]

-- avatar kommt angerannt vogelperspektive
CameraGefaengnisXVIII = 
[[
  	Camera:ScriptReset()
    Camera:ScriptAddSpline(0,15,1,"script\\p101\\n5536_CameraGefaengnisXVIII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Gefaengnis", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet wenn spieler Einheiten und gebaeude beim tor zum gefängnis zerstört hat und das hq zerstoert ist.
		IsGlobalFlagTrue {Name = "CutGefaengnisStart", UpdateInterval = 15},
		IsGlobalFlagTrue {Name = "CutHQgelaufen", UpdateInterval = 15},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 6116},
		SetGlobalFlagTrue {Name = "CutsceneInitGefaengnisLena"},
		SetGlobalFlagTrue {Name = "CutsceneInitGefaengnisGrim"},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = CameraGefaengnisI},	-- grim kommt an und oeffnet das tor		
		},
		[30] =
		{
			-- Grim geht zum Elfentor, öffnet es, 
			SetNoFightFlagTrue {NpcId = 7010},
			SetNoFightFlagTrue {NpcId = 7011},			
			Goto {X = 260, Y = 130, NpcId = 7011, Range = 0, WalkMode = Run, GotoMode = GotoNormal}, -- grim
		},
		[60] =
		{
			ExecuteCameraScript{Script = CameraGefaengnisIII},	
			SetGlobalFlagTrue{Name = "p101GrimÖffnetElfentor"}, -- tor oeffnet sich.
			LookAtFigure{NpcId = 6116, Target = 7011}, -- Fial auf Grim.										
		},
		[110] = 
		{
			-- Grim geht zum Gefangenen, befreit Gefangenen, zerschlägt Eisblock
			ExecuteCameraScript{Script = CameraGefaengnisIV},	
			LookAtFigure{NpcId = 6116, Target = 7011}, -- Fial auf Grim.		
			Goto {X = 260, Y = 123, NpcId = 7011, Range = 0, WalkMode = Run, GotoMode = GotoNormal}, -- grim geht zu fial darg
		},
		[140] =
		{
			-- CastSpell {Spell = 19, Target = 6116, TargetType = Figure, X = 0, Y = 0, NpcId = 7011},	-- CAST : fial unfreezed.	
			SetEffect {Effect = "IcePack", Length = 3000, TargetType = Figure, NpcId = 6116}, -- temporaerer Eisblock Effekt	
		},
		[160] = 
		{
			-- Fial Darg frei 
			SetGlobalFlagFalse {Name = "FialDargGefangen"}, -- fial darg wird aufgetaut.
			StopEffect {TargetType = Figure, NpcId = 6116},
			SetFreezeFlagFalse {NpcId = 6116},
			--Effekt: Leuchten beim Eiszerschlagen:
			--SetEffect {Effect = "IcePack", Length = 5000, TargetType = Figure, NpcId = 6116}, -- temporaerer Eisblock Effekt	
			CutSceneSay {Tag = "cs06GrimP101_001", NpcId = 7011, String = "Meister! Ihr seid frei!"},
			Goto {X = 259, Y = 125, NpcId = 7010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal}, -- Lea in die Nähe
			SetNoFightFlagTrue {NpcId = 7011},
			SetNoFightFlagTrue {NpcId = 7010},						
		},
		[200] = 
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs06FialDargP101_001", NpcId = 6116, String = "Endlich! Diese Lichtkriecher begannen mich allmählich zu langweilen."},
			LookAtFigure{NpcId = 6116, Target = 7011}, -- Fial auf Grim.
		},
		[250] =
		{
			ExecuteCameraScript{Script = CameraGefaengnisVI},
		},
		[260] = 
		{
			WaitForEndOfSpeech,
			-- AVATAR ROLE 
			Goto {X = 260, Y = 123, NpcId = 7011, Range = 0, WalkMode = Run, GotoMode = GotoNormal}, --Grim zu Fial			
		},
		[290] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 7010, Target = 6116}, -- Lea auf fial darg
			LookAtFigure{NpcId = 7011, Target = 6116}, -- Grim auf Fial.
			LookAtFigure{NpcId = 6116, Target = 7011}, -- Fial auf Grim.	
			Goto {X = 258, Y = 123, NpcId = 7010, Range = 0, WalkMode = Walk, GotoMode = GotoNormal}, -- Lea in die Nähe						
			CutSceneSay {Tag = "cs06LenaP101_001", NpcId = 7010, String = "Ein Fial Darg ... ein Prinz der Finsternis ... die Götter mögen uns beistehen ..."},
		},
		[330] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraGefaengnisV},			
			CutSceneSay {Tag = "cs06FialDargP101_002", NpcId = 6116, String = "Ich sehe, du hast Gefolge mitgebracht?"},
		},
		[370] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGefaengnisVII},
			CutSceneSay {Tag = "cs06GrimP101_002", NpcId = 7011, String = "Sie sind nur Werkzeuge, Meister."},			
		},
		[420] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGefaengnisVIII},		
			LookAtFigure{NpcId = 7011, Target = 7010}, -- Lea auf fial darg
			LookAtFigure{NpcId = 7010, Target = 7011}, -- Lea auf fial darg				
			CutSceneSay {Tag = "cs06LenaP101_002", NpcId = 7010, String = "Grim! Das war dein Plan? Nicht die Königin, sondern dieses ... Monstrum wolltest du befreien?"},			
		},		
		[470] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGefaengnisV},	
			CutSceneSay {Tag = "cs06FialDargP101_003", NpcId = 6116, String = "Wie schmeichelhaft. Wo wir gerade von der Königin sprechen ..."},			
		},			
		[500] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGefaengnisVII},	
			LookAtFigure {NpcId = 7011, Target = 6116},
			LookAtFigure {NpcId = 6116, Target = 7011},			
			CutSceneSay {Tag = "cs06GrimP101_003", NpcId = 7011, String = "Cenwen ist in sicheren Händen und auf dem Weg in die brennende Stadt, Meister."},			
		},		
		[540] = 
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs06FialDargP101_004", NpcId = 6116, String = "Sehr gut. Ihr habt den Schlüssel für das Feuertor?"},			
		},	
		[570] = 
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs06GrimP101_004", NpcId = 7011, String = "Ja ... die Eishexe braucht ihn nicht mehr!"},			
		},	
		[600] = 
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs06FialDargP101_005", NpcId = 6116, String = "Dann hält uns nichts mehr hier, mein Diener."},			
		},
		[630] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGefaengnisVIII},	
			LookAtFigure {NpcId = 7011, Target = 7010},
			CutSceneSay {Tag = "cs06GrimP101_005", NpcId = 7011, String = "Willst du nicht mitkommen, ... Liebste?"},			
		},	
		[660] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGefaengnisXVI},				
			CutSceneSay {Tag = "cs06LenaP101_003", NpcId = 7010, String = "Grim! Du hast meine Liebe genutzt, um Finsternis zu säen! Du wirst durch meine Hand sterben, Verräter! Das schwöre ich!"},			
		},	
		[740] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGefaengnisXV},				
			CutSceneSay {Tag = "cs06GrimP101_006", NpcId = 7011, String = "Schade. Du warst nützlich und ... unterhaltsam. Ihr Lichtgläubigen seid so schnell getäuscht."},
			LookAtFigure {NpcId = 6116, Target = 7010},			
		},			
		[800] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGefaengnisXVII},	
			CutSceneSay {Tag = "cs06FialDargP101_006", NpcId = 6116, String = "Unsere Armee soll sich dieses Gewürms annehmen. Diese Stadt wird brennen! Kommt jetzt, lasst uns das Ritual beginnen!"},			
		},																
		[860] = 
		{
			--Fial und Grim gehen zum Feuertor
			ExecuteCameraScript{Script = CameraGefaengnisIX},	
			Goto {X = 260, Y = 140, NpcId = 7011, Range = 0, WalkMode = Run, GotoMode = GotoNormal}, 
			Goto {X = 260, Y = 140, NpcId = 6116, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
		},
		[920] =
		{
			ExecuteCameraScript{Script = CameraGefaengnisX},
			
			-- AVATAR ROLE 
			Goto {X = 258, Y = 125, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoNormal}, --Avatar in die Nähe				
		},
		[930] =
		{
			SetGlobalFlagTrue {Name = "GrimZumTor"}, -- grim und fialdarg zum tor.
			SetGlobalFlagTrue {Name = "FialZumTor"},
		},
		[950] =
		{
			ChangeRace {NpcId = 7011, Race = 190}, -- grim wird zum darkelf clan
			Goto {NpcId = 0, X = 256, Y = 125, WalkMode = Walk},		
		},
		[960] = 
		{
			--Fial und Grim kommen ans Tor, Grim öffnet Tor NpcId5677 (wenn beide in Range)
			Goto {X = 348, Y = 247, NpcId = 6116, Range = 0, WalkMode = Run, GotoMode = GotoNormal },
			LookAtDirection {NpcId = 0, Direction = West},
		},
		[970] =
		{
			Goto {X = 348, Y = 245, NpcId = 7011, Range = 0, WalkMode = Run, GotoMode = GotoNormal }, 		
		},
		[1030] = 
		{
			--Fial und Grim gehen durch das Portal
			Goto {X = 387, Y = 249, NpcId = 7011, Range = 0, WalkMode = Run, GotoMode = GotoNormal}, 
			Goto {X = 387, Y = 249, NpcId = 6116, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
			SetGlobalFlagTrue {Name = "EluneSpawns"}, -- Elune wird gespawnt.
			Goto {X = 259, Y = 121, NpcId = 7010, Range = 0, WalkMode = Run, GotoMode = GotoNormal}, -- Lea in die Nähe		
		},
		[1070] =
		{
			ExecuteCameraScript{Script = CameraGefaengnisXI},
			LookAtFigure {NpcId = 7010, Target = 5937},
			Goto {X = 260, Y = 126, NpcId = 5937, Range = 0, WalkMode = Run, GotoMode = GotoNormal}, -- Elune in die Nähe				
		},
		[1100] =
		{
			ExecuteCameraScript{Script = CameraGefaengnisXIII},		
			
			-- AVATAR ROLE
			Goto {X = 253, Y = 136, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoForced}, --Avatar in die Nähe				
			
			CutSceneSay {Tag = "cs06EluneP101_001", NpcId = 5937, String = "Was ist das? Die Schwestern erschlagen! Das Monstrum frei!"}, -- elune
			LookAtFigure {NpcId = 7010, Target = 5937},
			LookAtFigure {NpcId = 5937, Target = 7010},	
			LookAtFigure {NpcId = 0, Target = 5937},							
		},
		[1130] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraGefaengnisXII},		
			CutSceneSay {Tag = "cs06LenaP101_004", NpcId = 7010, String = "Elune?"}, -- lena
			Goto {NpcId = 7010, X = 260, Y = 123, WalkMode = Walk}, -- lena
			LookAtFigure {NpcId = 7010, Target = 5937},
			LookAtFigure {NpcId = 5937, Target = 7010},	
			LookAtFigure {NpcId = 0, Target = 5937},
			SetGlobalFlagTrue{Name = "P101UmspawnInitFlüchtlinge"},								
		},
		[1160] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGefaengnisXIII},	
			CutSceneSay {Tag = "cs06EluneP101_002", NpcId = 5937, String = "Lena? Ist meine alte Schülerin für all das hier verantwortlich? Was ist in Euch gefahren?"},
			LookAtFigure {NpcId = 7010, Target = 5937},
			LookAtFigure {NpcId = 5937, Target = 7010},	
			LookAtFigure {NpcId = 0, Target = 5937},
		},
		[1200] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraGefaengnisXII},			
			CutSceneSay {Tag = "cs06LenaP101_005", NpcId = 7010, String = "Wir wurden getäuscht, Elune. Straft uns, wie Ihr wollt, aber bringt diese Leute in Sicherheit. Sie haben das Feuertor geöffnet!"},			
			
			SetGlobalFlagTrue {Name = "FeuerArmeeFälltEin"}, -- die feuerarmee wird gespawnt nach timer. grim und fialdarg zum tor.
			SetGlobalTimeStamp {Name = "CounterFeuerarmee1"}, -- counter dazu.					
		},
		[1260] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraGefaengnisXIV},	
			CutSceneSay {Tag = "cs06EluneP101_003", NpcId = 5937, String = "Dann wird das rote Imperium über uns herfallen!"},	
			Goto {X = 258, Y = 125, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoForced}, --Avatar in die Nähe			
		},	
		[1340] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraGefaengnisXII},
			Goto {NpcId = 7010, X = 260, Y = 124, WalkMode = Walk}, -- lena						
			CutSceneSay {Tag = "cs06LenaP101_006", NpcId = 7010, String = "Nehmt diese Leute in Euren Schutz, Elune! Das ist das Einzige, was sie noch retten kann. Es sind gute Menschen."},			
		},
		[1390] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraGefaengnisXIII},			
			CutSceneSay {Tag = "cs06EluneP101_004", NpcId = 5937, String = "Die hohe Priesterin wird über Euch richten. Bis dahin sucht Schutz in unseren Landen. Folgt mir zum Tor!"},			
		},					
		[1440] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraGefaengnisXVIII},	
			-- AVATAR ROLE 
			--Goto {X = 258, Y = 125, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoForced}, --Avatar in die Nähe					
			LookAtFigure {NpcId = 5937, Target = 0},				
			CutSceneSay {Tag = "cs06LenaP101_007", NpcId = 5937, String = "Folge uns mit den Leuten, Runenkrieger. Achte auf Truppen des roten Imperiums, sie werden bereits hier sein!"},
		},				
		[1500] = 
		{
			WaitForEndOfSpeech,			
			SetGlobalFlagTrue {Name = "NachFireCity"}, -- Grim/FialDargDespawn, EluneOutcries
			SetGlobalFlagFalse {Name = "SklavenRespawnen"}, -- tote Sklaven respawnen nicht mehr als Spielereigentum
			SetGlobalFlagTrue {Name = "CutsceneGefängnisIstGelaufen"}, --
			ChangeRace {Race = 152, NpcId = 7010}, -- Lena wird neutral
			SetGlobalFlagTrue {Name = "P101EiselfenWerdenLieb"},
			SetGlobalFlagTrue {Name = "P101EluneZuEiselfen"}, --Flag für Elune und Lena loslaufen
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 7011},
			SetNoFightFlagFalse {NpcId = 7010},
			SetNoFightFlagFalse {NpcId = 6116},		
			SetGlobalFlagFalse {Name = "CutsceneInitGefaengnisLena"},
			SetGlobalFlagFalse {Name = "CutsceneInitGefaengnisGrim"},
			QuestBegin{QuestId = 644, SubQuestActivate = FALSE}, --begin Quest Zuflucht im Norden
			QuestBegin{QuestId = 717, SubQuestActivate = FALSE}, --begin SubQuest zu Zuflucht im Norden
			QuestSolve{QuestId = 603, ActivateNextQuest = FALSE}, --Gefängnis Quest 603 solved
			QuestSolve{QuestId = 573, ActivateNextQuest = FALSE}, --Mainquest belagerung von Mirraw Thur solved
			Follow{Target = Avatar, NpcId = 7010},	--Lena folgt Avatar											
		},
	},
}
