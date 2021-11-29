-->INFO: Jonir
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 6 , 
	Conditions = 
	{
		Negated(QuestState{QuestId = 118 , State = StateActive}),
		IsGlobalFlagTrue {Name = "MarciaJonirIdleOn"},		
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 203 , Y = 480, Direction = 1 , 
	Conditions = 
	{
		QuestState{QuestId = 118 , State = StateActive},
		IsGlobalFlagTrue {Name = "MarciaJonirIdleOn"},		
	}
}


--!EDS RESPAWN BEGIN
Respawn{WaitTime=3}
--!EDS RESPAWN END

--Dialogsteuerung
OnToggleEvent
{
OnConditions = {
			QuestState{QuestId = 116 , State = StateUnknown}
			},
OnActions =	{
			RemoveDialog{}
			},
OffConditions = {
				QuestState{QuestId = 116 , State = StateActive , UpdateInterval = 15}
				},
OffActions =	{
				EnableDialog{},
				SetNpcFlagTrue{Name = "HasMainquest"}
				},
}

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


-- Brunnnefels bedroht
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 116, State = StateActive}
			},
Actions = {
		SetNpcFlagFalse{Name = "HasMainquest"},
		}
}

-- Brunnnefels safe
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 121, State = StateActive}
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
-- Source: C:\project\main\mission\dialoge\p9\n2017_Jonir.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagJonirKnown"},
		},
		Actions = {
			Say{Tag = "jonir001", String = "Die Rune zieht unter meinem Banner... Hätte mir das einmal jemand prophezeit, ich hätte ihn einen Narren geheißen! Versteht mich nicht falsch, Runenkrieger! Ich weiß Euren Beistand zu schätzen!"},
			Answer{Tag = "jonir001PC", String = "Ich habe wohl kaum eine Wahl, mein Lord!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonirKnown"}),
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "jonir003", String = "Grüße im Namen des Hauses Hallit!"},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonirKnown"}),
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "jonir003", String = "Grüße im Namen des Hauses Hallit!"},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonirKnown"}),
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "jonir003", String = "Grüße im Namen des Hauses Hallit!"},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonirKnown"}),
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "jonir003", String = "Grüße im Namen des Hauses Hallit!"},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonirKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "jonir003", String = "Grüße im Namen des Hauses Hallit!"},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonirKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "jonir003", String = "Grüße im Namen des Hauses Hallit!"},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonirKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "jonir003", String = "Grüße im Namen des Hauses Hallit!"},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonirKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "jonir003", String = "Grüße im Namen des Hauses Hallit!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonir002", String = "Nun, wer hat die schon, mein Freund... wer hat die schon?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonirKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonirKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonirKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonirKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonirKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonirKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonirKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonirKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonir004", String = "Seit Jahrhunderten verbindet die Zwerge und Menschen der Windwallberge ein Band der Bruderschaft!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonir005", String = "Es war Brauch im Hause Hallit, dass die ältesten Söhne beider Herrscher diesem Bund Treue schwören! So habe ich es einst getan. Und so hat es mein Vater vor mir getan. Und so tat es mein Sohn nach mir!"},
			Answer{Tag = "jonir005PC", String = "Und nun ist der Bund zerrissen?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonir006", String = "Ja! Ein Unglück entzweite die Häuser, und die Zwerge wandten sich von uns ab! Nun sind wir ohne ihren Schutz. Sie haben sich in ihr Land zurückgezogen und strafen uns mit Schweigen!"},
			Answer{Tag = "jonir006PC", String = "Weswegen?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonir007", String = "Das braucht Euch nicht zu interessieren, Runendiener! Wir sind jetzt auf uns allein gestellt. Doch wir werden zeigen, dass wir nicht weniger gute Krieger sind! Diese Feste wird standhalten!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagFalse{Name = "Q124DwarfInfoGiven"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonir008", String = "Wir sind so weit geflohen, wie wir konnten! Wenn dies unser Ende ist, dann werden wir ehrenvoll sterben! Wir werden unser Land nicht aufgeben! Niemals!"},
			Answer{Tag = "jonir008PC", String = "Ich werde den Orden in Graufurt um Verstärkung bitten!", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonir009", String = "Tut das! Wenn wir die Hilfe des Ordens jemals gebraucht haben, dann in dieser Stunde!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "BattleAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnAnswer{12;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 118 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "jonir011", String = "Ihr habt euch bewährt, Runenkrieger! Meine Leute verdanken Euch ihr Leben! Und ich verdanke Euch mein Land! Der Orden wird von Eurer Tat erfahren!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 118 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "jonir010", String = "Der Preis war hoch! Doch durch Eure Hilfe werden wir in Zukunft sicher sein! Nehmt dies im Namen des Hauses Hallit - und seid gesegnet!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "SchlachtUmBrunnenfels2a"} , SetNpcFlagTrue{Name = "RewardGiven"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{15;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnAnswer{15;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{15;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonir012", String = "Da Ihr auf Reisen seid, will ich Euch nicht mit höfischen Zeremonien aufhalten! Nehmt diese bescheidene Entlohnung - und den ewigen Dank des Hauses Hallit!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "SchlachtUmBrunnenfels2"} , SetNpcFlagTrue{Name = "RewardGiven"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir003PC", String = "Was ist mit der Zwergengarde geschehen?", AnswerId = 3},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir007PC", String = "Es sieht nicht gut aus!", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonir009PC", String = "Die Untoten sind zurückgeschlagen!", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q124DwarfInfoGiven"}),
			Negated(UND(QuestState{QuestId = 117 , State = StateActive} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(QuestState{QuestId = 120 , State = StateSolved} , IsNpcFlagFalse{Name = "RewardGiven"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end