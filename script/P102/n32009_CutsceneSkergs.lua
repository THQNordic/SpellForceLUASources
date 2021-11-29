-----------------------------------------------------------------------
--
--	HelpSkergs
--
-----------------------------------------------------------------------

-- fahrt skergs kommen an
CameraSkergsI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p102\\n5567_CameraSkergsI.lua")
   	Camera:ScriptStart()
]]

-- skergs nah
CameraSkergsII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p102\\n5567_CameraSkergsII.lua")
   	Camera:ScriptStart()
]]

-- lea und grim nah
CameraSkergsIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,34,1,"script\\p102\\n5567_CameraSkergsIII.lua")
   	Camera:ScriptStart()
]]

-- alle zusammen fahrt
CameraSkergsIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,34,1,"script\\p102\\n5567_CameraSkergsIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "HelpSkergs", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
		-- IsGlobalFlagTrue {Name = "Stopper"},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene: 
		Goto{NpcId = 0,    X = 40, Y = 75, Range = 0, WalkMode = Walk}, -- avatar
		Goto{NpcId = 5567, X = 43, Y = 71, Range = 0, WalkMode = Run}, -- skerg 1
		Goto{NpcId = 5568, X = 45, Y = 71, Range = 0, WalkMode = Run}, -- skerg 2						
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:
			Goto{NpcId = 5567, X = 43, Y = 71, Range = 0, WalkMode = Run}, -- skerg 1
			Goto{NpcId = 5568, X = 45, Y = 71, Range = 0, WalkMode = Run}, -- skerg 2				
		},
		[10] =
		{
			Goto{NpcId = 5567, X = 43, Y = 71, Range = 0, WalkMode = Run}, -- skerg 1
			Goto{NpcId = 5568, X = 45, Y = 71, Range = 0, WalkMode = Run}, -- skerg 2	
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraSkergsI},
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},
		},
		[80] =
		{
			CutSceneSay {Tag = "cs04aSkerg1P102_001" , NpcId = 5567, String = "Was ist das?"},
		},
		[100] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSkergsII},
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aSkerg2P102_001" , NpcId = 5568, String = "Ooh! Runenkrieger! Ooh!"},
		},		
		[130] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aSkerg1P102_002" , NpcId = 5567, String = "Runenkrieger mächtig..."},
		},	
		[160] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aSkerg2P102_002" , NpcId = 5568, String = "... helfen Skergs..."},
		},				
		[190] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSkergsIII},
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aGrimP102_001" , NpcId = 5951, String = "Wir sind in Eile, Wicht!"}, -- grim
		},
		[220] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aLenaP102_001" , NpcId = 6311, String = "Was ist denn mit euch geschehen?"}, -- lena
		},	
		[250] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSkergsII},
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aSkerg1P102_003" , NpcId = 5567, String = "Janina... Sie ist sehr krank..."}, -- skerg 1
		},		
		[280] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aSkerg2P102_003" , NpcId = 5568, String = "... Wir bringen Janina zu Hulu, großem Heiler..."}, -- skerg 2
		},								
		[310] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSkergsIV},
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aSkerg1P102_004" , NpcId = 5567, String = "Aber garstige Katzen uns angreifen!"}, -- skerg 1
		},		
		[340] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aSkerg2P102_004" , NpcId = 5568, String = "Wir getrennt von Janina! Janina verloren!"}, -- skerg 2
		},	
		[370] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aSkerg1P102_005" , NpcId = 5567, String = "Ihr Janina helfen! Nicht weit im Norden sie ist!"}, -- skerg 1
		},
		[400] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aSkerg2P102_005" , NpcId = 5568, String = "Ja! Ihr Janina helfen! Geht und erschlagt garstige Katzenwesen!"}, -- skerg 2
		},									
		[430] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSkergsIII},
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aLenaP102_002" , NpcId = 6311, String = "Janina..."}, -- lea
		},			
		[460] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aGrimP102_002" , NpcId = 5951, String = "Sie gehörte zum Widerstand."}, -- grim
		},			
		[490] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aLenaP102_003" , NpcId = 6311, String = "Wir glaubten, sie sei tot. Sie war der Grund, dass Dunhan sich mit allen zerstritt. Wir müssen ihr helfen!"}, -- lea
		},			
		[530] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aGrimP102_003" , NpcId = 5951, String = "Ja, vielleicht kann sie uns zu Dunhan führen."}, -- grim
		},		
		[560] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSkergsII},
			LookAtFigure {NpcId = 0, Target = 5567},
			LookAtFigure {NpcId = 5567, Target = 0},
			LookAtFigure {NpcId = 5568, Target = 0},
			LookAtFigure {NpcId = 6311, Target = 5567},
			LookAtFigure {NpcId = 5951, Target = 5567},			
			CutSceneSay {Tag = "cs04aSkerg1P102_006" , NpcId = 5567, String = "Ja Norden Ihr gehen, folgen Weg bis Kreuzung ... Dort Janina irgendwo ..."}, -- skerg 1
		},			
		[600] = 
		{
			WaitForEndOfSpeech,
			QuestBegin{QuestId = 560},
			QuestBegin{QuestId = 561},
			SetGlobalFlagTrue { Name = "DialogStartEnded"},
			ChangeFigureOwner{ NpcId = 5567},
			ChangeFigureOwner{ NpcId = 5568},			
			RevealUnExplored { X = 70 , Y = 124 , Range = 25 },		
		},
	},
}
