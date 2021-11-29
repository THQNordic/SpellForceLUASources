-------------------------------------------------------
--	Echo Sümpfe
-------------------------------------------------------
OnOneTimeEvent
{
	Conditions =
	{
		-- Gitzo
		FigureDead {NpcId = 7513},
		
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "GitzoTot"},
		EnableDialog {NpcId = 7227},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 4233},
		IsItemFlagTrue {Name = "PlayerHasItemGitzosEssenz", UpdateInterval = 20},
		--QuestState {QuestId = 722, State = StateUnknown},
	},
	Actions =
	{
		TransferItem {TakeItem = 4233, Flag = Take},
		SetItemFlagFalse {Name = "PlayerHasItemGitzosEssenz"},
		TransferItem {GiveItem = 4219, Flag = Give},
--		QuestBegin {QuestId = 722},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "LuciusFrei"},
	},
	Actions =
	{
		ChangeUnit {NpcId = 7227, Unit = 1900},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue {Name = "PlayerHasItemMinionTeile", UpdateInterval = 20},
		QuestState {QuestId = 722, State = StateSolved},
		QuestState {QuestId = 723, State = StateUnknown},
	},
	Actions =
	{
		QuestBegin {QuestId = 723},
	}
}

-- Forstfall
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 4233},
		IsItemFlagTrue {Name = "PlayerHasItemGultarksEssenz", UpdateInterval = 20},
		QuestState {QuestId = 722, State = StateSolved},
		QuestState {QuestId = 724, State = StateUnknown},
	},
	Actions =
	{
		TransferItem {TakeItem = 4233, Flag = Take},
		SetItemFlagFalse {Name = "PlayerHasItemGultarksEssenz"},
		TransferItem {GiveItem = 4220, Flag = Give},
		QuestBegin {QuestId = 724},
	}
}



-- Tirganach
OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue {Name = "PlayerHasItemSchaedelKlingenweber"},
		QuestState {QuestId = 725, State = StateUnknown},
		QuestState {QuestId = 722, State = StateSolved},
	},
	Actions =
	{
		QuestBegin {QuestId = 725},
	}
}

-- Wintertal

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 4233},
		IsItemFlagTrue {Name = "PlayerHasItemKyrasEssenz", UpdateInterval = 20},
		QuestState {QuestId = 722, State = StateSolved},
		QuestState {QuestId = 727, State = StateUnknown},
	},
	Actions =
	{
		TransferItem {TakeItem = 4233, Flag = Take},
		SetItemFlagFalse {Name = "PlayerHasItemKyrasEssenz"},
		TransferItem {GiveItem = 4221, Flag = Give},
		QuestBegin {QuestId = 727},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue {Name = "PlayerHasItemBrustPanzerKlingenweber"},
		QuestState {QuestId = 725, State = StateUnknown},
		QuestState {QuestId = 722, State = StateSolved},
	},
	Actions =
	{
		QuestBegin {QuestId = 725},
	}
}


-- Fastholme

OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue {Name = "PlayerHasItemBeinteileKlingenweber"},
		QuestState {QuestId = 725, State = StateUnknown},
		QuestState {QuestId = 722, State = StateSolved},
	},
	Actions =
	{
		QuestBegin {QuestId = 725},
	}
}

-- Nevershade

OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue {Name = "PlayerHasItemSchaedelPrinceps"},
		QuestState {QuestId = 722, State = StateSolved},
		QuestState {QuestId = 728, State = StateUnknown},
	},
	Actions =
	{
		QuestBegin {QuestId = 728},
	}
}

-- Shal Dun

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 4233},
		IsItemFlagTrue {Name = "PlayerHasItemSharsEssenz", UpdateInterval = 20},
		QuestState {QuestId = 722, State = StateSolved},
		QuestState {QuestId = 729, State = StateUnknown},
	},
	Actions =
	{
		TransferItem {TakeItem = 4233, Flag = Take},
		SetItemFlagFalse {Name = "PlayerHasItemSharsEssenz"},
		TransferItem {GiveItem = 4225, Flag = Give},
		QuestBegin {QuestId = 729},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue {Name = "PlayerHasItemSchulterPlattenPrinceps"},
		QuestState {QuestId = 728, State = StateUnknown},
		QuestState {QuestId = 722, State = StateSolved},
	},
	Actions =
	{
		QuestBegin {QuestId = 728},
	}
}

-- FireFangs


OnOneTimeEvent
{
	Conditions =
	{
		ODER
		(
			IsItemFlagTrue {Name = "PlayerHasItemBeinteilePrinceps"},
			IsItemFlagTrue {Name = "PlayerHasItemBrustPanzerPrinzeps"}
		),
		QuestState {QuestId = 728, State = StateUnknown},
		QuestState {QuestId = 722, State = StateSolved},
	},
	Actions =
	{
		QuestBegin {QuestId = 728},
	}
}


-- Itemblock

-- Gitzo Block

OnQuestItemFound
{
	ItemId = 4219, ItemFlagName = "GitzosInaktiverRunenstein", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4219, ItemFlagName = "GitzosInaktiverRunenstein", Amount = 1
}

OnQuestItemFound
{
	ItemId = 4212, ItemFlagName = "GitzosEssenz", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4212, ItemFlagName = "GitzosEssenz", Amount = 1
}

OnQuestItemFound
{
	ItemId = 3951, ItemFlagName = "GitzosAktiverRunenstein", Amount = 1
}

-- Gultar Block
OnQuestItemFound
{
	ItemId = 4213, ItemFlagName = "GultarksEssenz", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4213, ItemFlagName = "GultarksEssenz", Amount = 1
}

OnQuestItemFound
{
	ItemId = 4220, ItemFlagName = "GultarksInaktiverRunenstein", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4220, ItemFlagName = "GultarksInaktiverRunenstein", Amount = 1
}	

OnQuestItemFound
{
	ItemId = 4115, ItemFlagName = "AktiveGultarkRune", Amount = 1
}


OnQuestItemFound
{
	ItemId = 4214, ItemFlagName = "KyrasEssenz", Amount = 1
}
	
OnQuestItemRemove
{
	ItemId = 4214, ItemFlagName = "KyrasEssenz", Amount = 1
}

OnQuestItemFound
{
	ItemId = 4221, ItemFlagName = "KyrasSchlafenderRunenstein", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4221, ItemFlagName = "KyrasSchlafenderRunenstein", Amount = 1
}

OnQuestItemFound
{
	ItemId = 4114, ItemFlagName = "KyrasAktiverRunenstein", Amount = 1
}



-- Minion Block

OnQuestItemFound
{
	ItemId = 4244, ItemFlagName = "MinionTeile", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4244, ItemFlagName = "MinionTeile", Amount = 1
}

OnQuestItemFound
{
	ItemId = 4111, ItemFlagName = "MinionAktiverRunenstein", Amount = 1
}

-- Shars Block

OnQuestItemFound
{
	ItemId = 4218, ItemFlagName = "SharsEssenz", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4218, ItemFlagName = "SharsEssenz", Amount = 1
}

OnQuestItemFound
{
	ItemId = 4225, ItemFlagName = "InaktiverRunensteinShar", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4225, ItemFlagName = "InaktiverRunensteinShar", Amount = 1
}

OnQuestItemFound
{
	ItemId = 4113, ItemFlagName = "AktiverRunensteinShar", Amount = 1
}

-- Klingenweber Block

OnQuestItemFound
{
	ItemId = 4245, ItemFlagName = "BeinteileKlingenweber", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4247, ItemFlagName = "BeinteileKlingenweber", Amount = 1
}

OnQuestItemFound
{
	ItemId = 4245, ItemFlagName = "SchaedelKlingenweber", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4245, ItemFlagName = "SchaedelKlingenweber", Amount = 1
}


OnQuestItemFound
{
	ItemId = 4246, ItemFlagName = "BrustPanzerKlingenweber", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4246, ItemFlagName = "BrustPanzerKlingenweber", Amount = 1
}

OnQuestItemFound
{
	ItemId = 3953, ItemFlagName = "AktiveRuneKlingenweber", Amount = 1
}

-- Princeps Block

OnQuestItemFound
{
	ItemId = 4251, ItemFlagName = "BrustPanzerPrinzeps", Amount = 1
}
	
OnQuestItemRemove
{
	ItemId = 4251, ItemFlagName = "BrustPanzerPrinzeps", Amount = 1
}


OnQuestItemFound
{
	ItemId = 4248, ItemFlagName = "BeinteilePrinceps", Amount = 1
}
	
OnQuestItemRemove
{
	ItemId = 4248, ItemFlagName = "BeinteilePrinceps", Amount = 1
}
	
OnQuestItemFound
{
	ItemId = 4249, ItemFlagName = "SchulterPlattenPrinceps", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4249, ItemFlagName = "SchulterPlattenPrinceps", Amount = 1
}

OnQuestItemFound
{
	ItemId = 4250, ItemFlagName = "SchaedelPrinceps", Amount = 1
}

OnQuestItemRemove
{
	ItemId = 4250, ItemFlagName = "SchaedelPrinceps", Amount = 1
}

OnQuestItemFound
{
	ItemId = 4112, ItemFlagName = "AktiveRunePrinceps", Amount = 1
}