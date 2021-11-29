function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Läuft los sobald Elendin Tot ist
---- -Q31-
OnIdleGoHome
{
 	X = 143, Y = 325, Direction = random(0,7), WalkMode = Run,
 	Conditions = 
 	{
		QuestState{QuestId = 31 , State = StateUnsolvable}
 	},
}

--solange Elendin lebt sollte sie ihr hinterherdackeln
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		FigureAlive{NpcId = 1500},
	},
	Actions = 
	{
		Follow{Target = 1500},
	},
}


EndDefinition()

end
