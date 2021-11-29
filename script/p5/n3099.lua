function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = South,
	Conditions =
	{
		Negated(QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}),
	}
}

--Utraner go home
OnIdleGoHome
{
	WalkMode = Walk, X = 73, Y = 384, Direction = South,
	Conditions =
	{
		QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50},
	}
}
--!EDS ONIDLEGOHOME END

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END



EndDefinition()

end
