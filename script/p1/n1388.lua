-->INFO: Ortah
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome{X = 95, Y = 120, Direction = North}

-- ? setzen:
OnOneTimeEvent
{
	Actions = {
		SetDialogType{Type = SideQuest},
	},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n1388_Ortah.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagOrtahKnown"},
		},
		Actions = {
			Say{Tag = "ortah001", String = "Seid gegrüßt! Mögen die Wächter Euch schützen und Euch allzeit mit bester Gesundheit und vollem Geldbeutel segnen!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrtahKnown"}),
		},
		Actions = {
			Say{Tag = "ortah003", String = "Ah, Ihr seid es! Berichtet mir von Euren neusten Abenteuern! Und denkt daran, einen Blick auf unser Angebot zu werfen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrtahKnown"},
			Say{Tag = "ortah002", String = "Wo wir gerade davon sprechen - wir haben hier ein ausgesucht feines Sortiment von Waren! Wenn Ihr vielleicht mal einen Blick darauf werfen wollt...?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			PlayerHasItem{ItemId = 1995},
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah003PC", String = "Brok meinte, Ihr kennt diesen Ring?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			PlayerHasItem{ItemId = 1996},
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah008PC", String = "Ich habe hier einen weiteren Ring!", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah013PC", String = "Einer der Geister trug dieses Buch bei sich!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			PlayerHasItem{ItemId = 1997},
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah016PC", String = "Habt Ihr Interesse an einem weiteren Ring?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah020PC", String = "Udwin ist erschienen!", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			IsPlayerFlagTrue{Name = "Q49DairusandMarker"},
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah024PC", String = "Darius glaubt, dass diese Runenschrift ein Tagebuch ist!", AnswerId = 36},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah026PC", String = "Was hat es mit Udwin auf sich?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 41 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 1995}),
			Negated(PlayerHasItem{ItemId = 1996}),
			Negated(UND(PlayerHasItem{ItemId = 2003} ,QuestState{QuestId = 46 , State = StateUnknown})),
			Negated(PlayerHasItem{ItemId = 1997}),
			Negated(IsPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"}),
			Negated(IsPlayerFlagTrue{Name = "Q49DairusandMarker"}),
			Negated(UND(QuestState{QuestId = 44 , State = StateSolved}, IsNpcFlagFalse{Name = "UdwinAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 41 , State = StateActive}),
			IsNpcFlagFalse{Name = "DangerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ortah029PC", String = "Recht gefährlich hier für einen Händler, findet Ihr nicht?", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 41 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "DangerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah004", String = "Na, wenn das nicht... da soll mich doch... Udwins Siegel! Bei den Wächtern! Woher habt Ihr ihn? Sprecht!"},
			Answer{Tag = "ortah004PC", String = "Von der Mine im Osten! Dort ging der Geist eines alten Kriegers um! Er verlor den Ring, als ich ihn erschlug!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah005", String = "Ihr Götter! Das war einer von Udwins Gefolgsleuten!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah006", String = "Udwin war ein Gelehrter! Einst zog er mit seinen Adepten hinab in die Erde, in die tiefen Schlünde des Barga Gor! Sie hofften, das Reich der Dämonen zu ergründen! Keiner von ihnen ist je zurückgekehrt!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah007", String = "Nun haben ihre Geister wohl den Weg aus den Abgründen gefunden! Das verheißt nichts Gutes!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah008", String = "Ich werde Euch diesen Ring gegen etwas eintauschen, was Euch mehr nützt! Und haltet die Augen offen! Vielleicht suchen uns noch mehr Geister heim!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "EinSeltsamerRing"}, 
					TransferItem{TakeItem = 1995, Flag = Take},
			SetPlayerFlagTrue{Name = "SpawnFlagForScribe"} , QuestBegin{QuestId = 556},
			QuestSolve{QuestId = 44} , QuestSolve{QuestId = 42},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah009", String = "Alle Wetter, tatsächlich! Dann ist es ist also wahr!"},
			Answer{Tag = "ortah009PC", String = "Ein weiterer Geist ist erschienen! Ein Magier...", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah010", String = "Das muss einer von Udwins Schreibern oder Kartographen gewesen sein! Man berichtet, dass sich unter ihnen einige befanden, die der Zauberkunst mächtig waren..."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "AusDerTiefe1Schreiber"} , TransferItem{TakeItem = 1996, Flag = Take},
			SetPlayerFlagTrue{Name = "SpawnFlagForScout"} , QuestBegin{QuestId = 557},
			Say{Tag = "ortah011", String = "Hier, nehmt dies als Entlohnung!"},
			Answer{Tag = "ortah011PC", String = "Meint Ihr, es tauchen noch weitere dieser Geister auf?", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 45},
			Say{Tag = "ortah012", String = "Es würde mich nicht wundern! Udwins Gefolge war groß - Krieger in prächtigen Panzern, Schreiber und Forscher, aber auch Späher aus den Dunhanwäldern!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah013", String = "Nicht nur altes Wissen - auch Gegenstände und Waffen von unschätzbarem Wert verschwanden damals für immer mit ihnen in der Tiefe!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 46},
			Say{Tag = "ortah014", String = "Ein Buch aus Udwins Zeit? Lasst mich sehen!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah015", String = "Zum Seelenfluss damit! Ich hätte mir denken können, dass es eine alte Runenschrift ist!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah016", String = "Ihr solltet dieses Buch Darius zeigen! Er studiert die alten Schriften und kennt vielleicht die Sprache, in der es verfasst wurde!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah017", String = "Da soll mich doch... noch einer? Nicht, dass ich es nicht vermutet hätte..."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "AusDerTiefe2Spaeher"} , TransferItem{TakeItem = 1997, Flag = Take},
			Say{Tag = "ortah018", String = "Hier, Eure Entlohnung! Ein besonderes Stück aus meiner Sammlung!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "SpawnFlagForUdwin"} , QuestBegin{QuestId = 558},
			QuestSolve{QuestId = 48} , QuestSolve{QuestId = 47},
			Say{Tag = "ortah019", String = "Wenn das so weitergeht, wird bald Udwin selbst aus den Tiefen emporsteigen! Dann mögen die Wächter uns gnädig sein!"},
			Answer{Tag = "ortah019PC", String = "Ist er gefährlich?", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah020", String = "Allerdings! Er war zu seiner Zeit ein angesehener Magier! Seine Studien des Dämonenreichs haben ihn mit der Magie des Feuers allzu vertraut werden lassen, berichtet man!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah021", String = "Dann ist es also tatsächlich geschehen! Ihr Götter! Hat er Euch angegriffen?"},
			Answer{Tag = "ortah021PC", String = "Nein, seltsamerweise nicht! Er redete nur wirr und konnte sich an nichts erinnern...", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah022", String = "Ich verstehe... Nun, man berichtet, dass manche Geister ruhelos umherirren - ohne Erinnerung an ihren Tod oder sich selbst. Der Gedanke, noch etwas beenden zu wollen, fesselt sie an unsere Welt!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah023", String = "Wenn diese Erinnerung dann zurückkehrt, folgt meist unweigerlich der Wahn!"},
			Answer{Tag = "ortah023PC", String = "Welchen Rat könnt Ihr mir geben?", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q49MarkerForBookQuestion"} , SetPlayerFlagFalse{Name = "Q49PlayerHasSeenUdwin"},
			Say{Tag = "ortah024", String = "Ihr müsst etwas finden, das Udwin sich erinnern lässt! Dann erfahren wir vielleicht mehr..."},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah025", String = "Dann könnte dies die Lösung sein! Bringt Udwin das Buch, vielleicht wird er sich errinnern, wenn er es liest!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 50} , SetPlayerFlagFalse{Name = "Q49DairusandMarker"},
			Say{Tag = "ortah026", String = "Aber seht Euch vor! Es mag sein, dass seine Erinnerung ein größeres Übel ist als der Tod selbst!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah027", String = "Er war ein weiser Mann, jedoch rastlos und getrieben! Er glaubte, dass in den Reichen der Dämonen uraltes Wissen verborgen läge! Wissen über die Entstehung der Welt!"},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah028", String = "Damals - das war noch zur Zeit des großen Imperiums - lebte er in Talindar, der weißen Stadt unter dem See! Er muss ungeheuer reich gewesen sein! Und sehr mächtig!"},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah029", String = "Sein Markenzeichen war der silbergewogene Ring der Kraft, den er trug! Viele haben diesen Ring begehrt! Aber am Ende hat Udwin ihn mit in sein finsteres Grab genommen!"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "UdwinAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah030", String = "Brannigans Goblingesindel, dieses elende Lumpenpack! Das war mal ein ruhiges Fleckchen - von hier bis hinauf zum Wildland Pass! Doch jetzt möchte man fast glauben, es sei wieder Krieg! Schlecht fürs Geschäft, fürwahr!"},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ortah031", String = "Aber sollen sie ruhig kommen! Ich mag ein ein altes Wrack sein, aber mein Schwertarm ist immer noch schnell genug für diesen Abschaum! Wer den Krieg gesehen hat, den schrecken ein paar Grünhäute nicht ab, was?"},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "DangerAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}


	EndDefinition()
end