function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		QuestState {QuestId = 387, State = StateActive},
		IsGlobalFlagTrue {Name = "SpawnLea"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "Quest387Helper"},
	}
}

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

EndDefinition()

end
