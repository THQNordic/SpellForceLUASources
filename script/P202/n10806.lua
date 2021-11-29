-->INFO: HadekoTisch
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n10806_HadekoTisch.txt


	

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
			Negated(IsGlobalCounter{Name = "g_P202_HadekoCounter", Value = 5, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_001", String = "(Dies ist ein Tisch des berühmten Hadeko-Spiels. Fünf Runensymbole sind darauf im Kreis um ein Sechstes angeordnet.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(IsGlobalCounter{Name = "g_P202_HadekoCounter", Value = 5, Operator = IsEqual})),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_002", String = "(Das Hadeko-Spiel hat begonnen. Die Runensymbole auf dem Tisch leuchten.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
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
			Negated(UND(IsGlobalCounter{Name = "g_P202_HadekoCounter", Value = 0, Operator = IsEqual}, IsGlobalFlagFalse{Name ="g_P202_HadekoGameOn"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalCounter{Name = "g_P202_HadekoCounter", Value = 0, Operator = IsEqual}, IsGlobalFlagFalse{Name ="g_P202_HadekoGameOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name ="g_P202_HadekoGameOn"},
			IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
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

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			FigureAlive{NpcId = 10809},
			FigureAlive{NpcId = 10810},
			FigureAlive{NpcId = 10813},
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			FigureAlive{NpcId = 10809},
			FigureAlive{NpcId = 10810},
			FigureAlive{NpcId = 10813},
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			FigureAlive{NpcId = 10809},
			FigureAlive{NpcId = 10810},
			Negated(FigureAlive{NpcId = 10813}),
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			FigureAlive{NpcId = 10809},
			FigureAlive{NpcId = 10810},
			Negated(FigureAlive{NpcId = 10813}),
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			FigureAlive{NpcId = 10809},
			Negated(FigureAlive{NpcId = 10810}),
			FigureAlive{NpcId = 10813},
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			FigureAlive{NpcId = 10809},
			Negated(FigureAlive{NpcId = 10810}),
			FigureAlive{NpcId = 10813},
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			FigureAlive{NpcId = 10809},
			Negated(FigureAlive{NpcId = 10810}),
			Negated(FigureAlive{NpcId = 10813}),
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			FigureAlive{NpcId = 10809},
			Negated(FigureAlive{NpcId = 10810}),
			Negated(FigureAlive{NpcId = 10813}),
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			Negated(FigureAlive{NpcId = 10809}),
			FigureAlive{NpcId = 10810},
			FigureAlive{NpcId = 10813},
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			Negated(FigureAlive{NpcId = 10809}),
			FigureAlive{NpcId = 10810},
			FigureAlive{NpcId = 10813},
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			Negated(FigureAlive{NpcId = 10809}),
			FigureAlive{NpcId = 10810},
			Negated(FigureAlive{NpcId = 10813}),
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			Negated(FigureAlive{NpcId = 10809}),
			FigureAlive{NpcId = 10810},
			Negated(FigureAlive{NpcId = 10813}),
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			Negated(FigureAlive{NpcId = 10809}),
			Negated(FigureAlive{NpcId = 10810}),
			FigureAlive{NpcId = 10813},
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			Negated(FigureAlive{NpcId = 10809}),
			Negated(FigureAlive{NpcId = 10810}),
			FigureAlive{NpcId = 10813},
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			Negated(FigureAlive{NpcId = 10809}),
			Negated(FigureAlive{NpcId = 10810}),
			Negated(FigureAlive{NpcId = 10813}),
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"})),
			Negated(FigureAlive{NpcId = 10809}),
			Negated(FigureAlive{NpcId = 10810}),
			Negated(FigureAlive{NpcId = 10813}),
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_004PC", String = "(Der Held)", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			FigureAlive{NpcId = 10809},
			FigureAlive{NpcId = 10810},
			FigureAlive{NpcId = 10813},
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			FigureAlive{NpcId = 10809},
			FigureAlive{NpcId = 10810},
			FigureAlive{NpcId = 10813},
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			FigureAlive{NpcId = 10809},
			FigureAlive{NpcId = 10810},
			Negated(FigureAlive{NpcId = 10813}),
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			FigureAlive{NpcId = 10809},
			FigureAlive{NpcId = 10810},
			Negated(FigureAlive{NpcId = 10813}),
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			FigureAlive{NpcId = 10809},
			Negated(FigureAlive{NpcId = 10810}),
			FigureAlive{NpcId = 10813},
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			FigureAlive{NpcId = 10809},
			Negated(FigureAlive{NpcId = 10810}),
			FigureAlive{NpcId = 10813},
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			FigureAlive{NpcId = 10809},
			Negated(FigureAlive{NpcId = 10810}),
			Negated(FigureAlive{NpcId = 10813}),
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			FigureAlive{NpcId = 10809},
			Negated(FigureAlive{NpcId = 10810}),
			Negated(FigureAlive{NpcId = 10813}),
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_006PC", String = "(Der Trickster)", AnswerId = 11},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			Negated(FigureAlive{NpcId = 10809}),
			FigureAlive{NpcId = 10810},
			FigureAlive{NpcId = 10813},
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			Negated(FigureAlive{NpcId = 10809}),
			FigureAlive{NpcId = 10810},
			FigureAlive{NpcId = 10813},
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			Negated(FigureAlive{NpcId = 10809}),
			FigureAlive{NpcId = 10810},
			Negated(FigureAlive{NpcId = 10813}),
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			Negated(FigureAlive{NpcId = 10809}),
			FigureAlive{NpcId = 10810},
			Negated(FigureAlive{NpcId = 10813}),
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_008PC", String = "(Der Mentor)", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			Negated(FigureAlive{NpcId = 10809}),
			Negated(FigureAlive{NpcId = 10810}),
			FigureAlive{NpcId = 10813},
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			Negated(FigureAlive{NpcId = 10809}),
			Negated(FigureAlive{NpcId = 10810}),
			FigureAlive{NpcId = 10813},
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_010PC", String = "(Der Torwächter)", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			Negated(FigureAlive{NpcId = 10809}),
			Negated(FigureAlive{NpcId = 10810}),
			Negated(FigureAlive{NpcId = 10813}),
			FigureAlive{NpcId = 10812},
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
			OfferAnswer{Tag = "hadeko_deskP202_012PC", String = "(Der Schatten)", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(FigureAlive{NpcId = 10811},Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}))),
			Negated(FigureAlive{NpcId = 10809}),
			Negated(FigureAlive{NpcId = 10810}),
			Negated(FigureAlive{NpcId = 10813}),
			Negated(FigureAlive{NpcId = 10812}),
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_003", String = "(Welche Figur soll gegen die Figur des Gegners geschickt werden?)"},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_005", String = "(Ihr berührt die Schwertrune auf dem Spieltisch.)"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P212_GoodHeroInBattle"},
			IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_007", String = "(Ihr berührt die Fuchsrune auf dem Spieltisch.)"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P212_GoodTricksterInBattle"},
			IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_009", String = "(Ihr berührt das die Augenrune auf dem Spieltisch.)"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P212_GoodMentorInBattle"},
			IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_011", String = "(Ihr berührt das die Flammenrune auf dem Spieltisch.)"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P212_GoodDoorkeeperInBattle"},
			IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hadeko_deskP202_013", String = "(Ich berührt die Schädelrune auf dem Spieltisch.)"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P212_GoodShadowInBattle"},
			IncreaseGlobalCounter{Name = "g_P202_HadekoCounter"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end