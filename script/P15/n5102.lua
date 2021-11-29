function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		QuestState {QuestId = 391, State = StateActive},
		FigureDead {NpcId = 5100},
	},
	Actions =
	{
	}
}
EndDefinition()

end