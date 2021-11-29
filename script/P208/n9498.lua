-->INFO: PrinzessinDrei
-->INFO: Prinzessindrei
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Dialog aus am Anfang hat die Kröte keinen Dialog
OnOneTimeEvent
{
	Actions =
	{
		RemoveDialog {},
	}
}

-- Die viecher dürfen erst Spawnen wenn die Quest gegeben ist
-- Damit die States nicht durcheinander kommen müssen Bewacher vor den Kröten spawnen
SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P208_DemonGruppeDreiTot"},
		QuestState {State = StateActive, QuestId = 848},
	}
}

-- Die Bewacher sind tot also wirds ne Prinzessin
-- Beim ersten mal über ein OneTimeEvent wegen der Flags
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_DemonGruppeDreiTot"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9498"},
		SetGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinDrei"}
	}
	
}

-- Die Bewacher sind tot also wirds ne Prinzessin
-- Allerdingss nur wenn die Figuren auch wirklich tot sind, damit der Event nicht dauern getriggert wird
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_DemonGruppeDreiTot"},
		IsGlobalFlagTrue {Name = "g_P208_RespawnDeBlockerPrinzessinDrei"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9498"},
		SetGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinDrei"},
		SetNpcFlagTrue {Name = "n_P208_NachHause"},
	}
	
}

-- Die Elfe ist angesprochen, die Verwandlung beginnt
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P208PrinzessinDrei"}
	},
	Actions =
	{
		SetEffect {Effect = "OccludeWhite", Length = 9000, TargetType = Figur, NpcId = self},
		SetGlobalFlagTrue {Name  = "g_P208_DrittePrinzessinEffekt"},
		SetGlobalFlagFalse {Name = "g_n_P208PrinzessinDrei"},
		SetNpcFlagTrue {Name = "g_P208_ErsterWechsel"},
	}
}

-- Effekt und Verwandlung trennen 
-- Das Flag zurücksetzen, damit der ganze Spaß beliebig wiederholbar ist
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_DrittePrinzessinEffekt"}
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "g_P208_DrittePrinzessinEffekt"},
		ChangeUnit {Unit = 2334},
		ChangeRace {Race = 185},
		--ChangeFigureOwner {},
		QuestSolve {QuestId = 853},
		Outcry {Tag = "oca2jylaP208_001", NpcId = 9498, String = "Danke! Der Fluch ist gebrochen!", Color = ColorWhite},
		SetRewardFlagTrue {Name = "Prinzessin3Befreit "},
	}
}

-- Nach dem Platformwechsel müssen die Girls natürlich auch wieder dem Spieler gehören
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "g_P208_ErsterWechsel"},
		IsGlobalFlagFalse {Name = "g_P208_PrinzessinDreiTot"},
	},
	Actions =
	{
		ChangeUnit {Unit = 2334},
		ChangeRace {Race = 185},
	}
}

OnDeath
{
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_RespawnDeBlockerPrinzessinDrei"}
	},
}


-- Stirbt die Prinzessin muss man sie so lange befreien, bis alle frei sind
-- Auch die Aufträge werden dann wieder gestartet
Respawn
{
	WaitTime = 	5,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P208_DemonGruppeDreiTot"},
		Negated (QuestState {QuestId = 848, State = StateSolved}),
		IsGlobalFlagFalse {Name = "g_P208_PrinzessinDreiTot"}, 
	},
	Actions =
	{
		RemoveDialog {},
		QuestBegin {QuestId = 853},
	}
}

-- Sind alle frei gehen sie ins Land des Friedens und despawnen
OnIdleGoHome
{
	X = 468, Y = 316,
	WalkMode = Run,
	Conditions = 
	{
		QuestState {QuestId = 853, State = StateSolved},
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 467, Y = 315, Range = 2},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_PrinzessinDreiTot"}, 
		SetNpcFlagTrue {Name = "n_P208_Despawn"},
		SetEffect {Effect = "DeMaterialize", TargetType = Figure},
		Outcry {Tag = "oca2jylaP208_002", NpcId = 9498, String = "Wir verlassen Euch nun! Viel Glück auf Eurer Reise!", Color = ColorWhite}, 
	}
}

Despawn
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "n_P208_Despawn"},
	},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p208\n9498_PrinzessinDrei.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "princess3P208_001", String = "(Die hässliche Kreatur schaut Euch mit großen Augen flehend an.)"},
			Answer{Tag = "princess3P208_002PC", String = "Ihr seid frei, Prinzessin, erhebt Euch!", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_n_P208PrinzessinDrei"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end