-->INFO: CoopQuestgeberDark3
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--Coop Dark2

OnOneTimeEvent
{
	Actions =
	{
		RemoveDialog {},
	}
}

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	
	Conditions =
	{
		PlayerHasItem {ItemId = 7256}
	},
}

-- Für Auftrag 4 Dialog frei schalten

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			PlayerHasItem {ItemId = 7256},
			PlayerHasItem {ItemId = 7233},
		},
		Negated (PlayerHasItem {ItemId = 7257}),
		--Negated (PlayerHasItem {ItemId = 7245})
	},
	Actions =
	{
		EnableDialog {},
	}
}

-- Für Auftrag 5 Dialog frei schalten
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7257},
		Negated (PlayerHasItem {ItemId = 7258}),
		--Negated (PlayerHasItem {ItemId = 7246})
	},
	Actions =
	{
		EnableDialog {},
	}
}

--Nach AUftrag Fünf Dialog wieder abschalten
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7258},
	},
	Actions = 
	{
		RemoveDialog {},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p310\n10365_CoopQuestgeberDark3.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})},
		},
		Actions = {
			Say{Tag = "tarukhP310_001", String = "Ein Runenkrieger? Was bringt Euch zu Tarukh?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}),
		},
		Actions = {
			Say{Tag = "tarukhP310_002", String = "Was wollt Ihr, Mensch?"},
			Answer{Tag = "", String = "", AnswerId = 5},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_004", String = "Beim Blut der Erde! Die Schlange von Dragh'Lur ist zurück? Lasst sehen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_005", String = "Und schon hegt er große Pläne ... Ein Portal will er erschaffen?"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_006", String = "Was führt er nur im Schilde?... Aber gut, ich schulde es ihm ... Merkt auf, ich will Euch sagen, was zu tun ist!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_007", String = "Der Portalzauber kann nur mit einer besonderen Tinte geschrieben werden. Aber diese Tinte kann und will ich nicht herstellen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_008", String = "Aber wenn Ihr das Blut eines Lichtkindes bringt ... dies hat die gleiche Zauberkraft! Damit kann ich den Portalzauber schreiben!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_009", String = "Nehmt diese Gefäße! Sucht ein verdorbenes Lichtkind in den Tiefen von Orzach! Füllt eines der Gefäße mit seinem Blut uns bringt es mir!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7245, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[7]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{15;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{15;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_011", String = "Gut aufgemerkt, Mensch! Zur Tinte braucht man auch die Feder! Und wichtiger noch: das Wissen um den Zauber, den man schreiben will!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_012", String = "Nur der Orden des Erwachens kennt die Portalmagie, sie haben sie von Rohen gelernt. Doch weder Folter noch Magie wird einem Ordensmagier dieses Wissen entreissen, dafür hat Rohen gesorgt!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_013", String = "Doch es gibt einen Trick, den nur ich beherrsche! Damit werden wir uns das Wissen um den Zauber erschleichen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_014", String = "Nehmt diese Federkiele! Sie sind magisch, ich nenne sie die Federn der Erinnerung!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_015", String = "Sie haben die Fähigkeit, die Erinnerungen eines ganzen Lebens in sich aufznehmen! Und Ihr wisst, wenn man stirbt, zieht das Leben noch einmal an einem vorbei ..."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_016", String = "Nehmt also die Federkiele und tötet einen Magier des Ordens! Sein Leben wird druch seinen Geist jagen und der Federkiel wird es in sich aufnehmen! Und irgendwo in seiner Erinnerung ist der Portalzauber vergraben!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_017", String = "Sucht den Rodensmagier in Kathai! Erschlagt ihn und seht dann, ob Ihr den Federkiel findet, der seine Errinnerungen in sich aufgenommen hat!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7246, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[16]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_019", String = "Ihr seid erstaunlich, Mensch!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_020", String = "Seht her! Aus dem Blut fertige ich nun die Tinte der Verderbtheit! Damit wird der Zauber geschrieben! Nehmt sie an Euch und bewahrt sie gut auf!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7257, Flag = Give}, TransferItem {TakeItem = 7245, Flag = Take}, TransferItem {TakeItem = 7233, Flag = Take}, TransferXP {XP= 25000, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[26]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_022", String = "Er hat die Erinnerung des Ordensmagiers aufgenommen! Nun wartet, lasst uns dieses Pergament hier nehmen ... und die Tinte der Verderbtheit ..."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_023", String = "Da! Seht Ihr, wie der Kiel flink zu schreiben beginnt? ... Das ganze Leben eines Mannes! Und hier! Das muss er sein! Der Portalzauber formt sich auf dem Blatt!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_024", String = "Ihr habt vollbracht, was niemand bisher vermochte! Nun nehmt den Zauber, nach dem es Nazshar begehrt und bringt ihn ihm!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tarukhP310_025", String = "Ich werde die Knochen befragen ... denn ich spüre Unheil in Eurem tun, selbst für die Völker der Finsternis ... Doch geht nun zu Nazshar, lasst mich allein!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7258, Flag = Give}, TransferItem {TakeItem = 7246, Flag = Take}, TransferItem {TakeItem = 7234, Flag = Take}, TransferXP {XP= 28750, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[31]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{37;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{37;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{37;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{37;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{37;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_003PC", String = "Nazshar schickt mich mit dieser Nachricht ...!", AnswerId = 7},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_010PC", String = "Ihr habt nun Tinte, was braucht Ihr noch?", AnswerId = 16},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_018PC", String = "Das Blut des Lichtkindes!", AnswerId = 26},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tarukhP310_021PC", String = "Einer der Federkiele hat sich verändert!", AnswerId = 31},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7245}), PlayerHasItem {ItemId = 7256}, Negated(PlayerHasItem {ItemId = 7257})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7246}), PlayerHasItem {ItemId = 7257}, Negated(PlayerHasItem {ItemId = 7258})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[16]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7233}, Negated (PlayerHasItem {ItemId = 7257})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7234}, Negated (PlayerHasItem {ItemId = 7258})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end