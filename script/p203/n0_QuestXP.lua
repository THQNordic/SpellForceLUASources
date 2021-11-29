 -----------------------------------
-- Belohnungen für gelöste Questen --
 -----------------------------------


-- Nebenquest Vergiftetes Wasser: Tantaro Gefunden
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 1029, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "TantaroGefunden" },
	},
}

-- Nebenquest Vergiftetes Wasser: Wasser entgiftet
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 1030, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "WasserEntgiften" },
	},
}

-- Nebenquest Vergiftetes Wasser: Zu Tario gegangen
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 1031, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "ZuTarioGegangen" },
	},
}
