function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

--Wird gespawned sobald der Schattenklingenspieler in der NQ Der letzte Dracon nach Empiria reisen muss.
SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_sP211NQDraconAuftragEmpiria"},
	}, 
	Actions = 
	{
		ChangeRace {Race = 152, NpcId = self},
	} 
}
--Einheit wird aggro auf den Schattenklingenspieler sobald er das Siegel der Nocrain nicht dem Botschafter Dorkhan übergibt.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP204DorkharAggroAndAssassinsSpawn", UpdateInterval = 20},
		
	},
	Actions = 
	{
		ChangeRace {Race = 137, NpcId = self},
	},
}
EndDefinition()

end
