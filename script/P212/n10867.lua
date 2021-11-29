function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 42 , Y = 395 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint01On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint01Running", Seconds = 30 },
	},
}


EndDefinition()

end
