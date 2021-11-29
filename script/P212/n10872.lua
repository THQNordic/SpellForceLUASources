function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 442 , Y = 89 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint01On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint01Running", Seconds = 30 },
	},
}

EndDefinition()

end
