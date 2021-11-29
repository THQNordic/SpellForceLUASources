-->INFO: SchatzmeisterBrynjolf
-->INFO: SchatzmeisterinSabiha
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = South}
--!EDS ONIDLEGOHOME END

OnOneTimeEvent
{
	Conditions =
	{
		
		
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10999"},
	},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10999_SchatzmeisterBrynjolf.txt


	

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
			Say{Tag = "brynjolfP204_001", String = "Willkommen in usnerer Bank! Ich bin Brynjolf und ich kümmere mich hier um Edelmetalle aller Art!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name ="Known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_002", String = "Ihr seht erschöpft aus, wahrscheinlich, weil IHr zahllose Godlstücke in Euren Taschen mit Euch herumschleppt! Das muss nicht sein!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_003", String = "Kauft einige unserer guten Adamantinumbarren! Sie sind viel leichter als Euer Gold und Ihr könnt beim Verkauf einen Gewinn machen, wenn Ihr Glück habt!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_004", String = "Wie schaut es aus, wagt Ihr Euch?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name ="Known"},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND9{
													IsNpcFlagFalse{Name ="RavenPassInfoGiven"},
													QuestState{QuestId = 972 , State = StateSolved}
													}
													),
		},
		Actions = {
			Say{Tag = "brynjolfP204_008", String = "527 ... 528 ... Ach verflixt, schon wieder verzählt! Was ist?"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			UND9{
													IsNpcFlagFalse{Name ="RavenPassInfoGiven"},
													QuestState{QuestId = 972 , State = StateSolved}
													}
													,
		},
		Actions = {
			Say{Tag = "brynjolfP204_005", String = "Habt Ihr schon gehört? Der Rabenpass wurde wieder geöffnet! Die Untoten wurden vertrieben!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_006", String = "Jetzt kann in den Bergen wieder Adamantinum abgebaut werden!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_007", String = "Was natürlich bedeuted, dass der Preis erheblich gesunken ist! Ihr bekommt es jetzt viel günstiger!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			 SetNpcFlagTrue{Name ="RavenPassInfoGiven"} ,
			Say{Tag = "", String = ""},
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
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_009", String = "Ich hoffe, Ihr wollt etwas Adamantinum kaufen!"},
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
			 IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 0, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "brynjolfP204_010", String = "Der Preis für einen Adamantinumbarren liegt im Moment bei 250 Gold."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 0, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{17;
		Conditions = {
			PlayerHasMoney{Gold = 250},
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 18},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 23},
		}}

	OnAnswer{17;
		Conditions = {
			PlayerHasMoney{Gold = 250},
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 250}),
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 23},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 250}),
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_012", String = "Hier habt Ihr ihn! Passt gut darauf auf!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 250, Flag = Take},
					 TransferItem{GiveItem = 7358, Flag = Give},
			Say{Tag = "", String = ""},
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
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_013", String = "Natürlich. Hier, Euer Gold!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 250, Flag = Give},
					 TransferItem{TakeItem = 7358, Flag = Take},
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
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{28;
		Conditions = {
			 IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 1, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "brynjolfP204_014", String = "Der Preis für einen Adamantinumbarren liegt im Moment bei 280 Gold."},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{28;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 1, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{29;
		Conditions = {
			PlayerHasMoney{Gold = 280},
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 30},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			PlayerHasMoney{Gold = 280},
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 280}),
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 280}),
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_012", String = "Hier habt Ihr ihn! Passt gut darauf auf!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 280, Flag = Take},
					 TransferItem{GiveItem = 7358, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
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
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_013", String = "Natürlich. Hier, Euer Gold!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 280, Flag = Give},
					 TransferItem{TakeItem = 7358, Flag = Take},
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
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{40;
		Conditions = {
			 IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 2, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "brynjolfP204_015", String = "Der Preis für einen Adamantinumbarren liegt im Moment bei 330 Gold."},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 2, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasMoney{Gold = 330},
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 42},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 47},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasMoney{Gold = 330},
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 42},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 330}),
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 47},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 330}),
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_012", String = "Hier habt Ihr ihn! Passt gut darauf auf!"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 330, Flag = Take},
					 TransferItem{GiveItem = 7358, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
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
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_013", String = "Natürlich. Hier, Euer Gold!"},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 330, Flag = Give},
					 TransferItem{TakeItem = 7358, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
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
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{52;
		Conditions = {
			 IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 3, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "brynjolfP204_016", String = "Der Preis für einen Adamantinumbarren liegt im Moment bei 375 Gold."},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{52;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 3, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{53;
		Conditions = {
			PlayerHasMoney{Gold = 375},
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 54},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 59},
		}}

	OnAnswer{53;
		Conditions = {
			PlayerHasMoney{Gold = 375},
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 54},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 375}),
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 59},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 375}),
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_012", String = "Hier habt Ihr ihn! Passt gut darauf auf!"},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 375, Flag = Take},
					 TransferItem{GiveItem = 7358, Flag = Give},
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
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_013", String = "Natürlich. Hier, Euer Gold!"},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 375, Flag = Give},
					 TransferItem{TakeItem = 7358, Flag = Take},
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
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{64;
		Conditions = {
			 IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 4, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "brynjolfP204_017", String = "Der Preis für einen Adamantinumbarren liegt im Moment bei 22 Gold."},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{64;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 4, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{65;
		Conditions = {
			PlayerHasMoney{Gold = 22},
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 66},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 71},
		}}

	OnAnswer{65;
		Conditions = {
			PlayerHasMoney{Gold = 22},
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 66},
		}}

	OnAnswer{65;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 22}),
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 71},
		}}

	OnAnswer{65;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 22}),
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_012", String = "Hier habt Ihr ihn! Passt gut darauf auf!"},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 22, Flag = Take},
					 TransferItem{GiveItem = 7358, Flag = Give},
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
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_013", String = "Natürlich. Hier, Euer Gold!"},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 22, Flag = Give},
					 TransferItem{TakeItem = 7358, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 74},
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
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{76;
		Conditions = {
			 IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 5, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "brynjolfP204_018", String = "Der Preis für einen Adamantinumbarren liegt im Moment bei 24 Gold."},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{76;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 5, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{77;
		Conditions = {
			PlayerHasMoney{Gold = 24},
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 78},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 83},
		}}

	OnAnswer{77;
		Conditions = {
			PlayerHasMoney{Gold = 24},
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 78},
		}}

	OnAnswer{77;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 24}),
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 83},
		}}

	OnAnswer{77;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 24}),
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_012", String = "Hier habt Ihr ihn! Passt gut darauf auf!"},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 24, Flag = Take},
					 TransferItem{GiveItem = 7358, Flag = Give},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_013", String = "Natürlich. Hier, Euer Gold!"},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 24, Flag = Give},
					 TransferItem{TakeItem = 7358, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 85},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{88;
		Conditions = {
			 IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 6, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "brynjolfP204_019", String = "Der Preis für einen Adamantinumbarren liegt im Moment bei 27 Gold."},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{88;
		Conditions = {
			Negated( IsGlobalCounter {Name = "g_P204_Wechselkurs", Value = 6, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{89;
		Conditions = {
			PlayerHasMoney{Gold = 27},
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 90},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 95},
		}}

	OnAnswer{89;
		Conditions = {
			PlayerHasMoney{Gold = 27},
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 90},
		}}

	OnAnswer{89;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 27}),
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 95},
		}}

	OnAnswer{89;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 27}),
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{90;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_012", String = "Hier habt Ihr ihn! Passt gut darauf auf!"},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 27, Flag = Take},
					 TransferItem{GiveItem = 7358, Flag = Give},
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
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_013", String = "Natürlich. Hier, Euer Gold!"},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 27, Flag = Give},
					 TransferItem{TakeItem = 7358, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_020", String = "Der Preis für einen Adamantinumbarren liegt im Moment bei 34 Gold."},
			Answer{Tag = "", String = "", AnswerId = 101},
		}}

	OnAnswer{101;
		Conditions = {
			PlayerHasMoney{Gold = 34},
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 102},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 107},
		}}

	OnAnswer{101;
		Conditions = {
			PlayerHasMoney{Gold = 34},
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_011PC", String = "Ich möchte einen Barren kaufen.", AnswerId = 102},
		}}

	OnAnswer{101;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 34}),
			PlayerHasItem{ItemId = 7358},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brynjolfP204_021PC", String = "Ich möchte einen Barren verkaufen.", AnswerId = 107},
		}}

	OnAnswer{101;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 34}),
			Negated(PlayerHasItem{ItemId = 7358}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{102;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_012", String = "Hier habt Ihr ihn! Passt gut darauf auf!"},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{103;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 34, Flag = Take},
					 TransferItem{GiveItem = 7358, Flag = Give},
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
			Answer{Tag = "", String = "", AnswerId = 106},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{107;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brynjolfP204_013", String = "Natürlich. Hier, Euer Gold!"},
			Answer{Tag = "", String = "", AnswerId = 108},
		}}

	OnAnswer{108;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 34, Flag = Give},
					 TransferItem{TakeItem = 7358, Flag = Take},
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
			Answer{Tag = "", String = "", AnswerId = 111},
		}}

	OnAnswer{111;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}


	EndDefinition()
end