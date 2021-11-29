function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalCounter{Name = "P105_SpawnPitBuildingsDestroyed", Value = 5, Operator = IsGreaterOrEqual},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "P105_ScramangirSpawned"},
	},
}

OnDeath
{
	Actions =
	{
		SetRewardFlagTrue{Name = "SQScaramangirKilled"},
	},
}

EndDefinition()

end
