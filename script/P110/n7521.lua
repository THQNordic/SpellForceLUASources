-->INFO: VendingStone
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n7521_VendingStone.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingstone110_001", String = "(Ein gewaltiger Stein mit einem Schlitz in der Mitte, daneben Symbole von Stern, Sonne und Mond.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "vendingstone110_002", String = "(Eine Inschrift besagt: Opfere drei M�nzen deiner Wahl und empfange deine Belohnung.)"},
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
			IsNpcCounter{Name = "CoinsInserted", Value = 3, Operator = IsLess},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcCounter{Name = "CoinsInserted", Value = 3, Operator = IsLess}),
		},
		Actions = {
			Say{Tag = "vendingstone110_009", String = "(Drei M�nzen sind in den Menhir gefallen. Ein sonderbares Summen erf�llt die Luft.)"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			PlayerHasItem {ItemId = 3956},
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstone110_003PC", String = "(Sonnenm�nze einwerfen)", AnswerId = 5},
			OfferAnswer{Tag = "vendingstone110_005PC", String = "(Mondm�nze einwerfen)", AnswerId = 8},
			OfferAnswer{Tag = "vendingstone110_007PC", String = "(Sternm�nze einwerfen)", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			PlayerHasItem {ItemId = 3956},
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstone110_003PC", String = "(Sonnenm�nze einwerfen)", AnswerId = 5},
			OfferAnswer{Tag = "vendingstone110_005PC", String = "(Mondm�nze einwerfen)", AnswerId = 8},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			Negated(PlayerHasItem {ItemId = 3956}),
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstone110_003PC", String = "(Sonnenm�nze einwerfen)", AnswerId = 5},
			OfferAnswer{Tag = "vendingstone110_007PC", String = "(Sternm�nze einwerfen)", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			Negated(PlayerHasItem {ItemId = 3956}),
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstone110_003PC", String = "(Sonnenm�nze einwerfen)", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			PlayerHasItem {ItemId = 3956},
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstone110_005PC", String = "(Mondm�nze einwerfen)", AnswerId = 8},
			OfferAnswer{Tag = "vendingstone110_007PC", String = "(Sternm�nze einwerfen)", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			PlayerHasItem {ItemId = 3956},
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstone110_005PC", String = "(Mondm�nze einwerfen)", AnswerId = 8},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			Negated(PlayerHasItem {ItemId = 3956}),
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "vendingstone110_007PC", String = "(Sternm�nze einwerfen)", AnswerId = 11},
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
			Say{Tag = "vendingstone110_004", String = "(Die Sonnenm�nze f�llt ins Innere des Menhirs.)"},
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
			Say{Tag = "vendingstone110_006", String = "(Die Mondm�nze f�llt ins Innere des Menhirs.)"},
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
			Say{Tag = "vendingstone110_008", String = "(Die Sternm�nze f�llt ins Innere des Menhirs)"},
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
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
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
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 1670, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{18;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 195, Flag = Give},
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
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 2533, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 1545, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsNpcCounter{Name = "SunInserted", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{26;
		Conditions = {
			IsNpcCounter{Name = "SunInserted", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual}),
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
				  TransferItem{GiveItem = 1613, Flag = Give},
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
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "P110_SkullCoinAlreadyGot"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{31;
		Conditions = {
			IsGlobalFlagTrue{ Name = "P110_SkullCoinAlreadyGot"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				 	 ResetNpcCounter{Name = "SunInserted"},
				  	ResetNpcCounter{Name = "MoonInserted"},
				  	ResetNpcCounter{Name = "StarInserted"},
				  	TransferItem{GiveItem = 3957, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 4079, Flag = Give},
				  SetGlobalFlagTrue{ Name = "P110_SkullCoinAlreadyGot"},
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
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 299, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
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

	OnAnswer{38;
		Conditions = {
			IsNpcCounter{Name = "SunInserted", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(IsNpcCounter{Name = "SunInserted", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{39;
		Conditions = {
			IsNpcCounter{Name = "MoonInserted", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 2419, Flag = Give},
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
				  TransferItem{GiveItem = 1638, Flag = Give},
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
		},
		Actions = {
			ResetNpcCounter{Name = "CoinsInserted"},
				  ResetNpcCounter{Name = "SunInserted"},
				  ResetNpcCounter{Name = "MoonInserted"},
				  ResetNpcCounter{Name = "StarInserted"},
				  TransferItem{GiveItem = 3522, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end