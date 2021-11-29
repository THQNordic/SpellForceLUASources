function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {
		FigureAlive{ NpcId = 5946}, 
	},
	Actions = {
		Follow{ Target = 5946 , NpcId = self},
	},
}

EndDefinition()

end
