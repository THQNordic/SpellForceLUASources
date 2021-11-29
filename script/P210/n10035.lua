-->INFO: Raum9RiddleChest2
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n10035_Raum9RiddleChest2.txt


	

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
			Say{Tag = "room9riddlechest2P210_001", String = "(Die Truhe ist durch sieben Riegel gesichert.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room9StelenRiddle1Lit", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room9riddlechest2P210_002", String = "(Alle Riegel sind offen. Die Truhe kann jetzt geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room9StelenRiddle1Lit", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room9StelenRiddle1Lit", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room9riddlechest2P210_003", String = "(Sechs Riegel sind offen, einer ist geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room9StelenRiddle1Lit", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room9StelenRiddle1Lit", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room9riddlechest2P210_004", String = "(Fünf Riegel sind offen, zwei sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room9StelenRiddle1Lit", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalCounter{Name ="g_P210_Room9StelenRiddle1Lit", Value = 3, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room9riddlechest2P210_005", String = "(Vier Riegel sind offen, drei sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalCounter{Name ="g_P210_Room9StelenRiddle1Lit", Value = 3, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{10;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room9StelenRiddle1Lit", Value = 4, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room9riddlechest2P210_006", String = "(Drei Riegel sind offen, vier sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room9StelenRiddle1Lit", Value = 4, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{12;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room9StelenRiddle1Lit", Value = 5, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room9riddlechest2P210_007", String = "(Zwei Riegel sind offen, fünf sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room9StelenRiddle1Lit", Value = 5, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalCounter{Name =  "g_P210_Room9StelenRiddle1Lit", Value = 6, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room9riddlechest2P210_008", String = "(Ein Riegel ist offen, sechs sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalCounter{Name =  "g_P210_Room9StelenRiddle1Lit", Value = 6, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "room9riddlechest2P210_009", String = "(Alle Riegel sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end