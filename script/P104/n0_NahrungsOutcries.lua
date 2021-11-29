OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 0, Operator = IsEqual},
		PlayerHasGood {Good = GoodFood, Amount = 150, Side = SideDark},
		-- Hier mal noch ABfrage auf QuestState rein
		QuestState {QuestId = 576, State = StateActive},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "NahrungsZaehler"},
		TransferResource {Resource = GoodFood, Side = SideDark, Amount = 100, Flag = Take},
		Outcry {Tag = "ocLenaP004_003", NpcId = 5428, String = "Die Leute haben sich aus deinem Lager etwas Nahrung genommen!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "ZaehlBlockade"},
		QuestBegin {QuestId = 755},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 1, Operator = IsEqual},
		PlayerHasGood {Good = GoodFood, Amount = 150, Side = SideDark},
		-- Hier mal noch ABfrage auf QuestState rein
		QuestState {QuestId = 576, State = StateActive},
		IsGlobalTimeElapsed {Name = "ZaehlBlockade", Seconds = 10},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "NahrungsZaehler"},
		TransferResource {Resource = GoodFood, Side = SideDark, Amount = 100, Flag = Take},
		Outcry {Tag = "ocLenaP004_003", NpcId = 5428, String = "Die Leute haben sich aus deinem Lager etwas Nahrung genommen!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "ZaehlBlockade"},
		QuestChangeState {QuestId = 755, State = StateUnknown},
		QuestChangeState {QuestId = 576, State = StateUnknown},
		QuestBegin {QuestId = 576},
		QuestBegin {QuestId = 756},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 2, Operator = IsEqual},
		PlayerHasGood {Good = GoodFood, Amount = 150, Side = SideDark},
		-- Hier mal noch ABfrage auf QuestState rein
		QuestState {QuestId = 576, State = StateActive},
		IsGlobalTimeElapsed {Name = "ZaehlBlockade", Seconds = 10},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "NahrungsZaehler"},
		TransferResource {Resource = GoodFood, Side = SideDark, Amount = 100, Flag = Take},
		Outcry {Tag = "ocLenaP004_018", NpcId = 5428, String = "Die Leute haben sich etwas Nahrung genommen! Wir brauchen wohl noch dreimal so viel!", Color = ColorWhite}, 		
		SetGlobalTimeStamp {Name = "ZaehlBlockade"},
		QuestChangeState {QuestId = 756, State = StateUnknown},
		QuestChangeState {QuestId = 576, State = StateUnknown},
		QuestBegin {QuestId = 576},
		QuestBegin {QuestId = 757},
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 3, Operator = IsEqual},
		PlayerHasGood {Good = GoodFood, Amount = 150, Side = SideDark},
		-- Hier mal noch ABfrage auf QuestState rein
		QuestState {QuestId = 576, State = StateActive},
		IsGlobalTimeElapsed {Name = "ZaehlBlockade", Seconds = 10},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "NahrungsZaehler"},
		TransferResource {Resource = GoodFood, Side = SideDark, Amount = 100, Flag = Take},
		Outcry {Tag = "ocLenaP004_003", NpcId = 5428, String = "Die Leute haben sich aus deinem Lager etwas Nahrung genommen!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "ZaehlBlockade"},
		QuestChangeState {QuestId = 757, State = StateUnknown},
		QuestChangeState {QuestId = 576, State = StateUnknown},
		QuestBegin {QuestId = 576},
		QuestBegin {QuestId = 758},
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 4, Operator = IsEqual},
		PlayerHasGood {Good = GoodFood, Amount = 150, Side = SideDark},
		-- Hier mal noch ABfrage auf QuestState rein
		QuestState {QuestId = 576, State = StateActive},
		IsGlobalTimeElapsed {Name = "ZaehlBlockade", Seconds = 10},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "NahrungsZaehler"},
		TransferResource {Resource = GoodFood, Side = SideDark, Amount = 100, Flag = Take},
		Outcry {Tag = "ocLenaP004_019", NpcId = 5428, String = "Die Flüchtlinge sind gestärkt, aber wir brauchen bestimmt noch einmal so viel", Color = ColorWhite}, 
		Outcry {Tag = "ocLenaP004_004", NpcId = 5428, String = "Es ist ruhig, die Imperialen lassen auf sich warten ...", Color = ColorWhite}, 
		Outcry {Tag = "ocAedarP004_001", NpcId = 7305, String = "Danken wir den Göttern dafür.", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "P104OutcryBremse"},
		SetGlobalTimeStamp {Name = "ZaehlBlockade"},
		QuestChangeState {QuestId = 758, State = StateUnknown},
		QuestChangeState {QuestId = 576, State = StateUnknown},
		QuestBegin {QuestId = 576},
		QuestBegin {QuestId = 759},
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 5, Operator = IsEqual},
		PlayerHasGood {Good = GoodFood, Amount = 150, Side = SideDark},
		-- Hier mal noch ABfrage auf QuestState rein
		QuestState {QuestId = 576, State = StateActive},
		IsGlobalTimeElapsed {Name = "ZaehlBlockade", Seconds = 10},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "NahrungsZaehler"},
		TransferResource {Resource = GoodFood, Side = SideDark, Amount = 100, Flag = Take},
		Outcry {Tag = "ocLenaP004_003", NpcId = 5428, String = "Die Leute haben sich aus deinem Lager etwas Nahrung genommen!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "ZaehlBlockade"},
		QuestChangeState {QuestId = 759, State = StateUnknown},
		QuestChangeState {QuestId = 576, State = StateUnknown},
		QuestBegin {QuestId = 576},
		QuestBegin {QuestId = 760},
		
	}
}

---- Outcry Event
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		IsGlobalCounter {Name = "NahrungsZaehler", Value = 4, Operator = IsEqual},
--		IsGlobalTimeElapsed {Name = "P104OutcryBremse", Seconds = 20},
--	},
--	Actions =
--	{
--	}
--}

-- Outcry Event
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		IsGlobalCounter {Name = "NahrungsZaehler", Value = 4, Operator = IsEqual},
--		IsGlobalTimeElapsed {Name = "P104OutcryBremse", Seconds = 20},
--	},
--	Actions =
--	{
--		
--	}
--}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 6, Operator = IsEqual},
		PlayerHasGood {Good = GoodFood, Amount = 150, Side = SideDark},
		-- Hier mal noch ABfrage auf QuestState rein
		QuestState {QuestId = 576, State = StateActive},
		IsGlobalTimeElapsed {Name = "ZaehlBlockade", Seconds = 10},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "NahrungsZaehler"},
		TransferResource {Resource = GoodFood, Side = SideDark, Amount = 100, Flag = Take},
		Outcry {Tag = "ocLenaP004_003", NpcId = 5428, String = "Die Leute haben sich aus deinem Lager etwas Nahrung genommen!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "ZaehlBlockade"},
		QuestChangeState {QuestId = 760, State = StateUnknown},
		QuestChangeState {QuestId = 576, State = StateUnknown},
		QuestBegin {QuestId = 576},
		QuestBegin {QuestId = 761},
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 7, Operator = IsEqual},
		PlayerHasGood {Good = GoodFood, Amount = 150, Side = SideDark},
		-- Hier mal noch ABfrage auf QuestState rein
		QuestState {QuestId = 576, State = StateActive},
		IsGlobalTimeElapsed {Name = "ZaehlBlockade", Seconds = 10},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "NahrungsZaehler"},
		TransferResource {Resource = GoodFood, Side = SideDark, Amount = 100, Flag = Take},
		Outcry {Tag = "ocLenaP004_020", NpcId = 5428, String = "Bald haben die Leute genug Nahrung! Nur noch ein bisschen!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "ZaehlBlockade"},
		QuestChangeState {QuestId = 761, State = StateUnknown},
		QuestChangeState {QuestId = 576, State = StateUnknown},
		QuestBegin {QuestId = 576},
		QuestBegin {QuestId = 762},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 8, Operator = IsEqual},
		PlayerHasGood {Good = GoodFood, Amount = 150, Side = SideDark},
		-- Hier mal noch ABfrage auf QuestState rein
		QuestState {QuestId = 576, State = StateActive},
		IsGlobalTimeElapsed {Name = "ZaehlBlockade", Seconds = 10},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "NahrungsZaehler"},
		TransferResource {Resource = GoodFood, Side = SideDark, Amount = 100, Flag = Take},
		Outcry {Tag = "ocLenaP004_003", NpcId = 5428, String = "Die Leute haben sich aus deinem Lager etwas Nahrung genommen!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "ZaehlBlockade"},
		QuestChangeState {QuestId = 762, State = StateUnknown},
		QuestChangeState {QuestId = 576, State = StateUnknown},
		QuestBegin {QuestId = 576},
		QuestBegin {QuestId = 763},
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 9, Operator = IsEqual},
		PlayerHasGood {Good = GoodFood, Amount = 150, Side = SideDark},
		-- Hier mal noch ABfrage auf QuestState rein
		QuestState {QuestId = 576, State = StateActive},
		IsGlobalTimeElapsed {Name = "ZaehlBlockade", Seconds = 10},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "NahrungsZaehler"},
		TransferResource {Resource = GoodFood, Side = SideDark, Amount = 100, Flag = Take},
		Outcry {Tag = "ocLenaP004_003", NpcId = 5428, String = "Die Leute haben sich aus deinem Lager etwas Nahrung genommen!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "ZaehlBlockade"},
		--QuestChangeState {QuestId = 763, State = StateSolved},
		QuestSolve {QuestId = 763},
		QuestSolve {QuestId = 576},
		Outcry {Tag = "ocLenaP004_007", NpcId = 5428, String = "Die Flüchtlinge ziehen weiter!", Color = ColorWhite}, 
		SetGlobalFlagTrue {Name = "FugitivesMovingToPosition2"},
		SetGlobalFlagFalse	{Name = "FugitivesMovingToPosition1"},
	}
}

