function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}

--!EDS ONIDLEGOHOME END
SpawnOnlyWhen
{
	X = 361, Y = 370,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		QuestState {QuestId = 578, State = StateActive},
	},
}
EndDefinition()

end
