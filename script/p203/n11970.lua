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
	},
	Actions = 
	{
		Goto {X = 185, Y = 401, NpcId = self, WalkMode = Run, GotoMode = GotoContinuous},
	},
}

EndDefinition()

end
