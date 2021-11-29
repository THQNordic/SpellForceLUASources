function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{X = 211, Y = 117, Direction = SouthWest, 
	Conditions = {
		IsNpcFlagFalse{Name = "NowVanishing", UpdateInterval = 10},
	},
}


-- verschwinden event
OnEvent
{
	Conditions = {
		FigureHasAggro{},
		ODER(
			FigureInRange{X = 197, Y = 95, Range = 8, UpdateInterval = 20},
			FigureInRange{X = 205, Y = 95, Range = 5, UpdateInterval = 20}
			),
		IsNpcFlagFalse{Name = "NowVanishing", UpdateInterval = 5},
	},
	Actions = {
		ChangeRace{Race = 152},
		SetEffect{Effect = "DeMaterialize", Length = 1550},
		SetNpcTimeStamp{Name = "DespawnTimer"},
		SetNpcFlagTrue{Name = "NowVanishing"},
		SetGlobalFlagTrue{Name = "GhostIsNowVanishing"},
		SetFreezeFlagTrue{},
	},
}

Despawn
{
	Conditions = {
		IsNpcTimeElapsed{Name = "DespawnTimer", Seconds = 1.5, UpdateInterval = 5},
	},
	Actions = {
		ClearNpcTimeStamp{Name = "DespawnTimer"},
		SetNpcFlagTrue{Name = "AllowRespawn"},
		SetFreezeFlagFalse{},
	},
}

Respawn
{
	WaitTime = 1,
	Conditions = {
		IsNpcFlagTrue{Name = "AllowRespawn", UpdateInterval = 10},
	}, 
	Actions = {
		SetNpcFlagFalse{Name = "AllowRespawn"},
		SetNpcFlagFalse{Name = "NowVanishing"},
		SetGlobalFlagFalse{Name = "GhostIsNowVanishing"},
		SetEffect{Effect = "Materialize", X = _X, Y = _Y, Length = 1500},
		LookAtDirection{Direction = SouthWest},
	}, 
	DeathActions = {
		SetFreezeFlagFalse{},
	} 
}


EndDefinition()
end
