--> Skelett-Spawing f?r Arne

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = North}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Arne Spawn" , UpdateInterval = 10 }
	},
	Actions =
	{	
		SetGlobalFlagTrue { Name = "Arne Gespawnt" },
		SetNpcFlagTrue { Name = "CanBeDespawned" },
	},
}
Respawn
{
	X = _X, Y = _Y, WaitTime = 0.1,
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Arne Spawn" , UpdateInterval = 10 }
	},
	Actions =
	{	
		SetGlobalFlagTrue { Name = "Arne Gespawnt" },
		SetNpcFlagTrue { Name = "CanBeDespawned" },
	},
}

OnEvent
{
	Conditions =
	{
		TimeBetween { Hour = LibiEndStunde, Minute = 4, ToHour = 23, ToMinute = 59},
		IsNpcFlagTrue { Name = "CanBeDespawned" },
	},
	Actions =
	{	
		SetNpcFlagFalse { Name = "CanBeDespawned" },
		SetNpcTimeStamp{ Name = "DespawnTimer" },
		SetGlobalFlagFalse { Name = "Arne Spawn" },
		SetEffect { Effect = "DeMaterialize" , Length = 2200 , NpcId = _NpcId },
	},
}

Despawn
{
	Conditions =
	{
		IsNpcTimeElapsed{ Name = "DespawnTimer", Seconds = 1.9, UpdateInterval = 5},
	},
	Actions =
	{	
		ClearNpcTimeStamp{ Name = "DespawnTimer" },
	},
}


EndDefinition()

end



