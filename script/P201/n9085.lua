-->INFO CutszeneOutpost
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201OutpostCutszeneSpawn"},
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
		IsGlobalFlagTrue {Name = "g_sP201OutpostCutszeneSpawn2", UpdateInterval = 10}, 
	},
	Actions =
	{
	
	}
}

EndDefinition()

end
