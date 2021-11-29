-->INFO: VendingStoneB
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n7719_VendingStoneB.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingstoneB110_001", String = "(Ein gewaltiger Stein mit einem Schlitz in der Mitte, daneben Symbole von Stern, Sonne und Mond.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingstoneB110_002", String = "(Eine Inschrift besagt: Opfere drei Münzen deiner Wahl und empfange deine Belohnung.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcCounter{Name = "CoinsInserted", Value = 3, Operator = IsLess}),
		},
		Actions = {
			Say{Tag = "vendingstoneB110_009", String = "(Drei Münzen sind in den Menhir gefallen. Ein sonderbares Summen erfüllt die Luft.)"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcCounter{Name = "CoinsInserted", Value = 3, Operator = IsLess},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			PlayerHasItem {ItemId = 3956},
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstoneB110_003PC", String = "(Sonnenmünze einwerfen)", AnswerId = 5},
			OfferAnswer{Tag = "vendingstoneB110_005PC", String = "(Mondmünze einwerfen)", AnswerId = 8},
			OfferAnswer{Tag = "vendingstoneB110_007PC", String = "(Sternmünze einwerfen)", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			PlayerHasItem {ItemId = 3956},
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstoneB110_003PC", String = "(Sonnenmünze einwerfen)", AnswerId = 5},
			OfferAnswer{Tag = "vendingstoneB110_005PC", String = "(Mondmünze einwerfen)", AnswerId = 8},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			Negated(PlayerHasItem {ItemId = 3956}),
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstoneB110_003PC", String = "(Sonnenmünze einwerfen)", AnswerId = 5},
			OfferAnswer{Tag = "vendingstoneB110_007PC", String = "(Sternmünze einwerfen)", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			Negated(PlayerHasItem {ItemId = 3956}),
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstoneB110_003PC", String = "(Sonnenmünze einwerfen)", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			PlayerHasItem {ItemId = 3956},
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstoneB110_005PC", String = "(Mondmünze einwerfen)", AnswerId = 8},
			OfferAnswer{Tag = "vendingstoneB110_007PC", String = "(Sternmünze einwerfen)", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			PlayerHasItem {ItemId = 3956},
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstoneB110_005PC", String = "(Mondmünze einwerfen)", AnswerId = 8},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			Negated(PlayerHasItem {ItemId = 3956}),
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstoneB110_007PC", String = "(Sternmünze einwerfen)", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			Negated(PlayerHasItem {ItemId = 3956}),
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingstoneB110_004", String = "(Die Sonnenmünze fällt ins Innere des Menhirs.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3955, Flag = Take},
					   IncreaseNpcCounter{Name = "CoinsInserted"},
					   IncreaseNpcCounter{Name = "SunInserted"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingstoneB110_006", String = "(Die Mondmünze fällt ins Innere des Menhirs.)"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3956, Flag = Take},
						IncreaseNpcCounter{Name = "CoinsInserted"},
						IncreaseNpcCounter{Name = "MoonInserted"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingstoneB110_008", String = "(Die Sternmünze fällt ins Innere des Menhirs)"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3957, Flag = Take},
						IncreaseNpcCounter{Name = "CoinsInserted"},
						IncreaseNpcCounter{Name = "StarInserted"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{14;
		Conditions = {
			IsNpcCounter{Name = "SunInserted", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsNpcCounter{Name = "SunInserted", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "P110_SkullCoin2AlreadyGot"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
			IsGlobalFlagTrue{ Name = "P110_SkullCoin2AlreadyGot"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				 	 ResetNpcCounter{Name = "SunInserted"},
				  	 ResetNpcCounter{Name = "MoonInserted"},
				  	 ResetNpcCounter{Name = "StarInserted"},
				  	 TransferItem{GiveItem = 3956, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 4079, Flag = Give},
				  SetGlobalFlagTrue{ Name = "P110_SkullCoin2AlreadyGot"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "P110_SetItemBAlreadyGot"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{22;
		Conditions = {
			IsGlobalFlagTrue{ Name = "P110_SetItemBAlreadyGot"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				 	 ResetNpcCounter{Name = "SunInserted"},
				  	 ResetNpcCounter{Name = "MoonInserted"},
				  	 ResetNpcCounter{Name = "StarInserted"},
				  	 TransferItem{GiveItem = 3956, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 3810, Flag = Give},
				  SetGlobalFlagTrue{ Name = "P110_SetItemBAlreadyGot"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{27;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 28, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
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

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 3711, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcCounter{Name = "SunInserted", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcCounter{Name = "SunInserted", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{33;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 3714, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{36;
		Conditions = {
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{36;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 691, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{39;
		Conditions = {
			IsGlobalFlagTrue{ Name = "P110_SetItemAAlreadyGot"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "P110_SetItemAAlreadyGot"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				 	 ResetNpcCounter{Name = "SunInserted"},
				  	 ResetNpcCounter{Name = "MoonInserted"},
				  	 ResetNpcCounter{Name = "StarInserted"},
				  	 TransferItem{GiveItem = 3956, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 3809, Flag = Give},
				  SetGlobalFlagTrue{ Name = "P110_SetItemAAlreadyGot"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{44;
		Conditions = {
			IsNpcCounter{Name = "SunInserted", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(IsNpcCounter{Name = "SunInserted", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{45;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
			IsGlobalFlagTrue{ Name = "P110_SetItemCAlreadyGot"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{46;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "P110_SetItemCAlreadyGot"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				 	 ResetNpcCounter{Name = "SunInserted"},
				  	 ResetNpcCounter{Name = "MoonInserted"},
				  	 ResetNpcCounter{Name = "StarInserted"},
				  	 TransferItem{GiveItem = 3956, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 3811, Flag = Give},
				  SetGlobalFlagTrue{ Name = "P110_SetItemCAlreadyGot"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 3722, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 3675, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end