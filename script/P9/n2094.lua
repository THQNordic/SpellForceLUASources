function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7 , 
Conditions = 	{
				Negated(QuestState{QuestId = 118 , State = StateActive})
				},
}
--!EDS ONIDLEGOHOME END

OnIdleGoHome{WalkMode = Run, X = 162 , Y = 324 , Direction = 0 , 
Conditions = 	{
				QuestState{QuestId = 118 , State = StateActive}
				},
}

EndDefinition()

end
