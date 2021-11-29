
SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P210_ZerbitsRoom2Spawn"},
	},
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P210_RuneAnktharReturned"},
	},
	Actions =
	{
		SetEffect {Effect ="DeMaterialize", TargetType = Figure, NpcId = self},
		SetNpcTimeStamp{Name ="npc_P210_CountdownToDespawn"},	
	}
}
 
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		 IsNpcTimeElapsed{Name ="npc_P210_CountdownToDespawn", Seconds = 2},
	},
}