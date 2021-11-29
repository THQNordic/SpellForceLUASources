function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalCounter{Name = "g_P210_MinorMistakesMade", Value = 8, Operator = IsGreaterOrEqual},
	},
}

Despawn
{
	PlayDeathAnim = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_nP210_ShowXalabanCutscene"},
	},
}

EndDefinition()

end
