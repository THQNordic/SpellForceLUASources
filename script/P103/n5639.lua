function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions =
	{
		FigureDead{ NpcId = 5641},

	 },
	Actions =
	{
		Outcry { NpcId = 5639 , String = "Alarmiert die Orks! Schafft mir dieses Pack vom Hals!" , Tag = "ocWhorimP103_001" },
		RevealUnExplored {X = 294, Y = 280, Range = 15},
		RevealUnExplored {X = 90, Y = 375, Range = 15},	
	}
}
EndDefinition()

end
