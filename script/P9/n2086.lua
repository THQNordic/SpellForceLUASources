function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2 ,
Conditions =	{
				QuestState{QuestId = 118 , State = StateActive},
				IsGlobalFlagTrue{Name = "Q118ReinforcementsGetReady"}
				}
}
--!EDS ONIDLEGOHOME END

EndDefinition()

end
