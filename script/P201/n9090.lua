-->INFO CutszeneOutpost
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201OutpostCutszeneSpawn2"},
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
