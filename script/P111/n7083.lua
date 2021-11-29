function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "StartAngriffeSchattenP111"},
	} ,
	Actions = 
	{

	}
}
EndDefinition()

end
