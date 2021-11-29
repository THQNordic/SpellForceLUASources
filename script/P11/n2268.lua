function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Q166GolemStarter", UpdateInterval = 1},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "Q166GuardiansHaveSpawned"},
	},
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "Q166ConjurationSuccess"},
	}
}

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END




EndDefinition()

end
