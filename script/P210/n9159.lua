-->INFO: EntryMenhir
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9159_EntryMenhir.txt


	

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
			Say{Tag = "entrymenhirp210_001", String = "(An diesem Menhir sind vier drehbare Zeiger angebracht.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "entrymenhirp210_002PC", String = "(Den ersten Zeiger drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "entrymenhirp210_012PC", String = "(Den zweiten Zeiger drehen.)", AnswerId = 40},
			OfferAnswer{Tag = "entrymenhirp210_017PC", String = "(Den dritten Zeiger drehen.)", AnswerId = 77},
			OfferAnswer{Tag = "entrymenhirp210_022PC", String = "(Den vierten Zeiger drehen.)", AnswerId = 114},
			OfferAnswer{Tag = "entrymenhirp210_027PC", String = "(Die Zeiger nicht weiter manipulieren.)", AnswerId = 151},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_003", String = "(Wohin soll der Zeiger ausgerichtet werden?)"},
			OfferAnswer{Tag = "entrymenhirp210_004PC", String = "(Den Zeiger nach oben ausrichten)", AnswerId = 4},
			OfferAnswer{Tag = "entrymenhirp210_006PC", String = "(Den Zeiger nach links ausrichten)", AnswerId = 16},
			OfferAnswer{Tag = "entrymenhirp210_008PC", String = "(Den Zeiger nach unten ausrichten)", AnswerId = 24},
			OfferAnswer{Tag = "entrymenhirp210_010PC", String = "(Den Zeiger nach rechts ausrichten)", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_005", String = "(Der erste Zeiger ist jetzt nach oben ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerA", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{5;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerA", Value = 0, Operator = IsEqual},
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_PointerACorrectlySet"},
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
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
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
			SetGlobalFlagFalse{Name = "g_P210_PointerACorrectlySet"},
					SetGlobalFlagTrue {Name = "g_P210_EntryMenhirTried"},
					IncreaseGlobalCounter{Name =  "g_P210_MinorMistakesMade"},
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
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_007", String = "(Der erste Zeiger ist jetzt nach links ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerA", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerA", Value = 1, Operator = IsEqual}),
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
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
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_009", String = "(Der erste Zeiger ist jetzt nach unten ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerA", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{25;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerA", Value = 2, Operator = IsEqual},
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
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
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
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_011", String = "(Der erste Zeiger ist jetzt nach rechts ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerA", Value = 3, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{33;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerA", Value = 3, Operator = IsEqual},
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
			Answer{Tag = "", String = "", AnswerId = 7},
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
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_003", String = "(Wohin soll der Zeiger ausgerichtet werden?)"},
			OfferAnswer{Tag = "entrymenhirp210_004PC", String = "(Den Zeiger nach oben ausrichten)", AnswerId = 41},
			OfferAnswer{Tag = "entrymenhirp210_006PC", String = "(Den Zeiger nach links ausrichten)", AnswerId = 53},
			OfferAnswer{Tag = "entrymenhirp210_008PC", String = "(Den Zeiger nach unten ausrichten)", AnswerId = 61},
			OfferAnswer{Tag = "entrymenhirp210_010PC", String = "(Den Zeiger nach rechts ausrichten)", AnswerId = 69},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_013", String = "(Der zweite Zeiger ist jetzt nach oben ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerB", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{42;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerB", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_PointerBCorrectlySet"},
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
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{Name = "g_P210_PointerBCorrectlySet"},
					SetGlobalFlagTrue {Name = "g_P210_EntryMenhirTried"},
					IncreaseGlobalCounter{Name =  "g_P210_MinorMistakesMade"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_014", String = "(Der zweite Zeiger ist jetzt nach links ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerB", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{54;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerB", Value = 1, Operator = IsEqual},
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
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_015", String = "(Der zweite Zeiger ist jetzt nach unten ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerB", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{62;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerB", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 64},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{66;
		Conditions = {
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
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_016", String = "(Der zweite Zeiger ist jetzt nach rechts ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerB", Value = 3, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerB", Value = 3, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_003", String = "(Wohin soll der Zeiger ausgerichtet werden?)"},
			OfferAnswer{Tag = "entrymenhirp210_004PC", String = "(Den Zeiger nach oben ausrichten)", AnswerId = 78},
			OfferAnswer{Tag = "entrymenhirp210_006PC", String = "(Den Zeiger nach links ausrichten)", AnswerId = 90},
			OfferAnswer{Tag = "entrymenhirp210_008PC", String = "(Den Zeiger nach unten ausrichten)", AnswerId = 98},
			OfferAnswer{Tag = "entrymenhirp210_010PC", String = "(Den Zeiger nach rechts ausrichten)", AnswerId = 106},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_018", String = "(Der dritte Zeiger ist jetzt nach oben ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerC", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{79;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerC", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
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
			SetGlobalFlagTrue{Name = "g_P210_PointerCCorrectlySet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{Name = "g_P210_PointerCCorrectlySet"},
					SetGlobalFlagTrue {Name = "g_P210_EntryMenhirTried"},
					IncreaseGlobalCounter{Name =  "g_P210_MinorMistakesMade"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{90;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_019", String = "(Der dritte Zeiger ist jetzt nach links ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{91;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerC", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 92},
		}}

	OnAnswer{91;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerC", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 95},
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
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_020", String = "(Der dritte Zeiger ist jetzt nach unten ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{99;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerC", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{99;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerC", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 101},
		}}

	OnAnswer{101;
		Conditions = {
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
			Answer{Tag = "", String = "", AnswerId = 81},
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
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_021", String = "(Der dritte Zeiger ist jetzt nach rechts ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 107},
		}}

	OnAnswer{107;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerC", Value = 3, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 108},
		}}

	OnAnswer{107;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerC", Value = 3, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 111},
		}}

	OnAnswer{108;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 109},
		}}

	OnAnswer{109;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 110},
		}}

	OnAnswer{110;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{111;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 112},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{114;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_003", String = "(Wohin soll der Zeiger ausgerichtet werden?)"},
			OfferAnswer{Tag = "entrymenhirp210_004PC", String = "(Den Zeiger nach oben ausrichten)", AnswerId = 115},
			OfferAnswer{Tag = "entrymenhirp210_006PC", String = "(Den Zeiger nach links ausrichten)", AnswerId = 127},
			OfferAnswer{Tag = "entrymenhirp210_008PC", String = "(Den Zeiger nach unten ausrichten)", AnswerId = 135},
			OfferAnswer{Tag = "entrymenhirp210_010PC", String = "(Den Zeiger nach rechts ausrichten)", AnswerId = 143},
		}}

	OnAnswer{115;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_023", String = "(Der vierte Zeiger ist jetzt nach oben ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 116},
		}}

	OnAnswer{116;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerD", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 122},
		}}

	OnAnswer{116;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerD", Value = 0, Operator = IsEqual},
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
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{118;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_PointerDCorrectlySet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 119},
		}}

	OnAnswer{119;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 120},
		}}

	OnAnswer{120;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 121},
		}}

	OnAnswer{121;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{122;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 123},
		}}

	OnAnswer{123;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{Name = "g_P210_PointerDCorrectlySet"},
					SetGlobalFlagTrue {Name = "g_P210_EntryMenhirTried"},
					IncreaseGlobalCounter{Name =  "g_P210_MinorMistakesMade"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 124},
		}}

	OnAnswer{124;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 125},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{127;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_024", String = "(Der vierte Zeiger ist jetzt nach links ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 128},
		}}

	OnAnswer{128;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerD", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 132},
		}}

	OnAnswer{128;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerD", Value = 1, Operator = IsEqual},
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
			Answer{Tag = "", String = "", AnswerId = 131},
		}}

	OnAnswer{131;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{132;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 133},
		}}

	OnAnswer{133;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 134},
		}}

	OnAnswer{134;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 123},
		}}

	OnAnswer{135;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_025", String = "(Der vierte Zeiger ist jetzt nach unten ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 136},
		}}

	OnAnswer{136;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerD", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 137},
		}}

	OnAnswer{136;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerD", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 140},
		}}

	OnAnswer{137;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 138},
		}}

	OnAnswer{138;
		Conditions = {
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
			Answer{Tag = "", String = "", AnswerId = 118},
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
			Answer{Tag = "", String = "", AnswerId = 142},
		}}

	OnAnswer{142;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 123},
		}}

	OnAnswer{143;
		Conditions = {
		},
		Actions = {
			Say{Tag = "entrymenhirp210_026", String = "(Der vierte Zeiger ist jetzt nach rechts ausgerichtet.)"},
			Answer{Tag = "", String = "", AnswerId = 144},
		}}

	OnAnswer{144;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerD", Value = 3, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 145},
		}}

	OnAnswer{144;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerD", Value = 3, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 148},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 147},
		}}

	OnAnswer{147;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
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
			Answer{Tag = "", String = "", AnswerId = 123},
		}}

	OnAnswer{151;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 152},
		}}

	OnAnswer{152;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{152;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end