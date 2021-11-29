-->DryadenGeist

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X,
	Y = _Y,
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209DryadeSpawned", UpdateInterval = 10},
	},
	Actions =
	{
		LookAtFigure{ Target = 0, NpcId = self},
	}
} 

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209DryadeDespawn", UpdateInterval = 10},
	},
	Actions = 
	{ 
		SetEffect {Effect = "DeMaterialize", Length = 2250},
		SetNpcTimeStamp {Name = "g_tnP209DespawnDryadeTimer"},
	}
}

Despawn
{
	
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "g_tnP209DespawnDryadeTimer", Seconds = 2, UpdateInterval = 10},
	},
	Actions = 
	{
		
	}
}



EndDefinition()

end
