function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{X = _X , Y = _Y , NoSpawnEffect = TRUE,
	Conditions = 
	{
		QuestState {QuestId = 1028, State = StateActive},
	},
	Actions = 
	{
	},
}


EndDefinition()

end
