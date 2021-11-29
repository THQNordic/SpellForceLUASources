-- TRUPPE 1, Anführer

-- erst spawnen wenn die letzten flüchtlinge aus dem portal sind
SpawnOnlyWhen
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Zwei"},
	},
	Actions = 
	{
		SetGlobalTimeStamp {Name = "RebirthChef2"},
	},
}

-- respawn erst wenn der ganze trupp tot ist oder der chef zu lange tot ist, damit weitergelaufen wird
Respawn
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 60,
	Conditions = 
	{ 
		UND
		(
			ODER 
			(
				UND 
				(
					FigureDead {NpcId = 5392},
					IsGlobalTimeElapsed {Name = "RebirthChef2", Seconds = 300}
				),
				IsGlobalCounter{Name = "DarkElfAttackGroup2DeadCounter", Operator = IsGreaterOrEqual, Value = 10}
			),
			IsNpcFlagFalse {Name = "FigurDespawn"}
		)
	},
	Actions = 
	{
		ResetGlobalCounter{Name = "DarkElfAttackGroup2DeadCounter"},
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
	},
	DeathActions =
	{
		SetGlobalTimeStamp {Name = "RebirthChef2"},
	}
}

-- Wenn der Angriff auf die Festung losgeht gehen die Wipe outer zum Portal und despawnen
OnIdleGoHome
{
	X = PortalX, Y = PortalY, Direction = NorthWest, WalkMode = Run, Range = 2,
	Conditions =
	{	
		IsGlobalFlagFalse {Name = "Zwei"},
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
	Name = "Zwei",			-- muss unique sein, sollte kurz sein...
	RestartAfterCommonGoal = TRUE,
	PatternAlpha = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 20,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionNorthEastOrcCampX, Y = JunctionNorthEastOrcCampY, WalkMode = Run, Direction = East},
		[2] = {X = Flucht3X, Y = Flucht3Y, WalkMode = Run, GuardTime = 120},
	},
	PatternDelta = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 20,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = AttackElfMonumentX, Y = AttackElfMonumentY, WalkMode = Run, Direction = East},
		[2] = {X = JunctionPlateauX, Y = JunctionPlateauY, WalkMode = Run, GuardTime = 120},
	},
	PatternOmega = 
	{
		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 10,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionPlateauX, Y = JunctionPlateauY, WalkMode = Run, Direction = SouthEast},
		[2] = {X = JunctionNorthEastOrcCampX, Y = JunctionNorthEastOrcCampY, WalkMode = Run, Direction = SouthEast},
		[3] = {X = AttackElfMonumentX, Y = AttackElfMonumentY, WalkMode = Run, GuardTime = 120},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = AttackElfMonumentX, Y = AttackElfMonumentY, WalkMode = Run, GuardTime = 120},
}


--OnAttackPattern
--{
--	Name = "Last1",			-- muss unique sein, sollte kurz sein...
--	PatternAlpha = 
--	{
--		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
--		GuardTime = 50,		-- sekunden die an jedem punkt gewartet werden
--		[1] = {X = AttackGrenzFesteVorneX, Y = AttackGrenzFesteVorneY, WalkMode = Walk, Direction = East},
--	},
--	PatternDelta = 
--	{
--		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
--		GuardTime = 50,		-- sekunden die an jedem punkt gewartet werden
--		[1] = {X = JunctionAtMountainX, Y = JunctionAtMountainY, WalkMode = Walk, Direction = East},
--		[2] = {X = AttackGrenzFesteHintenX, Y = AttackGrenzFesteHintenX, WalkMode = Walk, Direction = SouthEast},
--	},
--	CommonGoal = {X = AttackGrenzFesteVorneX, Y = AttackGrenzFesteVorneY, WalkMode = Walk, GuardTime = 30},
--}
