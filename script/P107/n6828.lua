function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

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
