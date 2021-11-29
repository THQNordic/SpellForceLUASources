function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- TRUPPE 1, Anführer


SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "RagnarSpricht"},
		BuildingInRange{X = 436, Y = 243, Range = 0},
		BuildingInRange{X = 431, Y = 243, Range = 0},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "UTAT2"},
	},
}

-- respawn erst wenn der ganze trupp tot ist
Respawn
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE, WaitTime = 240,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "RagnarSpricht"},
		BuildingInRange{X = 436, Y = 243, Range = 0},
		BuildingInRange{X = 431, Y = 243, Range = 0},
		IsGlobalCounter{Name = "UntotenAttackGroup2DeadCounter", Operator = IsGreaterOrEqual, Value = 11},
	},
	Actions = 
	{
		ResetGlobalCounter{Name = "UntotenAttackGroup2DeadCounter"},
	},
}

-- FIXME: weitere respawns an anderen positionen ...


OnAttackPattern
{
	Name = "UTAT2",			-- muss unique sein, sollte kurz sein...
	PatternAlpha = 
	{
		Retries = 1,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 42,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionRampe2X, Y = JunctionRampe2Y, WalkMode = Run, Direction = East},
		[2] = {X = AttackVorpostenX, Y = AttackVorpostenY, WalkMode = Walk, Direction = East},
	},
	PatternDelta = 
	{
		Retries = 2,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 23,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionRampe2X, Y = JunctionRampe2Y, WalkMode = Walk, Direction = East},
	},
	PatternOmega = 
	{
		Retries = 3,		-- so oft hintereinander diesen angriffsweg nehmen
		GuardTime = 69,		-- sekunden die an jedem punkt gewartet werden
		[1] = {X = JunctionRampe1X, Y = JunctionRampe1Y, WalkMode = Walk, Direction = SouthEast},
	},
	-- gemeinsamer zielpunkt, wird immer am ende angelaufen:
	CommonGoal = {X = AttackZwergendorfX, Y = AttackZwergendorfY, WalkMode = Run, GuardTime = 30},
}

EndDefinition()

end
