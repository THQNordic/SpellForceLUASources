-->INFO: Fetischkiste
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p102\n6994_Fetischkiste.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "fetischkiste102_001", String = "(Anstelle von Schlüssellöchern sind in diese Truhe drei seltsam geformte, faustgroße Mulden eingelassen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"},
			IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"},
			IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fetischkiste102_002PC", String = "(Zolowins Stein in die erste Mulde stecken)", AnswerId = 2},
			OfferAnswer{Tag = "fetischkiste102_011PC", String = "(Renyas Stein in die zweite Mulde stecken)", AnswerId = 13},
			OfferAnswer{Tag = "fetischkiste102_017PC", String = "(Gruoluns Stein in die dritte Mulde stecken)", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"},
			IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fetischkiste102_002PC", String = "(Zolowins Stein in die erste Mulde stecken)", AnswerId = 2},
			OfferAnswer{Tag = "fetischkiste102_011PC", String = "(Renyas Stein in die zweite Mulde stecken)", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"}),
			IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fetischkiste102_002PC", String = "(Zolowins Stein in die erste Mulde stecken)", AnswerId = 2},
			OfferAnswer{Tag = "fetischkiste102_017PC", String = "(Gruoluns Stein in die dritte Mulde stecken)", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fetischkiste102_002PC", String = "(Zolowins Stein in die erste Mulde stecken)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"}),
			IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"},
			IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fetischkiste102_011PC", String = "(Renyas Stein in die zweite Mulde stecken)", AnswerId = 13},
			OfferAnswer{Tag = "fetischkiste102_017PC", String = "(Gruoluns Stein in die dritte Mulde stecken)", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"}),
			IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fetischkiste102_011PC", String = "(Renyas Stein in die zweite Mulde stecken)", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"}),
			IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fetischkiste102_017PC", String = "(Gruoluns Stein in die dritte Mulde stecken)", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"},
			IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"},
		},
		Actions = {
			Say{Tag = "fetischkiste102_003", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_004PC", String = "(Renyas Stein in die zweite Mulde stecken)", AnswerId = 3},
			OfferAnswer{Tag = "fetischkiste102_008PC", String = "(Gruoluns Stein in die dritte Mulde stecken)", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"}),
		},
		Actions = {
			Say{Tag = "fetischkiste102_003", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_004PC", String = "(Renyas Stein in die zweite Mulde stecken)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"}),
			IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"},
		},
		Actions = {
			Say{Tag = "fetischkiste102_003", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_008PC", String = "(Gruoluns Stein in die dritte Mulde stecken)", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"}),
		},
		Actions = {
			Say{Tag = "fetischkiste102_003", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
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
			IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"},
		},
		Actions = {
			Say{Tag = "fetischkiste102_005", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_006PC", String = "(Gruoluns Stein in die dritte Mulde stecken)", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"}),
		},
		Actions = {
			Say{Tag = "fetischkiste102_005", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
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
			Say{Tag = "fetischkiste102_007", String = "(Die Truhe ist nun offen.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "P110_SecondGateOpened"},
							SetItemFlagFalse{Name = "PlayerHasItemZolowinStone"},
							SetItemFlagFalse{Name = "PlayerHasItemRenyaStone"},
							SetItemFlagFalse{Name = "PlayerHasItemGruolunStone"},
							RemoveDialog{NpcId = 6994},
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
			IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"},
		},
		Actions = {
			Say{Tag = "fetischkiste102_009", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_010PC", String = "(Renyas Stein in die zweite Mulde stecken)", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"}),
		},
		Actions = {
			Say{Tag = "fetischkiste102_009", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
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
			IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"},
			IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"},
		},
		Actions = {
			Say{Tag = "fetischkiste102_012", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_013PC", String = "(Zolowins Stein in die erste Mulde stecken)", AnswerId = 14},
			OfferAnswer{Tag = "fetischkiste102_014PC", String = "(Gruoluns Stein in die dritte Mulde stecken)", AnswerId = 16},
		}}

	OnAnswer{13;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"}),
		},
		Actions = {
			Say{Tag = "fetischkiste102_012", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_013PC", String = "(Zolowins Stein in die erste Mulde stecken)", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"}),
			IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"},
		},
		Actions = {
			Say{Tag = "fetischkiste102_012", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_014PC", String = "(Gruoluns Stein in die dritte Mulde stecken)", AnswerId = 16},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGruolunStone"}),
		},
		Actions = {
			Say{Tag = "fetischkiste102_012", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
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
			IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"},
		},
		Actions = {
			Say{Tag = "fetischkiste102_015", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_016PC", String = "(Zolowins Stein in die erste Mulde stecken)", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"}),
		},
		Actions = {
			Say{Tag = "fetischkiste102_015", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
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
			IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"},
			IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"},
		},
		Actions = {
			Say{Tag = "fetischkiste102_018", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_019PC", String = "(Renyas Stein in die zweite Mulde stecken)", AnswerId = 21},
			OfferAnswer{Tag = "fetischkiste102_020PC", String = "(Zolowins Stein in die erste Mulde stecken)", AnswerId = 23},
		}}

	OnAnswer{20;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"}),
		},
		Actions = {
			Say{Tag = "fetischkiste102_018", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_019PC", String = "(Renyas Stein in die zweite Mulde stecken)", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"}),
			IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"},
		},
		Actions = {
			Say{Tag = "fetischkiste102_018", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
			OfferAnswer{Tag = "fetischkiste102_020PC", String = "(Zolowins Stein in die erste Mulde stecken)", AnswerId = 23},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemRenyaStone"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemZolowinStone"}),
		},
		Actions = {
			Say{Tag = "fetischkiste102_018", String = "(Der Stein passt genau in die Mulde. Ein Riegel im Inneren der Truhe öffnet sich.)"},
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