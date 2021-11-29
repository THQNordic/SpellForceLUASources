-->INFO: thurgon
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END


OnPlatformOneTimeEvent
{
	Conditions = {
		IsNpcFlagTrue{Name = "ThurgonMustAttackAvatar", UpdateInterval = 10},
	},
	Actions = {
		AttackTarget{Target = Avatar , NpcId = self , FriendlyFire = TRUE},
	},
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
-- Source: C:\project\main\mission\dialoge\p12\n2324_thurgon.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagThurgonKnown"},
		},
		Actions = {
			Say{Tag = "thurgon001", String = "Welcher verschlungene Pfad f�hrt Euch hierher? Seid Ihr gekommen, um mit uns zu sterben?"},
			Answer{Tag = "thurgon001PC", String = "Nein! Ich bin hier, um mit Euch zu k�mpfen, Freund! Und zu siegen!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagThurgonKnown"}),
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "thurgon004", String = "Ah! Unsere Hoffnung ist zur�ck!"},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagThurgonKnown"}),
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "thurgon004", String = "Ah! Unsere Hoffnung ist zur�ck!"},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagThurgonKnown"}),
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "thurgon004", String = "Ah! Unsere Hoffnung ist zur�ck!"},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagThurgonKnown"}),
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "thurgon004", String = "Ah! Unsere Hoffnung ist zur�ck!"},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagThurgonKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "thurgon004", String = "Ah! Unsere Hoffnung ist zur�ck!"},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagThurgonKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "thurgon004", String = "Ah! Unsere Hoffnung ist zur�ck!"},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagThurgonKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "thurgon004", String = "Ah! Unsere Hoffnung ist zur�ck!"},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagThurgonKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "thurgon004", String = "Ah! Unsere Hoffnung ist zur�ck!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon002", String = "Dann seid Ihr t�richter als Ihr ausseht! Schlagt die untote Horde in einer Schlacht, und sie kehren hundertfach st�rker zur�ck! Sie bringen den Tod und der Tod n�hrt sie! Der Tag wird kommen an dem sie alles Leben vertilgt haben!"},
			Answer{Tag = "thurgon002PC", String = "Hoffnung gibt es immer! Wer seid Ihr, Ritter?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagThurgonKnown"},
			Say{Tag = "thurgon003", String = "Ich bin Thurgon, Schmied und Waffenmeister dieser Feste!"},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagThurgonKnown"},
			Say{Tag = "thurgon003", String = "Ich bin Thurgon, Schmied und Waffenmeister dieser Feste!"},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagThurgonKnown"},
			Say{Tag = "thurgon003", String = "Ich bin Thurgon, Schmied und Waffenmeister dieser Feste!"},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagThurgonKnown"},
			Say{Tag = "thurgon003", String = "Ich bin Thurgon, Schmied und Waffenmeister dieser Feste!"},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagThurgonKnown"},
			Say{Tag = "thurgon003", String = "Ich bin Thurgon, Schmied und Waffenmeister dieser Feste!"},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagThurgonKnown"},
			Say{Tag = "thurgon003", String = "Ich bin Thurgon, Schmied und Waffenmeister dieser Feste!"},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagThurgonKnown"},
			Say{Tag = "thurgon003", String = "Ich bin Thurgon, Schmied und Waffenmeister dieser Feste!"},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagThurgonKnown"},
			Say{Tag = "thurgon003", String = "Ich bin Thurgon, Schmied und Waffenmeister dieser Feste!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon005", String = "Weil wir hier wie die L�mmer auf den Schlachter warten! Schaut Euch all diese guten Kerle hier an! Noch vor dem n�chsten Mond sind sie alle tot! Oder schlimmeres..."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon006", String = "Ich habe genug von diesem sinnlosen Spiel! Doch Urias h�lt uns hier wie Gefangene! Dieser Narr! Ich werde nicht mit den anderen im Staub enden, nein!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon007", String = "Ihr dagegen seht aus wie jemand, der es kaum erwarten kann, sein Blut zu vergie�en! Ben�tigt Ihr ein paar Ratschl�ge, wie Ihr Euer Leben am teuersten verkaufen k�nnt?"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q199ThrugonQDespairOff"} , SetPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{7;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{7;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon008", String = "Wenn Ihr gegen sie k�mpft, dann sucht ihre Meister! Findet diejenigen, die sie anf�hren!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon009", String = "Jede Gruppe, jedes Heer hat einen Captain! Solange dieser k�mpft, nimmt es kein Ende! Immer neue Kreaturen schlie�en sich dann dem Heer an! Sie sind unerbittlich!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon010", String = "Vernichtet Ihr aber die Anf�hrer, so brecht Ihr ihre St�rke! Dies ist der einzige Weg!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			TransferXP{XP = 300 , Flag = Give},
			Say{Tag = "thurgon011", String = "Ihr scheint nicht dumm zu sein! Vielleicht �berlebt Ihr dieses Gemetzel hier ja wirklich! Nun, solltet Ihr jemals nach Graufurt zur�ckkehren, dann bitte ich Euch, dort etwas f�r mich zu erledigen!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon012", String = "Bringt diesen Brief zu Tanara, der Weberin! Aber �ffnet ihn nicht! Er ist nicht f�r Eure Augen bestimmt!"},
			Answer{Tag = "thurgon012PC", String = "Gut, ich werde daran denken! Es mag aber eine Weile dauern!", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon013", String = "Es eilt nicht! Es ist nur... Geht jetzt! Ihr habt sicher noch viel zu tun..."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagFalse{Name = "Q199ThurgonQHints"} , TransferItem{GiveItem = 2628 , Amount = 1 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
		}}

	OnAnswer{15;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon014", String = "Zeigt her...! Den habe noch nie zuvor gesehen! Woher wollt Ihr wissen, dass dies meine Handschrift ist?"},
			Answer{Tag = "thurgon014PC", String = "Anhand der Anschrift des Briefes, den Ihr mir gegeben habt! Diese Karte stammt von Euch! Und ich fand sie in den Krallen eines untoten Heerf�hrers!", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon015", String = "Ich habe Euch untersch�tzt! Ihr seid ein Narr, aber Ihr seid nicht blind! Habt Ihr wirklich gedacht, ich will mit den anderen hier mein Blut im Staub verrinnen sehen? Glaubt Ihr, ich will meine Seele an diese Kreaturen dort drau�en verlieren?"},
			Answer{Tag = "thurgon015PC", String = "Nein, Ihr gebt ihnen Eure Seele lieber freiwillig!", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon016", String = "Nur die Seelen der anderen! Die Untoten holen sie sich so oder so! Wo ist der Unterschied? So bleibt wenigstens einer am Leben!"},
			Answer{Tag = "thurgon016PC", String = "Ob Ihr am Leben bleibt, dar�ber wird der Orden entscheiden!", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thurgon017", String = "Dazu m�ssen sie mich erst einmal kriegen, Runenknecht!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 204} , QuestBegin{QuestId = 209} , 
		TransferItem{TakeItem = 2616 , Amount = 1 , Flag = Take} , 
		SetNpcFlagTrue{Name = "ThurgonMustAttackAvatar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"},
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon004PC", String = "Warum seid Ihr so mutlos, Thurgon?", AnswerId = 3},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			IsPlayerFlagTrue{Name = "Q199ThurgonQHints"},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon007PC", String = "Lasst Eure Ratschl�ge h�ren, Freund!", AnswerId = 8},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			QuestState{QuestId = 204 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thurgon013PC", String = "Dieser Plan hier tr�gt Eure Handschrift! Erkl�rt Euch!", AnswerId = 16},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q199ThrugonQDespairOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q199ThurgonQHints"}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end