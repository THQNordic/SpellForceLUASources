-- P200 ... Collosseum 



----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

BeginScript
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 0, Operator = IsEqual},
	},
	Actions = 
	{
	
	},
}

KillScript
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 1, Operator = IsGreater},
	},
	Actions = 
	{
	
	},
}

---_____________________________________________________________________
--I																		I
--I							ROUND 1 ARENA								I
--I_____________________________________________________________________I

---_____________________________________________________________________
--I																		I
--I							 MainQuest  								I
--I_____________________________________________________________________I

--Eine neue Kampfrunde wird gestartet.
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound1", Value = 0, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		
	},
	Actions = 
	{
		QuestChangeState {QuestId = 1101, State = StateUnknown},
		QuestChangeState {QuestId = 1102, State = StateUnknown},  
		QuestBegin { QuestId = 1099},
		QuestBegin { QuestId = 1100},
		SetGlobalFlagFalse {Name = "g_sP200Round1Lost"},
		SetGlobalFlagFalse { Name = "g_sP200Round1Solved"},
		IncreaseGlobalCounter {Name = "g_cnP200QuestCounterRound1"},
	}
}

--Die aktuelle Runde wurde verloren.
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound1", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_sP200Round1Lost"},
	},
	Actions = 
	{
		QuestChangeState {QuestId = 1100, State = StateUnsolvable}, 
		QuestBegin { QuestId = 1101},
		ResetGlobalCounter {Name = "g_cnP200QuestCounterRound1"},
	}
}

--Die aktuelle Runde wurde gewonnen.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound1", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_sP200Round1Solved"},
	},
	Actions = 
	{
		QuestSolve { QuestId = 1100}, 
		QuestBegin { QuestId = 1102},
		ResetGlobalCounter {Name = "g_cnP200QuestCounterRound1"},
		SetGlobalTimeStamp{ Name = "Round1TimeOutcry"},
	}
}



--Abfrage ob die Gegner der ersten Runde alle Tot sind.
OnOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200Round1Lost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator2", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator2", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator2", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator2", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator2", UpdateInterval = 10},
		FigureDead {NpcId = 9329},
		FigureDead {NpcId = 9330},
		FigureDead {NpcId = 9331},
		FigureDead {NpcId = 9332},
		FigureDead {NpcId = 9333},	
    },
	Actions =
	{
		SetGlobalFlagTrue { Name = "g_sP200Round1Solved"},
		IncreaseGlobalCounter {Name = "g_cnP200FightsWon"},
		SetGlobalFlagFalse {Name = "g_sP200ArenaKampfStart"},
		SetGlobalFlagTrue {Name = "g_sP200BelohnungAnfordern"},
		
	  
	}
}


--Outcry für Sieger.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "Round1TimeOutcry", Seconds = 3}, 
    },
	Actions =
	{
	    Outcry { NpcId = 9321, String = "Applaus! Der Gewinner dieser Runde ist: Der Runenkrieger!" , Tag = "oca2zerboP200_002" , Color = ColorWhite},
	    PlaySound{Sound = SoundColosseumApplause},
	}
}





--Abfrage wann der Avatar die Runde verloren hat.
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		ODER(FigureInRange {X = 105, Y = 128, NpcId = 0, Range = 2, UpdateInterval = 10},FigureDead {NpcId = 0}),
		ODER9
		{
			FigureAlive {NpcId = 9329}, 
			FigureAlive {NpcId = 9330}, 
			FigureAlive {NpcId = 9331}, 
			FigureAlive {NpcId = 9332}, 
			FigureAlive {NpcId = 9333}, 
		},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200Round1Lost"},
		SetGlobalFlagFalse {Name = "g_sP200ArenaKampfStart"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehler"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler", Value = 1, Operator = IsGreaterOrEqual, UpdateInterval = 10},	
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehler"},
	},
}

--Das Verliererflag wird zurück gesetzt. 
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler2", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "g_sP200Round1Lost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_sP200Round1Lost"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehler2"},
	},
}
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler2", Value = 1, Operator = IsGreaterOrEqual, UpdateInterval = 10},
		
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehler2"},
	},
}



--Ausschüttung der Belohnung für den Sieg in der ersten Runde.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 1, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200Belohnungauszahlen", UpdateInterval = 10},				
    },
	Actions =
	{
	    --RewardFlag,
	    SetGlobalFlagFalse {Name = "g_sP200Belohnungauszahlen"},
	    SetGlobalFlagFalse {Name = "g_sP200BelohnungAnfordern"},
	    SetRewardFlagTrue { Name = "ColosseumRunde01Sieg" },
	    PlaySound{Sound = SoundColosseumApplause},

	}
}


---_____________________________________________________________________
--I																		I
--I							Publikum Jubel								I
--I_____________________________________________________________________I

--Runde 1
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator1"},
		FigureDead {NpcId = 9329},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
    },
	Actions =
	{
		PlaySound{Sound = SoundColosseumApplause},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator2"},
		FigureDead {NpcId = 9330},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
    },
	Actions =
	{
		PlaySound{Sound = SoundColosseumApplause},
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator3"},
		FigureDead {NpcId = 9331},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
    },
	Actions =
	{
		PlaySound{Sound = SoundColosseumApplause},
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator4"},
		FigureDead {NpcId = 9332},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
    },
	Actions =
	{
		PlaySound{Sound = SoundColosseumApplause},
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator5"},
		FigureDead {NpcId = 9333},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
    },
	Actions =
	{
		PlaySound{Sound = SoundColosseumApplause},
	}
}
						
EndDefinition()
end                 
                                      