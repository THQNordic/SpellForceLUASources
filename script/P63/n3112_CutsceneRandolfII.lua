-----------------------------------------------------------------------
--
--	Randolfs Hinweis auf Loot
--
-----------------------------------------------------------------------

CameraRandolfIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p63\\n3112_CameraRandolfIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "RandolfII", CameraScript = "", PlayOnlyOnce = FALSE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:	
		Negated(PlayerHasItem {ItemId = 3197}),
		IsGlobalTimeElapsed {Name = "CutsceneRandolfEnd", Seconds = 12, UpdateInterval = 30 },
		FigureAlive {NpcId = 3112},
		FigureInRange {X = 162, Y = 256 , Range = 12, NpcId = 0},	
		IsGlobalFlagFalse {Name = "Randolf_II_Running"},
		IsGlobalFlagFalse {Name = "RandolfHatFertig"},	
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetGlobalFlagTrue {Name = "Randolf_II_Running"},
		SetNoFightFlagTrue {NpcId = 0},		
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
			ExecuteCameraScript{Script = CameraRandolfIV},	
			LookAtFigure {NpcId = 3112, Target = 0},
			LookAtFigure {NpcId = 0, Target = 3112},	
			CutSceneSay {Tag = "cutrandolfGrf004", NpcId = 3112, String = "Wolltet Ihr nicht den Verräter durchsuchen?"},
			Goto {X = 133, Y = 245, NpcId = 0, Range = 0, WalkMode = Run},
			-- Goto {X = 133, Y = 247, NpcId = 3112, Range = 0, WalkMode = Walk},			
		},
		[60] = 
		{
			WaitForEndOfSpeech,					
			SetGlobalFlagFalse {Name = "Randolf_II_Running"},
			SetNoFightFlagFalse {NpcId = 0},						
		},
	},
}

