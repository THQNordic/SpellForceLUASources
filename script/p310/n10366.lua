-->INFO: CoopQuestgeberDark2
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate {}

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = FALSE,
	
	Conditions =
	{
		PlayerHasItem {ItemId = 7255},
		Negated (PlayerHasItem {ItemId = 7299}),
	},
}

-- Coop Dark2
OnOneTimeEvent
{
	Actions =
	{
		RemoveDialog {},
	}
}

-- Für Auftrag 3 Dialog frei schalten

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			UND9
			{
				PlayerHasItem {ItemId = 7255},
				Negated( PlayerHasItem {ItemId = 7256})
			},
			PlayerHasItem {ItemId = 7232},
			UND9
			{
				PlayerHasItem {ItemId = 7258},
				Negated( PlayerHasItem {ItemId = 7259})
			},
			PlayerHasItem {ItemId = 7235}
		}
	},
	Actions =
	{
		EnableDialog {},
	}
}

-- Wenn der spieler das Item nicht mehr hat wird der Dialog für Aufträge ausgeschaltet
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7256},
		Negated (PlayerHasItem {ItemId = 7258})
	},  	
	Actions =
	{
		RemoveDialog {},
	}
}

-- Der Spieler hat alle Items der Aufträge, aber die beiden sind noch nicht am Portal, dann darf kein Dialog aktiv sein
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7253},
		PlayerHasItem {ItemId = 7259}
	},
	Actions =
	{
		RemoveDialog {}
	}
}


Umspawn
{
	X = 41, Y = 151,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		Negated (FigureInRange {X = 40, Y = 168, Range = 15}),
		IsGlobalFlagTrue {Name = "UmspawnInit", UpdateInterval = 2}, 
	},
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p310\n10366_CoopQuestgeberDark2.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}},
		},
		Actions = {
			Say{Tag = "nazsharP310_001", String = "Nors Macht ist mit Euch, Mensch! Ich danke Euch für meine Rettung!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}),
		},
		Actions = {
			Say{Tag = "nazsharP310_003", String = "Ah, mein Erwecker!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_002", String = " Ihr habt dem Volk der Norcaine einen großen Dienst erwiesen!"},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_005", String = "Es tut gut, wieder Luft zu atmen und die eigenen Glieder zu spüren! Zu fühlen, wie Wind über mein Gesicht streicht!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_006", String = "Aber ein Gefühl hat mich auch in jenem kalten Grab nie verlassen! Der Wunsch nach Rache!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_007", String = "Ich will die Lichtbeter, die mir das angetan haben, leiden sehen! Ich will auf Ihren Sehnen eine Ode des Schmerzes spielen! In ihre Haut will ich dasTestament meines Hasses schnitzen!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_008", String = "Ich werde einen Schrecken über sie bringen, wie ihn die Welt noch nicht gesehen hat! Doch dazu brauche ich Hilfe! Eure Hilfe!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_009", String = "Wenn Ihr mir helfen wollt, geht nach Erindar! Dort befindet sich ein altes, schadhaftes Portal!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_010", String = "Nehmt diesen Steinschneider und bringt mir den Portalstein!"},
			Answer{Tag = "nazsharP310_011PC", String = "Wie hilft Euch ein Portalstein bei Eurer Rache?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_012", String = "Um meinen Schrecken zu rufen, brauche ich ein Portal! Und der Stein ist der erste Schritt!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7244, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[7]Abgeschaltet"},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_014", String = "Ihr habt Euch gut bewährt! Ihr werdet einen Platz an meiner Seite in der neuen Welt einnehmen!"},
			Answer{Tag = "nazsharP310_015PC", String = "Neue Welt?", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_016", String = "Noch ist es nicht soweit! Das Portal können wir nun erschaffen, doch es braucht noch ein Ziel, einen Anker, zu dem es eine Verbindung erstellt!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_017", String = "Dies soll Eure letzte Aufgabe für mich sein! Nehmt diesen Ring, er wird den Gegenstand für Euch sichtbar machen!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_018", String = "Es ist ein dunkler Kristall, der selbst schon eine Pforte in eine andere Welt ist! Doch mit Hilfe unseres Portales werden wir diese Pforte in ein gewaltiges Tor verwandeln!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_019", String = "Dann können unsere Heerscharen hereinströmen, uns zum Dienste und Wohlgefallen!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_020", String = "Doch rasch jetzt! Nehmt den Ring! Sucht nach dem dunklen Kristall in Anaduine!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7247, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[17]Abgeschaltet"},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_022", String = "Sehr gut! Nun gilt es den rechten Zauber zu erlernen um das Portal zu öffnen!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_023", String = "Doch nur wenige des Ordens des Erwachens kennen den Portalzauber ... und sie haben ihn stehts gut gehütet!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_024", String = "Ich gebe Euch eine Nachricht mit, zeigt diese Tarukh, dem Orkschamanen!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_025", String = "Er kennt einen Weg, mit dem wir dem Orden vielleicht das Geheimnis der Portale entreissen können!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7256, Flag = Give}, TransferItem {TakeItem = 7244, Flag = Take}, TransferItem {TakeItem = 7232, Flag = Take}, TransferXP {XP= 22000, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[26]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_027", String = "Ah! Ein Schattenkristall! Endlich ist es soweit!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_028", String = "Das Portal ist komplett! Nun kann mein Plan gelingen! Ihr habt Eure Aufgabe gut erfüllt, Bote!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_029", String = "Nehmt dies als Zeichen meiner Gunst! Wir werden uns wiedersehen!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_030", String = "Und solltet Ihr den rechten Weg wählen, werdet Ihr einst zu meiner Rechten an meiner Tafel sitzen und das Blut der Welt wird Eure Kehle netzen!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_031", String = "Lebt wohl ... und vergesst nicht, wir sind es, die das Erbe der Götter antreten werden!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7259, Flag = Give}, TransferItem {TakeItem = 7247, Flag = Take}, TransferItem {TakeItem = 7235, Flag = Take}, TransferXP {XP= 30000, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[33]Abgeschaltet"},
			EndDialog(),
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_033", String = "Gut gewählt, Bote! Erschlagen wir die Lichtbeterhure! Die Zukunft gehört uns und den Schatten!"},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			ChangeRace {NpcId = 10048, Race = 137},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[41]Abgeschaltet"},
			RemoveDialog{NpcId = self},
			EndDialog(),
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nazsharP310_035", String = "Verblendeter Wurm! Du kennst dein Schicksal nicht! Wenn die Schatten erst regieren, wirst du am grausamsten von allen sterben!"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			ChangeRace {NpcId = 10366, Race = 137},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[45]Abgeschaltet"},
			RemoveDialog{NpcId = self},
			EndDialog(),
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_004PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_013PC", String = "Tarukh schickt mich mit dem Portalzauber zu Euch.", AnswerId = 17},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_021PC", String = "Hier, der Portalstein!", AnswerId = 26},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_026PC", String = "Ist dies der Kristall, den Ihr sucht?", AnswerId = 33},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} ),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_032PC", String = "Ich werde Euch helfen, die Lichtkriecher sollen vergehen!", AnswerId = 41},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "nazsharP310_034PC", String = "Ich werde Euch aufhalten! Sterbt, Täuscher!", AnswerId = 45},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7244}), Negated(PlayerHasItem {ItemId = 7256}), PlayerHasItem {ItemId = 7255}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7247}), Negated(PlayerHasItem {ItemId = 7259}), PlayerHasItem {ItemId = 7258}}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[17]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7232}, Negated (PlayerHasItem {ItemId = 7256})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( UND(PlayerHasItem {ItemId = 7235}, Negated (PlayerHasItem {ItemId = 7259})), IsNpcFlagFalse{Name = "ChoiceMitAnswerId[33]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[41]Abgeschaltet"} )),
			Negated(UND( 
	UND9
	{
		PlayerHasItem {ItemId = 7259},
		PlayerHasItem {ItemId = 7253}, 
		Negated(ODER9
		{
			PlayerHasItem {ItemId = 7298}, 
			PlayerHasItem {ItemId = 7299}
		})
	}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[45]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end