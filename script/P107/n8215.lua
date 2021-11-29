function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "TorOeffnetSichP107" , UpdateInterval = 10},
	} ,
	Actions = 
	{
	
	}
} 



EndDefinition()

end
