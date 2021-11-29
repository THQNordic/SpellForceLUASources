-----------------------------------------------------------------------
--
--	Gabar Setup for Journey 4
--
-----------------------------------------------------------------------

CameraGabarI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p63\\n2860_CameraGabarI.lua")
   	Camera:Restore()
   	Camera:ScriptStart()
]]

CameraGabarII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p63\\n2860_CameraGabarII.lua")
   	Camera:Restore()
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "GabarSetupJourney4", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
--		IsGlobalState{Name = "Plot", State = "JourneyFour"},
		FigureInRange {X = 418, Y = 280, Range = 6, NpcId = 0},
		QuestState {QuestId = 322, State = StateActive, UpdateInterval = 15},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},		
		SetNoFightFlagTrue {NpcId = 2860},	
		RemoveDialog {NpcId = 2860},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraGabarI},	
			LookAtFigure{NpcId = 2860, Target = 0},	
			LookAtFigure{NpcId = 0, Target = 2860},		
			Goto{NpcId = 0, X = 419, Y = 281, Range = 0, WalkMode = Walk},
			Goto{NpcId = 2860, X = 421, Y = 283, Range = 0, WalkMode = Walk},											
		},
		[50] = 
		{ 
			LookAtFigure{NpcId = 2860, Target = 0},	
			CutSceneSay {Tag = "cutgabarGrf001", NpcId = 2860, String = "Gut, dass Ihr da seid! Ihr müsst sofort los!"},
			LookAtFigure{NpcId = 2860, Target = 0},	
			LookAtFigure{NpcId = 0, Target = 2860},				
		},
		[90] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraGabarII},						
			LookAtFigure{NpcId = 2860, Target = 0},	
			LookAtFigure{NpcId = 0, Target = 2860},	
			CutSceneSay {Tag = "cutmaincharGrf012", NpcId = 0, String = "Wo ist Sartarius?"},
		},
		[120] = 
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 2860, Target = 0},	
			LookAtFigure{NpcId = 0, Target = 2860},	
			CutSceneSay {Tag = "cutgabarGrf002", NpcId = 2860, String = "Aufgebrochen, mit dem Heer des Ordens! Sie wollen Euch den Weg ebnen, ins Herz der feindlichen Armee!"},
		},
		[200] = 
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 2860, Target = 0},	
			LookAtFigure{NpcId = 0, Target = 2860},	
			CutSceneSay {Tag = "cutmaincharGrf013", NpcId = 0, String = "Wie viele sind mit ihm gezogen?"},
		},
		[240] = 
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 2860, Target = 0},	
			LookAtFigure{NpcId = 0, Target = 2860},	
			CutSceneSay {Tag = "cutgabarGrf003", NpcId = 2860, String = "Alle! Die ganze Armee! Jeder Ritter, jeder Knappe! Sie werden die Blockade in den Frostmarschen durchschlagen!"},
		},
		[340] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGabarI},				
			LookAtFigure{NpcId = 2860, Target = 0},	
			LookAtFigure{NpcId = 0, Target = 2860},	
			CutSceneSay {Tag = "cutmaincharGrf014", NpcId = 0, String = "Oder bei dem Versuch umkommen. Also gut, zu den Frostmarschen!"},
			SetGlobalState{Name = "Plot" , State = "JourneyFour" },
			QuestSolve{QuestId = 322},
			QuestSolve{QuestId = 265},
			QuestBegin{QuestId = 554},
			QuestBegin{QuestId = 555},
		},
		[410] = 
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},		
			SetNoFightFlagFalse {NpcId = 2860},	
			EnableDialog {NpcId = 2860},
			SetDialogType{Type = SideQuest , NpcId = 2860}						
		},
	},
}

