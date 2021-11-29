function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_sP207StartDraconNebenQuest"},	
	},
	Actions = 
	{
		AttackTarget {Target = 11071, NpcId = self, FriendlyFire = FALSE},	
	}
} 

EndDefinition()

end
