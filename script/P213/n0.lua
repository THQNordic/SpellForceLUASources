function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Cutscenes aufrufen

dofile("script/p213/n32591_CutsceneAffenjunge.lua")
dofile("script/p213/n32590_CutsceneIntro.lua")
dofile("script/p213/n32592_CutsceneExtro.lua")
dofile("script/p213/n0_Outcries.lua")
dofile("script/Hadeko.lua")

-- Beim Betreten der Map erst mal Queststatus rtichtig stellen
OnOneTimeEvent
{
	Conditions =
	{	
	},
	Actions =
	{
		QuestSolve {QuestId = 956},
		QuestSolve {QuestId = 957},
		QuestBegin {QuestId = 1005},
		QuestBegin {QuestId = 1006},
		SetRewardFlagTrue {Name = "P213KarteErreicht"},
	}
}
-- Sind die MumienCamps platt wird der Timer für den Heiler gesetzt, ist der abgelaufen geht der Heiler heim
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_EinsCampMumien"},
		IsGlobalFlagTrue {Name = "g_P213_ZweiCampMumien"},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "gt_P213_MumienKaputt"},
		SetRewardFlagTrue {Name = "BeideMumienCampsPlatt"}
	}
}

-- Sind alle Camps Zertstört wird das Flag für den Affenjungen gesetzt
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_EinsCampMumien"},
		IsGlobalFlagTrue {Name = "g_P213_ZweiCampMumien"},
		IsGlobalFlagTrue {Name = "g_P213_EinsCampMantis"},
		IsGlobalFlagTrue {Name = "g_P213_ZweiCampMantis"},
		IsGlobalFlagTrue {Name = "g_P213_DreiCampMantis"},
		IsGlobalFlagTrue {Name = "g_P213_VierCampMantis"},
		IsGlobalFlagTrue {Name = "g_P213_EinsCampBlades"},
		IsGlobalFlagTrue {Name = "g_P213_ZweiCampBlades"},
	},
	Actions =
	{
		QuestSolve {QuestId = 1006},
		SetRewardFlagTrue {Name = "WegZumTorFreigeraeumt"}
	}
}

-- Der affenjunge kommt jetzt schon mit einem kaputten Mantiscamp raus
OnOneTimeEvent
{
	Conditions =
	{
		-- Wenn der Spieler um die Ecke kommt spawnt der Bub
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_P213_ZweiCampMantis"},
			IsGlobalFlagTrue {Name = "g_P213_DreiCampMantis"},
			IsGlobalFlagTrue {Name = "g_P213_VierCampMantis"}
		}
	},
	Actions =
	{
		QuestBegin {QuestId = 1007},
	}
}

-- Flag schalten ob der Spieler durch das Portal zu Hokan gegangen ist oder nicht
OnToggleEvent
{
	OnConditions =
	{
		PlayerUnitInRange {FigureType = Avatar, X = 306, Y = 101, Range = 10}
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P213_SpielerInEndfestung"},
		
	},
	OffConditions =
	{
		PlayerUnitInRange {FigureType = Avatar, X = 232, Y = 97, Range = 10}
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P213_SpielerInEndfestung"},
	}
}

-- Hat der Spieler den Affenjungequest gelöst wird ihm die Nahrung abgenommen
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasGood {Amount = 500, Side = SideDark, Good = GoodFood, UpdateInterval = 2},
		IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen", UpdateInterval = 2},
	},
	Actions =
	{
		TransferResource {Resource = GoodFood, Amount = 500, Side = SideDark, Flag = Take},
		SetGlobalFlagTrue {Name = "g_P213_DarkFood"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasGood {Amount = 500, Side = SideLight, Good = GoodFood, UpdateInterval = 30},
		IsGlobalFlagTrue {Name = "g_P213_AffenjungeEssen", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P213_DarkFood"},
	},
	Actions =
	{
		TransferResource {Resource = GoodFood, Amount = 500, Side = SideLight, Flag = Take}
	}
}

-- Fuer die beiden gegenavatare prüfen welcher Bindstone in Use ist
-- Wenn der Spieler die Karte erneut betritt wird die Liste gelöscht und neu angelegt, 
-- damit der Zweitavatar mit über die Bindstones reisen kann
OnPlatformOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "g_P213_BindStoneEins"},
		SetGlobalFlagFalse {Name = "g_P213_BindStoneZwei"},
		SetGlobalFlagFalse {Name = "g_P213_BindStoneDrei"},
		SetGlobalFlagFalse {Name = "g_P213_BindStoneVier"},
		SetGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
		SetGlobalFlagFalse {Name = "g_P213_BindStoneSechs"},
		SetGlobalTimeStamp {Name = "gt_P213_BindstoneBremse"},
		SetGlobalFlagFalse {Name = "g_P213_ZapBlocker"},
	}
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 101, Y = 415, Range = 0},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P213_BindStoneEins"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 101, Y = 415, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P213_BindStoneEins"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 431, Y = 430, Range = 0},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P213_BindStoneZwei"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 431, Y = 430, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P213_BindStoneZwei"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 273, Y = 292, Range = 0},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P213_BindStoneDrei"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 273, Y = 292, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P213_BindStoneDrei"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 21, Y = 79, Range = 0},
		
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P213_BindStoneVier"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 21, Y = 79, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P213_BindStoneVier"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 306, Y = 110, Range = 0},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P213_BindStoneFuenf"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 306, Y = 110, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		IsMonumentInUse {X = 405, Y = 182, Range = 0},
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_P213_BindStoneSechs"},
	},
	OffConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_BindstoneBremse", Seconds = 10},
		Negated (IsMonumentInUse {X = 405, Y = 182, Range = 0}),
	},
	OffActions =
	{
		SetGlobalFlagFalse {Name = "g_P213_BindStoneSechs"},
	},
}

-- Die Affenbefreiung
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 11847},
		FigureDead {NpcId = 11848},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P213_AffenjungeFrei"},
	}
}


----I---------------------------------------I
----I                                       I
----I           Bank von Empyria            I
----I           Schatzbrief-Zähler          I
----I         (muß auf alle Karten!)        I
----I                                       I
----I---------------------------------------I



OnEvent
{
	Conditions =
	{
		PlayerHasItem{ItemId = 7357},
		IsGlobalTimeElapsed{Name = "g_SchatzbriefTimer", Seconds = 7000}
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "g_P204_SchatzbriefZins"},
		SetGlobalTimeStamp{Name = "g_SchatzbriefTimer"},
	}
}

----------------------------------------------------------
--				Storyquest Part.
----------------------------------------------------------


--- Suche Darius, nachdem Affenjunge Torgeöffnet hat
OnOneTimeEvent
{
	Conditions = 
	{
	QuestState{QuestId = 1087, State = StateActive}, 
	QuestState{QuestId = 1094, State = StateActive}, 
	IsGlobalFlagTrue{Name = "g_StoryQuestTempleFound"},
	},
	Actions = 
	{ 
	QuestSolve{QuestId = 1094},
	QuestBegin{QuestId = 1095},
	}
}

--- Töte Hokan, nachdem Darius befreit ist
OnOneTimeEvent
{
	Conditions = 
	{
	QuestState{QuestId = 1087, State = StateActive}, 
	QuestState{QuestId = 1095, State = StateActive}, 
	IsGlobalFlagTrue{Name = "g_StoryQuestDariusFree"}
	},
	Actions = 
	{ 
	QuestSolve{QuestId = 1095},
	QuestBegin{QuestId = 1096},
	}
}

EndDefinition()
end
