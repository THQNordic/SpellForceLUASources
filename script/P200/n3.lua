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
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 1, Operator = IsEqual},
	},
	Actions = 
	{
		
		
	},
}


KillScript
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 2, Operator = IsGreater},
	},
	Actions = 
	{
	
	},
}

---_____________________________________________________________________
--I																		I
--I							ROUND 2 ARENA								I
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
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound2", Value = 0, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		
	},
	Actions = 
	{
		QuestChangeState {QuestId = 1101, State = StateUnknown},
		QuestChangeState {QuestId = 1102, State = StateUnknown},  
		QuestBegin { QuestId = 1099},
		QuestBegin { QuestId = 1100},
		SetGlobalFlagFalse {Name = "g_sP200Round2Lost"},
		SetGlobalFlagFalse { Name = "g_sP200Round2Solved"},
		IncreaseGlobalCounter {Name = "g_cnP200QuestCounterRound2"},
	}
}

--Die aktuelle Runde wurde verloren.
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound2", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_sP200Round2Lost"},
	},
	Actions = 
	{
		QuestChangeState {QuestId = 1100, State = StateUnsolvable}, 
		QuestBegin { QuestId = 1101},
		ResetGlobalCounter {Name = "g_cnP200QuestCounterRound2"},
	}
}

--Die aktuelle Runde wurde gewonnen.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound2", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_sP200Round2Solved"},
	},
	Actions = 
	{
		QuestSolve { QuestId = 1100}, 
		QuestBegin { QuestId = 1102},
		ResetGlobalCounter {Name = "g_cnP200QuestCounterRound2"},
		SetGlobalTimeStamp{ Name = "Round2TimeOutcry"},
	}
}


--Abfrage ob die Gegner der zweiten Runde alle Tot sind.
OnOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 1, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200Round2Lost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster1", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster2", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster3", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster4", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster5", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster6", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster7", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster8", UpdateInterval = 10},
		FigureDead {NpcId = 9476},
		FigureDead {NpcId = 9477},
		FigureDead {NpcId = 9478},
		FigureDead {NpcId = 9479},
		FigureDead {NpcId = 9480},
		FigureDead {NpcId = 9481},
		FigureDead {NpcId = 9482},	
    },
	Actions =
	{
		SetGlobalFlagTrue { Name = "g_sP200Round2Solved"},
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
		IsGlobalTimeElapsed {Name = "Round2TimeOutcry", Seconds = 3}, 
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
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound2", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 1, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		ODER(FigureInRange {X = 105, Y = 128, NpcId = 0, Range = 2, UpdateInterval = 10},FigureDead {NpcId = 0}),
		ODER9
		{
			FigureAlive {NpcId = 9476}, 
			FigureAlive {NpcId = 9477}, 
			FigureAlive {NpcId = 9478}, 
			FigureAlive {NpcId = 9479}, 
			FigureAlive {NpcId = 9480}, 
			FigureAlive {NpcId = 9481},
			FigureAlive {NpcId = 9482},
		},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200Round2Lost"},
		SetGlobalFlagFalse {Name = "g_sP200ArenaKampfStart"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound2"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound2", Value = 1, Operator = IsGreaterOrEqual, UpdateInterval = 10},	
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound2"},
	},
}

--Das Verliererflag wird zurück gesetzt. 
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round2", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "g_sP200Round2Lost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_sP200Round2Lost"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round2"},
	},
}
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round2", Value = 1, Operator = IsGreaterOrEqual, UpdateInterval = 10},
		
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round2"},
	},
}


--Ausschüttung der Belohnung für den Sieg in der zweiten Runde.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 2, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200Belohnungauszahlen", UpdateInterval = 10},				
    },
	Actions =
	{
	    --RewardFlag,
	    SetGlobalFlagFalse {Name = "g_sP200Belohnungauszahlen"},
	    SetGlobalFlagFalse {Name = "g_sP200BelohnungAnfordern"},
	    SetRewardFlagTrue { Name = "ColosseumRunde02Sieg" },
	    PlaySound{Sound = SoundColosseumApplause},
	}
}

---_____________________________________________________________________
--I																		I
--I							Publikum Jubel								I
--I_____________________________________________________________________I

--Runde 2
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster1"},
		FigureDead {NpcId = 9477},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster2"},
		FigureDead {NpcId = 9476},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster3"},
		FigureDead {NpcId = 9479},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster4"},
		FigureDead {NpcId = 9478},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster5"},
		FigureDead {NpcId = 9482},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster6"},
		FigureDead {NpcId = 9483},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster7"},
		FigureDead {NpcId = 9480},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster8"},
		FigureDead {NpcId = 9481},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
    },
	Actions =
	{
		PlaySound{Sound = SoundColosseumApplause},
	}
}

							
EndDefinition()
end                 
                                      