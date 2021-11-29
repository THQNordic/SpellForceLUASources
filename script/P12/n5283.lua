function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 4, Conditions =
	{
		IsGlobalFlagFalse {Name = "SkeletonIdleOff", UpdateInterval = 10},
	},
}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen 
{
	X = _X, Y = _Y, Conditions =
	{
		IsGlobalFlagTrue {Name = "SkeletonSpawn", UpdateInterval = 10},
	},
}

Despawn
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "SkeletonsDespawn"},		
	},
}

EndDefinition()

end
