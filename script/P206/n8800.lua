-->INFO: Unterhaendler
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8800"},
		ChangeRace {Race = 152},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_Unterhaendler"},
	}, 
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8800"},
	}
}

-- Der Unterhaendler laeuft ein wenig rum 
OnIdleGoHome
{
	X = 239, Y = 451, WalkMode = Walk, Direction = 0,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P206_LosGehtsUnterhaendler"},
		IsNpcCounter {Name = "g_c_P206_UnterhaendlerWartenRumlaufen", Value = 0, Operator = IsEqual},
		IsNpcFlagFalse {Name = "n_P213_AyzioBlock"},
	},
	HomeActions =
	{
	}
	
}

-- NIcht über Home Actions zählen, da dann evtl mehrfach gezählt wird
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 239, Y = 451, Range = 3},
	},
	Actions =
	{
		IncreaseNpcCounter {Name = "g_c_P206_UnterhaendlerWartenRumlaufen"},
	}
	
}

-- Der Unterhaendler laeuft ein wenig rum 
OnIdleGoHome
{
	X = 293, Y = 423, WalkMode = Walk, Direction = 0,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P206_LosGehtsUnterhaendler"},
		IsNpcCounter {Name = "g_c_P206_UnterhaendlerWartenRumlaufen", Value = 1, Operator = IsEqual},
		IsNpcFlagFalse {Name = "n_P213_AyzioBlock"},
	},
	HomeActions =
	{
	}
	
}

-- NIcht über Home Actions zählen, da dann evtl mehrfach gezählt wird
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 293, Y = 423, Range = 3},
	},
	Actions =
	{
		IncreaseNpcCounter {Name = "g_c_P206_UnterhaendlerWartenRumlaufen"},
	}
	
}

-- Der Unterhaendler laeuft ein wenig rum 
OnIdleGoHome
{
	X = 216, Y = 420, WalkMode = Walk, Direction = 0,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P206_LosGehtsUnterhaendler"},
		IsNpcCounter {Name = "g_c_P206_UnterhaendlerWartenRumlaufen", Value = 2, Operator = IsGreaterOrEqual},
		IsNpcFlagFalse {Name = "n_P213_AyzioBlock"},
	},
	HomeActions =
	{
	}
	
}

-- NIcht über Home Actions zählen, da dann evtl mehrfach gezählt wird
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 216, Y = 420, Range = 3},
	},
	Actions =
	{
		ResetNpcCounter {Name = "g_c_P206_UnterhaendlerWartenRumlaufen"},
	}
	
}

-- Ist der Unterhändler erst mal angesprochen geht er los den Lagerchefs bescheid sagen
OnIdleGoHome
{
	X = 358, Y = 323, WalkMode = Run, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_LosGehtsUnterhaendler"},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "n_P213_AyzioBlock"},
	},
	HomeActions =
	{
		SetGlobalFlagFalse {Name = "g_P206_LosGehtsUnterhaendler"},
		SetGlobalFlagTrue {Name = "g_P206_UnterhaendlerErsterChef"},
	}
	
}

-- NIcht über Home Actions zählen, da dann evtl mehrfach gezählt wird
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_UnterhaendlerErsterChef"},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "g_c_P206_UnterhaendlerWandercounter"},
	}
	
}
-- Der Erste Chef weiß bescheid weiter geht es zum zweiten Bruder
OnIdleGoHome
{
	X = 80, Y = 307, WalkMode = Run, Direction = 0,
	Conditions =
	{
		IsGlobalCounter {Name = "g_c_P206_UnterhaendlerWandercounter", Value = 1, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "g_P206_UnterhaendlerZweiterChef"},
		QuestSolve {QuestId = 821},
		QuestBegin {QuestId = 822},
	}
	
}

-- Wenn die Chefs tot sind Dialog aus
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {State = StateUnsolvable, QuestId = 821}
	},
	Actions =
	{
		RemoveDialog {},
	}
}

-- NIcht über Home Actions zählen, da dann evtl mehrfach gezählt wird
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_UnterhaendlerZweiterChef"},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "g_c_P206_UnterhaendlerWandercounter"},
	}
	
}

-- Der Mohr hat seine Schuldigkeit getan, er kann gehen, erst mal zum Portal
OnIdleGoHome
{
	X = 297, Y = 472, WalkMode = Run, Direction = 0,
	Conditions =
	{
		IsGlobalCounter {Name = "g_c_P206_UnterhaendlerWandercounter", Value = 2, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "g_P206_AlleBenachrichtigt"}
	}
	
}

Despawn
{
	Conditions =
	{ 
		ODER
		(
			IsGlobalFlagTrue {Name = "g_P206_AlleBenachrichtigt"},
			QuestState {QuestId = 886, State = StateActive}
		)
		
	}, 
	Actions = {}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p206\n8800_Unterhaendler.txt


	

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
			Say{Tag = "azyo_001", String = "Bario schickt Euch?"},
			Answer{Tag = "azyo_002PC", String = "Ja! Er sagt es ist soweit, Ihr sollt die Gazeda-Anführer zum Steinfeld locken.", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "azyo_003", String = "Dann geht es also los ... wohlan denn, dann werde ich diese Schlangen mal aus Ihren Körben locken!"},
			Answer{Tag = "azyo_004PC", String = "Tut das, ich erwarte sie beim Steinfeld.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P206_LosGehtsUnterhaendler"}, SetRewardFlagTrue {Name = "DialogMitUnterhaendler"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end