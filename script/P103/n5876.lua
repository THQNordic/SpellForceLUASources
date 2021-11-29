-->INFO: VendingMenhir
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p103\n5876_VendingMenhir.txt


	

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
			Say{Tag = "vendingmenhir103_001", String = "(Auf diesem Menhir sind vier seltsame Symbole zu sehen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_002", String = "(Ein Auge, ein Schädel, eine Kröte und eine Hand)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagTrue{Name = "P103_MehirCoinDropped"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "P103_MehirCoinDropped"}),
			PlayerHasMoney{Gold = 1},
		},
		Actions = {
			Say{Tag = "vendingmenhir103_048", String = "(Eine Stimme ertönt: Lass ein Goldstück fallen, so sollst du belohnt werden.)"},
			OfferAnswer{Tag = "vendingmenhir103_049PC", String = "(Goldstück fallen lassen)", AnswerId = 62},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "P103_MehirCoinDropped"}),
			Negated(PlayerHasMoney{Gold = 1}),
		},
		Actions = {
			Say{Tag = "vendingmenhir103_048", String = "(Eine Stimme ertönt: Lass ein Goldstück fallen, so sollst du belohnt werden.)"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_003", String = "(Eine Stimme ertönt: Berühre zwei der Symbole und nimm deine Belohnung in Empfang.)"},
			OfferAnswer{Tag = "vendingmenhir103_004PC", String = "(Das Auge berühren)", AnswerId = 4},
			OfferAnswer{Tag = "vendingmenhir103_015PC", String = "(Den Schädel berühren)", AnswerId = 20},
			OfferAnswer{Tag = "vendingmenhir103_027PC", String = "(Die Kröte berühren)", AnswerId = 35},
			OfferAnswer{Tag = "vendingmenhir103_038PC", String = "(Die Hand berühren)", AnswerId = 49},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_005", String = "(Das Symbol leuchtet kurz auf.)"},
			OfferAnswer{Tag = "vendingmenhir103_006PC", String = "(Das Auge berühren)", AnswerId = 5},
			OfferAnswer{Tag = "vendingmenhir103_008PC", String = "(Den Schädel berühren)", AnswerId = 9},
			OfferAnswer{Tag = "vendingmenhir103_010PC", String = "(Die Kröte berühren)", AnswerId = 12},
			OfferAnswer{Tag = "vendingmenhir103_013PC", String = "(Die Hand berühren)", AnswerId = 17},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_007", String = "(Die Stimme sagt: Nimm diese Spruchrolle der defensiven Mentalmagie!)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 305, Flag = Give},
					   SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
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
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_009", String = "(Die Stimme sagt: Nimm diese Spruchrolle der Todesmagie!)"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 1468, Flag = Give},
					 SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
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
			IsGlobalFlagTrue{ Name = "P103_SunCoinTaken"},
		},
		Actions = {
			Say{Tag = "vendingmenhir103_011", String = "(Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "P103_SunCoinTaken"}),
		},
		Actions = {
			Say{Tag = "vendingmenhir103_012", String = "(Die Stimme sagt: Nimm diese Sonnenmünze!)"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3955, Flag = Give},
					       SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			SetGlobalFlagTrue{ Name = "P103_SunCoinTaken"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_014", String = "(Die Stimme sagt: Nimm diese Spruchrolle der Fluchmagie!)"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 35, Flag = Give},
					      SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_016", String = "(Das Symbol leuchtet kurz auf.)"},
			OfferAnswer{Tag = "vendingmenhir103_017PC", String = "(Das Auge berühren)", AnswerId = 21},
			OfferAnswer{Tag = "vendingmenhir103_019PC", String = "(Den Schädel berühren)", AnswerId = 24},
			OfferAnswer{Tag = "vendingmenhir103_022PC", String = "(Die Kröte berühren)", AnswerId = 28},
			OfferAnswer{Tag = "vendingmenhir103_024PC", String = "(Die Hand berühren)", AnswerId = 31},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_018", String = "(Die Stimme sagt: Nimm diese Spruchrolle der Segnungsmagie!)"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2293, Flag = Give},
					    SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{24;
		Conditions = {
			IsGlobalFlagTrue {Name = "P103_MoonCoinTaken"},
		},
		Actions = {
			Say{Tag = "vendingmenhir103_020", String = "(Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "P103_MoonCoinTaken"}),
		},
		Actions = {
			Say{Tag = "vendingmenhir103_021", String = "(Die Stimme sagt: Nimm diese Mondmünze!)"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3956, Flag = Give},
					       SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			SetGlobalFlagTrue{ Name = "P103_MoonCoinTaken"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_023", String = "(Die Stimme sagt: Nimm diese Spruchrolle der Erdmagie!)"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 115, Flag = Give},
				  SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "P103_StarCoinTaken"}),
		},
		Actions = {
			Say{Tag = "vendingmenhir103_026", String = "(Die Stimme sagt: Nimm diese Sternenmünze!)"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{31;
		Conditions = {
			IsGlobalFlagTrue{ Name = "P103_StarCoinTaken"},
		},
		Actions = {
			Say{Tag = "vendingmenhir103_025", String = "(Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{ Name = "P103_StarCoinTaken"},
			TransferItem{GiveItem = 3957, Flag = Give},
					       SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_028", String = "(Das Symbol leuchtet kurz auf.)"},
			OfferAnswer{Tag = "vendingmenhir103_029PC", String = "(Das Auge berühren)", AnswerId = 36},
			OfferAnswer{Tag = "vendingmenhir103_031PC", String = "(Den Schädel berühren)", AnswerId = 39},
			OfferAnswer{Tag = "vendingmenhir103_033PC", String = "(Die Kröte berühren)", AnswerId = 42},
			OfferAnswer{Tag = "vendingmenhir103_035PC", String = "(Die Hand berühren)", AnswerId = 45},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_030", String = "(Die Stimme sagt: Nimm diese Spruchrolle der Feuermagie!)"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 1985, Flag = Give},
					 SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_032", String = "(Die Stimme sagt: Nimm diese Spruchrolle der offensiven Mentalmagie!)"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2180, Flag = Give},
				  SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_034", String = "(Die Stimme sagt: Nimm diese Spruchrolle der Nekromantie!)"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2082, Flag = Give},
					     SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "P103_SkullCoinTaken"}),
		},
		Actions = {
			Say{Tag = "vendingmenhir103_037", String = "(Die Stimme sagt: Nimm diese Schädelmünze!)"},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{45;
		Conditions = {
			IsGlobalFlagTrue{ Name = "P103_SkullCoinTaken"},
		},
		Actions = {
			Say{Tag = "vendingmenhir103_036", String = "(Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{ Name = "P103_SkullCoinTaken"},
			TransferItem{GiveItem = 4079, Flag = Give},
					       SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_039", String = "(Das Symbol leuchtet kurz auf.)"},
			OfferAnswer{Tag = "vendingmenhir103_040PC", String = "(Das Auge berühren)", AnswerId = 50},
			OfferAnswer{Tag = "vendingmenhir103_042PC", String = "(Den Schädel berühren)", AnswerId = 53},
			OfferAnswer{Tag = "vendingmenhir103_044PC", String = "(Die Kröte berühren)", AnswerId = 56},
			OfferAnswer{Tag = "vendingmenhir103_046PC", String = "(Die Hand berühren)", AnswerId = 59},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_041", String = "(Die Stimme sagt: Nimm diese Spruchrolle der Bezauberungsmagie!)"},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3484, Flag = Give},
					    SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_043", String = "(Die Stimme sagt: Nimm diese Spruchrolle der Naturmagie!)"},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2301, Flag = Give},
					     SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_045", String = "(Die Stimme sagt: Nimm diese Spruchrolle der Eismagie!)"},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2018, Flag = Give},
					SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_047", String = "(Die Stimme sagt: Nimm diese Spruchrolle der Lebensmagie!)"},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 1519, Flag = Give},
					   SetPlayerFlagFalse{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingmenhir103_050", String = "(Das Goldstück fällt zu Boden und verschwindet im Grund.)"},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 1, Flag = Take},
							SetPlayerFlagTrue{Name = "P103_MehirCoinDropped"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}


	EndDefinition()
end