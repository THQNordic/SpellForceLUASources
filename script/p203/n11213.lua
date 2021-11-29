-->INFO: Vergiftete_Quelle
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p203\n11213_Vergiftete_Quelle.txt


	

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
			Say{Tag = "fountain_onyxP203_001", String = "(Eine Quelle. Das Wasser, das zwischen den Steinen hervorsprudelt, hat eine grünliche Färbung und verströmt einen beißenden Geruch. Tote Tiere liegen in der Umgebung.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_002", String = "(Neben der Quelle gibt es einen kleinen Teich, in dem noch frisches, klares Wasser steht. Der Rest des Wassers scheint vergiftet.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_003", String = "(Wenn Ihr in die Quelle heinblickt, könnt Ihr im Wasser einen dunklen Gegenstand sehen, der tief im Innern der Quelle verkeilt ist.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			PlayerHasItem {ItemId = 7333},
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_004", String = "(Ihr würdet ein Werkzeug benötigen, um den Gegenstand heraus zu holen.)"},
			OfferAnswer{Tag = "fountain_onyxP203_005PC", String = "(Mit dem Nagelstock nach dem Gegenstand stochern.)", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7333}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_004", String = "(Ihr würdet ein Werkzeug benötigen, um den Gegenstand heraus zu holen.)"},
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
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 11},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 13},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 11},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 13},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
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
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 19},
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
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 20},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 20},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 22},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 168},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{24;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
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
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 29},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 31},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 29},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 31},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 33},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
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
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
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
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 40},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 42},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 40},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 42},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{44;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 49},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 51},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 49},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 51},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 168},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{53;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 58},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 60},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 62},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 64},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 58},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 60},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 62},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 64},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{66;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 71},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 73},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 75},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 77},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 71},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 73},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 75},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 77},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 113},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 84},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 86},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 88},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 84},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 86},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 88},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 126},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 90},
		}}

	OnAnswer{90;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 92},
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 93},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 95},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 97},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 99},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 95},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 97},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 99},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 137},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 101},
		}}

	OnAnswer{101;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{101;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{102;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{103;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 104},
		}}

	OnAnswer{104;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 106},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 108},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 110},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 112},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 106},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 108},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 110},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 112},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{108;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 146},
		}}

	OnAnswer{110;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{112;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 113},
		}}

	OnAnswer{113;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 114},
		}}

	OnAnswer{114;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{114;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 115},
		}}

	OnAnswer{115;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 116},
		}}

	OnAnswer{116;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 117},
		}}

	OnAnswer{117;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 119},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 121},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 123},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 125},
		}}

	OnAnswer{118;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 119},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 121},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 123},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 125},
		}}

	OnAnswer{119;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{121;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 157},
		}}

	OnAnswer{123;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{125;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 126},
		}}

	OnAnswer{126;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 127},
		}}

	OnAnswer{127;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 128},
		}}

	OnAnswer{127;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 131},
		}}

	OnAnswer{128;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 129},
		}}

	OnAnswer{129;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 130},
		}}

	OnAnswer{130;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 132},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 134},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 136},
		}}

	OnAnswer{131;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 132},
			OfferAnswer{Tag = "fountain_onyxP203_008PC", String = "(Den Nagelstock nach unten bewegen.)", AnswerId = 134},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 136},
		}}

	OnAnswer{132;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{134;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 168},
		}}

	OnAnswer{136;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 113},
		}}

	OnAnswer{137;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 138},
		}}

	OnAnswer{138;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 142},
		}}

	OnAnswer{138;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 139},
		}}

	OnAnswer{139;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 140},
		}}

	OnAnswer{140;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 141},
		}}

	OnAnswer{141;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 143},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 145},
		}}

	OnAnswer{142;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 143},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 145},
		}}

	OnAnswer{143;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{145;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 146},
		}}

	OnAnswer{146;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 147},
		}}

	OnAnswer{147;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 148},
		}}

	OnAnswer{147;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 151},
		}}

	OnAnswer{148;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 149},
		}}

	OnAnswer{149;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 150},
		}}

	OnAnswer{150;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 152},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 154},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 156},
		}}

	OnAnswer{151;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 152},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 154},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 156},
		}}

	OnAnswer{152;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{154;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 137},
		}}

	OnAnswer{156;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 157},
		}}

	OnAnswer{157;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_006", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen.)"},
			Answer{Tag = "", String = "", AnswerId = 158},
		}}

	OnAnswer{158;
		Conditions = {
			PlayerHasItem {ItemId = 7324},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 159},
		}}

	OnAnswer{158;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7324}),
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_007", String = "(Die beißende Flüssigkeit verbrennt Eure Hände! Ihr nehmt Schaden!)"},
			Answer{Tag = "", String = "", AnswerId = 162},
		}}

	OnAnswer{159;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 160},
		}}

	OnAnswer{160;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 161},
		}}

	OnAnswer{161;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 163},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 165},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 167},
		}}

	OnAnswer{162;
		Conditions = {
		},
		Actions = {
			SetHealth {HitPoints = 250,NpcId = 0, Decrease = TRUE},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fountain_onyxP203_011PC", String = "(Den Nagelstock nach oben bewegen.)", AnswerId = 163},
			OfferAnswer{Tag = "fountain_onyxP203_010PC", String = "(Den Nagelstock nach links bewegen.)", AnswerId = 165},
			OfferAnswer{Tag = "fountain_onyxP203_009PC", String = "(Den Nagelstock nach rechts bewegen.)", AnswerId = 167},
		}}

	OnAnswer{163;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 113},
		}}

	OnAnswer{165;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 146},
		}}

	OnAnswer{167;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 168},
		}}

	OnAnswer{168;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_012", String = "(Ihr tastet mit dem Nagelstock im Innern der Quelle zwischen den Steinen. Die Nagelstock hakt sich an etwas fest!)"},
			Answer{Tag = "", String = "", AnswerId = 169},
		}}

	OnAnswer{169;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_013", String = "(Als Ihr ihn herauszieht steckt an seinem Ende eine tote Kreatur, die jene beißende Flüssigkeit absondert, die das Wasser vergiftet.)"},
			Answer{Tag = "", String = "", AnswerId = 170},
		}}

	OnAnswer{170;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fountain_onyxP203_014", String = "(Ihr habt die Quelle gesäubert! Nun fließt wieder frisches, klares Wasser zwischen den Steinen!)"},
			Answer{Tag = "", String = "", AnswerId = 171},
		}}

	OnAnswer{171;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 1030}, QuestBegin{QuestId = 1031},
			RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end