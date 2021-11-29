function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue {Name ="g_P210_Set1EyesTouched"}
	},
}

Despawn
{
	PlayDeathAnim = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_P210_EyesSet1Solved" },
	},
}

EndDefinition()

end