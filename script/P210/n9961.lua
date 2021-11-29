-->INFO: Raum8Riddle2Chest
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9961_Raum8Riddle2Chest.txt


	

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
			Say{Tag = "room8_riddle2chest_p210_001", String = "(Die Truhe ist durch sechs Riegel gesichert.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 6, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "room8_riddle2chest_p210_002", String = "(Alle Riegel sind offen. Die Truhe kann jetzt geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 6, Operator = IsEqual} ),
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
			RemoveDialog{NpcId = 8931},
			RemoveDialog{NpcId = 8932},
			RemoveDialog{NpcId = 8933},
			RemoveDialog{NpcId = 8934},
			RemoveDialog{NpcId = 8935},
			RemoveDialog{NpcId = 8936},
			RemoveDialog{NpcId = 8937},
			RemoveDialog{NpcId = 8938},
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
			Say{Tag = "room8_riddle2chest_p210_003", String = "(Auf dem Deckel der Truhe leuchtet ein Symbol.)"},
			OfferAnswer{Tag = "room8_riddle2chest_p210_004PC", String = "(Das Symbol berühren.)", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "room8_riddle2chest_p210_005", String = "(Alle Riegel schließen sich wieder.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{ Name = "P210Room8Torch11On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch12On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch13On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch14On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch15On"},
			SetGlobalFlagFalse{ Name = "P210Room8Torch16On"},
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
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 5, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle2chest_p210_006", String = "(Fünf Riegel sind offen, einer ist geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 5, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
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
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 4, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle2chest_p210_007", String = "(Vier Riegel sind offen, zwei sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 4, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
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
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 3, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle2chest_p210_008", String = "(Drei Riegel sind offen, drei sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 3, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
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
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle2chest_p210_009", String = "(Zwei Riegel sind offen, vier sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 2, Operator = IsEqual}),
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
			IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "room8_riddle2chest_p210_010", String = "(Ein Riegel ist offen, fünf sind geschlossen.)"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_Room8TorchRiddle2Lit", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "room8_riddle2chest_p210_011", String = "(Alle Riegel sind geschlossen.)"},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end