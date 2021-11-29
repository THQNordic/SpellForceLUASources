function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1 , 
Conditions = {Negated(QuestState{QuestId = 118 , State = StateActive})}
}

OnIdleGoHome{WalkMode = Run, X = 209 , Y = 477, Direction = 7 , 
Conditions = {QuestState{QuestId = 118 , State = StateActive}}
}

EndDefinition()

end
