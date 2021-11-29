function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{ 
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		QuestState{QuestId = 1026, State = StateActive},
	},
	Actions = {	},
}

KillOnDominate{}

EndDefinition()

end
