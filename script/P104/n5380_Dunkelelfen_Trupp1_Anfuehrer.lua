-- TRUPPE 1, Anführer

-- erst spawnen wenn die letzten flüchtlinge aus dem portal sind
SpawnOnlyWhen
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "DraconArmyBeginsAttackingFromPortal"},
	},
	Actions = 
	{
		SetGlobalTimeStamp {Name = "RebirthChef"},
	},
}
--Respawn aus
---- respawn erst wenn der ganze trupp tot ist oder der chef zu lange tot ist, damit weitergelaufen wird
--Respawn
--{
--	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 120,
--	Conditions = 
--	{ 
--		ODER 
--		(
--			UND 
--			(
--				FigureDead {NpcId = 5380},
--				IsGlobalTimeElapsed {Name = "RebirthChef", Seconds = 360}
--			),
--			IsGlobalCounter{Name = "DarkElfAttackGroup1DeadCounter", Operator = IsGreaterOrEqual, Value = 7}
--		)
--	},
--	Actions = 
--	{
--		ResetGlobalCounter{Name = "DarkElfAttackGroup1DeadCounter"},
--		Follow {Target = NpcId, NpcId = NpcId+1},
--		Follow {Target = NpcId, NpcId = NpcId+2},
--		Follow {Target = NpcId, NpcId = NpcId+3},
--		Follow {Target = NpcId, NpcId = NpcId+4},
--		Follow {Target = NpcId, NpcId = NpcId+5},
--		Follow {Target = NpcId, NpcId = NpcId+6},
--		Follow {Target = NpcId, NpcId = NpcId+7},
--		Follow {Target = NpcId, NpcId = NpcId+8},
--		Follow {Target = NpcId, NpcId = NpcId+9},
--		Follow {Target = NpcId, NpcId = NpcId+10},
--		Follow {Target = NpcId, NpcId = NpcId+11},
--	},
--	DeathActions =
--	{
--		SetGlobalTimeStamp {Name = "RebirthChef"},
--	}
--}

-- FIXME: weitere respawns an anderen positionen ...


OnAttackPattern
{
	Name = "AP01",			-- muss unique sein, sollte kurz sein...
	RestartAfterCommonGoal = TRUE,
	PatternAlpha = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 5,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionSouthEastX, Y = JunctionSouthEastY, WalkMode = Run, Direction = East},
		[2] = {X = AttackOrkMonumentX, Y = AttackOrkMonumentY, WalkMode = Run, Direction = SouthEast},
	},
	PatternDelta = 
	{
		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 20,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionSouthX, Y = JunctionSouthY, WalkMode = Run, Direction = East},
		[2] = {X = AttackOrkMonumentX, Y = AttackOrkMonumentY, WalkMode = Run, Direction = SouthEast},
	},
	PatternOmega = 
	{
		Retries = 3,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 20,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionEastX, Y = JunctionEastY, WalkMode = Run, Direction = SouthEast},
		[2] = {X = JunctionNorthX, Y = JunctionNorthY, WalkMode = Run, Direction = SouthEast},
		[3] = {X = AttackOrkMonumentX, Y = AttackOrkMonumentY, WalkMode = Run, Direction = SouthEast},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = FallBackX, Y = FallBackY, WalkMode = Run, GuardTime = 120},
}


--OnAttackPattern
--{
--	Name = "AP02",			-- muss unique sein, sollte kurz sein...
--	RestartAfterCommonGoal = TRUE,
--	PatternAlpha = 
--	{
--		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
--		GuardTime = 70,		-- sekunden die an jedem punkt gewartet werden
--		[1] = {X = JunctionAtCaveX, Y = JunctionAtCaveY, WalkMode = Run, Direction = East},
--	},
--	PatternDelta = 
--	{
--		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
--		GuardTime = 70,		-- sekunden die an jedem punkt gewartet werden
--		[1] = {X = JunctionPlateauX, Y = JunctionPlateauY, WalkMode = Run, Direction = East},
--	},
--	PatternOmega = 
--	{
--		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
--		GuardTime = 70,		-- sekunden die an jedem punkt gewartet werden
--		[1] = {X = JunctionPlateauX, Y = JunctionPlateauY, WalkMode = Run, Direction = SouthEast},
--		[2] = {X = JunctionNorthEastOrcCampX, Y = JunctionNorthEastOrcCampY, WalkMode = Walk, Direction = SouthEast},
--	},
--	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
--	CommonGoal = {X = AttackElfMonumentX, Y = AttackElfMonumentY, WalkMode = Run, GuardTime = 120},
--}
--
--
--OnAttackPattern
--{
--	Name = "Last1",			-- muss unique sein, sollte kurz sein...
--	PatternAlpha = 
--	{
--		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
--		GuardTime = 50,		-- sekunden die an jedem punkt gewartet werden
--		[1] = {X = AttackGrenzFesteVorneX, Y = AttackGrenzFesteVorneY, WalkMode = Run, Direction = East},
--	},
--	PatternDelta = 
--	{
--		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
--		GuardTime = 50,		-- sekunden die an jedem punkt gewartet werden
--		[1] = {X = JunctionAtMountainX, Y = JunctionAtMountainY, WalkMode = Run, Direction = East},
--		[2] = {X = AttackGrenzFesteHintenX, Y = AttackGrenzFesteHintenX, WalkMode = Run, Direction = SouthEast},
--	},
--	CommonGoal = {X = AttackGrenzFesteVorneX, Y = AttackGrenzFesteVorneY, WalkMode = Run, GuardTime = 30},
--}
