function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange{ X = 401, Y = 208, Range = 12 , FigureType = FigureAll},

		
    },
	Actions =
	{
		Outcry { NpcId = 7533, String = "Lichtgläubige! Es gibt schlimmere Arten zu sterben. Komm her!" , Tag = "ocShar_P110_001" , Color = ColorWhite},
	}
}

EndDefinition()

end
