function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})
OnFollowForever
{
	Target = 9356,
 	NpcId = self,
	Conditions = 
	{
	
	},
	Actions = 
	{
	
	},
}

EndDefinition()

end
