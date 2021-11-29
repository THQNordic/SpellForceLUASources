-->INFO: tana
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2 , Conditions = {IsGlobalFlagFalse{Name = "Q210TanGotoChest"}}}
--!EDS ONIDLEGOHOME END


OnIdleGoHome{WalkMode = Walk, X = 216 , Y = 264 , Direction = 3, Conditions = {IsGlobalFlagTrue{Name = "Q210TanGotoChest"}}}
--Zur Truhe gehen
--!EDS RESPAWN BEGIN
Respawn{WaitTime=120}
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

-- Zu Tana gehen
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 214, State = StateActive}
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}

-- Zu Shan gehen von Shiel aus
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 219, State = StateActive}
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
-- Source: C:\project\main\mission\dialoge\p12\n2326_tana.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagTanaKnown"},
		},
		Actions = {
			Say{Tag = "tana001", String = "Ein Runenkrieger? Da soll mich doch Zarach persönlich holen! Gesellt Euch zu mir! Berichtet! Ich bin mir sicher, Ihr habt eine spannende Geschichte zu erzählen!"},
			Answer{Tag = "tana001PC", String = "Noch ist nicht die Zeit für Geschichten!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTanaKnown"}),
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			QuestState{QuestId = 214 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "tana003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTanaKnown"}),
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			QuestState{QuestId = 214 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "tana003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTanaKnown"}),
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "tana003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTanaKnown"}),
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "tana003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTanaKnown"}),
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			QuestState{QuestId = 214 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "tana003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTanaKnown"}),
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			QuestState{QuestId = 214 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "tana003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTanaKnown"}),
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "tana003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTanaKnown"}),
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "tana003", String = "Willkommen zurück!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			QuestState{QuestId = 214 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTanaKnown"},
			Say{Tag = "tana002", String = "Schade! Ich bin Tana! Bardin aus der Hohenmark!"},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			QuestState{QuestId = 214 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTanaKnown"},
			Say{Tag = "tana002", String = "Schade! Ich bin Tana! Bardin aus der Hohenmark!"},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTanaKnown"},
			Say{Tag = "tana002", String = "Schade! Ich bin Tana! Bardin aus der Hohenmark!"},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTanaKnown"},
			Say{Tag = "tana002", String = "Schade! Ich bin Tana! Bardin aus der Hohenmark!"},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			QuestState{QuestId = 214 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTanaKnown"},
			Say{Tag = "tana002", String = "Schade! Ich bin Tana! Bardin aus der Hohenmark!"},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			QuestState{QuestId = 214 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTanaKnown"},
			Say{Tag = "tana002", String = "Schade! Ich bin Tana! Bardin aus der Hohenmark!"},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTanaKnown"},
			Say{Tag = "tana002", String = "Schade! Ich bin Tana! Bardin aus der Hohenmark!"},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTanaKnown"},
			Say{Tag = "tana002", String = "Schade! Ich bin Tana! Bardin aus der Hohenmark!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tana004", String = "Gern! Die Hohenmark ist ein reiches und fruchtbares Land! Ihr werdet Nortander in zwei Atemzügen vergessen haben, wenn Ihr einmal dort gewesen seid!"},
			Answer{Tag = "tana004PC", String = "Das dürfte zur Zeit schwerfallen!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tana005", String = "Ja, die Grenzen sind geschlossen! Fragt mich nicht warum! Ich weiß nur, dass es etwas mit dem Konflikt im Osten zu tun hat! Doch es gibt wohl auch Streitereien innerhalb der Häuser!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tana006", String = "Man hat uns gesagt, dass die Grenze so schnell wohl nicht wieder geöffnet wird! Wahrscheinlich nicht mehr in diesem Jahr!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "HighmarkAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			QuestState{QuestId = 214 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			QuestState{QuestId = 214 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			QuestState{QuestId = 214 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			QuestState{QuestId = 214 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tana007", String = "Ist er noch am Leben?"},
			Answer{Tag = "tana007PC", String = "Ja, und auf dem Weg hierher! Er entsendet Grüße und bittet Euch, mir die Truhe zu öffnen!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tana008", String = "Gut, hier habt Ihr den Schlüssel! Kommt mit! Ich zeige Euch, wo sie steht!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 219} , QuestSolve{QuestId = 214} , TransferItem{GiveItem = 2619 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			QuestState{QuestId = 214 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			QuestState{QuestId = 214 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			QuestState{QuestId = 214 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			QuestState{QuestId = 214 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tana009", String = "Gleich hier neben mir! Benutzt den Schlüssel, den ich Euch gegeben habe!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			QuestState{QuestId = 214 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			QuestState{QuestId = 214 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "HighmarkAsked"},
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana003PC", String = "Erzählt mir von der Hohenmark!", AnswerId = 2},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			QuestState{QuestId = 214 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			QuestState{QuestId = 214 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana006PC", String = "Ich brauche Malicors Schlüssel!", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q210NearMalicorChest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tana008PC", String = "Wo ist Malicors Truhe?", AnswerId = 11},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "HighmarkAsked"}),
			Negated(QuestState{QuestId = 214 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q210NearMalicorChest"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end