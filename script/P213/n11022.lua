function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Erst Nach Cutscene wird das Lager angegriffen, damit der Spieler noch reagieren kann
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_AffenjungeCsZuEnde"},
	},
	Actions =
	{
		SetNoFightFlagFalse {NpcId = self},
		Goto {X = 110, Y = 403, WalkMode = Run, NpcId = 11022, GotoMode = GotoContinous},
	}
}

EndDefinition()

end
