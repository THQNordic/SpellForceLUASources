function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

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
Respawn{WaitTime=30}
--!EDS RESPAWN END



-- Utraner nach Hause
OnIdleGoHome
{
	X = 273, Y = 146, Direction = 1 ,
	Conditions =
	{
		QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}
	}
}


EndDefinition()

end
