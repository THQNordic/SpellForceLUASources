-->INFO SQ WEG NACH TIONDRIA WERWOLF5

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{ 
	Conditions = 
	{
		QuestState {QuestId = 703, State = StateActive},
	}, 
	Actions = 
	{
	
	}
}


EndDefinition()

end
