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
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 2, Operator = IsEqual},
	},
	Actions = 
	{
		
		
	},
}


KillScript
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 3, Operator = IsGreater},
	},
	Actions = 
	{
	
	},
}


---_____________________________________________________________________
--I																		I
--I							ROUND 3 ARENA								I
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
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound3", Value = 0, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		
	},
	Actions = 
	{
		QuestChangeState {QuestId = 1101, State = StateUnknown},
		QuestChangeState {QuestId = 1102, State = StateUnknown},  
		QuestBegin { QuestId = 1099},
		QuestBegin { QuestId = 1100},
		SetGlobalFlagFalse {Name = "g_sP200Round3Lost"},
		SetGlobalFlagFalse { Name = "g_sP200Round3Solved"},
		IncreaseGlobalCounter {Name = "g_cnP200QuestCounterRound3"},
	}
}

--Die aktuelle Runde wurde verloren.
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound3", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_sP200Round3Lost"},
	},
	Actions = 
	{
		QuestChangeState {QuestId = 1100, State = StateUnsolvable}, 
		QuestBegin { QuestId = 1101},
		ResetGlobalCounter {Name = "g_cnP200QuestCounterRound3"},
	}
}

--Die aktuelle Runde wurde gewonnen.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound3", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_sP200Round3Solved"},
	},
	Actions = 
	{
		QuestSolve { QuestId = 1100}, 
		QuestBegin { QuestId = 1102},
		ResetGlobalCounter {Name = "g_cnP200QuestCounterRound3"},
		SetGlobalTimeStamp{ Name = "Round3TimeOutcry"},
	}
}


--Abfrage ob die Gegner der zweiten Runde alle Tot sind.
OnOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 2, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200Round3Lost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound3Monster1", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound3Monster2", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound3Monster3", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound3Monster4", UpdateInterval = 10},
		FigureDead {NpcId = 9586},
		FigureDead {NpcId = 9587},
		FigureDead {NpcId = 9588},
		FigureDead {NpcId = 9589},
		
    },
	Actions =
	{
		SetGlobalFlagTrue { Name = "g_sP200Round3Solved"},
		IncreaseGlobalCounter {Name = "g_cnP200FightsWon"},
		SetGlobalFlagFalse {Name = "g_sP200ArenaKampfStart"},
		SetGlobalFlagTrue {Name = "g_sP200BelohnungAnfordern"},
		
		 
	}
}





--Outcry f�r Sieger.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "Round3TimeOutcry", Seconds = 3}, 
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
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound3", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 2, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		ODER(FigureInRange {X = 105, Y = 128, NpcId = 0, Range = 2, UpdateInterval = 10},FigureDead {NpcId = 0}),
		ODER9
		{
			FigureAlive {NpcId = 9586}, 
			FigureAlive {NpcId = 9587}, 
			FigureAlive {NpcId = 9588},
			FigureAlive {NpcId = 9589},
		},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200Round3Lost"},
		SetGlobalFlagFalse {Name = "g_sP200ArenaKampfStart"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound3"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound3", Value = 1, Operator = IsGreaterOrEqual, UpdateInterval = 10},	
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound3"},
	},
}

--Das Verliererflag wird zur�ck gesetzt. 
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round3", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "g_sP200Round3Lost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_sP200Round3Lost"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round3"},
	},
}
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round3", Value = 1, Operator = IsGreaterOrEqual, UpdateInterval = 10},
		
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round3"},
	},
}

--Aussch�ttung der Belohnung f�r den Sieg in der dritten Runde.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 3, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200Belohnungauszahlen", UpdateInterval = 10},				
    },
	Actions =
	{
	    --RewardFlag,
	    SetGlobalFlagFalse {Name = "g_sP200Belohnungauszahlen"},
	    SetGlobalFlagFalse {Name = "g_sP200BelohnungAnfordern"},
	    SetRewardFlagTrue { Name = "ColosseumRunde03Sieg" },
	    PlaySound{Sound = SoundColosseumApplause},
	}
}

---_____________________________________________________________________
--I																		I
--I							Publikum Jubel								I
--I_____________________________________________________________________I


--Runde 3
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound3Monster1"},
		FigureDead {NpcId = 9586},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound3Monster2"},
		FigureDead {NpcId = 9587},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound3Monster3"},
		FigureDead {NpcId = 9588},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound3Monster4"},
		FigureDead {NpcId = 9589},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
    },
	Actions =
	{
		PlaySound{Sound = SoundColosseumApplause},
	}
}


							
EndDefinition()
end                 
                                      