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
		Goto {X = 109, Y = 403, WalkMode = Walk, NpcId = 11021, GotoMode = GotoContinous},
	}
}

EndDefinition()

end
