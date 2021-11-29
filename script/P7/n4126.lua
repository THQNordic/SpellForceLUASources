function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	Conditions = {
		FigureAlive{NpcId = 4127},
	},
	Actions = {
		Follow{Target = 4127},
	},
}


EndDefinition()

end
