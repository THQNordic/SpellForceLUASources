function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions =
	{
		

   },
	Actions =
	{
		LookAtFigure { Target = 5461, NpcId = self },

	
	}
}


EndDefinition()

end
