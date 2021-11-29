function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},
	Actions =
	{
		Follow{Target = 8204, NpcId = self},
	}
}


EndDefinition()

end
