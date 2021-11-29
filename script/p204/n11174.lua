-->INFO: SchatzmeisterinSahiba
-->INFO: SchatzmeisterBrynjolf
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END

OnOneTimeEvent
{
	Conditions =
	{
		
		
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11174"},
	},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11174_SchatzmeisterinSahiba.txt


	

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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name ="Known"},
		},
		Actions = {
			Say{Tag = "shaibaP204_001", String = "Willkommen in der kaiserlichen Bank von Empyria, der neuesten und fortschrittlichsten Einrichtung dieser Stadt!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name ="Known"}),
		},
		Actions = {
			Say{Tag = "shaibaP204_003", String = "Ah, ein vertrautes Gesicht. Guten Tag!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_002", String = "Kann ich Euch vielleicht für einen kaiserlichen Schatzbrief interessieren? Jeder, der etwas auf sich hält, hat einen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name ="Known"},
			Say{Tag = "", String = ""},
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
			Answer{Tag = "", String = "", AnswerId = 7},
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
			UND9{
										PlayerHasMoney{Gold = 5000},
										Negated(PlayerHasItem{ItemId = 7357})
										},
			PlayerHasItem{ItemId = 7357},
			PlayerHasItem{ItemId = 7357},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_004PC", String = "Was sind Schatzbriefe?", AnswerId = 8},
			OfferAnswer{Tag = "shaibaP204_008PC", String = "Ich möchte einen Schatzbrief kaufen.", AnswerId = 13},
			OfferAnswer{Tag = "shaibaP204_010PC", String = "Ich möchte gern weitere Schatzbriefe kaufen.", AnswerId = 18},
			OfferAnswer{Tag = "shaibaP204_013PC", String = "Wieviel ist mein Schatzbrief inzwischen wert?", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			UND9{
										PlayerHasMoney{Gold = 5000},
										Negated(PlayerHasItem{ItemId = 7357})
										},
			PlayerHasItem{ItemId = 7357},
			Negated(PlayerHasItem{ItemId = 7357}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_004PC", String = "Was sind Schatzbriefe?", AnswerId = 8},
			OfferAnswer{Tag = "shaibaP204_008PC", String = "Ich möchte einen Schatzbrief kaufen.", AnswerId = 13},
			OfferAnswer{Tag = "shaibaP204_010PC", String = "Ich möchte gern weitere Schatzbriefe kaufen.", AnswerId = 18},
		}}

	OnAnswer{7;
		Conditions = {
			UND9{
										PlayerHasMoney{Gold = 5000},
										Negated(PlayerHasItem{ItemId = 7357})
										},
			Negated(PlayerHasItem{ItemId = 7357}),
			PlayerHasItem{ItemId = 7357},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_004PC", String = "Was sind Schatzbriefe?", AnswerId = 8},
			OfferAnswer{Tag = "shaibaP204_008PC", String = "Ich möchte einen Schatzbrief kaufen.", AnswerId = 13},
			OfferAnswer{Tag = "shaibaP204_013PC", String = "Wieviel ist mein Schatzbrief inzwischen wert?", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			UND9{
										PlayerHasMoney{Gold = 5000},
										Negated(PlayerHasItem{ItemId = 7357})
										},
			Negated(PlayerHasItem{ItemId = 7357}),
			Negated(PlayerHasItem{ItemId = 7357}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_004PC", String = "Was sind Schatzbriefe?", AnswerId = 8},
			OfferAnswer{Tag = "shaibaP204_008PC", String = "Ich möchte einen Schatzbrief kaufen.", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND9{
										PlayerHasMoney{Gold = 5000},
										Negated(PlayerHasItem{ItemId = 7357})
										}),
			PlayerHasItem{ItemId = 7357},
			PlayerHasItem{ItemId = 7357},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_004PC", String = "Was sind Schatzbriefe?", AnswerId = 8},
			OfferAnswer{Tag = "shaibaP204_010PC", String = "Ich möchte gern weitere Schatzbriefe kaufen.", AnswerId = 18},
			OfferAnswer{Tag = "shaibaP204_013PC", String = "Wieviel ist mein Schatzbrief inzwischen wert?", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND9{
										PlayerHasMoney{Gold = 5000},
										Negated(PlayerHasItem{ItemId = 7357})
										}),
			PlayerHasItem{ItemId = 7357},
			Negated(PlayerHasItem{ItemId = 7357}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_004PC", String = "Was sind Schatzbriefe?", AnswerId = 8},
			OfferAnswer{Tag = "shaibaP204_010PC", String = "Ich möchte gern weitere Schatzbriefe kaufen.", AnswerId = 18},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND9{
										PlayerHasMoney{Gold = 5000},
										Negated(PlayerHasItem{ItemId = 7357})
										}),
			Negated(PlayerHasItem{ItemId = 7357}),
			PlayerHasItem{ItemId = 7357},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_004PC", String = "Was sind Schatzbriefe?", AnswerId = 8},
			OfferAnswer{Tag = "shaibaP204_013PC", String = "Wieviel ist mein Schatzbrief inzwischen wert?", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND9{
										PlayerHasMoney{Gold = 5000},
										Negated(PlayerHasItem{ItemId = 7357})
										}),
			Negated(PlayerHasItem{ItemId = 7357}),
			Negated(PlayerHasItem{ItemId = 7357}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_004PC", String = "Was sind Schatzbriefe?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_005", String = "Schatzbriefe sind Wertpapiere. Das bedeuted, Ihr kauft einen und leiht damit dem kaiserlichen Hof Euer Geld."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_006", String = "Um einen Schatzbrief zu erwerben, zahlt Ihr einmalig 5000 Goldstücke. Wenn Ihr ihn dann wieder einlöst, bekommt Ihr zusätzlich zu diesem Wert Zinsen."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_007", String = "Der Zinssatz steigt dabei treppenartig an: Je länger Ihr ihn nicht zurückgebt, desto höher der Zins!"},
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_009", String = "Sehr gern! Bitteschön!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 5000, Flag = Take},
								  TransferItem{GiveItem = 7357, Flag = Give},
								  SetGlobalTimeStamp{Name = "g_SchatzbriefTimer"},
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
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_011", String = "Leider darf pro Person nur ein einziger Schatzbrief verkauft werden."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_012", String = "Ihr könnt erst dann einen neuen kaufen, sobald Ihr Euren alten wieder eingelöst habt."},
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
			Answer{Tag = "", String = "", AnswerId = 7},
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
			 IsGlobalCounter {Name = "g_P204_SchatzbriefZins", Value = 0, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "shaibaP204_014", String = "Es ist noch kein Zins fällig geworden. Euer Schatzbrief ist noch 5000 Goldstücke wert."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_SchatzbriefZins", Value = 0, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_015PC", String = "Ich möchte verkaufen.", AnswerId = 25},
			OfferAnswer{Tag = "shaibaP204_017PC", String = "Ich werde ihn noch behalten.", AnswerId = 30},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_016", String = "Hier Euer Geld."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 5000, Flag = Give},
								  TransferItem{TakeItem = 7357, Flag = Take},
								  ResetGlobalCounter {Name = "g_P204_SchatzbriefZins"},
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
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{33;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_SchatzbriefZins", Value = 1, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{33;
		Conditions = {
			 IsGlobalCounter {Name = "g_P204_SchatzbriefZins", Value = 1, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "shaibaP204_018", String = "Euer Schatzbrief ist jetzt 5500 Goldstücke wert."},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_015PC", String = "Ich möchte verkaufen.", AnswerId = 35},
			OfferAnswer{Tag = "shaibaP204_017PC", String = "Ich werde ihn noch behalten.", AnswerId = 40},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_016", String = "Hier Euer Geld."},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 5500, Flag = Give},
								  TransferItem{TakeItem = 7357, Flag = Take},
								  ResetGlobalCounter {Name = "g_P204_SchatzbriefZins"},
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
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{43;
		Conditions = {
			 IsGlobalCounter {Name = "g_P204_SchatzbriefZins", Value = 2, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "shaibaP204_019", String = "Euer Schatzbrief ist jetzt 6400 Goldstücke wert."},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{43;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_SchatzbriefZins", Value = 2, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_015PC", String = "Ich möchte verkaufen.", AnswerId = 45},
			OfferAnswer{Tag = "shaibaP204_017PC", String = "Ich werde ihn noch behalten.", AnswerId = 50},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_016", String = "Hier Euer Geld."},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 6400, Flag = Give},
								  TransferItem{TakeItem = 7357, Flag = Take},
								  ResetGlobalCounter {Name = "g_P204_SchatzbriefZins"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{53;
		Conditions = {
			 IsGlobalCounter {Name = "g_P204_SchatzbriefZins", Value = 3, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "shaibaP204_020", String = "Euer Schatzbrief ist jetzt 7700 Goldstücke wert."},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{53;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_SchatzbriefZins", Value = 3, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_015PC", String = "Ich möchte verkaufen.", AnswerId = 55},
			OfferAnswer{Tag = "shaibaP204_017PC", String = "Ich werde ihn noch behalten.", AnswerId = 60},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_016", String = "Hier Euer Geld."},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 7700, Flag = Give},
								  TransferItem{TakeItem = 7357, Flag = Take},
								  ResetGlobalCounter {Name = "g_P204_SchatzbriefZins"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 58},
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{63;
		Conditions = {
			 IsGlobalCounter {Name = "g_P204_SchatzbriefZins", Value = 4, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "shaibaP204_021", String = "Euer Schatzbrief ist jetzt 9400 Goldstücke wert."},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{63;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_SchatzbriefZins", Value = 4, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_015PC", String = "Ich möchte verkaufen.", AnswerId = 65},
			OfferAnswer{Tag = "shaibaP204_017PC", String = "Ich werde ihn noch behalten.", AnswerId = 70},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_016", String = "Hier Euer Geld."},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 9400, Flag = Give},
								  TransferItem{TakeItem = 7357, Flag = Take},
								  ResetGlobalCounter {Name = "g_P204_SchatzbriefZins"},
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 71},
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
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_022", String = "Euer Schatzbrief hat die höchste Zinsstufe erreicht und ist jetzt 11500 Goldstücke wert."},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shaibaP204_015PC", String = "Ich möchte verkaufen.", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shaibaP204_016", String = "Hier Euer Geld."},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 11500, Flag = Give},
								  TransferItem{TakeItem = 7357, Flag = Take},
								  ResetGlobalCounter {Name = "g_P204_SchatzbriefZins"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 77},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}


	EndDefinition()
end