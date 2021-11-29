function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {
		FigureAlive{NpcId = Avatar},
	},
	Actions = {
		Follow{Target = Avatar},
	},
}

EndDefinition()

end
