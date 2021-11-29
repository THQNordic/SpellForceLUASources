-->INFO: Skeld
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END



--!EDS RESPAWN BEGIN
Respawn{WaitTime=3}
--!EDS RESPAWN END


--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
			IsNpcFlagTrue{Name = "HasMainquest"},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			IsNpcFlagFalse{Name = "HasMainquest"},
			},
OffActions = {
		SetDialogType{Type = SideQuest}
		},
}
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}

-- To Skeld
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"},
			Negated(QuestState{QuestId = 472, State = StateUnknown})
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}
-- Helm
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 146, State = StateActive},
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}
-- Helm abgegeben
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 146, State = StateSolved},
			},
Actions = {
		SetNpcFlagFalse{Name = "HasMainquest"},
		}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p10\n2178_Skeld.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"}),
		},
		Actions = {
			Say{Tag = "skeld017", String = "Mit Euresgleichen habe ich nichts mehr zu schaffen, Mensch."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSkeldKnown"}),
			QuestState{QuestId = 138 , State = StateUnknown},
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "skeld003", String = "Grüße, Mensch!"},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSkeldKnown"}),
			QuestState{QuestId = 138 , State = StateUnknown},
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "skeld003", String = "Grüße, Mensch!"},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSkeldKnown"}),
			QuestState{QuestId = 138 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "skeld003", String = "Grüße, Mensch!"},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSkeldKnown"}),
			QuestState{QuestId = 138 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "skeld003", String = "Grüße, Mensch!"},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSkeldKnown"}),
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "skeld003", String = "Grüße, Mensch!"},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSkeldKnown"}),
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "skeld003", String = "Grüße, Mensch!"},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSkeldKnown"}),
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "skeld003", String = "Grüße, Mensch!"},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSkeldKnown"}),
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "skeld003", String = "Grüße, Mensch!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagSkeldKnown"},
		},
		Actions = {
			Say{Tag = "skeld001", String = "Geht, Mensch! Euresgleichen ist hier nicht erwünscht!"},
			Answer{Tag = "skeld001PC", String = "Ich komme auf Empfehlung von Meister Skarvig! Ich benötige Eure Hilfe!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSkeldKnown"},
			Say{Tag = "skeld002", String = "Skarvig? Gut, ich werde Euch anhören! Aber haltet Euch kurz!"},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSkeldKnown"},
			Say{Tag = "skeld002", String = "Skarvig? Gut, ich werde Euch anhören! Aber haltet Euch kurz!"},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSkeldKnown"},
			Say{Tag = "skeld002", String = "Skarvig? Gut, ich werde Euch anhören! Aber haltet Euch kurz!"},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSkeldKnown"},
			Say{Tag = "skeld002", String = "Skarvig? Gut, ich werde Euch anhören! Aber haltet Euch kurz!"},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSkeldKnown"},
			Say{Tag = "skeld002", String = "Skarvig? Gut, ich werde Euch anhören! Aber haltet Euch kurz!"},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSkeldKnown"},
			Say{Tag = "skeld002", String = "Skarvig? Gut, ich werde Euch anhören! Aber haltet Euch kurz!"},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSkeldKnown"},
			Say{Tag = "skeld002", String = "Skarvig? Gut, ich werde Euch anhören! Aber haltet Euch kurz!"},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSkeldKnown"},
			Say{Tag = "skeld002", String = "Skarvig? Gut, ich werde Euch anhören! Aber haltet Euch kurz!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld004", String = "Der Osten ist ein Grab! Das Grab meines Sohnes! Dieser Weg wird Euch verschlossen bleiben!"},
			Answer{Tag = "skeld004PC", String = "Was ist geschehen?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld005", String = "Es war die Feigheit eines Menschen! Lordling Joshua! Er ließ meinen Sohn Herger im Stich! Das Band zwischen Menschen und Zwergen ist zertrennt!"},
			Answer{Tag = "skeld005PC", String = "Die Menschen von Brunnenfels haben auf dieses Bündnis vertraut! Wenn ich nicht nach Osten gelange, dann steht Euch offener Krieg bevor! Wie viele Tote braucht es, bis Euer Zorn vergeht?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld006", String = "Lordling Joshua muss sich seinem Schicksal stellen! Und entweder er stirbt wie sein Bruder im Blute oder er rächt dessen Tod! Nur eine solche Tat kann den Bund wieder herstellen! Habt Ihr mich verstanden?"},
			Answer{Tag = "skeld006PC", String = "Dann werde ich Joshua dazu bringen, seinem Feind in der Kaltmark noch einmal gegenüberzutreten!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld007", String = "Unter diesen Bedingungen werde ich das Osttor für Euch öffnen lassen! Der Lordling hat sich irgendwo südlich der Stadt verkrochen! Findet ihn!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld008", String = "Sorgt dafür, dass der Drachling, der meinen Sohn getötet hat, sein Ende findet! Der Helm Hergers soll mir als Beweis dafür dienen, dass es vollbracht ist!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 138} , QuestBegin{QuestId = 141} , QuestSolve{QuestId = 472},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld009", String = "Herger brach zusammen mit seiner Garde auf, um die Pfade nach Osten zu erkunden! Wir planten, ein Heer durch die Kaltmark zu entsenden, um den Menschen im Grauschattental zur Hilfe zu eilen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld010", String = "Sein Bruder im Blute sollte ihm zur Seite stehen! Doch Lordling Joshua ist kein Krieger, er ist ein Feigling!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld011", String = "Sie durchquerten die Kaltmark, bis sie weit im Osten, hoch in den Felsen, auf ein Drachenwesen stießen! Ein Drachling, der dort seinen Hort errichtet hatte! Es kam zum Kampf!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld012", String = "Der Lordling, dieser Wurm namens Joshua, nahm seine Beine in die Hand und lief... lief davon und ließ seine Gefährten und seinen Blutsbruder im Stich! Wimmernd wie ein Weib stolperte er vor unsere Tore!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld013", String = "Keiner der anderen kehrte mehr zurück! Fluch über den Lordling und seine Brut! Kein Bund verbindet mich mehr mit solchem Gewürm!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Q124QuestionHerger"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld014", String = "Wahrlich, Ihr habt Euer Wort gehalten, Mensch! Dann gibt es doch noch starkes Blut unter Euresgleichen! Ich danke euch!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld015", String = "Der Bund zwischen Joshua und meinem Sohn ist mit ihm gestorben! Aber das Bündnis zwischen den Menschen und Zwergen der Windwallberge soll wieder bestehen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skeld016", String = "Nehmt dies als Entlohnung! Möge Niethalfs Stärke allzeit mit Euch sein, Mensch!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			TransferXP{XP = 100 , Flag = Give} , TransferItem{GiveItem = 1009 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 1015 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 1333 , Amount = 1 , Flag = Give} , 
				TransferItem{TakeItem = 2515 , Amount = 1 , Flag = Take},
				QuestSolve{QuestId = 146} , QuestSolve{QuestId = 147} , QuestSolve{QuestId = 138}, QuestBegin{QuestId = 142},
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToColdmark"},
				SetGlobalFlagFalse{Name = "Q138JoshuaRunBackToThane"},
				RemoveDialog{NpcId = 2184},
				StopFollow{Target = Avatar , NpcId = 2184},
				SetRewardFlagTrue{ Name = "InsGrauschattental4"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 138 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld003PC", String = "Dringende Geschäfte führen mich nach Osten!", AnswerId = 3},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"}),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld008PC", String = "Was ist mit Eurem Sohn geschehen?", AnswerId = 10},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			PlayerHasItem{ItemId = 2515},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skeld013PC", String = "Hier ist der Helm Eures Sohnes!", AnswerId = 17},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 138 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 138 , State = StateActive} , IsNpcFlagFalse{Name = "Q124QuestionHerger"})),
			Negated(PlayerHasItem{ItemId = 2515}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end