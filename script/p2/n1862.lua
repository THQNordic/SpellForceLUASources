function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--!EDS RESPAWN BEGIN
--Respawn{WaitTime=600}
--!EDS RESPAWN END


OnIdleGoHome
{
 	X = 130, Y = 328, Direction = random(0,7), WalkMode = Run,
 	Conditions = 
 	{
 		QuestState{QuestId = 33 , State = StateUnsolvable},
 	},
}

--solange Lian lebt sollte sie ihr hinterherdackeln
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		FigureAlive{NpcId = 1411},
	},
	Actions = 
	{
		Follow{Target = 1411},
	},
}

EndDefinition()

end
