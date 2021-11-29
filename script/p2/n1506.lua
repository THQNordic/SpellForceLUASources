function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Läuft los sobald Silven tot ist
---- -Q35-
OnIdleGoHome
{
 X = 138, Y = 318, Direction = random(0,7), WalkMode = Run,
 Conditions = {
	QuestState{QuestId = 35 , State = StateUnsolvable}
 },
}

--solange Silven lebt sollte sie ihr hinterherdackeln
OnPlatformOneTimeEvent
{
	Conditions = {
		FigureAlive{NpcId = 1505},
	},
	Actions = {
		Follow{Target = 1505},
	},
}


EndDefinition()

end
