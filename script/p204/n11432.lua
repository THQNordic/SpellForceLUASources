-->INFO: Orakel
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11432_Orakel.txt


	

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
			Say{Tag = "orakel2P204_001", String = "(In dieser Steinhand befinden sich 4 Vertiefungen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalCounter {Name = "gc_P204_CounterTafelnRechts", Value = 4, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalCounter {Name = "gc_P204_CounterTafelnRechts", Value = 4, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_002PC", String = "(Inschrift Sidonie lesen.)", AnswerId = 3},
			OfferAnswer{Tag = "orakel2P204_004PC", String = "(Inschrift Jochen lesen.)", AnswerId = 7},
			OfferAnswer{Tag = "orakel2P204_006PC", String = "(Inschrift Marcus lesen.)", AnswerId = 11},
			OfferAnswer{Tag = "orakel2P204_008PC", String = "(Inschrift Michael lesen.)", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel2P204_003", String = "(muß hessen vernichten.... g.i.r.l.)"},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel2P204_005", String = "(La Silka sagt: Der abartige, gelbe Keks trifft die Austair an der Leidtplanke im Strahlungskönig.)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel2P204_007", String = "(Raven Pass - Console: SetGlobalFlagTrue{Name = 'p207_Death'})"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel2P204_009", String = "(Bäume sterben aufrecht - Alejandro Casona)"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{19;
		Conditions = {
			PlayerHasItem{ItemId = 7349},
			PlayerHasItem{ItemId = 7350},
			PlayerHasItem{ItemId = 7351},
			PlayerHasItem{ItemId = 7352},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_010PC", String = "(Die Steintafel der Sidonie einsetzen.)", AnswerId = 20},
			OfferAnswer{Tag = "orakel2P204_012PC", String = "(Die Steintafel des Jochen einsetzen.)", AnswerId = 24},
			OfferAnswer{Tag = "orakel2P204_013PC", String = "(Die Steintafel des Marcus einsetzen.)", AnswerId = 28},
			OfferAnswer{Tag = "orakel2P204_014PC", String = "(Die Steintafel des Michael einsetzen.)", AnswerId = 32},
		}}

	OnAnswer{19;
		Conditions = {
			PlayerHasItem{ItemId = 7349},
			PlayerHasItem{ItemId = 7350},
			PlayerHasItem{ItemId = 7351},
			Negated(PlayerHasItem{ItemId = 7352}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_010PC", String = "(Die Steintafel der Sidonie einsetzen.)", AnswerId = 20},
			OfferAnswer{Tag = "orakel2P204_012PC", String = "(Die Steintafel des Jochen einsetzen.)", AnswerId = 24},
			OfferAnswer{Tag = "orakel2P204_013PC", String = "(Die Steintafel des Marcus einsetzen.)", AnswerId = 28},
		}}

	OnAnswer{19;
		Conditions = {
			PlayerHasItem{ItemId = 7349},
			PlayerHasItem{ItemId = 7350},
			Negated(PlayerHasItem{ItemId = 7351}),
			PlayerHasItem{ItemId = 7352},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_010PC", String = "(Die Steintafel der Sidonie einsetzen.)", AnswerId = 20},
			OfferAnswer{Tag = "orakel2P204_012PC", String = "(Die Steintafel des Jochen einsetzen.)", AnswerId = 24},
			OfferAnswer{Tag = "orakel2P204_014PC", String = "(Die Steintafel des Michael einsetzen.)", AnswerId = 32},
		}}

	OnAnswer{19;
		Conditions = {
			PlayerHasItem{ItemId = 7349},
			PlayerHasItem{ItemId = 7350},
			Negated(PlayerHasItem{ItemId = 7351}),
			Negated(PlayerHasItem{ItemId = 7352}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_010PC", String = "(Die Steintafel der Sidonie einsetzen.)", AnswerId = 20},
			OfferAnswer{Tag = "orakel2P204_012PC", String = "(Die Steintafel des Jochen einsetzen.)", AnswerId = 24},
		}}

	OnAnswer{19;
		Conditions = {
			PlayerHasItem{ItemId = 7349},
			Negated(PlayerHasItem{ItemId = 7350}),
			PlayerHasItem{ItemId = 7351},
			PlayerHasItem{ItemId = 7352},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_010PC", String = "(Die Steintafel der Sidonie einsetzen.)", AnswerId = 20},
			OfferAnswer{Tag = "orakel2P204_013PC", String = "(Die Steintafel des Marcus einsetzen.)", AnswerId = 28},
			OfferAnswer{Tag = "orakel2P204_014PC", String = "(Die Steintafel des Michael einsetzen.)", AnswerId = 32},
		}}

	OnAnswer{19;
		Conditions = {
			PlayerHasItem{ItemId = 7349},
			Negated(PlayerHasItem{ItemId = 7350}),
			PlayerHasItem{ItemId = 7351},
			Negated(PlayerHasItem{ItemId = 7352}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_010PC", String = "(Die Steintafel der Sidonie einsetzen.)", AnswerId = 20},
			OfferAnswer{Tag = "orakel2P204_013PC", String = "(Die Steintafel des Marcus einsetzen.)", AnswerId = 28},
		}}

	OnAnswer{19;
		Conditions = {
			PlayerHasItem{ItemId = 7349},
			Negated(PlayerHasItem{ItemId = 7350}),
			Negated(PlayerHasItem{ItemId = 7351}),
			PlayerHasItem{ItemId = 7352},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_010PC", String = "(Die Steintafel der Sidonie einsetzen.)", AnswerId = 20},
			OfferAnswer{Tag = "orakel2P204_014PC", String = "(Die Steintafel des Michael einsetzen.)", AnswerId = 32},
		}}

	OnAnswer{19;
		Conditions = {
			PlayerHasItem{ItemId = 7349},
			Negated(PlayerHasItem{ItemId = 7350}),
			Negated(PlayerHasItem{ItemId = 7351}),
			Negated(PlayerHasItem{ItemId = 7352}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_010PC", String = "(Die Steintafel der Sidonie einsetzen.)", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7349}),
			PlayerHasItem{ItemId = 7350},
			PlayerHasItem{ItemId = 7351},
			PlayerHasItem{ItemId = 7352},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_012PC", String = "(Die Steintafel des Jochen einsetzen.)", AnswerId = 24},
			OfferAnswer{Tag = "orakel2P204_013PC", String = "(Die Steintafel des Marcus einsetzen.)", AnswerId = 28},
			OfferAnswer{Tag = "orakel2P204_014PC", String = "(Die Steintafel des Michael einsetzen.)", AnswerId = 32},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7349}),
			PlayerHasItem{ItemId = 7350},
			PlayerHasItem{ItemId = 7351},
			Negated(PlayerHasItem{ItemId = 7352}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_012PC", String = "(Die Steintafel des Jochen einsetzen.)", AnswerId = 24},
			OfferAnswer{Tag = "orakel2P204_013PC", String = "(Die Steintafel des Marcus einsetzen.)", AnswerId = 28},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7349}),
			PlayerHasItem{ItemId = 7350},
			Negated(PlayerHasItem{ItemId = 7351}),
			PlayerHasItem{ItemId = 7352},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_012PC", String = "(Die Steintafel des Jochen einsetzen.)", AnswerId = 24},
			OfferAnswer{Tag = "orakel2P204_014PC", String = "(Die Steintafel des Michael einsetzen.)", AnswerId = 32},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7349}),
			PlayerHasItem{ItemId = 7350},
			Negated(PlayerHasItem{ItemId = 7351}),
			Negated(PlayerHasItem{ItemId = 7352}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_012PC", String = "(Die Steintafel des Jochen einsetzen.)", AnswerId = 24},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7349}),
			Negated(PlayerHasItem{ItemId = 7350}),
			PlayerHasItem{ItemId = 7351},
			PlayerHasItem{ItemId = 7352},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_013PC", String = "(Die Steintafel des Marcus einsetzen.)", AnswerId = 28},
			OfferAnswer{Tag = "orakel2P204_014PC", String = "(Die Steintafel des Michael einsetzen.)", AnswerId = 32},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7349}),
			Negated(PlayerHasItem{ItemId = 7350}),
			PlayerHasItem{ItemId = 7351},
			Negated(PlayerHasItem{ItemId = 7352}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_013PC", String = "(Die Steintafel des Marcus einsetzen.)", AnswerId = 28},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7349}),
			Negated(PlayerHasItem{ItemId = 7350}),
			Negated(PlayerHasItem{ItemId = 7351}),
			PlayerHasItem{ItemId = 7352},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel2P204_014PC", String = "(Die Steintafel des Michael einsetzen.)", AnswerId = 32},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7349}),
			Negated(PlayerHasItem{ItemId = 7350}),
			Negated(PlayerHasItem{ItemId = 7351}),
			Negated(PlayerHasItem{ItemId = 7352}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel2P204_011", String = "(Die Schrift auf der Tafel ist nun lesbar.)."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7349, Flag = Take}, SetEffect { X = 178, Y = 265, Effect = "Torch" }, IncreaseGlobalCounter {Name = "gc_P204_CounterTafelnRechts", Step = 1},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
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
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel2P204_011", String = "(Die Schrift auf der Tafel ist nun lesbar.)."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7350, Flag = Take}, SetEffect { X = 182, Y = 265, Effect = "Torch" }, IncreaseGlobalCounter {Name = "gc_P204_CounterTafelnRechts", Step = 1},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
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
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel2P204_011", String = "(Die Schrift auf der Tafel ist nun lesbar.)."},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7351, Flag = Take}, SetEffect { X = 178, Y = 261, Effect = "Torch" }, IncreaseGlobalCounter {Name = "gc_P204_CounterTafelnRechts", Step = 1},
			Say{Tag = "", String = ""},
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
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel2P204_011", String = "(Die Schrift auf der Tafel ist nun lesbar.)."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7352, Flag = Take}, SetEffect { X = 182, Y = 261, Effect = "Torch" }, IncreaseGlobalCounter {Name = "gc_P204_CounterTafelnRechts", Step = 1},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
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
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end