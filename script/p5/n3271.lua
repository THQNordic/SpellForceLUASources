function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 0,
	Conditions =
	{
		Negated(QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}),
	}
}
--!EDS ONIDLEGOHOME END

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END

-- Utraner nach Hause
OnIdleGoHome
{
	X = 296, Y = 159, Direction = 2 ,
	Conditions =
	{
		QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}
	}
}

EndDefinition()

end
