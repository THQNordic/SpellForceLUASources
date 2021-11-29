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
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 7, Operator = IsEqual},
	},
	Actions = 
	{
		
		
	},
}


KillScript
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 8, Operator = IsGreater},
	},
	Actions = 
	{
	
	},
}


---_____________________________________________________________________
--I																		I
--I							ROUND 8 ARENA								I
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
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound8", Value = 0, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		
	},
	Actions = 
	{
		QuestChangeState {QuestId = 1101, State = StateUnknown},
		QuestChangeState {QuestId = 1102, State = StateUnknown},  
		QuestBegin { QuestId = 1099},
		QuestBegin { QuestId = 1100},
		SetGlobalFlagFalse {Name = "g_sP200Round8Lost"},
		SetGlobalFlagFalse { Name = "g_sP200Round8Solved"},
		IncreaseGlobalCounter {Name = "g_cnP200QuestCounterRound8"},
	}
}

--Die aktuelle Runde wurde verloren.
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound8", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_sP200Round8Lost"},
	},
	Actions = 
	{
		QuestChangeState {QuestId = 1100, State = StateUnsolvable}, 
		QuestBegin { QuestId = 1101},
		ResetGlobalCounter {Name = "g_cnP200QuestCounterRound8"},
	}
}

--Die aktuelle Runde wurde gewonnen.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200QuestCounterRound8", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_sP200Round8Solved"},
	},
	Actions = 
	{
		QuestSolve { QuestId = 1100}, 
		QuestBegin { QuestId = 1102},
		ResetGlobalCounter {Name = "g_cnP200QuestCounterRound8"},
		SetGlobalTimeStamp{ Name = "Round8TimeOutcry"},
	}
}



--Abfrage ob die Gegner der zweiten Runde alle Tot sind.
OnOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 7, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200Round8Lost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster1", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster2", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster3", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster4", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster5", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster6", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster7", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster8", UpdateInterval = 10},
		FigureDead {NpcId = 9636},
		FigureDead {NpcId = 9637},
		FigureDead {NpcId = 9638},
		FigureDead {NpcId = 9639},
		FigureDead {NpcId = 9640},
		FigureDead {NpcId = 9641},
		FigureDead {NpcId = 9642},
		FigureDead {NpcId = 9643},
    },
	Actions =
	{
		SetGlobalFlagTrue { Name = "g_sP200Round8Solved"},
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
		IsGlobalTimeElapsed {Name = "Round8TimeOutcry", Seconds = 3}, 
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
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound8", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 7, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		ODER(FigureInRange {X = 105, Y = 128, NpcId = 0, Range = 2, UpdateInterval = 10},FigureDead {NpcId = 0}),
		ODER9
		{
			FigureAlive {NpcId = 9636}, 
			FigureAlive {NpcId = 9637}, 
			FigureAlive {NpcId = 9638},
			FigureAlive {NpcId = 9639},
			FigureAlive {NpcId = 9640}, 
			FigureAlive {NpcId = 9641}, 
			FigureAlive {NpcId = 9642},
			FigureAlive {NpcId = 9643},
			
		},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200Round8Lost"},
		SetGlobalFlagFalse {Name = "g_sP200ArenaKampfStart"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound8"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound8", Value = 1, Operator = IsGreaterOrEqual, UpdateInterval = 10},	
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehlerRound8"},
	},
}

--Das Verliererflag wird zurück gesetzt. 
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round8", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "g_sP200Round8Lost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_sP200Round8Lost"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round8"},
	},
}
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round8", Value = 1, Operator = IsGreaterOrEqual, UpdateInterval = 10},
		
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehler2Round8"},
	},
}


--Ausschüttung der Belohnung für den Sieg in der achten Runde.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 8, Operator = IsEqual, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP200Belohnungauszahlen", UpdateInterval = 10},				
    },
	Actions =
	{
	    --RewardFlag,
	    SetGlobalFlagFalse {Name = "g_sP200Belohnungauszahlen"},
	    SetGlobalFlagFalse {Name = "g_sP200BelohnungAnfordern"},
	    SetRewardFlagTrue { Name = "ColosseumRunde08Sieg" },
	    PlaySound{Sound = SoundColosseumApplause},
	}
}

---_____________________________________________________________________
--I																		I
--I							Publikum Jubel								I
--I_____________________________________________________________________I


--Runde 8
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster1"},
		FigureDead {NpcId = 9637},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster2"},
		FigureDead {NpcId = 9636},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster3"},
		FigureDead {NpcId = 9639},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster4"},
		FigureDead {NpcId = 9638},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster5"},
		FigureDead {NpcId = 9640},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster6"},
		FigureDead {NpcId = 9641},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster7"},
		FigureDead {NpcId = 9643},
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
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster8"},
		FigureDead {NpcId = 9642},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
    },
	Actions =
	{
		PlaySound{Sound = SoundColosseumApplause},
	}
}
	
							
EndDefinition()
end                 
                                      