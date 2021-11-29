function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END


SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue {Name ="g_P210_Set3EyesTouched"}
	},
}

Despawn
{
	PlayDeathAnim = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_P210_EyesSet3Solved" },
	},
}

EndDefinition()

end
