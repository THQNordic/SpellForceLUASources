-->INFO: ElementarTorZwei
-->INFO: ElementarTorZwei

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 150, Y = 241,		-- exact position of portal object!
	Type = DunkelelfenTor,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue { Name = "P110_ElementalGateTwoOpen" },

	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}







--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n6746_ElementarTorZwei.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "elementartorzwei110_001", String = "(In diesem Tor sind drei Schlitze. Neben den Schlitzen sind die Symbole von Sonne, Mond und Stern eingraviert.)"},
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
			IsNpcFlagTrue{ Name = "PlayerInsertedSunCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedSunCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedMoonCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedMoonCoin"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedStarCoin"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedStarCoin"},
		},
		Actions = {
			Say{Tag = "elementartorzwei110_002", String = "(Alle drei Riegel sind geöffnet worden!)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{ Name = "P110_ElementalGateTwoOpen"},
			RemoveDialog{NpcId = self},
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			PlayerHasItem {ItemId = 3956},
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elementartorzwei110_003PC", String = "(Sonnenmünze in den Sonnenschlitz werfen)", AnswerId = 9},
			OfferAnswer{Tag = "elementartorzwei110_006PC", String = "(Mondmünze in den Mondschlitz werfen)", AnswerId = 15},
			OfferAnswer{Tag = "elementartorzwei110_009PC", String = "(Sternmünze in den Sternschlitz werfen)", AnswerId = 21},
		}}

	OnAnswer{8;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			PlayerHasItem {ItemId = 3956},
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elementartorzwei110_003PC", String = "(Sonnenmünze in den Sonnenschlitz werfen)", AnswerId = 9},
			OfferAnswer{Tag = "elementartorzwei110_006PC", String = "(Mondmünze in den Mondschlitz werfen)", AnswerId = 15},
		}}

	OnAnswer{8;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			Negated(PlayerHasItem {ItemId = 3956}),
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elementartorzwei110_003PC", String = "(Sonnenmünze in den Sonnenschlitz werfen)", AnswerId = 9},
			OfferAnswer{Tag = "elementartorzwei110_009PC", String = "(Sternmünze in den Sternschlitz werfen)", AnswerId = 21},
		}}

	OnAnswer{8;
		Conditions = {
			PlayerHasItem {ItemId = 3955},
			Negated(PlayerHasItem {ItemId = 3956}),
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elementartorzwei110_003PC", String = "(Sonnenmünze in den Sonnenschlitz werfen)", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			PlayerHasItem {ItemId = 3956},
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elementartorzwei110_006PC", String = "(Mondmünze in den Mondschlitz werfen)", AnswerId = 15},
			OfferAnswer{Tag = "elementartorzwei110_009PC", String = "(Sternmünze in den Sternschlitz werfen)", AnswerId = 21},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			PlayerHasItem {ItemId = 3956},
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elementartorzwei110_006PC", String = "(Mondmünze in den Mondschlitz werfen)", AnswerId = 15},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			Negated(PlayerHasItem {ItemId = 3956}),
			PlayerHasItem {ItemId = 3957},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elementartorzwei110_009PC", String = "(Sternmünze in den Sternschlitz werfen)", AnswerId = 21},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3955}),
			Negated(PlayerHasItem {ItemId = 3956}),
			Negated(PlayerHasItem {ItemId = 3957}),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			IsNpcFlagTrue{ Name = "PlayerInsertedSunCoin"},
		},
		Actions = {
			Say{Tag = "elementartorzwei110_004", String = "(Die Münze fällt in den Schlitz. Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedSunCoin"}),
		},
		Actions = {
			Say{Tag = "elementartorzwei110_005", String = "(Die Münze fällt in den Schlitz. Auf der anderen Seite des Tors öffnet sich ein Riegel.)"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3955, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedSunCoin"},
			TransferItem{TakeItem = 3955, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
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
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedMoonCoin"}),
		},
		Actions = {
			Say{Tag = "elementartorzwei110_008", String = "(Die Münze fällt in den Schlitz. Auf der anderen Seite des Tors öffnet sich ein Riegel.)"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagTrue{ Name = "PlayerInsertedMoonCoin"},
		},
		Actions = {
			Say{Tag = "elementartorzwei110_007", String = "(Die Münze fällt in den Schlitz. Nichts geschieht)."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3956, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{ Name = "PlayerInsertedMoonCoin"},
			TransferItem{TakeItem = 3956, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
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
			IsNpcFlagTrue{ Name = "PlayerInsertedStarCoin"},
		},
		Actions = {
			Say{Tag = "elementartorzwei110_010", String = "(Die Münze fällt in den Schlitz. Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagTrue{ Name = "PlayerInsertedStarCoin"}),
		},
		Actions = {
			Say{Tag = "elementartorzwei110_011", String = "(Die Münze fällt in den Schlitz. Auf der anderen Seite des Tors öffnet sich ein Riegel.)"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3957, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{25;
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