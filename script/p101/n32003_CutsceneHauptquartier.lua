-----------------------------------------------------------------------
--
--	Hauptquartier
--
-----------------------------------------------------------------------

-- totale
CameraHauptquartierI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,100,1,"script\\p101\\n5536_CameraHauptquartierI.lua")
   	Camera:ScriptStart()
]]

-- halbnah aedele kommt aus dem haus
CameraHauptquartierII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraHauptquartierII.lua")
   	Camera:ScriptStart()
]]

-- gegenschuss
CameraHauptquartierIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,100,1,"script\\p101\\n5536_CameraHauptquartierIII.lua")
   	Camera:ScriptStart()
]]

-- lea 
CameraHauptquartierIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p101\\n5536_CameraHauptquartierIV.lua")
   	Camera:ScriptStart()
]]

-- grim still
CameraHauptquartierV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p101\\n5536_CameraHauptquartierV.lua")
   	Camera:ScriptStart()
]]

-- lea von hinten
CameraHauptquartierVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p101\\n5536_CameraHauptquartierVI.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Hauptquartier", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "HQistZerstört", UpdateInterval = 15},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetGlobalFlagTrue {	Name = "CutsceneInitHauptquartierLena" },
		SetGlobalFlagTrue {	Name = "CutsceneInitHauptquartierGrim" },
		SetNoFightFlagTrue {NpcId = 0},		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = CameraHauptquartierII},
		},
		[20] = 
		{
			ChangeRace {NpcId = 5938, Race = 152}, -- statthalterin wird neutral
			SetNoFightFlagTrue {NpcId = 5938},	
			SetNoFightFlagTrue {NpcId = 7010},
			SetNoFightFlagTrue {NpcId = 7011},							
			LookAtFigure{NpcId = 5938, Target = 0}, -- Statthalterin.	
			LookAtFigure{NpcId = 7011, Target = 5938}, -- grim.
			LookAtFigure{NpcId = 7010, Target = 5938}, -- lea.
			LookAtFigure{NpcId = 0, Target = 5938}, -- avatar.
			Goto{X = 223, Y = 295, NpcId = 5938, Range = 0, WalkMode = Walk}, --Statthalterin			
			CutSceneSay {Tag = "cs05PriestessP101_001" , NpcId = 5938, String = "Ihr Narren! Ich sollte euch vernichten! Ihr wisst ja gar nicht, gegen was ihr kämpft!"},
		},
		[50] = 
		{ 
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraHauptquartierV},	
			CGdsFigureSetHealth:new(5938, 1),		
			Goto{X = 223, Y = 296, NpcId = 7011, Range = 0, WalkMode = Walk}, --Grim auf aedele zu	
						
			--CutSceneSay {Tag = "cs05GrimP101_001" , NpcId = 7011, String = "Oh, entschuldigt, habe ich Euch unterbrochen? Danke für Eure Schlüssel, alte Hexe!"},	
								
		},
		[70] = 
		{ 
			WaitForEndOfSpeech,
			AttackTarget {Target = 5938, NpcId = 7011, FriendlyFire = TRUE}, --Grim greift Statthalterin an				
			
		},
		[80] =
		{
			WaitForEndOfSpeech,
			--AttackTarget {Target = 5938, NpcId = 7011, FriendlyFire = TRUE}, --Grim greift Statthalterin an	
			CutSceneSay {Tag = "cs05GrimP101_001" , NpcId = 7011, String = "Oh, entschuldigt, habe ich Euch unterbrochen? Danke für Eure Schlüssel, alte Hexe!"},		
		},
		[120] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraHauptquartierVI},						
			LookAtFigure{NpcId = 7010, Target = 7011}, -- lea schaut grim an.
			CutSceneSay {Tag = "cs05LenaP101_001" , NpcId = 7010, String = "Grim, was hast du getan?"},	
			Goto{X = 222, Y = 297, NpcId = 7010, Range = 0, WalkMode = Walk}, --Lea läuft zu Grim
		},
		[150] =
		{
			ExecuteCameraScript{Script = CameraHauptquartierIV},
			LookAtFigure{NpcId = 7010, Target = 7011}, -- Lea.	
			LookAtFigure{NpcId = 7011, Target = 7010}, -- grim.						
		},
		[160] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 7010, Target = 7011}, -- Lea.	
			LookAtFigure{NpcId = 7011, Target = 7010}, -- grim.
			CutSceneSay {Tag = "cs05GrimP101_002" , NpcId = 7011, String = "Ich habe uns vor ihrer Zauberei bewahrt, Liebste. Ha!"},
		},
		[190] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHauptquartierV},				
			LookAtFigure{NpcId = 7010, Target = 7011}, -- Lea.	
			LookAtFigure{NpcId = 7011, Target = 7010}, -- grim.
			CutSceneSay {Tag = "cs05GrimP101_003" , NpcId = 7011, String = "Und ich habe die Schlüssel der weißen Priesterin, das zählt! Damit kann ich das Gefängnis und das Feuertor öffnen!"},
		},
		[250] =
		{
			WaitForEndOfSpeech,				
			ExecuteCameraScript{Script = CameraHauptquartierI},			
			CutSceneSay {Tag = "cs05GrimP101_004" , NpcId = 7011, String = "Los, zum Gefängnis!"}, 
		},
		[290] = 
		{
			SetGlobalFlagTrue {Name = "CutHQgelaufen"},
			QuestBegin{QuestId = 602}, -- begin Quest Der Gefangene
			QuestBegin{QuestId = 603}, -- begin Quest Zum Gefängnis
			SetNoFightFlagFalse {NpcId = 7011},
			SetNoFightFlagFalse {NpcId = 7010},
			SetNoFightFlagFalse {NpcId = 0},
			SetGlobalFlagFalse { Name = "CutsceneInitHauptquartierLena" },	
			SetGlobalFlagFalse { Name = "CutsceneInitHauptquartierGrim" },
			ChangeRace {NpcId = 7011, Race = 152}, -- grim wird neutral
			Follow {Target = 0, NpcId = 7010},	--neues Follow für Lena auf Avatar
			Follow {Target = 0, NpcId = 7011},	--neues Follow für Grim auf Avatar
			
		},
	},
}
