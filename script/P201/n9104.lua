function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = FALSE, 
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201OutpostCutszeneRespawn"},
		IsGlobalFlagTrue {Name = "g_sP201OrdensritterCutszeneOutpostGespawned"},
		FigureDead {NpcId = 9084},
	},
	Actions = 
	{
		
	}
} 



Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201OutpostCutszeneDespawn"}, 
	},
	Actions =
	{
	
	}
}

EndDefinition()

end
