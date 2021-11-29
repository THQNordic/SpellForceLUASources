-->INFO: waechter
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 4,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "2850_IdleOff"},
	},
}
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
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}
--einend er SPlitter?
OnOneTimeEvent
{
Conditions = {
			ODER(PlayerHasItem{ItemId = 2746},
				ODER(PlayerHasItem{ItemId = 2797},
					ODER(PlayerHasItem{ItemId = 2666},
						PlayerHasItem{ItemId = 2634})))
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}
--alle splitter?
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 308 , State = StateActive}
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p19\n2850_waechter.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagGuardianKnown"},
		},
		Actions = {
			Say{Tag = "waechterMul001", String = "Lange ist es her, dass ein Mensch auf diesen Pfaden gewandelt ist!"},
			Answer{Tag = "waechterMul001PC", String = "Wer seid Ihr?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagGuardianKnown"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "waechterMul002", String = "Einst diente ich dem Zirkel! Nun wache ich �ber die m�chtigen Sch�tze Mulandirs. Solange, bis die Welt wieder bereit f�r sie ist!"},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 294 , State = StateActive},
		},
		Actions = {
			Say{Tag = "waechterMul004", String = "Habt Ihr etwas gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 294 , State = StateActive}),
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "waechterMul003", String = "Was w�nscht Ihr?"},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul005", String = "Ein Schmuckst�ck von gewaltiger Macht, das ihr da begehrt!"},
			Answer{Tag = "waechterMul005PC", String = "Seine Macht ist die letzte Hoffnung f�r uns! Einer der Zirkelmagier ist zur�ckgekehrt! Nur der Ph�nix kann ihn noch aufhalten!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul006", String = "Dann wisset, dass Ihr die Wahrhaftigkeit Eurer Worte beweisen m�sst! Solche Macht wird nicht leichtfertig vergeben!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul007", String = "Seid Ihr bereit, die Pr�fung zu empfangen?"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 319} , QuestSolve{QuestId = 553} , 
					QuestSolve{QuestId = 318},
					SetRewardFlagTrue{ Name = "DerPhoenix1Waechter"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul008", String = "Einst lagerte in den Archiven des Zirkels ein wundervolles Kunstwerk aus Glas, das jeden, der es betrachtete, unweigerlich in seinen Bann schlug!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul009", String = "W�hrend des Krieges wurde es zerschlagen! Die vier Bruchst�cke wurden gestohlen! Seit jenem Tag haben diese Splitter Leid �ber diese Lande gebracht!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul010", String = "Denn sie sch�ren die Gier der Menschen. Viele mussten schon ihretwegen sterben! M�chtige Magier suchten nach ihnen und st�rzten alles ins Chaos!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul011", String = "Findet die vier Splitter und erl�st das Land von ihrem Fluch! Dann will ich Euch die Macht des Ph�nix anvertrauen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 294} , QuestBegin{QuestId = 295}, QuestBegin{QuestId = 320} , SetNpcFlagTrue{Name = "ShardQuestGiven"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul012", String = "Sie befinden sich noch immer in den D�sterlanden, wenn auch in alle Richtungen verstreut!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul013", String = "Ihnen wohnen verschiedene Eigenschaften inne. Einer gibt Freude wie der tanzende Fr�hling. Einer gl�ht wie der warme Sommerwind. Einer ist wie das nachdenkliche Licht des Herbstes und einer wie die schwerm�tige Stille des Winters!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul014", String = "Ein Abenteurer und Pl�nderer namens Thurgin stahl den Splitter des tanzenden Fr�hlings. Er lie� sich auf dem Gottwall s�dlich von hier nieder!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul015", String = "Der Splitter des Sommerwinds war zun�chst im Besitz der Magierin Talia. Doch Armun, ein Dieb aus dem S�den, entwendete ihn. Er floh nach Farlorns Heim und dann verlor sich seine Spur. Sucht dort nach ihm!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul016", String = "Der Splitter des Herbstlichts war lange verloren. Er muss seltsame Wege gegangen sein. Jahre sp�ter tauchte er dann im Besitz des Kaufmannes Farlorn auf! Ihr findet seinen Handelsposten westlich von Farlorns Heim!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul017", String = "Das Bruchst�ck der Winterstille befand sich ebenfalls im Besitz Talias. Sie nahm ihn mit auf ihre Reise nach Osten!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul018", String = "Sie zog aus, um Ulather, den F�rsten der D�monen, zu schlagen! Keiner hat je wieder etwas von ihr geh�rt. Niemand wagte es, ihr in den Spalt zu folgen - hinein in das Reich der D�monen!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q294InfoShardsGiven"} , SetNpcFlagTrue{Name = "FragmentsOneAsked"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul019", String = "Das Kunstwerk, zu dem sie geh�rten, war eine Glasmalerei! Ein Gem�lde aus Farben und Magie! Die uralten Former selbst haben dieses Artefakt einst angefertigt!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul020", String = "Es ist ein Abbild der Zeit und doch noch viel mehr! Es sind Tr�ume, Gedanken, Gef�hle in unglaublicher Macht und Tiefe! Wer es einmal betrachtet, wird unweigerlich von seinem Zauber gefangen!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul021", String = "Deshalb seid froh, wenn Ihr es nie in seiner G�nze erblickt! Ihr w�rdet nie wieder derselbe sein! Selbst die Splitter, in die es zerbrach, besitzen noch einen Teil seiner grausam sch�nen Macht!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul022", String = "Der Zirkel fand es in den Ruinen der Former und bewahrte es lange auf. Nur wenige bekamen es je zu Gesicht!"},
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
			SetNpcFlagTrue{Name = "FragmentsTwoAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul023", String = "Zeigt her!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2634}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{32;
		Conditions = {
			PlayerHasItem{ItemId = 2634},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "waechterMul023PC", String = "Hier ist der Splitter des tanzenden Fr�hlings!", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul024", String = "Ihr konntet ihn diesen Dieben entringen! Nun wird er wieder seinen rechten Platz einnehmen!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2634 , Amount = 1 , Flag = Take}, TransferXP{XP = 1000, Flag = Give},
				IncreasePlayerCounter{Name = "Q294ShardCounter" , Step = 1},
				SetRewardFlagTrue{ Name = "DerPhoenix2Splitter1"},
			SetNpcFlagFalse{Name = "HasMainquest"},
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
			Negated(PlayerHasItem{ItemId = 2666}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{36;
		Conditions = {
			PlayerHasItem{ItemId = 2666},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "waechterMul024PC", String = "Ich habe den Splitter des Sommerwinds gefunden!", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul025", String = "Ihr habt Armun aufgesp�rt?"},
			Answer{Tag = "waechterMul025PC", String = "Was von ihm �brig war... doch das ist eine lange Geschichte!", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2666 , Amount = 1 , Flag = Take}, TransferXP{XP = 1000, Flag = Give},
				IncreasePlayerCounter{Name = "Q294ShardCounter" , Step = 1},
				SetRewardFlagTrue{ Name = "DerPhoenix2Splitter2"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "waechterMul026", String = "Jetzt ist der Splitter wieder in Sicherheit! Nur das allein z�hlt!"},
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
			Negated(PlayerHasItem{ItemId = 2797}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{40;
		Conditions = {
			PlayerHasItem{ItemId = 2797},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "waechterMul026PC", String = "Hier, der Splitter des Herbstlichts!", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul027", String = "Endlich! Ihr habt diesen Landen gro�e Dienste erwiesen, Runenkrieger!"},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2797 , Amount = 1 , Flag = Take}, TransferXP{XP = 1000, Flag = Give},
					IncreasePlayerCounter{Name = "Q294ShardCounter" , Step = 1},
					SetRewardFlagTrue{ Name = "DerPhoenix2Splitter3"},
			SetNpcFlagFalse{Name = "HasMainquest"},
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
			Negated(PlayerHasItem{ItemId = 2746}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{44;
		Conditions = {
			PlayerHasItem{ItemId = 2746},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "waechterMul027PC", String = "Der Splitter der Winterstille!", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul028", String = "Tats�chlich! Keinem vorher ist es gelungen, Talia umzustimmen! Erstaunlich!"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2746 , Amount = 1 , Flag = Take}, TransferXP{XP = 1000, Flag = Give},
					IncreasePlayerCounter{Name = "Q294ShardCounter" , Step = 1},
					SetRewardFlagTrue{ Name = "DerPhoenix2Splitter4"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waechterMul029", String = "Wohlan denn! Er soll Euch geh�ren! M�ge er Euch und Eurer gerechten Sache dienen!"},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 321} , QuestSolve{QuestId = 320}, 
					QuestSolve{QuestId = 319}, QuestSolve{QuestId = 308}, 
					QuestSolve{QuestId = 294} , TransferXP{XP = 1000, Flag = Give},
					SetGlobalFlagTrue{Name = "MechlanFight"}, RemoveDialog{},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			QuestState{QuestId = 318, State = StateActive},
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul004PC", String = "Ich suche den Ph�nixstein!", AnswerId = 4},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul007PC", String = "Stellt mir Eure Pr�fung!", AnswerId = 9},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"}),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul011PC", String = "Wo finde ich die vier Splitter?", AnswerId = 15},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"}),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul018PC", String = "Was ist so besonders an diesen Splittern?", AnswerId = 24},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634}))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul022PC", String = "Ich habe ein Bruchst�ck des Kunstwerks...", AnswerId = 31},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waechterMul028PC", String = "Hier habt Ihr Euer Kunstwerk! Es ist komplett, wie Ihr verlangt habt! Gebt mir nun den Ph�nix!", AnswerId = 49},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(QuestState{QuestId = 318, State = StateActive}),
			Negated(UND(QuestState{QuestId = 319, State = StateActive}, IsNpcFlagFalse{Name = "ShardQuestGiven"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsOneAsked"})),
			Negated(UND(QuestState{QuestId = 295, State = StateActive} , IsNpcFlagFalse{Name = "FragmentsTwoAsked"})),
			Negated(UND(Negated(QuestState{QuestId = 302 , State = StateUnknown}) , ODER(ODER(PlayerHasItem{ItemId = 2666} , PlayerHasItem{ItemId = 2797}) , ODER(PlayerHasItem{ItemId = 2746} , PlayerHasItem{ItemId = 2634})))),
			Negated(UND(IsPlayerCounter{Name = "Q294ShardCounter" , Value = 4 , Operator = IsGreaterOrEqual} , QuestState{QuestId = 308 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end