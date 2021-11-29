function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 4,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "Q237UndeadAttack"},
		IsGlobalFlagFalse {Name = "Q237UndeadAttackBlocker"},
	}
	
}

OnIdleGoHome
{
	WalkMode = Walk, X = 216, Y = 223, Direction = 2,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Q237UndeadAttack"},
		IsGlobalFlagFalse {Name = "Q237UndeadAttackBlocker"},
		IsGlobalTimeElapsed {Name = "HowlingMoundsAttackWaveTimer", Seconds = 60},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 212, Y = 143, Direction = 4, Range = 15,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "Q237UndeadAttack"},
		IsGlobalFlagFalse {Name = "Q237UndeadAttackBlocker"},
		IsGlobalTimeElapsed {Name = "HowlingMoundsAttackWaveTimer", Seconds = 150},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "Q237UndeadAttackBlocker"},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 190, Y = 336, Direction = 4, Range = 15,
	Conditions = 
	{
		FigureInRange {X = 212, Y = 143, Range = 16},
		Negated(FigureHasAggro {}),
	},
}

OnIdleGoHome
{
	WalkMode = Run, X = 69, Y = 244, Direction = 4, Range = 15,
	Conditions = 
	{
		FigureInRange {X = 190, Y = 336, Range = 16},
		Negated(FigureHasAggro {}),
	},
}

OnIdleGoHome
{
	WalkMode = Run, X = _X, Y = _Y, Direction = 4, 
	Conditions = 
	{
		FigureInRange {X = 69, Y = 244, Range = 16},
		Negated(FigureHasAggro {}),
	},
}


--!EDS ONIDLEGOHOME END

SpawnOnlyWhen 
{
	X = 254, Y = 222, 
	Conditions =
	{
		FigureDead{NpcId = 3449},
	},
	Actions =
	{
		RevealUnExplored { X = 255, Y = 240, Range = 5},
	}

}

EndDefinition()

end
