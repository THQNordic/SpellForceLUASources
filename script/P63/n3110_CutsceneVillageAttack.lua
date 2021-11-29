-----------------------------------------------------------------------
--
--	Village Attack
--
-----------------------------------------------------------------------

CameraVillageAttackI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\p63\\n3110_CameraVillageAttackI.lua")
   	Camera:ScriptStart()
]]

CameraVillageAttackII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\p63\\n3110_CameraVillageAttackII.lua")
   	Camera:ScriptStart()
]]

CameraVillageAttackIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\p63\\n3110_CameraVillageAttackIII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Village Attack +Avatar", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		PlayerUnitInRange {X = 300, Y = 179, Range = 5, UpdateInterval = 15},
		FigureInRange {NpcId = 0, X = 300, Y = 179, Range = 5, UpdateInterval = 15},
		IsGlobalFlagFalse {Name = "VillageAttackOver", UpdateInterval = 1},				
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetGlobalFlagTrue {Name = "OrcAttack"},
		QuestBegin{QuestId = 438},
		QuestSolve{QuestId = 437},
		SetNoFightFlagTrue {NpcId = 0},
		SetEffect {TargetType = World, X = 307, Y = 234, Length = 0, Effect = "BuildingFire"},
		SetEffect {TargetType = World, X = 295, Y = 240, Length = 0, Effect = "BuildingFire"},
		SetEffect {TargetType = World, X = 289, Y = 258, Length = 0, Effect = "BuildingFire"},
		SetEffect {TargetType = World, X = 313, Y = 225, Length = 0, Effect = "BuildingFire"},
		SetEffect {TargetType = World, X = 294, Y = 226, Length = 0, Effect = "BuildingFire"},
		SetEffect {TargetType = World, X = 278, Y = 259, Length = 0, Effect = "BuildingFire"},
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
			ExecuteCameraScript {Script = CameraVillageAttackI},
			Goto {NpcId = 3110, X = 297, Y = 176, WalkMode = Run},	-- bauer
			Goto {NpcId = 0, X = 294, Y = 175},	-- avatar
		},
		[40] = 
		{
			CutSceneSay {Tag = "cutbauerGrf001", NpcId = 3110, String = "Orks! Sie brennen alles nieder! Wo sind die Wachen?"},
		},
		[80] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript {Script = CameraVillageAttackII},
			LookAtFigure {NpcId = 0, Target = 3110},
			LookAtFigure {NpcId = 3110, Target = 0},
		},
		[110] = 
		{
			ExecuteCameraScript {Script = CameraVillageAttackIII},
			CutSceneSay {Tag = "cutbauerGrf002", NpcId = 3110, String = "Helft uns bei der Verteidigung, schnell! Oder wir sind verloren!"},
		},
		[150] = 
		{
			WaitForEndOfSpeech,			
			Goto {NpcId = 3110, X = 292, Y = 258, WalkMode = Run},	-- bauer
			RevealUnExplored {X = 298, Y = 248, Range = 10},
			SetNoFightFlagFalse {NpcId = 0},
			SetGlobalFlagTrue {Name = "VillageAttackOver"},
		},
	},
}


CreateCutScene
{
	Name = "Village Attack -Avatar", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		PlayerUnitInRange {X = 300, Y = 179, Range = 5, UpdateInterval = 15},
		Negated (FigureInRange {NpcId = 0, X = 300, Y = 179, Range = 5, UpdateInterval = 15}),
		IsGlobalFlagFalse {Name = "VillageAttackOver", UpdateInterval = 1},		
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetGlobalFlagTrue {Name = "OrcAttack"},
		QuestBegin{QuestId = 438},
		QuestSolve{QuestId = 437},
		SetNoFightFlagTrue {NpcId = 0},
		SetEffect {TargetType = World, X = 307, Y = 234, Length = 0, Effect = "BuildingFire"},
		SetEffect {TargetType = World, X = 295, Y = 240, Length = 0, Effect = "BuildingFire"},
		SetEffect {TargetType = World, X = 289, Y = 258, Length = 0, Effect = "BuildingFire"},
		SetEffect {TargetType = World, X = 313, Y = 225, Length = 0, Effect = "BuildingFire"},
		SetEffect {TargetType = World, X = 294, Y = 226, Length = 0, Effect = "BuildingFire"},
		SetEffect {TargetType = World, X = 278, Y = 259, Length = 0, Effect = "BuildingFire"},
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
			ExecuteCameraScript {Script = CameraVillageAttackI},
			Goto {NpcId = 3110, X = 297, Y = 176, WalkMode = Run},	-- bauer
			--Goto {NpcId = 0, X = 294, Y = 175},	-- avatar
		},
		[40] = 
		{
			CutSceneSay {Tag = "cutbauerGrf001", NpcId = 3110, String = "Orks! Sie brennen alles nieder! Wo sind die Wachen?"},
		},
		[80] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript {Script = CameraVillageAttackII},
			--LookAtFigure {NpcId = 0, Target = 3110},
			--LookAtFigure {NpcId = 3110, Target = 0},
		},
		[110] = 
		{
			ExecuteCameraScript {Script = CameraVillageAttackIII},
			CutSceneSay {Tag = "cutbauerGrf002", NpcId = 3110, String = "Helft uns bei der Verteidigung, schnell! Oder wir sind verloren!"},
		},
		[150] = 
		{
			WaitForEndOfSpeech,			
			Goto {NpcId = 3110, X = 292, Y = 258, WalkMode = Run},	-- bauer
			RevealUnExplored {X = 298, Y = 248, Range = 10},
			SetNoFightFlagFalse {NpcId = 0},
			SetGlobalFlagTrue {Name = "VillageAttackOver"},			
		},
	},
}


-- die brände nach und nach löschen...
OnOneTimeEvent
{
	Conditions = {
		QuestState{QuestId = 439 , State = StateActive},
	},
	Actions = {
		SetNpcTimeStamp{Name = "VillageBurningTimer"},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "VillageBurningTimer", Seconds = 7},
	},
	Actions = {
		StopEffect {X = 289, Y = 258},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "VillageBurningTimer", Seconds = 15},
	},
	Actions = {
		StopEffect {X = 313, Y = 225},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "VillageBurningTimer", Seconds = 20},
	},
	Actions = {
		StopEffect {X = 307, Y = 234},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "VillageBurningTimer", Seconds = 27},
	},
	Actions = {
		StopEffect {X = 278, Y = 259},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "VillageBurningTimer", Seconds = 44},
	},
	Actions = {
		StopEffect {X = 295, Y = 240},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "VillageBurningTimer", Seconds = 60},
	},
	Actions = {
		StopEffect {X = 294, Y = 226},
	},
}

