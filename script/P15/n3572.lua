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
	WalkMode = Walk, X = 221, Y = 225, Direction = 2,
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
		RevealUnExplored{X = 223 , Y = 231, Range = 8},
		RevealUnExplored{X = 220 , Y = 215, Range = 8},
		RevealUnExplored{X = 221 , Y = 222, Range = 8},
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
		FigureDead{NpcId = 3446},
	}, 
	Actions = 
	{
		RevealUnExplored { X = 245, Y = 237, Range = 3},
	}

}
EndDefinition()

end
