-- TRUPPE 1, Anführer

-- erst spawnen wenn die letzten flüchtlinge aus dem portal sind
SpawnOnlyWhen
{
	-- Spawnen an der Höhle
	X = 371, Y = 307, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Last1"},
	},
	Actions = 
	{
		SetGlobalTimeStamp {Name = "RebirthChef3"},
	},
}

-- respawn erst wenn der ganze trupp tot ist oder der chef zu lange tot ist, damit weitergelaufen wird
Respawn
{
	X = 371, Y = 307, NoSpawnEffect = TRUE, WaitTime = 30,
	Conditions = 
	{ 
		ODER 
		(
			IsGlobalTimeElapsed {Name = "RebirthChef3", Seconds = 360},
			IsGlobalCounter{Name = "DarkElfAttackGroup3DeadCounter", Operator = IsGreaterOrEqual, Value = 10}
		),
		Negated (QuestState {QuestId = 615, State = StateSolved})

	},
	Actions = 
	{
		ResetGlobalCounter{Name = "DarkElfAttackGroup3DeadCounter"},
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
		SetGlobalTimeStamp {Name = "RebirthChef3"},
	}
}



OnIdleGoHome
{
	X = AttackGrenzFesteHintenX, Y = AttackGrenzFesteHintenY, Direction = West, Range = 4, WalkMode = Run,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "Last1"},
		IsNpcFlagFalse {Name = "P104_NichtMehrKrieg"},
	},
	HomeActions = 
	{
		SetNpcFlagTrue {Name = "P104_GarnisonsAngriffNachHause"},
		SetNpcFlagTrue {Name = "P104_NichtMehrKrieg"},
	},
}

-- Wenn der Angriff auf die Festung losgeht gehen die Wipe outer zum Portal und despawnen
OnIdleGoHome
{
	X = PortalX, Y = PortalY, Direction = NorthWest, WalkMode = Run, Range = 2,
	Conditions =
	{	
		IsGlobalFlagTrue {Name = "P104_GarnisonsAngriffNachHause"},
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
--		[1] = {X = AttackGrenzFesteHintenX, Y = AttackGrenzFesteHintenX, WalkMode = Run, Direction = SouthEast},
--	},
--	CommonGoal = {X = AttackGrenzFesteVorneX, Y = AttackGrenzFesteVorneY, WalkMode = Run, GuardTime = 30},
--}
