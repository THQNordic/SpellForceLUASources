-->INFO: Karawanenfuehrer
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Für Cutscene das Ausrufezeichen weg
OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8790"},
	}
}

-- Nach der Cutscene geht es wieder zum Lager, damit die Einheit nicht so doof in der Landschaft rum seht
OnIdleGoHome
{
	X = 239, Y = 454,
	WalkMode = Walk,
	Direction = South,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_IntroGelaufen"},
		IsGlobalFlagFalse { Name = "g_P206_KarawaneLos"},
		IsGlobalFlagFalse { Name = "g_P206_KarawaneLosOhneDeal"}
	}
}

-- wenn der erste Dialog inkl. Infodialogen komplett geführt wurde kann er erst mal aus
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_Eins"},
		IsGlobalFlagTrue {Name = "g_P206_Zwei"},
		IsGlobalFlagTrue {Name = "g_P206_Drei"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8790"},
	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_P206_Eins"},
			IsGlobalFlagTrue { Name = "g_P206_DealAbgelehnt"},
		},
		ODER9
		{
			IsGlobalFlagFalse {Name = "g_P206_Zwei"},
			IsGlobalFlagFalse {Name = "g_P206_Drei"},
		}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8790"},
	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_AlleTraUndTroCampsPlatt"},
		IsGlobalFlagFalse {Name = "g_P206_KarawaneLos"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8790"},
	}
}

-- Vorm Tor bleibt die Karawane erst mal stehen bis es auf ist
OnIdleGoHome
{
	X = 256, Y = 206,
	WalkMode = Walk, Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "c_P206_KarawanenWegpunktzaehler", Value = 0, Operator = IsEqual},
		ODER9
		{
			IsGlobalFlagTrue { Name = "g_P206_KarawaneLos"},
			IsGlobalFlagTrue { Name = "g_P206_KarawaneLosOhneDeal"}
		}
	},
	Actions =
	{
		-- Den Dialog hier aus, weil der Spieler den Karawanenführer unterwegs nicht ansprechen können soll
		-- außerdem um die Trennung von Deal/kein Deal besser hinzubekommen
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8790"},
		ChangeRace {Race = 4},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "P206_AmTor"},
		-- Auf Player race tauschen, damit er von den Zombies angegriffen wir
		SetGlobalFlagTrue {Name = "c_P206_KarawaneAmTor"},
		Outcry {Tag = "oca2barioP206_003", NpcId = 8790, String = "Es ist soweit! Ich öffne das Tor der Djinnis!", Color = ColorWhite},
	}
}
-- Idle go home kann mehrfach ausgeführt werden, deshalb Zählen auslagern
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "P206_AmTor"},
	},
	Actions =
	{
		IncreaseNpcCounter {Name = "c_P206_KarawanenWegpunktzaehler"}
	}
}

--Zur Oase
OnIdleGoHome
{
	X = 165, Y = 126,
	WalkMode = Walk, Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "c_P206_KarawanenWegpunktzaehler", Value = 1, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_P206_TorAuf"}
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "c_P206_KarawaneZuHause"},
	}
}

-- Nur wenn auch der Auftrag angenommen wurde darf der Karawanenführer auch den Solver anbieten
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		--IsGlobalFlagTrue {Name = "c_P206_KarawaneZuHause"},
		IsGlobalFlagFalse {Name = "g_P206_DealAbgelehnt"},
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_n_P206HalbeKarawaneAngekommen"},
			IsGlobalFlagTrue {Name = "g_n_P206GanzeKarawaneAngekommen"},
			IsGlobalFlagTrue {Name = "g_n_P206ViertelKarawaneAngekommen"},
			IsGlobalFlagTrue {Name = "g_n_P206KeineKarawaneAngekommen"}
		}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8790"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_FickendeDialoge"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8790"},
	}
}

OnDeath
{
	Actions =
	{
		Outcry {Tag = "oca2barioP206_004", NpcId = 8790, String = "Ich schaffe es nicht! Bringt die Waren zum Dorf im Süden, Runenkrieger!", Color = ColorWhite},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p206\n8790_Karawanenfuehrer.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
		},
		Actions = {
			Say{Tag = "barioP206_001", String = "Nun, habt Ihr Euch unseren kleinen Handel durch den Kopf gehen lassen, Freund?"},
			Answer{Tag = "barioP206_002PC", String = "Wenn nur Ihr dieses Tor im Süden aufmachen könnt, haben wir wohl kaum eine Wahl!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "barioP206_006", String = "Ah, mögen Eure Wege mit Gold und Eure Taten mit Ruhm bedeckt sein!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_003", String = "Dann stimmt zu!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_004", String = "Es ist ganz einfach, glaubt mir!"},
			Answer{Tag = "barioP206_005PC", String = "Ich werde darüber nachdenken.", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_P206_AlleTraUndTroCampsPlatt"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_P206_AlleTraUndTroCampsPlatt"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{9;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_007PC", String = "Ich nehme Euer verdammtes Angebot an!", AnswerId = 10},
			OfferAnswer{Tag = "barioP206_014PC", String = "Was ist das für eine Falle?", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "barioP206_024PC", String = "Seid Ihr ein Hazim?", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "barioP206_041PC", String = "Euer Handel ist mir zu grausam, ich schlage nicht ein!", AnswerId = 42},
		}}

	OnAnswer{9;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_007PC", String = "Ich nehme Euer verdammtes Angebot an!", AnswerId = 10},
			OfferAnswer{Tag = "barioP206_014PC", String = "Was ist das für eine Falle?", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "barioP206_024PC", String = "Seid Ihr ein Hazim?", AnswerId = 31, Color = ColorDarkOrange},
		}}

	OnAnswer{9;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_007PC", String = "Ich nehme Euer verdammtes Angebot an!", AnswerId = 10},
			OfferAnswer{Tag = "barioP206_014PC", String = "Was ist das für eine Falle?", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "barioP206_041PC", String = "Euer Handel ist mir zu grausam, ich schlage nicht ein!", AnswerId = 42},
		}}

	OnAnswer{9;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_007PC", String = "Ich nehme Euer verdammtes Angebot an!", AnswerId = 10},
			OfferAnswer{Tag = "barioP206_014PC", String = "Was ist das für eine Falle?", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{9;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_007PC", String = "Ich nehme Euer verdammtes Angebot an!", AnswerId = 10},
			OfferAnswer{Tag = "barioP206_024PC", String = "Seid Ihr ein Hazim?", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "barioP206_041PC", String = "Euer Handel ist mir zu grausam, ich schlage nicht ein!", AnswerId = 42},
		}}

	OnAnswer{9;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_007PC", String = "Ich nehme Euer verdammtes Angebot an!", AnswerId = 10},
			OfferAnswer{Tag = "barioP206_024PC", String = "Seid Ihr ein Hazim?", AnswerId = 31, Color = ColorDarkOrange},
		}}

	OnAnswer{9;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_007PC", String = "Ich nehme Euer verdammtes Angebot an!", AnswerId = 10},
			OfferAnswer{Tag = "barioP206_041PC", String = "Euer Handel ist mir zu grausam, ich schlage nicht ein!", AnswerId = 42},
		}}

	OnAnswer{9;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_007PC", String = "Ich nehme Euer verdammtes Angebot an!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_014PC", String = "Was ist das für eine Falle?", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "barioP206_024PC", String = "Seid Ihr ein Hazim?", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "barioP206_041PC", String = "Euer Handel ist mir zu grausam, ich schlage nicht ein!", AnswerId = 42},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_014PC", String = "Was ist das für eine Falle?", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "barioP206_024PC", String = "Seid Ihr ein Hazim?", AnswerId = 31, Color = ColorDarkOrange},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_014PC", String = "Was ist das für eine Falle?", AnswerId = 19, Color = ColorDarkOrange},
			OfferAnswer{Tag = "barioP206_041PC", String = "Euer Handel ist mir zu grausam, ich schlage nicht ein!", AnswerId = 42},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_014PC", String = "Was ist das für eine Falle?", AnswerId = 19, Color = ColorDarkOrange},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_024PC", String = "Seid Ihr ein Hazim?", AnswerId = 31, Color = ColorDarkOrange},
			OfferAnswer{Tag = "barioP206_041PC", String = "Euer Handel ist mir zu grausam, ich schlage nicht ein!", AnswerId = 42},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_024PC", String = "Seid Ihr ein Hazim?", AnswerId = 31, Color = ColorDarkOrange},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_041PC", String = "Euer Handel ist mir zu grausam, ich schlage nicht ein!", AnswerId = 42},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[10]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_P206_Unterhaendler" , UpdateInterval = 10}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[19]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "InfoHazimOff"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[42]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_008", String = "Sehr gut, gebt meinem Unterhändler Azyo Nachricht, dass er die Anführer der Lager zum Steinfeld schicken soll. Dann begebt Euch selbst dorthin."},
			Answer{Tag = "barioP206_009PC", String = "Wo liegt das Steinfeld?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_010", String = "Das Steinfeld befindet sich südlich von hier, ziemlich genau in der Mitte des Landes. Ihr erkennt es an dem Kreis aus Felsen, der dort aufgestellt ist."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_011", String = "Sucht dort nach einem versteckten Hebel! Sobald die zwei Brüder in den Kreis der Steine getreten sind, legt den Hebel um, dass löst die Falle aus!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_012", String = "Das Gas wird ausströmen und den Brüdern ein Ende machen! Und ohne Führer werden die Gazeda wieder gegeneinander kämpfen, anstatt uns das Leben schwer zu machen!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, SetGlobalFlagTrue {Name = "g_P206_Unterhaendler"}, RevealUnExplored {X = 267, Y = 405, Range = 10}, QuestSolve {QuestId = 820}, QuestBegin {QuestId = 821},
			Say{Tag = "barioP206_013", String = "Ihr Horden werden dann geschwächt sein und Ihr könnt ihre Lager zerstören! Dann ist die Handelsstraße ein für allemal frei von dieser Plage!"},
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
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[10]Abgeschaltet"},
			SetGlobalFlagTrue { Name = "g_P206_Eins"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_015", String = "Eine Gasfalle! Dort oben gab es einmal eine Erdspalte, aus der giftiges Gas stieg. Findige Köpfe haben die Spalte verschlossen und mit einem Mechanismus versehen, so dass man das Gas nach Wunsch ausströmen lassen kann!"},
			Answer{Tag = "barioP206_016PC", String = "Aber warum? Eine Falle mitten in dieser Einöde? Für wen?", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_017", String = "Früher, als das Reich noch groß war, da zogen viele Karawanen zwischen Empyria und den südlichen Provinzen oder den Grenzfestungen hin und her."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_018", String = "Das Ausrauben dieser Handelszüge galt zu dieser Zeit als ein ehrbares und angesehenes Handwerk!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_019", String = "Die meisten der Räuber fielen damals mit blitzenden Säbeln über die Handelsleute her, aber es gab auch solche mit etwas mehr Witz, wenn Ihr versteht!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_020", String = "Diese würden einen Führer in eine Karawane einschleusen, der dafür sorgt, dass die Karawane, wenn sie hier vorbeikommt, auf diesem herrlich übersichtlichen Steinfeld für die Nacht rastet."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_021", String = "Und kaum, dass die Kaufleute nichts ahnend schnarchend daliegen, schleicht sich der falsche Führer davon und legt den Hebel der Falle um ..."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_022", String = "Das Gas strömt aus und tut sein Werk! Dann können er  und seine Kameraden kampflos die Waren der armen Opfer einsammeln! Ziemlich grausam, ich weiß."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_023", String = "Aber nützlich! Wenn Ihr versteht, was ich meine."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[19]Abgeschaltet"},
			SetGlobalFlagTrue { Name = "g_P206_Zwei"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_025", String = "Richtig erkannt!"},
			Answer{Tag = "barioP206_026PC", String = "Dann seid Ihr wohl sehr ungwöhnlich. Die anderen Hazim waren weniger gesprächig ...", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_027", String = "Was wisst Ihr schon! Wir Hazim haben allzeit gekämpft! Gegen die Wüste, gegen die Dunklen und schließlich gegen euch Nordleute mit eurem Imperium!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_028", String = "Dies ist unser Land! Aber unsere Zahl ist klein und jedem gefällt es, Jagd auf uns zu machen! Dabei wollen wir nur eines! Leben wie der Wind in der Wüste ... in Freiheit!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_029", String = "Wundert es Euch da, dass viele von uns zu Räubern geworden sind? Wenn die reichen Nordmänner uns unser Land nehmen, dann sollen sie auch dafür bezahlen!"},
			Answer{Tag = "barioP206_030PC", String = "Ihr, guter Mann, scheint Euch aber mit Nordmännern und den Dunklen ganz gut zu verstehen.", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_031", String = "Ich kann nun mal mit Gold und Worten besser umgehen als mit Stahl und Eisen! Und meine Waren sorgen dafür, das die letzen friedlichen Hazim nicht verhungern!"},
			Answer{Tag = "barioP206_032PC", String = "Was ist mit diesen Gazeda-Familien, die Ihr so leichtfertig ermorden wollt? Sind das keine Hazim?", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_033", String = "Doch, Ihr habt recht, das sind sie. Aber sie sind schlecht!  ...  Wir Hazim sind ein tapferes Volk, aber unsere Streitetreien machen uns schwach!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_034", String = "Wenn die Gazeda nicht für, sondern gegen andere Hazim kämpfen, dann sind sie nicht mehr meine Brüder! Sie wollen den Kampf, also sollen sie ihn haben!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[31]Abgeschaltet"},
			SetGlobalFlagTrue { Name = "g_P206_Drei"},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_042", String = "Wie Ihr meint. Aber dieses Land ist nun einmal grausam und wenn Ihr überleben wollt, dann müsst Ihr es auch sein!"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_043", String = "Das werdet Ihr noch früh genug selbst herausfinden. Nun seht zu, wie Ihr mit den Gazeda und den Mumien selbst zurecht kommt! Ich bin mit Euch fertig!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[42]Abgeschaltet"},
			SetNpcFlagTrue {Name = "g_n_P203KarawanenfuehrerAngesprochen"}, SetGlobalFlagTrue { Name = "g_P206_DealAbgelehnt"}, QuestBegin {QuestId = 886}, QuestSolve {QuestId = 820},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{47;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P206_AlleTraUndTroCampsPlatt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[48]Abgeschaltet"} ),
			UND(IsGlobalFlagTrue {Name = "c_P206_KarawaneZuHause" , UpdateInterval = 10}, IsGlobalFlagFalse { Name = "g_P206_AngekommeneKarawane"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_035PC", String = "Die Lager sind zerstört, Eure Karawane kann nach Süden ziehen!", AnswerId = 48},
			OfferAnswer{Tag = "barioP206_044PC", String = "Ist dies Euer Ziel?", AnswerId = 55},
		}}

	OnAnswer{47;
		Conditions = {
			UND( IsGlobalFlagTrue {Name = "g_P206_AlleTraUndTroCampsPlatt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[48]Abgeschaltet"} ),
			Negated(UND(IsGlobalFlagTrue {Name = "c_P206_KarawaneZuHause" , UpdateInterval = 10}, IsGlobalFlagFalse { Name = "g_P206_AngekommeneKarawane"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_035PC", String = "Die Lager sind zerstört, Eure Karawane kann nach Süden ziehen!", AnswerId = 48},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P206_AlleTraUndTroCampsPlatt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[48]Abgeschaltet"} )),
			UND(IsGlobalFlagTrue {Name = "c_P206_KarawaneZuHause" , UpdateInterval = 10}, IsGlobalFlagFalse { Name = "g_P206_AngekommeneKarawane"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "barioP206_044PC", String = "Ist dies Euer Ziel?", AnswerId = 55},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(UND( IsGlobalFlagTrue {Name = "g_P206_AlleTraUndTroCampsPlatt"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[48]Abgeschaltet"} )),
			Negated(UND(IsGlobalFlagTrue {Name = "c_P206_KarawaneZuHause" , UpdateInterval = 10}, IsGlobalFlagFalse { Name = "g_P206_AngekommeneKarawane"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_036", String = "Ich wußte, dass mein Plan gelingen würde! Gut vollbracht, mein Freund!"},
			Answer{Tag = "barioP206_037PC", String = "Wer sagt, dass ich Euer Freund bin? Nun sputet Euch, macht Euren Trägern Beine!", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_038", String = "Nur gemach, Trollträger sollte man nicht über Gebühr antreiben! Das ist schlecht fürs Inventar!"},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_039", String = "Und wenn Ihr wirklich wollt, dass ich dieses Tor für Euch öffne, dann bleibt besser bei uns und schützt meine Träger! Die Gazeda sind nicht die einzige Gefahr hier!"},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_040", String = "Achtet auf die Mumien! Sie sind mit Waffen kaum zu verletzen! Bekämpft sie am besten mit Magie, wenn Ihr könnt! Feuer schadet ihnen am meisten!"},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue { Name = "g_P206_KarawaneLos"}, QuestSolve {QuestId = 824}, QuestBegin {QuestId = 825},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[48]Abgeschaltet"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_n_P206GanzeKarawaneAngekommen"},
		},
		Actions = {
			Say{Tag = "barioP206_045", String = "Ja! Vielen Dank für Eure Hilfe, Nordmensch! Vielleicht sind nicht alle Eurer Art so übel, wie ich dachte. Ihr habt gut gekämpft!"},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{56;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_n_P206GanzeKarawaneAngekommen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_046", String = "Ich denke, ich schulde Euch etwas, nehmt noch dies hier, ich hoffe es nützt Euch auf Eurer Reise! Lebt wohl!"},
			Answer{Tag = "barioP206_047PC", String = "Lebt wohl, Bario.", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "AlleTrolleKommenAn"}, SetGlobalFlagTrue { Name = "g_P206_AngekommeneKarawane"}, QuestSolve {QuestId = 825}, QuestBegin {QuestId = 891},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{61;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_n_P206HalbeKarawaneAngekommen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{61;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_n_P206HalbeKarawaneAngekommen"},
		},
		Actions = {
			Say{Tag = "barioP206_048", String = "Ja! Verfluchtes Pech! Kaum noch die Hälfte meiner Träger ist am Leben!"},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_049", String = "Nun ja, das ist nicht Eure Schuld ... hier, ich will meine Schulden nicht unbezahlt lassen. Hier!"},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "VieleTrolleKommenAn"}, SetGlobalFlagTrue { Name = "g_P206_AngekommeneKarawane"}, QuestSolve {QuestId = 825}, QuestBegin {QuestId = 891},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{66;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_n_P206ViertelKarawaneAngekommen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{66;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_n_P206ViertelKarawaneAngekommen"},
		},
		Actions = {
			Say{Tag = "barioP206_050", String = "Ja, das Dorf ist gleich hier ... bei allen heulenden Sanddämonen! Dieses jämmerliche Häuflein dort, dass soll meine Karawane gewesen sein?"},
			Answer{Tag = "barioP206_051PC", String = "Euer Land ist wahrhaft feindselig, Bario", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_052", String = "Wohl wahr! Bei solch hohen Verlusten kann ich Euch nur wenig als Entlohnung bieten. Aber nehmt dies, ich hoffe es hilft Euch."},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{Name = "WenigeTrolleKommenAn"}, SetGlobalFlagTrue { Name = "g_P206_AngekommeneKarawane"}, QuestSolve {QuestId = 825}, QuestBegin {QuestId = 891},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_n_P206KeineKarawaneAngekommen"}),
		},
		Actions = {
			Say{Tag = "barioP206_056", String = "Dennoch, danke!"},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{71;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_n_P206KeineKarawaneAngekommen"},
		},
		Actions = {
			Say{Tag = "barioP206_053", String = "Ja! Aber was nützt es mir, hier zu sein, wenn meine Waren in der Wüste begraben liegen?"},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_054", String = "Kein einzger Träger hat überlebt! Die Ahnen haben sich von mir abgewandt! Ich bin am Ende!"},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue { Name = "g_P206_AngekommeneKarawane"}, QuestSolve {QuestId = 825}, QuestBegin {QuestId = 891}, SetGlobalFlagTrue { Name = "g_P206_FickendeDialoge"},
			Say{Tag = "barioP206_055", String = "Ich hoffe Ihr habt auf Eurer Reise mehr Erfolg!"},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_057", String = "Ah, eins noch! Wenn Ihr nach Süden zieht, dann müsst Ihr als nächstes durch den Rabenpass! Wir haben einige Geschichten über ein Heer von Untoten gehört, dass die Festungen dort besetzt hat!"},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barioP206_058", String = "Seid also vorsichtig! Und möge die Sonne des Glücks dort für Euch scheinen!"},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue { Name = "g_P206_AngekommeneKarawane"}, QuestSolve {QuestId = 825}, QuestBegin {QuestId = 891}, SetGlobalFlagTrue { Name = "g_P206_FickendeDialoge"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}


	EndDefinition()
end