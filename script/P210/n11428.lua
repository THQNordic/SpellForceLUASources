-->INFO: CoinRewardKiste5
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n11428_CoinRewardKiste5.txt


	

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
			Say{Tag = "coinrewardchest5p210_001", String = "(Anstelle eines Schlüssellochs sind in diese Kiste drei Schlitze eingelassen. Neben den Schlitzen befinden sich geschnitzte Symbole von Feuer, Wasser und Erde.)"},
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
			IsNpcFlagTrue{ Name = "PlayerInsertedFireCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedFireCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedWaterCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedWaterCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "PlayerInsertedEarthCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagTrue{Name = "PlayerInsertedEarthCoin"},
		},
		Actions = {
			Say{Tag = "coinrewardchest5p210_002", String = "(Alle drei Riegel sind geöffnet worden.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
			PlayerHasItem {ItemId = 7222},
			PlayerHasItem {ItemId = 7332},
			PlayerHasItem {ItemId = 7356},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "coinrewardchest5p210_003PC", String = "(Feuermünze in den Feuerschlitz werfen)", AnswerId = 10},
			OfferAnswer{Tag = "coinrewardchest5p210_006PC", String = "(Wassermünze in den Wasserschlitz werfen)", AnswerId = 16},
			OfferAnswer{Tag = "coinrewardchest5p210_007PC", String = "(Erdmünze in den Erdschlitz werfen)", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			PlayerHasItem {ItemId = 7222},
			PlayerHasItem {ItemId = 7332},
			Negated(PlayerHasItem {ItemId = 7356}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "coinrewardchest5p210_003PC", String = "(Feuermünze in den Feuerschlitz werfen)", AnswerId = 10},
			OfferAnswer{Tag = "coinrewardchest5p210_006PC", String = "(Wassermünze in den Wasserschlitz werfen)", AnswerId = 16},
		}}

	OnAnswer{9;
		Conditions = {
			PlayerHasItem {ItemId = 7222},
			Negated(PlayerHasItem {ItemId = 7332}),
			PlayerHasItem {ItemId = 7356},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "coinrewardchest5p210_003PC", String = "(Feuermünze in den Feuerschlitz werfen)", AnswerId = 10},
			OfferAnswer{Tag = "coinrewardchest5p210_007PC", String = "(Erdmünze in den Erdschlitz werfen)", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			PlayerHasItem {ItemId = 7222},
			Negated(PlayerHasItem {ItemId = 7332}),
			Negated(PlayerHasItem {ItemId = 7356}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "coinrewardchest5p210_003PC", String = "(Feuermünze in den Feuerschlitz werfen)", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7222}),
			PlayerHasItem {ItemId = 7332},
			PlayerHasItem {ItemId = 7356},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "coinrewardchest5p210_006PC", String = "(Wassermünze in den Wasserschlitz werfen)", AnswerId = 16},
			OfferAnswer{Tag = "coinrewardchest5p210_007PC", String = "(Erdmünze in den Erdschlitz werfen)", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7222}),
			PlayerHasItem {ItemId = 7332},
			Negated(PlayerHasItem {ItemId = 7356}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "coinrewardchest5p210_006PC", String = "(Wassermünze in den Wasserschlitz werfen)", AnswerId = 16},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7222}),
			Negated(PlayerHasItem {ItemId = 7332}),
			PlayerHasItem {ItemId = 7356},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "coinrewardchest5p210_007PC", String = "(Erdmünze in den Erdschlitz werfen)", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7222}),
			Negated(PlayerHasItem {ItemId = 7332}),
			Negated(PlayerHasItem {ItemId = 7356}),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			IsNpcFlagTrue{ Name = "PlayerInsertedFireCoin"},
		},
		Actions = {
			Say{Tag = "coinrewardchest5p210_004", String = "(Die Münze fällt in den Schlitz. Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedFireCoin"}),
		},
		Actions = {
			Say{Tag = "coinrewardchest5p210_005", String = "(Die Münze fällt in den Schlitz. In der Truhe verschiebt sich ein Riegel.)"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 7222, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedFireCoin"},
			TransferItem{TakeItem = 7222, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
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
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedWaterCoin"}),
		},
		Actions = {
			Say{Tag = "coinrewardchest5p210_005", String = "(Die Münze fällt in den Schlitz. In der Truhe verschiebt sich ein Riegel.)"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedWaterCoin"},
		},
		Actions = {
			Say{Tag = "coinrewardchest5p210_004", String = "(Die Münze fällt in den Schlitz. Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 7332, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedWaterCoin"},
			TransferItem{TakeItem = 7332, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
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
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedEarthCoin"}),
		},
		Actions = {
			Say{Tag = "coinrewardchest5p210_005", String = "(Die Münze fällt in den Schlitz. In der Truhe verschiebt sich ein Riegel.)"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedEarthCoin"},
		},
		Actions = {
			Say{Tag = "coinrewardchest5p210_004", String = "(Die Münze fällt in den Schlitz. Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 7356, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedEarthCoin"},
			TransferItem{TakeItem = 7356, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}


	EndDefinition()
end