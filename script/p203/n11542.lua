function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Rohen auf dem Pferd

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = FALSE,
	Conditions =
	{	
		IsGlobalFlagTrue {Name = "g_P203_RohenErscheint"}
	},
	Actions =
	{
		LookAtDirection {Direction = South},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_RohenNachHause", UpdateInterval = 2},
	},
	Actions =
	{
		SetEffect {Effect = "DeMaterialize", NpcId = self, Length = 3200},
		SetNpcTimeStamp {Name = "n_P203_Verschwindibus"},
	}
}

Despawn
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "n_P203_Verschwindibus", UpdateInterval = 2, Seconds = 3},
	}
}

EndDefinition()

end
