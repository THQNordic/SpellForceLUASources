function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions  =
	{
		PlayerUnitInRange{ X = 57, Y = 18, Range = 40 , FigureType = FigureAvatar},
 	},
 	Actions = 
 	{
 		ChangeUnit { Unit = 1660, NpcId = 7665, ChangeLevel = TRUE},
		ChangeRace { Race = 195, NpcId = 7665},
 	}
}

EndDefinition()

end
