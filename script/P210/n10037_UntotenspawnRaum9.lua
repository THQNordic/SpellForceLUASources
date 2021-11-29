
SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue {Name ="g_P210_Set99EyesTouched"},
	},
}

Despawn
{
	PlayDeathAnim = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_P210_EyesSet99Solved" },
	},
}
