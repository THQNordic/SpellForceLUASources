function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--	SpawnOnlyWhen
--	{
--		X = _X, 
--		Y = _Y, 
--		NoSpawnEffect = TRUE,
--		Conditions = 
--		{
--			IsGlobalFlagTrue {Name = "g_p207_Cutscene_Beginning_Dummies_Spawn"},
--		},
--		Actions = 
--		{
--			--SetGlobalFlagTrue {Name = "g_p207_Cutscene_Beginning_Dummies_Has_Spawned"},
--		},
--	}

Despawn
{
	Conditions = 
	{
		--IsGlobalFlagTrue {Name = "g_p207_Cutscene_Beginning_Dummies_Has_Spawned"},
		IsGlobalFlagTrue {Name = "g_p207_Cutscene_Beginning_Dummies_Despawn"},
	},
	Actions = 
	{
	},
}



EndDefinition()

end
