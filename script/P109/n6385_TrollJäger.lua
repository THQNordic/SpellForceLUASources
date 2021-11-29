function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7}
--!EDS ONIDLEGOHOME END


Respawn
{
	X = 446, Y = 249, NoSpawnEffect = TRUE, WaitTime = 180,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WarzoneHunterFakeSpawn"},
	}
}


EndDefinition()

end
