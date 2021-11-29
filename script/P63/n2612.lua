-->INFO: Valdis
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

WatchStateMachine ()

SpawnOnlyWhen
{
	Conditions =
	{
		IsNpcFlagFalse {Name = "OneTimeSpawn"},
		QuestState {QuestId = 357, State = StateActive},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "OneTimeSpawn"},
	}
}

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
-- Source: C:\project\main\mission\dialoge\p63\n2612_Valdis.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagValdisKnown"},
			QuestState {QuestId = 357, State = StateActive},
			PlayerHasItem{ItemId = 2671},
		},
		Actions = {
			Say{Tag = "valdis001", String = "Leider kann ich Euch immer noch nichts anbieten! Flann Gondersen ist noch immer nicht mit der Lieferung eingetroffen!"},
			OfferAnswer{Tag = "valdis004PCa", String = "Dann könnt Ihr mir auch keine Wundtinktur geben?", AnswerId = 6},
			OfferAnswer{Tag = "valdis005PC", String = "Ich glaube, ich habe hier eine Kiste für Euch!", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagValdisKnown"},
			QuestState {QuestId = 357, State = StateActive},
			Negated(PlayerHasItem{ItemId = 2671}),
		},
		Actions = {
			Say{Tag = "valdis001", String = "Leider kann ich Euch immer noch nichts anbieten! Flann Gondersen ist noch immer nicht mit der Lieferung eingetroffen!"},
			OfferAnswer{Tag = "valdis004PCa", String = "Dann könnt Ihr mir auch keine Wundtinktur geben?", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagValdisKnown"},
			Negated(QuestState {QuestId = 357, State = StateActive}),
			PlayerHasItem{ItemId = 2671},
		},
		Actions = {
			Say{Tag = "valdis001", String = "Leider kann ich Euch immer noch nichts anbieten! Flann Gondersen ist noch immer nicht mit der Lieferung eingetroffen!"},
			OfferAnswer{Tag = "valdis005PC", String = "Ich glaube, ich habe hier eine Kiste für Euch!", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagValdisKnown"},
			Negated(QuestState {QuestId = 357, State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2671}),
		},
		Actions = {
			Say{Tag = "valdis001", String = "Leider kann ich Euch immer noch nichts anbieten! Flann Gondersen ist noch immer nicht mit der Lieferung eingetroffen!"},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagValdisKnown"}),
		},
		Actions = {
			Say{Tag = "valdis002", String = "Seid gegrüßt, Fremder! Leider kann ich Euch keine Waren anbieten! Ich warte nun schon seit Tagen auf eine wichtige Lieferung! Mein Lager ist restlos ausverkauft!"},
			Answer{Tag = "valdis002PC", String = "Von wem erwartet Ihr Eure Lieferung?", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "valdis003", String = "Von Flann Gondersen, einem fahrenden Händler! Ich frage mich, was mit ihm geschehen ist!"},
			Answer{Tag = "valdis003PC", String = "Vielleicht kann ich ihn finden. Sagt mir, wo ich mit der Suche beginnen soll!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "valdis004", String = "Er nimmt gewöhnlich den Weg über Shiel. Möglicherweise ist er dort oder auf einer der angrenzenden Inseln aufgehalten worden!"},
			Answer{Tag = "valdis004PC", String = "Falls ich dorthin komme, werde ich mich nach ihm umsehen!", AnswerId = 3},
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
			SetPlayerFlagTrue{Name = "FlagValdisKnown"},
						QuestBegin{QuestId = 353},
						QuestBegin{QuestId = 356},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState {QuestId = 357, State = StateActive},
			PlayerHasItem{ItemId = 2671},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "valdis004PCa", String = "Dann könnt Ihr mir auch keine Wundtinktur geben?", AnswerId = 6},
			OfferAnswer{Tag = "valdis005PC", String = "Ich glaube, ich habe hier eine Kiste für Euch!", AnswerId = 8},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState {QuestId = 357, State = StateActive},
			Negated(PlayerHasItem{ItemId = 2671}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "valdis004PCa", String = "Dann könnt Ihr mir auch keine Wundtinktur geben?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState {QuestId = 357, State = StateActive}),
			PlayerHasItem{ItemId = 2671},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "valdis005PC", String = "Ich glaube, ich habe hier eine Kiste für Euch!", AnswerId = 8},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState {QuestId = 357, State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2671}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "valdis005", String = "Im Augenblick leider nicht! Erst wenn ich meine nächste Lieferung erhalten habe!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState {QuestId = 357, State = StateActive},
			PlayerHasItem{ItemId = 2671},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "valdis004PCa", String = "Dann könnt Ihr mir auch keine Wundtinktur geben?", AnswerId = 6},
			OfferAnswer{Tag = "valdis005PC", String = "Ich glaube, ich habe hier eine Kiste für Euch!", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState {QuestId = 357, State = StateActive},
			Negated(PlayerHasItem{ItemId = 2671}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "valdis004PCa", String = "Dann könnt Ihr mir auch keine Wundtinktur geben?", AnswerId = 6},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState {QuestId = 357, State = StateActive}),
			PlayerHasItem{ItemId = 2671},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "valdis005PC", String = "Ich glaube, ich habe hier eine Kiste für Euch!", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState {QuestId = 357, State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2671}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "valdis006", String = "Meine Lieferung! Endlich!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "valdis007", String = "Wie soll ich Euch nur dafür belohnen? Meine Kasse ist leer... Wartet, ich weiß! Hier, nehmt diese Tinktur! Sie hat große Heilkraft und wird überall geschätzt!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2671 , GiveItem = 2670 , Flag = Exchange},
			  RemoveDialogFromNpc{NpcId = 2612},
			  SetRewardFlagTrue{ Name = "WundtinkturValdis"},
			  ChangeUnit{Unit = 1022},
			QuestSolve{QuestId = 356},
						QuestSolve{QuestId = 355},
						QuestSolve{QuestId = 354},
						QuestSolve{QuestId = 353},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end