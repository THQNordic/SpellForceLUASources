-->INFO SQ WEG NACH TIONDRIA SKELETT18

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{ 
	Conditions = 
	{
		QuestState {QuestId = 712, State = StateActive},
		PlayerUnitInRange {X = 54, Y = 184, Range = Meter, FigureType = FigureAll},
	}, 
	Actions = 
	{
	
	}
}




EndDefinition()

end