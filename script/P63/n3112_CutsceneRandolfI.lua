-----------------------------------------------------------------------
--
--	Randolf Monument und Loot Hinweis
--
-----------------------------------------------------------------------

CameraRandolfI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p63\\n3112_CameraRandolfI.lua")
   	Camera:ScriptStart()
]]

CameraRandolfII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,15,1,"script\\p63\\n3112_CameraRandolfII.lua")
   	Camera:ScriptStart()
]]

CameraRandolfIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p63\\n3112_CameraRandolfIII.lua")   	
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Randolf 1", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalTimeElapsed {Name = "TimerCutsceneRohen", Seconds = 8, UpdateInterval = 5},
		FigureInRange {X = 134, Y = 246 , Range = 10, NpcId = 0},		
		IsGlobalFlagTrue {Name = "DarkRohenDisappeared", UpdateInterval = 20},
		FigureDead {NpcId = 2916},
		FigureAlive {NpcId = 3112},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:		
		-- Goto {X = 131 , Y = 246, NpcId = 0, Range = 0, WalkMode = Walk},
		-- Goto {X = 133 , Y = 247, NpcId = 3112, Range = 0, WalkMode = Run},
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 3112},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:			
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraRandolfI},	
			Goto {X = 131 , Y = 246, NpcId = 0, Range = 0, WalkMode = Walk},	-- avatar
			Goto {X = 133 , Y = 247, NpcId = 3112, Range = 0, WalkMode = Run},	-- randolf der heiler
			LookAtFigure{NpcId = 0, Target = 3112},
			LookAtFigure{Target = 0, NpcId = 3112},				
		},
		[50] =
		{
			LookAtFigure{NpcId = 0, Target = 3112},
			LookAtFigure{Target = 0, NpcId = 3112},
			CutSceneSay {Tag = "cutrandolfGrf001", NpcId = 3112, String = "Was ist hier geschehen?"},			
		},
		[80] = 
		{
			WaitForEndOfSpeech,					
			LookAtFigure{NpcId = 0, Target = 3112},
			LookAtFigure{Target = 0, NpcId = 3112},			
			CutSceneSay {Tag = "cutmaincharGrf003", NpcId = 0, String = "Verrat! Ich muss auf dem schnellsten Weg nach Graufurt!"},
		},
		[130] = 
		{
			WaitForEndOfSpeech,					
			LookAtFigure{NpcId = 0, Target = 3112},
			LookAtFigure{Target = 0, NpcId = 3112},				
			CutSceneSay {Tag = "cutrandolfGrf002", NpcId = 3112, String = "Berggoblins haben den Weg dorthin blockiert! Sie errichten bereits ein Lager!"},
		},
		[170] = 
		{
			WaitForEndOfSpeech,					
			ExecuteCameraScript{Script = CameraRandolfII},	
			LookAtFigure{NpcId = 0, Target = 3112},
			LookAtFigure{Target = 0, NpcId = 3112},				
			CutSceneSay {Tag = "cutrandolfGrf003", NpcId = 3112, String = "Es gibt hier ein Runenmonument ganz in der Nähe! Beschwört dort eine Armee! Nur so wird Euch der Durchbruch nach Graufurt gelingen!"},
		},
		[220] = 
		{
			WaitForEndOfSpeech,	
		},
		[230] =
		{				
			ExecuteCameraScript{Script = CameraRandolfIII},				
			LookAtFigure{NpcId = 0, Target = 3112},
			LookAtFigure{Target = 0, NpcId = 3112},					
			CutSceneSay {Tag = "cutmaincharGrf004", NpcId = 0, String = "Ich muss zuerst diesen Verräter durchsuchen! Die Schatulle muss auf dem schnellsten Weg zum Orden gebracht werden!"},
		},
		[270] = 
		{
			WaitForEndOfSpeech,					
			SetGlobalTimeStamp {Name = "CutsceneRandolfEnd"},
			SetGlobalFlagTrue {Name = "RandolfGeht"},
			RevealUnExplored {X = 192, Y = 292, Range = 7},	
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 3112},						
		},
	},
}

