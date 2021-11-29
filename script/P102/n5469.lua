function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OnOneTimeEvent
{
	Conditions = {
		FigureAlive{ NpcId = 5464}, --Folgen ihrem Anführer um Janina nach der 1 CutSzene anzugreifen
	},
	Actions = {
		Follow{ Target = 5445 , NpcId = self},
	},
} 

EndDefinition()

end
