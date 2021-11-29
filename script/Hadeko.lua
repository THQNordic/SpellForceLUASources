
---I++++++++++++++++++++++++++++++++++++++++++++++++++++I
---I                                                    I
---I                Hadeko-Puppen-Abfrage               I
---I                                                    I
---I++++++++++++++++++++++++++++++++++++++++++++++++++++I


--- ABFRAGE FÜR TESTING
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "HadekoTest"},
	},
	Actions =
	{
		QuestBegin{QuestId = 993 },
		QuestBegin{QuestId = 994 },
		QuestBegin{QuestId = 995 },
		QuestBegin{QuestId = 996 },
		QuestBegin{QuestId = 997 },
		QuestBegin{QuestId = 998 },
		QuestBegin{QuestId = 999 },
		QuestBegin{QuestId = 1000 }
	}
}


-- Torwächter
OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 993, State = StateActive },
		Negated(QuestState{QuestId = 998, State = StateSolved}),
		PlayerHasItem{ItemId = 7078},
	},
	Actions =
	{
		QuestSolve{QuestId = 998 }
	}
}

OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 998, State = StateSolved },
		QuestState{QuestId = 993, State = StateActive },
		Negated(PlayerHasItem{ItemId = 7078}),
	},
	Actions =
	{
		QuestBegin{QuestId = 998 }
	}
}



-- Schatten
OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 993, State = StateActive },
		Negated(QuestState{QuestId = 999, State = StateSolved}),
		PlayerHasItem{ItemId = 7077},
	},
	Actions =
	{
		QuestSolve{QuestId = 999 }
	}
}

OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 999, State = StateSolved },
		QuestState{QuestId = 993, State = StateActive },
		Negated(PlayerHasItem{ItemId = 7077}),
	},
	Actions =
	{
		QuestBegin{QuestId = 999}
	}
}




-- Held
OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 993, State = StateActive },
		Negated(QuestState{QuestId = 995, State = StateSolved}),
		PlayerHasItem{ItemId = 7076},
	},
	Actions =
	{
		QuestSolve{QuestId = 995 }
	}
}

OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 995, State = StateSolved },
		QuestState{QuestId = 993, State = StateActive },
		Negated(PlayerHasItem{ItemId = 7076}),
	},
	Actions =
	{
		QuestBegin{QuestId = 995 },
		SetGlobalFlagTrue{Name = "!!!HADEKOTESTFLAG"}
	}
}



-- Trickster
OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 993, State = StateActive },
		Negated(QuestState{QuestId = 996, State = StateSolved}),
		PlayerHasItem{ItemId = 7079},
	},
	Actions =
	{
		QuestSolve{QuestId = 996 }
	}
}

OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 996, State = StateSolved },
		QuestState{QuestId = 993, State = StateActive },
		Negated(PlayerHasItem{ItemId = 7079}),
	},
	Actions =
	{
		QuestBegin{QuestId = 996 }
	}
}


-- Mentor
OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 993, State = StateActive },
		Negated(QuestState{QuestId = 997, State = StateSolved}),
		PlayerHasItem{ItemId = 7080},
	},
	Actions =
	{
		QuestSolve{QuestId = 997 }
	}
}

OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 997, State = StateSolved },
		QuestState{QuestId = 993, State = StateActive },
		Negated(PlayerHasItem{ItemId = 7080}),
	},
	Actions =
	{
		QuestBegin{QuestId = 997 }
	}
}


-- Erzmagier
OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 993, State = StateActive },
		Negated(QuestState{QuestId = 1000, State = StateSolved}),
		PlayerHasItem{ItemId = 7081},
	},
	Actions =
	{
		QuestSolve{QuestId = 1000 }
	}
}

OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 1000, State = StateSolved },
		QuestState{QuestId = 993, State = StateActive },
		Negated(PlayerHasItem{ItemId = 7081}),
	},
	Actions =
	{
		QuestBegin{QuestId = 1000 }
	}
}

OnEvent
{
	Conditions =
	{
		QuestState{QuestId = 994, State = StateActive },
		PlayerHasItem{ItemId = 7076},
		PlayerHasItem{ItemId = 7077},
		PlayerHasItem{ItemId = 7078},
		PlayerHasItem{ItemId = 7079},
		PlayerHasItem{ItemId = 7080},
		PlayerHasItem{ItemId = 7081},
	},
	Actions =
	{
		QuestSolve{QuestId = 994 }
	}
}
