function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions =
	{
		

    },
	Actions =
	{
		LookAtDirection {Direction = East, NpcId = self},	
	}
}

EndDefinition()

end
