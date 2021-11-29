function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "SpawnenDerElfen"},
		IsNpcFlagFalse {Name = "SpawnenDerElfenPassiert"},
	},
	Actions = 
	{
			SetNpcFlagTrue {Name = "SpawnenDerElfenPassiert"},
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcFlagTrue {Name = "SpawnenDerElfenPassiert"},
	},
	Actions = 
	{
		Follow {Target = Gruppe3},
	},
}

--Gruppe Drei der versprengten Flüchtlinge ist in der Nähe der Grenze und läuft jetzt von alleine weiter
OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRange {X = 388, Y = 430, Range = 10},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "Gruppe3ZuHause"},
	},
}


OnIdleGoHome
{
	WalkMode = Run, X = 269, Y = 411, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue{Name = "Gruppe3ZuHause"},
	},
	HomeActions =
	{
		SetNpcFlagTrue{Name = "Gruppe3InsPortal"},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 161, Y = 361, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue{Name = "Gruppe3InsPortal"},
	},
	HomeActions =
	{
		IncreaseGlobalCounter {Name = "GeretteteFugis"},
		SetNpcFlagTrue{Name = "Verschwindibus"},
	}
}

Despawn 
{
	Conditions =
	{
		IsNpcFlagTrue{Name = "Verschwindibus"},
	}
}


EndDefinition()

end