-----------------------------------------------------------------------
--
--	ElfDiscovered
--
-----------------------------------------------------------------------

-- totale
CameraElfDiscoveredI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p101\\n6743_CameraElfDiscoveredI.lua")
   	Camera:ScriptStart()
]]

-- totale gegenschuss
CameraElfDiscoveredII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p101\\n6743_CameraElfDiscoveredII.lua")
   	Camera:ScriptStart()
]]

-- grim nah
CameraElfDiscoveredIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p101\\n6743_CameraElfDiscoveredIII.lua")
   	Camera:ScriptStart()
]]

-- Lea nah
CameraElfDiscoveredIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p101\\n6743_CameraElfDiscoveredIV.lua")
   	Camera:ScriptStart()
]]

-- eisboden
CameraElfDiscoveredV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p101\\n6743_CameraElfDiscoveredV.lua")
   	Camera:ScriptStart()
]]

-- drache 1
CameraElfDiscoveredVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p101\\n6743_CameraElfDiscoveredVI.lua")
   	Camera:ScriptStart()
]]

-- drache 2
CameraElfDiscoveredVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p101\\n6743_CameraElfDiscoveredVII.lua")
   	Camera:ScriptStart()
]]

-- drache 3
CameraElfDiscoveredVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n6743_CameraElfDiscoveredVIII.lua")
   	Camera:ScriptStart()
]]

-- drache 4
CameraElfDiscoveredIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n6743_CameraElfDiscoveredIX.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "ElfDiscovered", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet wenn spieler in die Naehe der Eiselfen kommt und diese alle tot sind
		--FigureInRange{X = 231, Y = 428, Range = 10, NpcId = 0}, 
		FigureDead {NpcId = 6743}, -- eiselfe tot
		FigureDead {NpcId = 6744}, -- eiselfe tot
		FigureDead {NpcId = 6745}, -- eiselfe tot
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},		-- avatar
		SetNoFightFlagTrue {NpcId = 7011}, 	-- grim
		SetNoFightFlagTrue {NpcId = 7010},	-- lena
		SetGlobalFlagFalse {Name = "FollowGrim"},
		SetGlobalFlagTrue  {Name = "CutsceneInitAryn"},		
	},	
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = CameraElfDiscoveredII},	
			SetGlobalFlagTrue {Name = "CutsceneInitElfDiscovered"},
			SetGlobalFlagTrue {Name = "CutsceneInitElfDiscoveredLena"},		
		},
		[10] =
		{
						
			Goto {NpcId = 0, X = 233, Y = 418, WalkMode = Run},					
		},
		[50] = 
		{
			--SetNoFightFlagTrue {NpcId = 7011}, 	-- grim
			--SetNoFightFlagTrue {NpcId = 7010},	-- lena		
			Goto {NpcId = 0, X = 233, Y = 418, WalkMode = Run},    -- avatar
			Goto {NpcId = 7011, X = 231, Y = 417, WalkMode = Run}, -- grim
			Goto {NpcId = 7010, X = 231, Y = 419, WalkMode = Run}, -- lena	
			LookAtDirection {NpcId = 7235, Direction = South},
		},
		[80] =
		{
			CutSceneSay {Tag = "cs03MainCharP101_001" , NpcId = 0, String = "Wartet!"},
			LookAtFigure {NpcId = 0, Target = 7011},
			LookAtFigure {NpcId = 7010, Target = 0},						
		},
		[110] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs03GrimP101_001" , NpcId = 7011, String = "Komm schon, wir müssen weiter!"},	
			Goto {NpcId = 7011, X = 235, Y = 413, WalkMode = Run}, -- grim			
			LookAtFigure {NpcId = 0, Target = 7011},
			LookAtFigure {NpcId = 7010, Target = 0},					
		},
		[140] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs03MainCharP101_002" , NpcId = 0, String = "Das waren Elfen! Warum werden wir von Elfen angegriffen? Hier, mitten in Urgath?"},		
		},
		[180] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraElfDiscoveredIV},				
			CutSceneSay {Tag = "cs03LenaP101_001" , NpcId = 7010, String = "Rede Du, Grim."},	
			Goto {NpcId = 7010, X = 230, Y = 419, WalkMode = Walk}, -- lena					
		},
		[210] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraElfDiscoveredIII},
			CutSceneSay {Tag = "cs03GrimP101_002" , NpcId = 7011, String = "Kennst du die Geschichte von Aryn, dem Frostweber, und seinem Bund mit den Elfen?"},	
			Goto {NpcId = 7011, X = 233, Y = 416, WalkMode = Walk}, -- grim					
		},
		[260] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs03MainCharP101_003" , NpcId = 0, String = "Die Sage vom Winterdrachen? Natürlich, aber ..."},		
		},
		[290] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cs03GrimP101_003" , NpcId = 7011, String = "Mehr als nur eine Sage! Der Drache ist ebenso wirklich, wie Cenwen, die Königin, die unter dem Eis für ihn singt."},		
		},
		[320] =
		{
			ExecuteCameraScript{Script = CameraElfDiscoveredIX},
		},
		[360] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraElfDiscoveredIV},
			CutSceneSay {Tag = "cs03LenaP101_002" , NpcId = 7010, String = "Seit Tausenden von Jahren..."},		
		},
		[400] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraElfDiscoveredIII},			
			CutSceneSay {Tag = "cs03GrimP101_004" , NpcId = 7011, String = "Aber nun nicht mehr. Die Eiselfen selbst haben die Königin aus dem Gletscher geraubt! Auf dass Aryn wieder aufsteige und suchend über die Lande fliege."},		
		},
		[470] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs03LenaP101_003" , NpcId = 7010, String = "Und diese mit ewigem Winter bedeckt..."},		
		},			
		[500] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraElfDiscoveredIV},			
			CutSceneSay {Tag = "cs03GrimP101_005" , NpcId = 7011, String = "Wie vor Tausenden von Jahren."},		
		},																			
		[530] =
		{
			WaitForEndOfSpeech,				
			ExecuteCameraScript{Script = CameraElfDiscoveredIII},			
			Goto {NpcId = 7011, X = 235, Y = 413, WalkMode = Walk}, -- grim						

			CutSceneSay {Tag = "cs03MainCharP101_004" , NpcId = 0, String = "Aber den Elfen war ihr Bund mit dem Drachen immer heilig!"},		
		},		
		[570] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs03GrimP101_006" , NpcId = 7011, String = "Heilig? Heilig nur, weil er ihnen die Macht der Eismagie schenkte!"},	
			LookAtFigure {NpcId = 7011, Target = 0},	
		},	
		[610] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs03GrimP101_007" , NpcId = 7011, String = "Was kann es Besseres für sie geben, als einen ewigen Winter, in dem sie absolute Macht besitzen?"},
			Goto {NpcId = 7011, X = 233, Y = 416, WalkMode = Walk}, -- grim							
		},		
		[660] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs03MainCharP101_005" , NpcId = 0, String = "Also kämpft Ihr und der Widerstand nicht mehr gegen die Orks, sondern gegen die Eiselfen?"},		
		},	
		[700] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs03GrimP101_008" , NpcId = 7011, String = "Ja. Sie kamen vor einem Mond und vertrieben die Orks aus Mirraw Thur. Dann verbargen sie die Königin in einem Gefängnis oben in der Stadt. Wir versuchen, sie mit Hilfe der Flüchtlinge zu befreien."},		
		},												
		[760] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraElfDiscoveredIV},			
			CutSceneSay {Tag = "cs03LenaP101_004" , NpcId = 7010, String = "Ich konnte es zuerst auch nicht glauben. Aber Grim hat recht, wer sonst kennt das Versteck der Königin? Wer sonst überlebt den ewigen Winter, den der Drache bringt?"},	
			Goto {NpcId = 7010, X = 231, Y = 415, WalkMode = Walk}, -- lena					
		},	
		[820] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs03MainCharP101_006" , NpcId = 0, String = "Hm. Wer sagt, dass Schönheit immer ein reines Herz haben muss. Wenn dies Euer Kampf ist, so ist es nun auch meiner."},	
		},					
		[880] = 
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 7011},
			SetNoFightFlagFalse {NpcId = 7010},	
			Follow {Target = Avatar, NpcId = 7011},	
			Follow {Target = Avatar, NpcId = 7010}, --Follow Grim und Lea neu gesetzt nach Cutscene-Goto
			SetGlobalTimeStamp{ Name = "P101TimerPatrolWarnung"},
			SetGlobalFlagFalse {Name = "CutsceneInitElfDiscovered"},
			SetGlobalFlagFalse {Name = "CutsceneInitElfDiscoveredLena"},
			SetGlobalFlagTrue {Name = "ArynDespawn"},
			QuestBegin{QuestId = 754, SubQuestActivate = FALSE}, --begin Quest Eiselfenpatrouillen ausweichen				
		},
		
	},
}
