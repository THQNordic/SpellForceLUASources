function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
SpawnOnlyWhen
{
	X = _X, Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions =
	{
		QuestState {State = StateActive, QuestId = 886},
		IsGlobalFlagTrue {Name = "g_P206_UnKillTrakanTot"},
	}
}

EndDefinition()

end
