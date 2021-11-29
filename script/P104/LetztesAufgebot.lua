-- Das letzte Aufgebot von Dracon

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "TorAufLeaLos"},
	},
	Actions = 
	{
		
	},
}

--DE rücken zur Garnison vor
OnIdleGoHome
{
	WalkMode = Run, X = 431, Y = 328, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "TorAufLeaLos"},
	},
	HomeActions =
	{
		SetGlobalFlagTrue	{Name = "DEInGarnison"},
		SetGlobalTimeStamp {Name = "DEWeiterLaufen"},
	}
}

--DE rücken zur Garnison vor
OnIdleGoHome
{
	WalkMode = Run, X = 245, Y = 409, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DEInGarnison"},
		IsGlobalTimeElapsed {Name = "DEWeiterLaufen", Seconds = 120},
	},
	HomeActions =
	{
	}
}


EndDefinition()

end

