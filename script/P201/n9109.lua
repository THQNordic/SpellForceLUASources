function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_sP201CutszeneGrabStart"},
			
	},
	Actions =
	{
		LookAtDirection {Direction = East, NpcId = self},
	}
} 

Despawn
{
	
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201CutszeneGrabEnded"},
	},
	Actions = 
	{
		
	}
}
EndDefinition()

end
