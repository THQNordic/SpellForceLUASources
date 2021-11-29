-->INFO: Orakel
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11431_Orakel.txt


	

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
			Say{Tag = "orakel1P204_001", String = "(In dieser Steinhand befinden sich 4 Vertiefungen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalCounter {Name = "gc_P204_CounterTafelnLinks", Value = 4, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalCounter {Name = "gc_P204_CounterTafelnLinks", Value = 4, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_002PC", String = "(Inschrift von Arne lesen.)", AnswerId = 3},
			OfferAnswer{Tag = "orakel1P204_004PC", String = "(Inschrift von Libi lesen.)", AnswerId = 7},
			OfferAnswer{Tag = "orakel1P204_008PC", String = "(Inschrift von Holger lesen.)", AnswerId = 13},
			OfferAnswer{Tag = "orakel1P204_011PC", String = "(Inschrift von Steffen lesen.)", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel1P204_003", String = "(Mortannon: Why-oh-why didn't I take the BLUE pill ... )"},
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
			Say{Tag = "orakel1P204_005", String = "(Erbauer von Graufurt, Tirganach und Empyria.)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel1P204_006", String = "(Möchte jemand Käsebällchen? Gary? Die sind gut...Na, Käsebällchen?)"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel1P204_007", String = "(Hallo?...Mm-mm...Sie haben sich verwählt. Hier gibt es keine Thelma.)"},
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
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel1P204_009", String = "(Das Spice muss fließen.)"},
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
			Say{Tag = "orakel1P204_010", String = "(We all sync to head revision.)"},
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
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel1P204_012", String = "'Wahrhaft siegt, wer nicht kämpft.' -Sun Tsu, chinesischer General."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel1P204_013", String = "'Trantor immer siegen! Haben Flammenwerfer!' -Trantor, angehender Beherrscher des Universums."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 7345},
			PlayerHasItem{ItemId = 7346},
			PlayerHasItem{ItemId = 7347},
			PlayerHasItem{ItemId = 7348},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_014PC", String = "(Die Steintafel des Arne einsetzen.)", AnswerId = 23},
			OfferAnswer{Tag = "orakel1P204_016PC", String = "(Die Steintafel des Libi einsetzen.)", AnswerId = 27},
			OfferAnswer{Tag = "orakel1P204_017PC", String = "(Die Steintafel des Holger einsetzen.)", AnswerId = 31},
			OfferAnswer{Tag = "orakel1P204_018PC", String = "(Die Steintafel des Steffen einsetzen.)", AnswerId = 35},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 7345},
			PlayerHasItem{ItemId = 7346},
			PlayerHasItem{ItemId = 7347},
			Negated(PlayerHasItem{ItemId = 7348}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_014PC", String = "(Die Steintafel des Arne einsetzen.)", AnswerId = 23},
			OfferAnswer{Tag = "orakel1P204_016PC", String = "(Die Steintafel des Libi einsetzen.)", AnswerId = 27},
			OfferAnswer{Tag = "orakel1P204_017PC", String = "(Die Steintafel des Holger einsetzen.)", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 7345},
			PlayerHasItem{ItemId = 7346},
			Negated(PlayerHasItem{ItemId = 7347}),
			PlayerHasItem{ItemId = 7348},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_014PC", String = "(Die Steintafel des Arne einsetzen.)", AnswerId = 23},
			OfferAnswer{Tag = "orakel1P204_016PC", String = "(Die Steintafel des Libi einsetzen.)", AnswerId = 27},
			OfferAnswer{Tag = "orakel1P204_018PC", String = "(Die Steintafel des Steffen einsetzen.)", AnswerId = 35},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 7345},
			PlayerHasItem{ItemId = 7346},
			Negated(PlayerHasItem{ItemId = 7347}),
			Negated(PlayerHasItem{ItemId = 7348}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_014PC", String = "(Die Steintafel des Arne einsetzen.)", AnswerId = 23},
			OfferAnswer{Tag = "orakel1P204_016PC", String = "(Die Steintafel des Libi einsetzen.)", AnswerId = 27},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 7345},
			Negated(PlayerHasItem{ItemId = 7346}),
			PlayerHasItem{ItemId = 7347},
			PlayerHasItem{ItemId = 7348},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_014PC", String = "(Die Steintafel des Arne einsetzen.)", AnswerId = 23},
			OfferAnswer{Tag = "orakel1P204_017PC", String = "(Die Steintafel des Holger einsetzen.)", AnswerId = 31},
			OfferAnswer{Tag = "orakel1P204_018PC", String = "(Die Steintafel des Steffen einsetzen.)", AnswerId = 35},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 7345},
			Negated(PlayerHasItem{ItemId = 7346}),
			PlayerHasItem{ItemId = 7347},
			Negated(PlayerHasItem{ItemId = 7348}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_014PC", String = "(Die Steintafel des Arne einsetzen.)", AnswerId = 23},
			OfferAnswer{Tag = "orakel1P204_017PC", String = "(Die Steintafel des Holger einsetzen.)", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 7345},
			Negated(PlayerHasItem{ItemId = 7346}),
			Negated(PlayerHasItem{ItemId = 7347}),
			PlayerHasItem{ItemId = 7348},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_014PC", String = "(Die Steintafel des Arne einsetzen.)", AnswerId = 23},
			OfferAnswer{Tag = "orakel1P204_018PC", String = "(Die Steintafel des Steffen einsetzen.)", AnswerId = 35},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 7345},
			Negated(PlayerHasItem{ItemId = 7346}),
			Negated(PlayerHasItem{ItemId = 7347}),
			Negated(PlayerHasItem{ItemId = 7348}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_014PC", String = "(Die Steintafel des Arne einsetzen.)", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7345}),
			PlayerHasItem{ItemId = 7346},
			PlayerHasItem{ItemId = 7347},
			PlayerHasItem{ItemId = 7348},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_016PC", String = "(Die Steintafel des Libi einsetzen.)", AnswerId = 27},
			OfferAnswer{Tag = "orakel1P204_017PC", String = "(Die Steintafel des Holger einsetzen.)", AnswerId = 31},
			OfferAnswer{Tag = "orakel1P204_018PC", String = "(Die Steintafel des Steffen einsetzen.)", AnswerId = 35},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7345}),
			PlayerHasItem{ItemId = 7346},
			PlayerHasItem{ItemId = 7347},
			Negated(PlayerHasItem{ItemId = 7348}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_016PC", String = "(Die Steintafel des Libi einsetzen.)", AnswerId = 27},
			OfferAnswer{Tag = "orakel1P204_017PC", String = "(Die Steintafel des Holger einsetzen.)", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7345}),
			PlayerHasItem{ItemId = 7346},
			Negated(PlayerHasItem{ItemId = 7347}),
			PlayerHasItem{ItemId = 7348},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_016PC", String = "(Die Steintafel des Libi einsetzen.)", AnswerId = 27},
			OfferAnswer{Tag = "orakel1P204_018PC", String = "(Die Steintafel des Steffen einsetzen.)", AnswerId = 35},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7345}),
			PlayerHasItem{ItemId = 7346},
			Negated(PlayerHasItem{ItemId = 7347}),
			Negated(PlayerHasItem{ItemId = 7348}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_016PC", String = "(Die Steintafel des Libi einsetzen.)", AnswerId = 27},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7345}),
			Negated(PlayerHasItem{ItemId = 7346}),
			PlayerHasItem{ItemId = 7347},
			PlayerHasItem{ItemId = 7348},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_017PC", String = "(Die Steintafel des Holger einsetzen.)", AnswerId = 31},
			OfferAnswer{Tag = "orakel1P204_018PC", String = "(Die Steintafel des Steffen einsetzen.)", AnswerId = 35},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7345}),
			Negated(PlayerHasItem{ItemId = 7346}),
			PlayerHasItem{ItemId = 7347},
			Negated(PlayerHasItem{ItemId = 7348}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_017PC", String = "(Die Steintafel des Holger einsetzen.)", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7345}),
			Negated(PlayerHasItem{ItemId = 7346}),
			Negated(PlayerHasItem{ItemId = 7347}),
			PlayerHasItem{ItemId = 7348},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orakel1P204_018PC", String = "(Die Steintafel des Steffen einsetzen.)", AnswerId = 35},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 7345}),
			Negated(PlayerHasItem{ItemId = 7346}),
			Negated(PlayerHasItem{ItemId = 7347}),
			Negated(PlayerHasItem{ItemId = 7348}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel1P204_015", String = "(Die Tafel wurde eingesetzt.)."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7345, Flag = Take}, SetEffect { X = 168, Y = 265, Effect = "Torch" }, IncreaseGlobalCounter {Name = "gc_P204_CounterTafelnLinks", Step = 1},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel1P204_015", String = "(Die Tafel wurde eingesetzt.)."},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7346, Flag = Take}, SetEffect { X = 172, Y = 265, Effect = "Torch" }, IncreaseGlobalCounter {Name = "gc_P204_CounterTafelnLinks", Step = 1},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel1P204_015", String = "(Die Tafel wurde eingesetzt.)."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7347, Flag = Take}, SetEffect { X = 168, Y = 261, Effect = "Torch" }, IncreaseGlobalCounter {Name = "gc_P204_CounterTafelnLinks", Step = 1},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orakel1P204_015", String = "(Die Tafel wurde eingesetzt.)."},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7348, Flag = Take}, SetEffect { X = 172, Y = 261, Effect = "Torch" }, IncreaseGlobalCounter {Name = "gc_P204_CounterTafelnLinks", Step = 1},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end