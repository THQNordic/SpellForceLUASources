--dofile für BodenrankenTorWächter



SpawnOnlyWhen
{
	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		--IsGlobalFlagFalse {Name = "g_P202RankeGegossen", UpdateInterval = 20},
		--PlayerHasItem {ItemId = 7067, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10}
	}, 
	Actions = {}
}

Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P202WaechterdespawnStop", UpdateInterval = 20}
	}, 
	Actions = {}
}

Respawn
{
	WaitTime = 30, UnitId = self, Clan = 0, Target = none, X = startX, Y = startY, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P202RankeGegossen", UpdateInterval = 20},
		IsNpcFlagTrue {Name = "RespawnBodenrankenWaechter", UpdateInterval = 10},
		--IsGlobalFlagTrue {Name = "g_P202WasserQuestErsteRundeVorbei"},
	},
	Actions = 
	{
		SetNpcFlagFalse {Name = "RespawnBodenrankenWaechter"} ,
		SetGlobalFlagTrue {Name = "g_P202WaechterdespawnStop"} 
	}, 
	DeathActions = {} 

}