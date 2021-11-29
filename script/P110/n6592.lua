-->INFO: GateOne
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 424, Y = 169, -- exact position of portal object!
	Type = DunkelelfenTor,		-- type of portal
	OpenConditions = {
		IsGlobalFlagTrue { Name = "P110_FirstGateOpened" },
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n6592_GateOne.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "gateone110_001", String = "(An diesem Tor sind drei Schlösser angebracht: ein goldenes, ein silbernes und ein kupfernes.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
			IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
			IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateone110_002PC", String = "(Sonnenschlüssel in goldenes Schloss stecken)", AnswerId = 2},
			OfferAnswer{Tag = "gateone110_011PC", String = "(Mondschlüssel in silbernes Schloss stecken)", AnswerId = 13},
			OfferAnswer{Tag = "gateone110_017PC", String = "(Sternenschlüssel in bronzenes Schloss stecken)", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
			IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemStarKey"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateone110_002PC", String = "(Sonnenschlüssel in goldenes Schloss stecken)", AnswerId = 2},
			OfferAnswer{Tag = "gateone110_011PC", String = "(Mondschlüssel in silbernes Schloss stecken)", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemMoonKey"}),
			IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateone110_002PC", String = "(Sonnenschlüssel in goldenes Schloss stecken)", AnswerId = 2},
			OfferAnswer{Tag = "gateone110_017PC", String = "(Sternenschlüssel in bronzenes Schloss stecken)", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemMoonKey"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemStarKey"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateone110_002PC", String = "(Sonnenschlüssel in goldenes Schloss stecken)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSunKey"}),
			IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
			IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateone110_011PC", String = "(Mondschlüssel in silbernes Schloss stecken)", AnswerId = 13},
			OfferAnswer{Tag = "gateone110_017PC", String = "(Sternenschlüssel in bronzenes Schloss stecken)", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSunKey"}),
			IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemStarKey"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateone110_011PC", String = "(Mondschlüssel in silbernes Schloss stecken)", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSunKey"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemMoonKey"}),
			IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gateone110_017PC", String = "(Sternenschlüssel in bronzenes Schloss stecken)", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSunKey"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemMoonKey"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemStarKey"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
			IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
		},
		Actions = {
			Say{Tag = "gateone110_003", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_004PC", String = "(Mondschlüssel in silbernes Schloss stecken)", AnswerId = 3},
			OfferAnswer{Tag = "gateone110_008PC", String = "(Sternenschlüssel in bronzenes Schloss stecken)", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemStarKey"}),
		},
		Actions = {
			Say{Tag = "gateone110_003", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_004PC", String = "(Mondschlüssel in silbernes Schloss stecken)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemMoonKey"}),
			IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
		},
		Actions = {
			Say{Tag = "gateone110_003", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_008PC", String = "(Sternenschlüssel in bronzenes Schloss stecken)", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemMoonKey"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemStarKey"}),
		},
		Actions = {
			Say{Tag = "gateone110_003", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
		},
		Actions = {
			Say{Tag = "gateone110_005", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_006PC", String = "(Sternenschlüssel in bronzenes Schloss stecken)", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemStarKey"}),
		},
		Actions = {
			Say{Tag = "gateone110_005", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gateone110_007", String = "(Klick! Das Tor öffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "P110_FirstGateOpened"},
							SetItemFlagFalse{Name = "PlayerHasItemSunKey"},
							SetItemFlagFalse{Name = "PlayerHasItemMoonKey"},
							SetItemFlagFalse{Name = "PlayerHasItemStarKey"},
							RemoveDialog{NpcId = 6592},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
		},
		Actions = {
			Say{Tag = "gateone110_009", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_010PC", String = "(Mondschlüssel in silbernes Schloss stecken)", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemMoonKey"}),
		},
		Actions = {
			Say{Tag = "gateone110_009", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{13;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
			IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
		},
		Actions = {
			Say{Tag = "gateone110_012", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_013PC", String = "(Sonnenschlüssel in goldenes Schloss stecken)", AnswerId = 14},
			OfferAnswer{Tag = "gateone110_014PC", String = "(Sternenschlüssel in bronzenes Schloss stecken)", AnswerId = 16},
		}}

	OnAnswer{13;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemStarKey"}),
		},
		Actions = {
			Say{Tag = "gateone110_012", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_013PC", String = "(Sonnenschlüssel in goldenes Schloss stecken)", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSunKey"}),
			IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
		},
		Actions = {
			Say{Tag = "gateone110_012", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_014PC", String = "(Sternenschlüssel in bronzenes Schloss stecken)", AnswerId = 16},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSunKey"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemStarKey"}),
		},
		Actions = {
			Say{Tag = "gateone110_012", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
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
			IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
		},
		Actions = {
			Say{Tag = "gateone110_015", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_016PC", String = "(Sonnenschlüssel in goldenes Schloss stecken)", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSunKey"}),
		},
		Actions = {
			Say{Tag = "gateone110_015", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{20;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
			IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
		},
		Actions = {
			Say{Tag = "gateone110_018", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_019PC", String = "(Mondschlüssel in silbernes Schloss stecken)", AnswerId = 21},
			OfferAnswer{Tag = "gateone110_020PC", String = "(Sonnenschlüssel in goldenes Schloss stecken)", AnswerId = 23},
		}}

	OnAnswer{20;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSunKey"}),
		},
		Actions = {
			Say{Tag = "gateone110_018", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_019PC", String = "(Mondschlüssel in silbernes Schloss stecken)", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemMoonKey"}),
			IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
		},
		Actions = {
			Say{Tag = "gateone110_018", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
			OfferAnswer{Tag = "gateone110_020PC", String = "(Sonnenschlüssel in goldenes Schloss stecken)", AnswerId = 23},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemMoonKey"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSunKey"}),
		},
		Actions = {
			Say{Tag = "gateone110_018", String = "(Klick! Der Schlüssel passt, doch das Tor ist noch verschlossen.)"},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}


	EndDefinition()
end