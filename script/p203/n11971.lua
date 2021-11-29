function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		QuestState {QuestId = 1031, State = StateActive},
		FigureAlive {NpcId = 11971},
	},
	Actions = 
	{
		Follow {Target = 11970},
	},
}

EndDefinition()

end
