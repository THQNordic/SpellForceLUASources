function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4 , 
Conditions = {Negated(QuestState{QuestId = 118 , State = StateActive})}
}

OnIdleGoHome{WalkMode = Run, X = 190 , Y = 474, Direction = 0 , 
Conditions = {QuestState{QuestId = 118 , State = StateActive}}
}

EndDefinition()

end
