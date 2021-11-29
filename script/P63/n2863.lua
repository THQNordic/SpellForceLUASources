-->INFO: Zahnbrecher
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Dialogsteuerung

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
-- Source: C:\project\main\mission\dialoge\p63\n2863_Zahnbrecher.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagZahnbrecherKnown"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagZahnbrecherKnown"}),
		},
		Actions = {
			Say{Tag = "zahnbrecher004", String = "Ein Kunde! Willkommen! Sperrt Euren Mund auf und zeigt mir Euer Gebiss! Da liegt doch sicher einiges im Argen! Spürt Ihr nicht dieses Ziehen...?"},
			Answer{Tag = "zahnbrecher004PC", String = "Bei mir gibt es nichts zu holen! Meine Zähne sind in Ordnung, danke!", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 371 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "zahnbrecher001", String = "Ah, Freund! Ihr seid es wieder!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 371 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "zahnbrecher002", String = "Ah, Ihr seid es wieder! Wollt Ihr mir jetzt Eure Zähne zeigen?"},
			Answer{Tag = "zahnbrecher002PC", String = "Nein danke!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher003", String = "Schade! Habt Ihr dann wenigstens mein Eigentum gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher005", String = "Ich steche auch den Star! Euer Blick sieht mir ein wenig trübe aus..."},
			Answer{Tag = "zahnbrecher005PC", String = "Nein, nochmals danke!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher006", String = "Nun ja... früher oder später werdet Ihr schon noch angekrochen kommen! Wartet nicht, bis es zu spät ist! Sonst ist es am Ende Euer Tod!"},
			Answer{Tag = "zahnbrecher006PC", String = "Ich bin schon so oft gestorben...", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher007", String = "Wie meint Ihr...? Ah! Wartet! Ihr seid ein Runenkrieger, nicht wahr!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher008", String = "Ihr könntet mir vielleicht einen Gefallen tun! Als ich das letzte Mal in Liannon war, stahl mir eine Bande Goblins einen Satz meiner teuersten Zangen und Pinzetten! Falls Ihr sie finden solltet..."},
			Answer{Tag = "zahnbrecher008PC", String = "Ich finde die Vorstellung von Goblins, die sich gegenseitig ihre Zähne ausreißen, durchaus interessant... aber ich werde meine Augen offen halten!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagZahnbrecherKnown"},
	QuestBegin{QuestId = 371},
	QuestBegin{QuestId = 372},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 375, State = StateActive},
			PlayerHasItem{ItemId = 2486},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zahnbrecher008PCa", String = "Ihr versteht es, einem Augenkranken den Star zu stechen?", AnswerId = 10},
			OfferAnswer{Tag = "zahnbrecher010PC", String = "Sind dies die Zangen, die Euch gestohlen wurden?", AnswerId = 12},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 375, State = StateActive},
			Negated(PlayerHasItem{ItemId = 2486}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zahnbrecher008PCa", String = "Ihr versteht es, einem Augenkranken den Star zu stechen?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 375, State = StateActive}),
			PlayerHasItem{ItemId = 2486},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zahnbrecher010PC", String = "Sind dies die Zangen, die Euch gestohlen wurden?", AnswerId = 12},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 375, State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2486}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher009", String = "Das habe ich schon mehrere Dutzend Mal getan! Und in... ähm... den meisten Fällen ging es recht gut aus!"},
			Answer{Tag = "zahnbrecher009PC", String = "General Torn in Farlorns Heim benötigt ärztlichen Beistand!", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher010", String = "Wenn Ihr mir meine Zangen und Pinzetten wiederbringt, werde ich Euch helfen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher011", String = "Ja! Endlich kann ich wieder Zähne ausreißen! Hier, nehmt diesen Edelstein als Dank! Der bringt Euch bei einem Händler sicher ein hübsches Sümmchen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 372},
	QuestSolve{QuestId = 373},
	QuestSolve{QuestId = 371},
	TransferItem{TakeItem = 2486 , GiveItem = 2457 , Flag = Exchange},
	SetRewardFlagTrue{ Name = "ZahnbrechersZangen"},
			Say{Tag = "zahnbrecher012", String = "Und wenn Ihr einmal einen Eingriff nötig habt, kommt nur zu mir!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 375, State = StateActive},
			PlayerHasItem{ItemId = 3008},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zahnbrecher012PC", String = "Ihr versteht es, einem Augenkranken den Star zu stechen?", AnswerId = 15},
			OfferAnswer{Tag = "zahnbrecher016PC", String = "Diesen Zahn hier habe ich gefunden! Könnt Ihr etwas damit anfangen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 375, State = StateActive},
			Negated(PlayerHasItem{ItemId = 3008}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zahnbrecher012PC", String = "Ihr versteht es, einem Augenkranken den Star zu stechen?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 375, State = StateActive}),
			PlayerHasItem{ItemId = 3008},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zahnbrecher016PC", String = "Diesen Zahn hier habe ich gefunden! Könnt Ihr etwas damit anfangen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 375, State = StateActive}),
			Negated(PlayerHasItem{ItemId = 3008}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher013", String = "Das habe ich schon mehrere Dutzend Mal getan! Und in... ähm... den meisten Fällen ging es recht gut aus"},
			Answer{Tag = "zahnbrecher013PC", String = "General Torn in Farlorns Heim benötigt ärztlichen Beistand!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher014", String = "Farlorns Heim? Das ist mir zu weit! Doch ich kann Euch alles sagen, was Ihr wissen müsst!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2898 , Flag = Give},
	QuestSolve{QuestId = 375},
	QuestBegin{QuestId = 376},
			Say{Tag = "zahnbrecher015", String = "Hier, nehmt diese Nadel! Die getrübte Linse muss damit in die Tiefe des Auges versenkt werden! Dann können die Lichtstrahlen wieder durch das Sehloch ins Auginnere fallen!"},
			Answer{Tag = "zahnbrecher015PC", String = "Ich werde mich an Eure Anweisungen halten!", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher016", String = "Aber seid vorsichtig! Eine falsche Bewegung - und das Augenlicht ist für immer erloschen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zahnbrecher017", String = "Tatsächlich! Ein schönes Stück für meine Sammlung! Hier, nehmt die als Vergeltung!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3008 , Flag = Take},
	TransferXP{XP = 20, Flag = Give},
	TransferMoney{Silver = 1 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}


	EndDefinition()
end