function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	Conditions =
	{
		IsNpcFlagFalse {Name = "OneTimeSpawn"},
		IsPlayerFlagTrue {Name = "P107_MosaicComplete"},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "OneTimeSpawn"},
	}
}

EndDefinition()

end
