function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name ="g_P205_KoenigDerZweite"},
	},
	Actions = {},
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth{Percent = 70, NpcId = self, UpdateInterval = 10},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P205_SpinnenZuHilfe"},
	}
}

EndDefinition()

end
