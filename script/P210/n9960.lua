-->INFO: Raum8Riddle1Chest
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9960_Raum8Riddle1Chest.txt


	

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
			Say{Tag = "room8_riddle1chest_p210_001", String = "(Die Truhe ist durch acht Riegel gesichert.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 8, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_002", String = "(Alle Riegel sind offen. Die Truhe kann jetzt geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 8, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			RemoveDialog{NpcId = self},
			RemoveDialog{NpcId = 8690},
			RemoveDialog{NpcId = 8691},
			RemoveDialog{NpcId = 8692},
			RemoveDialog{NpcId = 8693},
			RemoveDialog{NpcId = 8686},
			RemoveDialog{NpcId = 8687},
			RemoveDialog{NpcId = 8688},
			RemoveDialog{NpcId = 8689},
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
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_003", String = "(Auf dem Deckel der Truhe leuchtet ein Symbol.)"},
			OfferAnswer{Tag = "room8_riddle1chest_p210_004PC", String = "(Das Symbol berühren.)", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_005", String = "(Alle Riegel schließen sich wieder.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{ Name = "P210Room8Torch01On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch02On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch03On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch04On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch05On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch06On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch07On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch08On"},
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

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 7, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 7, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_006", String = "(Sieben Riegel sind offen, einer ist geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 6, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{13;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 6, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_007", String = "(Sechs Riegel sind offen, zwei sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 5, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{17;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 5, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_008", String = "(Fünf Riegel sind offen, drei sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{21;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 4, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_009", String = "(Vier Riegel sind offen, vier sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 4, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{25;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 3, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_010", String = "(Drei Riegel sind offen, fünf sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 3, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{29;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_011", String = "(Zwei Riegel sind offen, sechs sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{33;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_012", String = "(Ein Riegel ist offen, sieben sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle1Lit", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "room8_riddle1chest_p210_013", String = "(Alle Riegel sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end