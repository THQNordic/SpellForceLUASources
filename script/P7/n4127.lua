function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	Conditions = {
		FigureAlive{NpcId = 4125},
	},
	Actions = {
		Follow{Target = 4125},
	},
}

EndDefinition()

end
