function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_sP201StartCutszeneOutpost"},
			
	},
	Actions =
	{
		LookAtDirection {Direction = South, NpcId = self},
	}
} 

Despawn
{
	
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201EndeVomAnfangCutszeneOutpost"},
	},
	Actions = 
	{
		
	}
}
EndDefinition()

end
