-->INFO: Cronvig
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p10\n2577_Cronvig.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagCronvigKnown"},
		},
		Actions = {
			Say{Tag = "cronvig001", String = "Wer seid Ihr, Fremder? Ich erkenne Euch nicht! Seitdem man mir meine Augengläser gestohlen hat, kann ich nichts mehr sehen!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCronvigKnown"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cronvig002", String = "Wenn sie nur jemand finden und mir wiederbringen könnte..."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2661},
			PlayerHasItem{ItemId = 2893},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCronvigKnown"},
			QuestBegin{QuestId = 488},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cronvig002PC", String = "Diese Gläser hier fand ich in einer Kiste auf Liannon!", AnswerId = 3},
			OfferAnswer{Tag = "cronvig007PC", String = "Diese Gläser nahm ich einem Strauchdieb in Graufurt ab!", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2661},
			Negated(PlayerHasItem{ItemId = 2893}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCronvigKnown"},
			QuestBegin{QuestId = 488},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cronvig002PC", String = "Diese Gläser hier fand ich in einer Kiste auf Liannon!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2661}),
			PlayerHasItem{ItemId = 2893},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCronvigKnown"},
			QuestBegin{QuestId = 488},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cronvig007PC", String = "Diese Gläser nahm ich einem Strauchdieb in Graufurt ab!", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2661}),
			Negated(PlayerHasItem{ItemId = 2893}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCronvigKnown"},
			QuestBegin{QuestId = 488},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cronvig003", String = "Tatsächlich, das sind sie! Wie bei allen Schlünden des Braga Gor sind sie bloß nach Liannon gekommen?"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cronvig004", String = "Hier nehmt diese Flasche Zwergenweinbrand als Dank! Jedoch..."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cronvig005", String = "Sagt, als Ihr die Gläser gefunden habt - war dort auch eine kleine, bronzene Statuette?"},
			Answer{Tag = "cronvig005PC", String = "Nein, ich fürchte nicht!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cronvig006", String = "Die Statuette wurde mir zusammen mit den Augengläsern gestohlen! Sie ist für mich von unschätzbarem Wert!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cronvig007", String = "Vielleicht könntet Ihr Euch noch einmal auf die Suche begeben? Ich wäre Euch sehr dankbar!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 488},
			 QuestBegin{QuestId = 495},
			 TransferItem{TakeItem = 2661, GiveItem = 2662, Flag = Exchange},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cronvig008", String = "Nein, das sind sie nicht! Bitte, sucht weiter!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			PlayerHasItem{ItemId = 2661},
			PlayerHasItem{ItemId = 2893},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cronvig002PC", String = "Diese Gläser hier fand ich in einer Kiste auf Liannon!", AnswerId = 3},
			OfferAnswer{Tag = "cronvig007PC", String = "Diese Gläser nahm ich einem Strauchdieb in Graufurt ab!", AnswerId = 10},
		}}

	OnAnswer{11;
		Conditions = {
			PlayerHasItem{ItemId = 2661},
			Negated(PlayerHasItem{ItemId = 2893}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cronvig002PC", String = "Diese Gläser hier fand ich in einer Kiste auf Liannon!", AnswerId = 3},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2661}),
			PlayerHasItem{ItemId = 2893},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cronvig007PC", String = "Diese Gläser nahm ich einem Strauchdieb in Graufurt ab!", AnswerId = 10},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2661}),
			Negated(PlayerHasItem{ItemId = 2893}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState {QuestId = 488, State = StateSolved}),
			PlayerHasItem{ItemId = 2661},
			PlayerHasItem{ItemId = 2893},
		},
		Actions = {
			Say{Tag = "cronvig011", String = "Noch ein Fremder? Ach nein, Eure Stimme klingt vertraut..."},
			OfferAnswer{Tag = "cronvig002PC", String = "Diese Gläser hier fand ich in einer Kiste auf Liannon!", AnswerId = 3},
			OfferAnswer{Tag = "cronvig007PC", String = "Diese Gläser nahm ich einem Strauchdieb in Graufurt ab!", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState {QuestId = 488, State = StateSolved}),
			PlayerHasItem{ItemId = 2661},
			Negated(PlayerHasItem{ItemId = 2893}),
		},
		Actions = {
			Say{Tag = "cronvig011", String = "Noch ein Fremder? Ach nein, Eure Stimme klingt vertraut..."},
			OfferAnswer{Tag = "cronvig002PC", String = "Diese Gläser hier fand ich in einer Kiste auf Liannon!", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState {QuestId = 488, State = StateSolved}),
			Negated(PlayerHasItem{ItemId = 2661}),
			PlayerHasItem{ItemId = 2893},
		},
		Actions = {
			Say{Tag = "cronvig011", String = "Noch ein Fremder? Ach nein, Eure Stimme klingt vertraut..."},
			OfferAnswer{Tag = "cronvig007PC", String = "Diese Gläser nahm ich einem Strauchdieb in Graufurt ab!", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState {QuestId = 488, State = StateSolved}),
			Negated(PlayerHasItem{ItemId = 2661}),
			Negated(PlayerHasItem{ItemId = 2893}),
		},
		Actions = {
			Say{Tag = "cronvig011", String = "Noch ein Fremder? Ach nein, Eure Stimme klingt vertraut..."},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState {QuestId = 488, State = StateSolved},
			PlayerHasItem{ItemId = 3247},
		},
		Actions = {
			Say{Tag = "cronvig009", String = "Ah, Freund! Ihr seid es wieder! Habt Ihr meine Statuette gefunden?"},
			OfferAnswer{Tag = "cronvig009PC", String = "Das habe ich in der Tat! Hier ist sie!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState {QuestId = 488, State = StateSolved},
			Negated(PlayerHasItem{ItemId = 3247}),
		},
		Actions = {
			Say{Tag = "cronvig009", String = "Ah, Freund! Ihr seid es wieder! Habt Ihr meine Statuette gefunden?"},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cronvig010", String = "Tausend Dank! Bitte, nehmt diese Goldmünzen als Belohnung!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3247 , Flag = Take},
			 QuestSolve{QuestId = 495},
			 QuestSolve{QuestId = 487},
			 SetRewardFlagTrue{ Name = "Zwergendienste2Cronvig"},
			 RemoveDialogFromNpc{NpcId = 2577},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end