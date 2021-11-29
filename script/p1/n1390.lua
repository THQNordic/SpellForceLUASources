-->INFO: Sunder
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- ? setzen:
OnOneTimeEvent
{
	Actions = {
		SetDialogType{Type = SideQuest},
	},
}

OnIdleGoHome{X = _X, Y = _Y, Direction = 1}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n1390_Sunder.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagSunderKnown"},
		},
		Actions = {
			Say{Tag = "sunder001", String = "Hm?"},
			Answer{Tag = "sunder001PC", String = "Seid Ihr der Schmied?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "sunder003", String = "Hmh?!"},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "sunder003", String = "Hmh?!"},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "sunder003", String = "Hmh?!"},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSunderKnown"}),
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "sunder003", String = "Hmh?!"},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "sunder003", String = "Hmh?!"},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "sunder003", String = "Hmh?!"},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "sunder003", String = "Hmh?!"},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSunderKnown"}),
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "sunder003", String = "Hmh?!"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSunderKnown"},
			Say{Tag = "sunder002", String = "Hm!"},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSunderKnown"},
			Say{Tag = "sunder002", String = "Hm!"},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSunderKnown"},
			Say{Tag = "sunder002", String = "Hm!"},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSunderKnown"},
			Say{Tag = "sunder002", String = "Hm!"},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSunderKnown"},
			Say{Tag = "sunder002", String = "Hm!"},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSunderKnown"},
			Say{Tag = "sunder002", String = "Hm!"},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSunderKnown"},
			Say{Tag = "sunder002", String = "Hm!"},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSunderKnown"},
			Say{Tag = "sunder002", String = "Hm!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder004", String = "Gut!"},
			Answer{Tag = "sunder004PC", String = "Gut... dann... gehabt Euch wohl!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder005", String = "Wartet! Hätte nicht gedacht, dass ein Runenkrieger sich dazu herablässt, einem einfachen Kerl wie mir zu helfen! Ihr scheint in Ordnung! Kommt, ich habe etwas für Euch!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 131} , 
					QuestSolve{QuestId = 128} , 
					TransferItem{TakeItem = 2461 , Flag = Take} , 
					SetRewardFlagTrue{ Name = "KleineFische2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
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
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder006", String = "Hmm... Zwergenarbeit! War mal ein schönes Stück... ziemlich verkommen! Ich tausche sie Euch gegen eine Waffe aus meinem Sortiment, wenn Ihr wollt?"},
			OfferAnswer{Tag = "sunder006PC", String = "Gerne! Zeigt mir, was Ihr anzubieten habt!", AnswerId = 8},
			OfferAnswer{Tag = "sunder007PCd", String = "Ich würde sie Euch lieber verkaufen!", AnswerId = 21},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder007", String = "Sucht Euch etwas aus..."},
			OfferAnswer{Tag = "sunder007PC", String = "(Feuerstahl-Säbel)", AnswerId = 9},
			OfferAnswer{Tag = "sunder007PCa", String = "(Feuerstahl-Axt)", AnswerId = 12},
			OfferAnswer{Tag = "sunder007PCb", String = "(Feuerstahl-Großhammer)", AnswerId = 15},
			OfferAnswer{Tag = "sunder007PCc", String = "(Feuerstahl-Schild)", AnswerId = 18},
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
		},
		Actions = {
			TransferItem{GiveItem = 661 , Flag = Give} , 
				TransferItem{TakeItem = 2005 , Flag = Take},
				SetNpcFlagTrue{Name = "AxeGiven"},
				SetRewardFlagTrue{ Name = "Zwergenaxt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 674 , Flag = Give} , 
				TransferItem{TakeItem = 2005 , Flag = Take},
				SetNpcFlagTrue{Name = "AxeGiven"},
				SetRewardFlagTrue{ Name = "Zwergenaxt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			TransferItem{GiveItem = 733 , Flag = Give} , 
				TransferItem{TakeItem = 2005 , Flag = Take},
				SetNpcFlagTrue{Name = "AxeGiven"},
				SetRewardFlagTrue{ Name = "Zwergenaxt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 702 , Flag = Give} , 
				TransferItem{TakeItem = 2005 , Flag = Take},
				SetNpcFlagTrue{Name = "AxeGiven"},
				SetRewardFlagTrue{ Name = "Zwergenaxt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder008", String = "Dann nehmt diese Münzen dafür!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			TransferMoney{Copper = 400 , Flag = Give} , 
				TransferItem{TakeItem = 2005 , Flag = Take},
				SetNpcFlagTrue{Name = "AxeGiven"},
				SetRewardFlagTrue{ Name = "Zwergenaxt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder009", String = "Danke! Aber Ihr seid nicht deswegen hier, oder?"},
			Answer{Tag = "sunder009PC", String = "Ich suche nach Amras Rüstung! Orthanc sandte mich zu Euch!", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder010", String = "Amra? Amra ist fort! Lea ist fort! Nur die Götter wissen, was aus ihnen geworden ist!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder011", String = "Amra war ein Krieger - ein Hitzkopf! Aber das Herz am rechten Fleck! Und Lea? Lea war das schönste Geschöpf, das die Welt je erblickt hat!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder012", String = "Die beiden hätten ein hübsches Paar abgegeben. Doch dann ging Lea fort, mit so einem vermummten Kerl! Und Amra war nicht mehr derselbe! Tobte und schrie den ganzen Tag!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder013", String = "Schließlich befahl er uns, diese Rüstung zu schmieden! Eine Rüstung, die weder Schwert noch Magie durchdringen kann! Als sie schließlich fertig war, zog er aus, um Lea zurückzuholen!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sunder014", String = "Er kehrte nicht wieder! Dieser vermummte Kerl muss ihn erschlagen haben. Anschließend ist er mit Lea verschwunden! Arme Shan... sie sorgt sich immer noch um ihre Schwester!"},
			Answer{Tag = "sunder014PC", String = "Shan Muir ist Leas Schwester?", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 380}, QuestBegin {QuestId = 381},
				SetRewardFlagTrue{ Name = "AmraUndLea1Liannon1"},
			Say{Tag = "sunder015", String = "Das ist sie! Geht hin und fragt sie selbst, wenn Ihr mir nicht glaubt!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 131, State  = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder003PC", String = "Ich bringe Euch den Fisch von Tyrgar!", AnswerId = 2},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"}),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder005PC", String = "Habt Ihr schon einmal eine solche Axt gesehen?", AnswerId = 7},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			QuestState {QuestId = 380, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sunder008PC", String = "Grüße von Orthanc!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 131, State  = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2005}, IsNpcFlagFalse{Name = "AxeGiven"})),
			Negated(QuestState {QuestId = 380, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end