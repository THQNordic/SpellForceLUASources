function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	Conditions = {
		FigureAlive{NpcId = 4131},
	},
	Actions = {
		Follow{Target = 4131},
	},
}

EndDefinition()

end
