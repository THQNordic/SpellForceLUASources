-->INFO: Schatzkiste3
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n6685_Schatzkiste3.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "schatzkiste3110_001", String = "(Anstelle eines Schlüssellochs sind in diese Kiste zwei Schlitze eingelassen. Neben den Schlitzen befinden sich geschnitzte Symbole von Mond und Stern.)"},
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
			IsNpcFlagTrue{ Name = "PlayerInsertedMoonCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedMoonCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedStarCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedStarCoin"},
		},
		Actions = {
			Say{Tag = "schatzkiste3110_002", String = "(Beide Riegel sind geöffnet worden!)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
			PlayerHasItem {ItemId = 3956},
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schatzkiste3110_003PC", String = "(Mondmünze in den Mondschlitz werfen)", AnswerId = 8},
			OfferAnswer{Tag = "schatzkiste3110_006PC", String = "(Sternenmünze in den Sternenschlitz werfen)", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
			PlayerHasItem {ItemId = 3956},
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schatzkiste3110_003PC", String = "(Mondmünze in den Mondschlitz werfen)", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3956}),
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schatzkiste3110_006PC", String = "(Sternenmünze in den Sternenschlitz werfen)", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3956}),
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedMoonCoin"}),
		},
		Actions = {
			Say{Tag = "schatzkiste3110_005", String = "(Die Münze fällt in den Schlitz. In der Truhe verschiebt sich ein Riegel.)"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedMoonCoin"},
		},
		Actions = {
			Say{Tag = "schatzkiste3110_004", String = "(Die Münze fällt in den Schlitz. Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3956, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedMoonCoin"},
			TransferItem{TakeItem = 3956, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
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
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedStarCoin"}),
		},
		Actions = {
			Say{Tag = "schatzkiste3110_008", String = "(Die Münze fällt in den Schlitz. In der Truhe verschiebt sich ein Riegel.)"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedStarCoin"},
		},
		Actions = {
			Say{Tag = "schatzkiste3110_007", String = "(Die Münze fällt in den Schlitz. Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3957, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedStarCoin"},
			TransferItem{TakeItem = 3957, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}


	EndDefinition()
end