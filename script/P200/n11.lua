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
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 9, Operator = IsEqual},
	},
	Actions = 
	{
	
	},
}



---_____________________________________________________________________
--I																		I
--I							ROUND 10 ARENA								I
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
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound10", Value = 0, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		
	},
	Actions = 
	{
		QuestChangeState {QuestId = 1101, State = StateUnknown},
		QuestChangeState {QuestId = 1102, State = StateUnknown},  
		QuestBegin { QuestId = 1099},
		QuestBegin { QuestId = 1100},
		SetGlobalFlagFalse {Name = "g_sP200Round10Lost"},
		SetGlobalFlagFalse { Name = "g_sP200Round10Solved"},
		IncreaseGlobalCounter {Name = "g_cnP200QuestCounterRound10"},
	}
}

--Die aktuelle Runde wurde verloren.
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound10", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_sP200Round10Lost"},
	},
	Actions = 
	{
		QuestChangeState {QuestId = 1100, State = StateUnsolvable}, 
		QuestBegin { QuestId = 1101},
		ResetGlobalCounter {Name = "g_cnP200QuestCounterRound10"},
	}
}
--Die aktuelle Runde wurde gewonnen.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound10", Value = 1, Operator = IsEqual},
		QuestState {QuestId = 1100, State = StateActive},	
		IsGlobalFlagTrue {Name = "g_sP200Round10Solved"},
    },
	Actions =
	{
		QuestSolve { QuestId = 1100}, 
		QuestBegin { QuestId = 1103},
		SetGlobalTimeStamp{ Name = "Round10TimeOutcry"},
	}
}



--Abfrage ob die Gegner der zweiten Runde alle Tot sind.
OnOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 9, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200Round10Lost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound10Monster1", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound10Monster2", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound10Monster3", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound10Monster4", UpdateInterval = 10},
	
		FigureDead {NpcId = 9660},
		FigureDead {NpcId = 9661},
		FigureDead {NpcId = 9662},
		FigureDead {NpcId = 9663},
		
		
    },
	Actions =
	{
		SetGlobalFlagTrue { Name = "g_sP200Round10Solved"},
		IncreaseGlobalCounter {Name = "g_cnP200FightsWon"},
		SetGlobalFlagFalse {Name = "g_sP200ArenaKampfStart"},
		SetGlobalFlagTrue {Name = "g_sP200BelohnungAnfordern"},
		SetGlobalFlagFalse {Name = "g_sP200Round10Lost"},
		 
	}
}

--Outcry für Sieger.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "Round10TimeOutcry", Seconds = 3}, 
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
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound10", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 9, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		ODER(FigureInRange {X = 105, Y = 128, NpcId = 0, Range = 2, UpdateInterval = 10},FigureDead {NpcId = 0}),
		ODER9
		{
			FigureAlive {NpcId = 9660}, 
			FigureAlive {NpcId = 9661}, 
			FigureAlive {NpcId = 9662},
			FigureAlive {NpcId = 9663},		
		},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200Round10Lost"},
		SetGlobalFlagFalse {Name = "g_sP200ArenaKampfStart"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound10"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound10", Value = 1, Operator = IsGreaterOrEqual, UpdateInterval = 10},	
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound10"},
	},
}

--Das Verliererflag wird zurück gesetzt. 
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round10", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "g_sP200Round10Lost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_sP200Round10Lost"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round10"},
	},
}
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round10", Value = 1, Operator = IsGreaterOrEqual, UpdateInterval = 10},
		
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round10"},
	},
}

--Ausschüttung der Belohnung für den Sieg in der zehnten und finalen Runde.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 10, Operator = IsGreaterOrEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200Belohnungauszahlen", UpdateInterval = 10},				
    },
	Actions =
	{
	    --RewardFlag,
	    SetGlobalFlagFalse {Name = "g_sP200Belohnungauszahlen"},
	    SetGlobalFlagFalse {Name = "g_sP200BelohnungAnfordern"},
	    SetRewardFlagTrue { Name = "ColosseumRunde10Sieg" },
	    SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9321"},
	  	PlaySound{Sound = SoundColosseumApplause},
	  	QuestSolve { QuestId = 1103}, 
	    QuestSolve { QuestId = 1099}, 
	    SetGlobalFlagFalse { Name = "g_sP200Round10Solved"},
		
	  	
	}
}

---_____________________________________________________________________
--I																		I
--I							Publikum Jubel								I
--I_____________________________________________________________________I


--Runde 10
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound10Monster1"},
		FigureDead {NpcId = 9660},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound10Monster2"},
		FigureDead {NpcId = 9661},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound10Monster3"},
		FigureDead {NpcId = 9662},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound10Monster4"},
		FigureDead {NpcId = 9663},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
    },
	Actions =
	{
		PlaySound{Sound = SoundColosseumApplause},
	}
}


							
EndDefinition()
end                 
