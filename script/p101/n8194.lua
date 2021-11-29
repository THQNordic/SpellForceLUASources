function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = {},
	Actions = 
	{
		Follow{Target = 8190, NpcId = self},
	}
}


EndDefinition()

end
