function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsNpcFlagFalse {Name = "OneTimeSpawn"},
		QuestState {QuestId = 363, State = StateActive},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "OneTimeSpawn"},
	}
}

EndDefinition()

end
