-->INFO: kerwen
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END


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


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p17\n2621_kerwen.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagKerwenKnown"},
		},
		Actions = {
			Say{Tag = "kerwen001", String = "Durch dieses Portal ist schon sehr lange niemand mehr gekommen! Wie habt Ihr das vollbracht?"},
			Answer{Tag = "kerwen001PC", String = "Das ist eine lange Geschichte! Ich würde lieber die Eure hören!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKerwenKnown"}),
			QuestState{QuestId = 249 , State = StateActive},
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kerwen005", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKerwenKnown"}),
			QuestState{QuestId = 249 , State = StateActive},
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "kerwen005", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKerwenKnown"}),
			QuestState{QuestId = 249 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kerwen005", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKerwenKnown"}),
			QuestState{QuestId = 249 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "kerwen005", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKerwenKnown"}),
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kerwen005", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKerwenKnown"}),
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "kerwen005", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKerwenKnown"}),
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kerwen005", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKerwenKnown"}),
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "kerwen005", String = "Was kann ich für Euch tun?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen002", String = "Ich bin Kerwen, Soldat der roten Legion! Was wollt Ihr wissen?"},
			Answer{Tag = "kerwen002PC", String = "Wo ich hier bin für den Anfang.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen003", String = "Ihr seid am Fuße des Gottwalles! Hier findet Ihr einige der wenigen Siedlungen, die es in den Düsterlanden noch gibt."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKerwenKnown"},
			Say{Tag = "kerwen004", String = "Zumindest findet Ihr sie noch, solange die Briarwölfe sie nicht völlig zerstört haben!"},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKerwenKnown"},
			Say{Tag = "kerwen004", String = "Zumindest findet Ihr sie noch, solange die Briarwölfe sie nicht völlig zerstört haben!"},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKerwenKnown"},
			Say{Tag = "kerwen004", String = "Zumindest findet Ihr sie noch, solange die Briarwölfe sie nicht völlig zerstört haben!"},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKerwenKnown"},
			Say{Tag = "kerwen004", String = "Zumindest findet Ihr sie noch, solange die Briarwölfe sie nicht völlig zerstört haben!"},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKerwenKnown"},
			Say{Tag = "kerwen004", String = "Zumindest findet Ihr sie noch, solange die Briarwölfe sie nicht völlig zerstört haben!"},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKerwenKnown"},
			Say{Tag = "kerwen004", String = "Zumindest findet Ihr sie noch, solange die Briarwölfe sie nicht völlig zerstört haben!"},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKerwenKnown"},
			Say{Tag = "kerwen004", String = "Zumindest findet Ihr sie noch, solange die Briarwölfe sie nicht völlig zerstört haben!"},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKerwenKnown"},
			Say{Tag = "kerwen004", String = "Zumindest findet Ihr sie noch, solange die Briarwölfe sie nicht völlig zerstört haben!"},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen006", String = "Söldner, elendes Pack! Sie plündern unsere Höfe und foltern unsere Leute! Früher waren sie nur lästige Schmeißfliegen! Aber inzwischen..."},
			Answer{Tag = "kerwen006PC", String = "Warum greifen sie Eure Siedlungen an?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen007", String = "Ein Magier, ein Illusionist namens Mechlan, bezahlt sie dafür! Er sucht etwas - einen Gegenstand oder ein Schmuckstück! Es soll irgendwo hier verborgen sein..."},
			Answer{Tag = "kerwen007PC", String = "Hm, ich muss dringend Mulandir erreichen... gibt es einen Weg diese Söldner zu umgehen?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen008", String = "Nein! Das Portal nach Mulandir liegt auf der Spitze des Walles! Ihr werdet mitten durch sie hindurch müssen! Diese Kerle plündern und morden wie es ihnen gefällt! Sie werden vor Euch nicht Halt machen..."},
			Answer{Tag = "kerwen008PC", String = "Gut! Dann wollen wir sie nicht warten lassen!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 248} , QuestBegin{QuestId = 250} , 
				QuestBegin{QuestId = 257} , QuestSolve{QuestId = 249},
				SetGlobalFlagTrue{Name = "GodwallGateOpen"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen009", String = "Die rote Legion stand einst im Dienste Urams, des Dämonenbeschwörers! Er war der Zirkelmagier, der über dieses Gebiet herrschte. Er lag mit dem Nekromanten Hokan im Streit!"},
			Answer{Tag = "kerwen009PC", String = "Lebt Uram noch?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen010", String = "Nein! Er hat sich bei der Konvokation mit seinem eigenen Zauber vernichtet, wie die meisten des Zirkels! Wir handeln nicht mehr unter seinem Befehl - wir versuchen einfach nur noch zu überleben!"},
			Answer{Tag = "kerwen010PC", String = "Also sind die Siedler hier ehemalige Legionäre Urams?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen011", String = "Ja! Die meisten der Leute haben nach dem Krieg begonnen, sich irgendwo niederzulassen. Aber dieses Land ist teuflisch. Deshalb mussten einige von uns ihre Rüstungen anbehalten. Ihre Aufgabe war es, für unseren Schutz zu sorgen!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "UramToyInfoGiven"} , SetNpcFlagTrue{Name = "RedLegionAsked"},
			Say{Tag = "kerwen012", String = "Unser Stützpunkt hier, dort oben auf der Spitze des Walles, ist von den Briarwölfen zerstört worden! Aber es gibt noch mehr von uns überall in den Düsterlanden!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen013", String = "Die Briarwölfe sind Menschen wie wir! Ihr solltet also gut zwischen Freund und Feind unterscheiden! Sie sind perfekt ausgerüstet und organisiert, wie eine reguläre Armee!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen014", String = "Der Wall ist wie eine große Treppe, auf deren Stufen die Siedlungen errichtet wurden! Sie sind fast alle im Besitz der Söldner! Die Bauern sind geflohen oder haben sich versteckt!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerwen015", String = "Falls Ihr es schafft, einige der Söldner zu vertreiben, werden Euch unsere Leute sicherlich dankbar sein! Helft ihnen - dann helfen sie Euch!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q248TacticsQuestionAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 249 , State = StateActive},
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen005PC", String = "Die Briarwölfe?", AnswerId = 4},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			IsNpcFlagFalse{Name = "RedLegionAsked"},
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen008PCa", String = "Was ist die rote Legion?", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kerwen012PC", String = "Muss ich noch etwas über diese Söldner wissen?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 249 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "RedLegionAsked"}),
			Negated(UND(IsPlayerFlagFalse{Name = "Q248TacticsQuestionAsked"} , QuestState{QuestId = 250 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end