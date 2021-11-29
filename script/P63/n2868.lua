function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "SouthStoneSolved", UpdateInterval = 10},
		--Negated(QuestState {QuestId = 327, State = StateActive}),
	}
}

EndDefinition()

end
