-->INFO: OberstadttorRechts


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum ?ffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 15,
	X = 316, Y = 275,		-- exact position of portal object!
	Type = MetallTorKlein,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P204_OberstadttorRechtsOffen", UpdateInterval = 60},
	},
	CloseConditions = {},
	StayOpen = TRUE,

	OpenActions =
	{
		SetGlobalTimeStamp{Name = "c_P204_CounterOberstadttorRechts"},
		RemoveDialog {},
		QuestSolve{QuestId = 950},
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n9667_OberstadttorRechts.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l?sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_OberstadttorRechtsBewacht"},
		},
		Actions = {
			Say{Tag = "gate_upperrrightP204_001", String = "(Dieses Tor ist verschossen)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_OberstadttorRechtsBewacht"}),
		},
		Actions = {
			Say{Tag = "gate_upperrrightP204_001", String = "(Dieses Tor ist verschossen)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 4630},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gate_upperrrightP204_002PC", String = "(Den Dietrich verwenden, obwohl die Wachen in der N?he sind?)", AnswerId = 2},
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
			Say{Tag = "gate_upperrrightP204_003", String = "(Das Tor ?ffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_OberstadttorRechtsOffen"},
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
			OfferAnswer{Tag = "gate_upperrrightP204_004PC", String = "(Den Dietrich verwenden?)", AnswerId = 6},
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
			Say{Tag = "gate_upperrrightP204_003", String = "(Das Tor ?ffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_OberstadttorRechtsOffen"},
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