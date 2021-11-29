-->INFO: CoopQuestgeberLight1
-->INFO: MPQuestgeber
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate {}

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		Negated (PlayerHasItem {ItemId = 7298}), 
	}
}


Umspawn
{
	X = 62, Y = 168,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		Negated (FigureInRange {X = 40, Y = 168, Range = 15}),
		IsGlobalFlagTrue {Name = "UmspawnInit", UpdateInterval = 2}, 
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
-- Source: C:\Project\main\mission\dialoge\p310\n10048_CoopQuestgeberLight1.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7250}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(Negated(PlayerHasItem {ItemId = 7250})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{1;
		Conditions = {
			UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})},
		},
		Actions = {
			Say{Tag = "nightsongP310_001", String = "Nors Schatten behüte uns alle Runenkrieger. Etwas Seltsames geschieht mit meinem Volk ... "},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}),
		},
		Actions = {
			Say{Tag = "nightsongP310_002", String = "Seid gegrüßt."},
			Answer{Tag = "", String = "", AnswerId = 6},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{5;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{7;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_004", String = "Als Bardin bin ich frei ... und kann ziehen wohin ich will! Ich lasse mich nicht einsperren, wie die anderen Frauen meines Volkes!"},
			Answer{Tag = "nightsongP310_005PC", String = "Eine Bardin der Norcaine? Ihr seid wirklich ungewöhnlich!", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_006", String = "Ich bin die Tocher von Craig Un'Shallach! Mein Leben kann nur ungewöhnlich sein!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_007", String = "Von meinem Vater habe ich den Respekt für Euch Lichtbeter geerbt ... und ich habe Freunde unter Euresgleichen auf meinen Reisen gewonnen."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_008", String = "Sagt, kann ich Euch bitten, einen dieser Freunde zu suchen? Ich kann diesen Ort nicht verlassen, ich muss auf jemanden warten!"},
			Answer{Tag = "nightsongP310_009PC", String = "Nur zu.", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_010", String = "Eine meiner Gefährten, Tana Klingensang, wollte schon längst hier sein! Sie wollte über Laragh reisen, danach habe ich nichts mehr von ihr gehört!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_011", String = "Wenn Ihr mir helfen wollt, dann sucht Tana in Laragh und gebt ihr diese Nachricht von mir! Ich hoffe, sie ist wohlauf!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7236, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[8]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_013", String = "Ein Lied auf die Zeit ... und gleichsam eine Prophezeiung! Der Barde Angar Arandir hat es einst begonnen. Man sagt, es gibt in jeder Generation einen Barden, der dem Lied einen weiteren Vers hinzufügt."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_014", String = "Alles Unheil, das uns noch erwartet, wird in diesem Lied besungen! Aber es ist nirgendwo ganz aufgezeichnet, seine Melodien klingen im Atem von Welt und Zeit!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_015", String = "Die getöteten Barden hatten wohl etwas gefährliches aus dem Lied erfahren! Auch Tana hat vom ewigen Lied gesprochen ... besser gesagt, von einem Teil daraus, dem Lied der Täuschung, das sie in Norimar suchen wollte!"},
			Answer{Tag = "nightsongP310_016PC", String = "Kann ich es dort finden?", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_017", String = "Das ist wohl möglich ...! Nehmt diese magischen Pergamente, sie wurden nach Angar Arandirs Angaben hergestellt! Sie sollten Euch helfen, Teile des Lieds aufzuzeichnen!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_018", String = "Begebt Euch damit nach Norimar! Sucht dort nach der Melodie der Täuschung! Das Pergament wird sie auszeichnen, wenn Ihr an der richtigen Stelle seid!"},
			Answer{Tag = "nightsongP310_019PC", String = "Was ist der Unterschied zwischen der Melodie und dem Lied?", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_020", String = "Richtig, dass könnt Ihr ja gar nicht wissen, verzeiht. Ihr könnt nur die Meldodie finden, nur eine Ahnung, eine Erinnerung, die noch in der Luft schwebt ... Ihr müsst dann, wenn Ihr sie gefunden habt, das Lied niederschreiben"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_021", String = "Benutzt dazu meinen Schreibtisch. Dort werdet Ihr das Lied aus der Melodie fertigen können. Bringt es mir dann!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_022", String = "Aber erst einmal müsst Ihr nach Norimar und die Melodie der Täschung suchen!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7237, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[17]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{27;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_024", String = "Lasst mich sehen ... Wahrhaftig, Ihr habt es vollbracht! Was mag es enthalten, dass jemand Tanas Herz dafür zu Eis gefriert ..."},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_025", String = "Hier steht, der Täuscher ist die Schlange, die aus dem Grabe kriecht ... Der Bote ist der, welcher die Prophezeiung schreibt, die er selbst erfüllt ....  Sie beide öffnen das Tor um die lange Nacht zu bringen!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_026", String = "Die lange Nacht ... Nachtfall,  das muss ein Zeitalter oder eine Epoche sein, etwas, das uns noch bevorsteht! Aber hier endet das Lied auch schon wieder! Aber wer ist dieser Täuscher? Und wer der Bote?"},
			Answer{Tag = "nightsongP310_027PC", String = "Also brauchen wir den nächsten Teil des ewigen Liedes?", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_028", String = "Ja! Ich errinnere mich, das es einen Teil davon gibt, den man Nachtfall nennt!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_029", String = "Nehmt diese Pergamente! Sie sind mächtiger und können vielleicht die Melodie von Nachtfall erfassen! Sucht sie in Draugh'Nar, dort wurde von ihrem Klang berichtet!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_030", String = "Wenn Ihr sie habt, benutzt wieder den Schreibtisch um das Lied niederzuschreiben."},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7238, Flag = Give}, TransferItem {GiveItem = 7239, Flag = Take}, TransferItem {TakeItem = 7226, Flag = Take},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[28]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_032", String = "Nors Auge! Tana! Es ist, wie ich befürchtet hatte!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_033", String = "Jemand ... oder etwas ... mordet meine Zunft! Barden, Spielmänner, Sänger ... immer mehr werden irgendwo tot gefunden. Und jedesmal ist ihr Herz zu Eis gefroren!"},
			Answer{Tag = "nightsongP310_034PC", String = "Warum die Barden? Was ist an Eurer Zunft so gefährlich, dass jemand sie auslöschen sollte?", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_035", String = "Nun, ausser ein paar falschen Noten ... Nein wartet! Das ewige Lied! Das muss es sein! Tana sprach davon! Deshalb wurde sie getötet!"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_036", String = "Arme Tana. Sie gab mir einst diesen Ring als Zeichen der Freundschaft ... nehmt ihn! Nehmt ihn und bewahrt ihn zusammen mit dem Herzen auf, als Erinnerung an sie."},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7248, Flag = Give}, TransferItem {TakeItem = 7236, Flag = Take}, TransferItem {TakeItem = 7224, Flag = Take}, TransferXP {XP= 10000, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[37]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{43;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_003PC", String = "Ein weiblicher Dunkelelf?", AnswerId = 8},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_012PC", String = "Was ist das ewige Lied?", AnswerId = 17},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_023PC", String = "Ich habe das Lied der Täschung!", AnswerId = 28},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_031PC", String = "Tana ist tot! Ihr Herz ist zu Eis erstarrt!", AnswerId = 37},
		}}

	OnAnswer{43;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7236}), Negated(PlayerHasItem {ItemId = 7248})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[8]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7237}), Negated(PlayerHasItem {ItemId = 7249}), PlayerHasItem {ItemId =7248}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7238}), Negated(PlayerHasItem {ItemId = 7250}), PlayerHasItem {ItemId = 7249}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[28]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7224}, Negated (PlayerHasItem {ItemId = 7248})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[37]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "nightsongP310_037", String = "Seid vorsichtig, Freund."},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_039", String = "Dieses Lied ist voll Trauer und Schwermut! Es beschreibt eine schlimme Zeit, die hier die lange Nacht genannt wird!"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_040", String = "Die lebendige Finsternis wird durch das Tor des Täuschers von jenseits der Sterne kommen ... und der Gott der Nacht wird der mächtigste auf Eo sein!"},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_041", String = "Das Licht vergeht ... die Wesen aus Finsternis erheben die Silbernen zu den Herren der Welt!"},
			Answer{Tag = "nightsongP310_042PC", String = "Wesen aus Finsternis? Die Silbernen?", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_043", String = "Ich weiß nicht, wen er mit den Silbernen meint, aber Wesen aus Finsternis, die durch ein Tor in unsere Welt kommen ... Ich ahne, wovon er spricht! Das ist es, was Castagir befürchtet hat!"},
			Answer{Tag = "nightsongP310_044PC", String = "Wer ist Castagir?", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_045", String = "Er ist derjenige, auf den ich warte! Doch dazu später! Wir müssen Rigour Mortis ebenfalls hierher holen!"},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_046", String = "Er ist ein Totenbeschwörer, der viel Kenntnis über diese Wesen aus Finsternis hat! Er lebt in Khalazhar! Sucht dort nach Rigour Mortis und gebt ihm diese Nachricht! Wir werden seine Hilfe brauchen!"},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7239, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[45]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{53;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{53;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{53;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
		}}

	OnAnswer{53;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{53;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{53;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{53;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_048", String = "Das Lied des Verräters? Lasst sehen ..."},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_049", String = "Eines der Sternenkinder wird die Wacht täuschen und verraten ... Und im Schatten seines Blendwerks strömt die Finsternis ungehindert ins Gefüge der Welt."},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_050", String = "Er wird die Bande seines Vaters abwerfen und zum Feinde aller werden!"},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_051", String = "Erde und Himmel! Wisst Ihr, was das bedeutet? Einer der Wächter wird die anderen verraten! Einer der Götter wird abtrünnig werden!"},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_052", String = "Hier steht, der Bote wird den Namen des Verräters nennen, wenn die Zeit gekommen ist ...  Nun beginnt das Lied des Boten, aber es ist nicht vollständig ..."},
			Answer{Tag = "nightsongP310_053PC", String = "Also brauchen wir ein weiteres Lied?", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_054", String = "Ja! Wir müssen die Prophezeiung vollenden! Hier, nehmt diese letzen Pergamente. Es sind die Mächtigsten, die ich besitze! Beginnt Eure Suche in Hazimar, dort ist in den Legenden von einem Boten die Rede."},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_055", String = "Der Schreibtisch wird Euch diesmal allerdings nichts nutzen, das Lied ist zu mächtig, als das Ihr es schreiben könntet! Bringt die Melodie gleich zu mir, wenn Ihr sie habt!"},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7241, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[54]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{63;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{63;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{63;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
		}}

	OnAnswer{63;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{63;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{63;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{63;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
		}}

	OnAnswer{63;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{63;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{63;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{63;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
		}}

	OnAnswer{63;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{63;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{63;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{63;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_057", String = "Der Täuscher muss bereits am Werk sein! Alle finden den Tod, die etwas über das ewige Lied und die lange Nacht wissen!"},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_058", String = "Aber der arme Rigour hat uns doch noch geholfen! Seht, dieses Buch! Das Schattenmanifest! Es war in dem Beutel, den Ihr gebracht habt!"},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_059", String = "Das ist es,was ich fürchte, Runenkrieger! Die Schatten! Sie sind die Wesen aus Finsternis, von denen das Lied spricht!"},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_060", String = "Deshalb hatte Castagir uns hierher gerufen! Er ahnt schon seit langem, dass die Schatten kommen werden!"},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_061", String = "Zeigt Castagir das Buch und die Lieder!"},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7251, Flag = Give}, TransferItem {TakeItem = 7239, Flag = Take}, TransferItem {TakeItem = 7227, Flag = Take}, TransferXP {XP= 24000, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[64]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{71;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{71;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{71;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
		}}

	OnAnswer{71;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{71;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{71;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{71;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_063", String = "Gut! Nun erfahren wir, wer der wahre Urheber all dessen ist!"},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_064", String = "Er erweckt die Schlange, gibt dem Täuscher was er will ... für ihn schafft er das Tor in die Schattenwelt ... und er bringt die lange Nacht ..."},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_065", String = "Sein ist die Wahl zwischen Licht und Schatten! Er webt die Prophezeiung, die er selbst erfüllt!  Sein ist die Macht über die Zukunft! "},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_066", String = "Und doch ist er nur ein Sklave der .... Ihr Götter!"},
			Answer{Tag = "nightsongP310_067PC", String = "Was habt Ihr? Ein Sklave der was?", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_068", String = "Ein Sklave der Rune!"},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_069", String = "Ihr seid der Bote! Ihr webt die Prophezeiung, die Ihr selbst erfüllt!"},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_070", String = "Und ich habe Euch auf den Weg geschickt! Ich werde verdammt sein!"},
			Answer{Tag = "nightsongP310_071PC", String = "Ich verstehe nicht ...", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nightsongP310_072", String = "Geht jetzt! Geht! Hütet Euch vor dem Täuscher! Und trefft die rechte Wahl, wenn es soweit ist!"},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7253, Flag = Give}, TransferItem {TakeItem = 7241, Flag = Take}, TransferItem {TakeItem = 7229, Flag = Take}, TransferXP {XP= 30000, Flag = Give},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{82;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{82;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{82;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
		}}

	OnAnswer{82;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{82;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{82;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{82;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_038PC", String = "Ich habe das Lied Nachtfall!", AnswerId = 45},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_047PC", String = "Castagir hat mich beauftragt ein weiteres Lied zu fertigen.", AnswerId = 54},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_056PC", String = "Auch Rigour ist tot! Ich habe nur noch seine Tasche!", AnswerId = 64},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nightsongP310_062PC", String = "Die Melodie des Boten ist gefunden!", AnswerId = 72},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7239}), PlayerHasItem {ItemId = 7250}, Negated(PlayerHasItem {ItemId = 7251})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7241}), Negated(PlayerHasItem {ItemId = 7253}), PlayerHasItem {ItemId = 7252}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[54]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7227}, Negated (PlayerHasItem {ItemId = 7251})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[64]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7229}, Negated (PlayerHasItem {ItemId = 7253})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[72]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end