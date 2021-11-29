function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		
	},
		
 	Actions = 
	{ 
		LookAtDirection	{Direction = SouthEast, NpcId = self},


	},
}



EndDefinition()

end
