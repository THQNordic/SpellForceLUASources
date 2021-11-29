function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=3 , Conditions = {IsGlobalFlagTrue{Name = "Q97MonumentGroupGo"}}}
--!EDS RESPAWN END

OnIdleGoHome
{
X = 95 , Y = 378 , Direction = 0 , Range = 0 , WalkMode = Run , UpdateInterval = 10 ,
Conditions = 	{
		IsGlobalFlagTrue{Name = "Q97MonumentTroopsFormUp"},
		Negated(QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}), 
		},
Actions = 	{ }
}



-- Utraner nach Hause
OnIdleGoHome
{
	X = 294, Y = 144, Direction = 1 ,
	Conditions =
	{
		QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}
	}
}



EndDefinition()

end
