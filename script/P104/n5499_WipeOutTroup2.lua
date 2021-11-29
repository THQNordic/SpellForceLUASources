--WipeOutTroup2

-- nur spawnen wenn Flüchtlinge weiterziehn um das Lager zu wipen
SpawnOnlyWhen
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "FugitivesMovingToPosition2"},
	},
}

Respawn
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 60,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "FugitivesMovingToPosition2"},
		IsGlobalFlagFalse {Name = "NewSpawn"},
	},
	Actions =
	{
		Follow {Target = NpcId, NpcId = NpcId+1},
		Follow {Target = NpcId, NpcId = NpcId+2},
		Follow {Target = NpcId, NpcId = NpcId+3},
		Follow {Target = NpcId, NpcId = NpcId+4},
		Follow {Target = NpcId, NpcId = NpcId+5},
		Follow {Target = NpcId, NpcId = NpcId+6},
		Follow {Target = NpcId, NpcId = NpcId+7},
		Follow {Target = NpcId, NpcId = NpcId+8},
		Follow {Target = NpcId, NpcId = NpcId+9},
		Follow {Target = NpcId, NpcId = NpcId+10},
	}
}

Respawn
{
	X = SecondSpawnX, Y = SecondSpawnY, NoSpawnEffect = TRUE, WaitTime = 60,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "NewSpawn"},
		Negated (QuestState {QuestId = 615, State = StateSolved})
	},
	Actions =
	{
		Follow {Target = NpcId, NpcId = NpcId+1},
		Follow {Target = NpcId, NpcId = NpcId+2},
		Follow {Target = NpcId, NpcId = NpcId+3},
		Follow {Target = NpcId, NpcId = NpcId+4},
		Follow {Target = NpcId, NpcId = NpcId+5},
		Follow {Target = NpcId, NpcId = NpcId+6},
		Follow {Target = NpcId, NpcId = NpcId+7},
		Follow {Target = NpcId, NpcId = NpcId+8},
		Follow {Target = NpcId, NpcId = NpcId+9},
		Follow {Target = NpcId, NpcId = NpcId+10},
	}
}

-- Wenn der Angriff auf die Festung losgeht gehen die Wipe outer zum Portal und despawnen
OnIdleGoHome
{
	X = PortalX, Y = PortalY, Direction = NorthWest, WalkMode = Run, Range = 2,
	Conditions =
	{	
		IsGlobalFlagFalse {Name = "APW04"},
		IsGlobalFlagTrue {Name = "Last1"},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "FigurDespawn"},
	}
}

Despawn
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "FigurDespawn"},
	},
}

OnAttackPattern
{
	Name = "APW03",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionSouthX, Y = JunctionSouthY, WalkMode = Run, Direction = East},
		[2] = {X = JunctionCampEntrySouthX, Y = JunctionCampEntrySouthY, WalkMode = Run, Direction = East},
		[3] = {X = AttackOrkMonumentX, Y = AttackOrkMonumentY, WalkMode = Run, Direction = East},
	},
	
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = AttackOrkMonumentX, Y = AttackOrkMonumentY, WalkMode = Run, GuardTime = 30},
}

OnAttackPattern
{
	Name = "APWO4",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 30,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = AttackFugitivesX, Y = AttackFugitivesY, WalkMode = Run, Direction = East},
	},
	PatternDelta = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 20,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = Flucht3X, Y = Flucht3Y, WalkMode = Run, Direction = East},
	},
	PatternOmega = 
	{
		Retries = 3,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 40,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = AttackElfMonumentX, Y = AttackElfMonumentY, WalkMode = Run, Direction = SouthEast},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = AttackElfMonumentX, Y = AttackElfMonumentY, WalkMode = Run, GuardTime = 30},
}