-->INFO: PrinzessinVier
-->INFO: Prinzessinvier
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Dialog aus am Anfang hat die Kr?te keinen Dialog
OnOneTimeEvent
{
	Actions =
	{
		RemoveDialog {},
	}
}

-- Die viecher d?rfen erst Spawnen wenn die Quest gegeben ist
-- Damit die States nicht durcheinander kommen m?ssen Bewacher vor den Kr?ten spawnen
SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P208_DemonGruppeVierTot"},
		QuestState {State = StateActive, QuestId = 848},
	}
}

-- Die Bewacher sind tot also wirds ne Prinzessin
-- Beim ersten mal ?ber ein OneTimeEvent wegen der Flags
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_DemonGruppeVierTot"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9497"},
		SetGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinVier"}
	}
	
}

-- Die Bewacher sind tot also wirds ne Prinzessin
-- Allerdingss nur wenn die Figuren auch wirklich tot sind, damit der Event nicht dauern getriggert wird
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_DemonGruppeVierTot"},
		IsGlobalFlagTrue {Name = "g_P208_RespawnDeBlockerPrinzessinVier"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9497"},
		SetGlobalFlagFalse {Name = "g_P208_RespawnDeBlockerPrinzessinVier"}
		
	}
	
}

-- Die Elfe ist angesprochen, die Verwandlung beginnt
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P208PrinzessinVier"}
	},
	Actions =
	{
		SetEffect {Effect = "OccludeWhite", Length = 9000, TargetType = Figur, NpcId = self},
		SetGlobalFlagTrue {Name  = "g_P208_ViertePrinzessinEffekt"},
		SetGlobalFlagFalse {Name = "g_n_P208PrinzessinVier"},
		SetNpcFlagTrue {Name = "g_P208_ErsterWechsel"},
	}
}

-- Effekt und Verwandlung trennen 
-- Das Flag zur?cksetzen, damit der ganze Spa? beliebig wiederholbar ist
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_ViertePrinzessinEffekt"}
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "g_P208_ViertePrinzessinEffekt"},
		ChangeUnit {Unit = 2334},
		ChangeRace {Race = 185},
		QuestSolve {QuestId = 850},
		Outcry {Tag = "oca2jylaP208_001", NpcId = 9497, String = "Danke! Der Fluch ist gebrochen!", Color = ColorWhite},  	
		SetRewardFlagTrue {Name = "Prinzessin4Befreit "},
	}
}

-- Nach dem Platformwechsel m?ssen die Girls nat?rlich auch wieder dem Spieler geh?ren
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "g_P208_ErsterWechsel"},
		IsGlobalFlagFalse {Name = "g_P208_PrinzessinVierTot"},
	},
	Actions =
	{
		ChangeUnit {Unit = 2334},
		ChangeRace {Race = 185},
	}
}

--Hilfsflag f?r OnEvent Blocker
OnDeath
{
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_RespawnDeBlockerPrinzessinVier"}
	},
}

-- Stirbt die Prinzessin muss man sie so lange befreien, bis alle frei sind
-- Auch die Auftr?ge werden dann wieder gestartet
Respawn
{
	WaitTime = 	5,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P208_DemonGruppeVierTot"},
		Negated (QuestState {QuestId = 848, State = StateSolved}),
		IsGlobalFlagFalse {Name = "g_P208_PrinzessinVierTot"}, 
	},
	Actions =
	{
		RemoveDialog {},
		QuestBegin {QuestId = 850},
	}
}


-- Sind alle frei gehen sie ins Land des Friedens und despawnen
OnIdleGoHome
{
	X = 468, Y = 316,
	WalkMode = Run,
	Conditions = 
	{
		QuestState {QuestId = 850, State = StateSolved},
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
		SetGlobalFlagTrue {Name = "g_P208_PrinzessinVierTot"}, 
		SetNpcFlagTrue {Name = "n_P208_Despawn"},
		SetEffect {Effect = "DeMaterialize", TargetType = Figure},
		Outcry {Tag = "oca2jylaP208_002", NpcId = 9497, String = "Wir verlassen Euch nun! Viel Gl?ck auf Eurer Reise!", Color = ColorWhite}, 
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
-- Source: C:\Project\main\mission\dialoge\p208\n9497_PrinzessinVier.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l?sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "princess4P208_001", String = "(Die h?ssliche Kreatur schaut Euch mit gro?en Augen flehend an.)"},
			Answer{Tag = "princess4P208_002PC", String = "Ihr seid frei, Prinzessin, erhebt Euch!", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_n_P208PrinzessinVier"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end