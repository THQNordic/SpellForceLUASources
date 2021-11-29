-->INFO: BasartorWest
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 222, Y = 258,		-- exact position of portal object!
	Type = EmpyriaTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen", UpdateInterval = 60},
	},
	CloseConditions = {},
	StayOpen = TRUE,

	OpenActions =
	{
		SetGlobalTimeStamp{Name = "c_P204_CounterBasartorWest"},	
		SetGlobalFlagTrue{Name = "g_P204_BasartorWestOffen"},
		SetGlobalFlagFalse{Name = "g_P204_SpielerIstVerkleidet"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8838"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9998"},		
		QuestSolve {QuestId = 946},
		RemoveDialog {},
	}
}
	


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n9998_BasartorWest.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_BasartorWestBewacht"},
		},
		Actions = {
			Say{Tag = "gate_basarsouth_001", String = "(Dieses Tor ist verschossen)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_BasartorWestBewacht"}),
		},
		Actions = {
			Say{Tag = "gate_basarsouth_001", String = "(Dieses Tor ist verschossen)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 4630},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gate_basarsouth_002PC", String = "(Den Dietrich verwenden, obwohl die Wachen in der Nähe sind?)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 4630}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gate_basarsouth_003", String = "(Das Tor öffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalTimeStamp{Name = "c_P204_CounterNasarSagtWas"}, SetGlobalFlagTrue{Name = "g_P204_BasartorWestAufmachen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
			PlayerHasItem{ItemId = 4630},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gate_basarsouth_004PC", String = "(Den Dietrich verwenden?)", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 4630}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gate_basarsouth_003", String = "(Das Tor öffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalTimeStamp{Name = "c_P204_CounterNasarSagtWas"}, SetGlobalFlagTrue{Name = "g_P204_BasartorWestAufmachen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end