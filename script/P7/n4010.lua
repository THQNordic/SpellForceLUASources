-->INFO: craigh
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

OnOneTimeEvent
{
Conditions = {
	IsGlobalFlagFalse{Name = "IcegateDarkElfOn" , UpdateInterval = 50}
	},
Actions = {
	RemoveDialog{}
	}
}


OnOneTimeEvent
{
Conditions = {
	IsGlobalFlagTrue{Name = "IcegateDarkElfOn" , UpdateInterval = 10}
	},
Actions = {
	EnableDialog{}
	}
}

Despawn
{
Conditions = {
			Negated(QuestState{QuestId = 532 , State = StateUnknown})
			}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p7\n4010_craigh.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagCraighKnown"},
		},
		Actions = {
			Say{Tag = "craighIcegate001", String = "Ein Runenkrieger... welch Ironie des Schicksals! So schließt sich hier also der Kreis! Die Mächte des Konvokationskriegs treten an, um die letzte Schlacht gemeinsam auszutragen!"},
			Answer{Tag = "craighIcegate001PC", String = "Und was ist dabei Euer Platz in diesem Spiel?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "craighIcegate003", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "craighIcegate003", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "craighIcegate003", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "craighIcegate003", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "craighIcegate003", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "craighIcegate003", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "craighIcegate003", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCraighKnown"}),
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "craighIcegate003", String = "Runenkrieger?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate002", String = "Ich kehre aus der Verbannung zurück zu meinem Volk! Lange genug bin ich als Söldner durch die Welt gezogen! Meine Leute brauchen mich jetzt!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCraighKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate004", String = "Der Ort an den sie Euren Freund entführt haben? Ja, ich kenne ihn... und ich kenne auch die Runenmonumente dort!"},
			Answer{Tag = "craighIcegate004PC", String = "Erzählt mir mehr!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate005", String = "Eines von ihnen, ein Orkmonument, liegt östlich des Portals! Dorthin ist es jedoch ein weiter, gefährlicher Weg! Ganz in der Nähe des Portals befindet sich dagegen ein Monument der Dunkelelfen!"},
			Answer{Tag = "craighIcegate005PC", String = "Ich besitze keine Runensteine der Dunkelelfen!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate006", String = "Dann werdet Ihr in der Gottmark scheitern...! Es sei denn, Ihr wagt Euch in die Stätten von Tirganach!"},
			Answer{Tag = "craighIcegate006PC", String = "Die Stätte von Tirganach?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate007", String = "Sie liegt von hier aus gesehen im Osten, jenseits des Tores, das ins ewige Eis führt! Meine Brüder rangen sie einst den Sharok ab... nur um sie später wieder an die Eiselfen des Arynkults zu verlieren!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate008", String = "Diese Eiselfen sind fanatisch - und grausam! Ihr werdet unter ihnen keine Freunde des Lichts finden! Sie verteidigen den Gletscher gegen jeden, der den Schlaf des Frostwebers zu stören wagt!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate009", String = "Bereitet Euch also gut vor, falls Ihr in diese Schlacht ziehen wollt...!  Sucht im Eis nach den verschollenen Runensteinen meines Volkes und kehrt anschließend zu mir zurück! Dann werde ich Euch sagen, ob Ihr gerüstet seid!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 522} , QuestSolve{QuestId = 521},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate010", String = "Lasst sehen..."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q523HasAllItems"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q523HasAllItems"},
		},
		Actions = {
			Say{Tag = "craighIcegate011", String = "Es sollte genügen! Derart gerüstet könnt Ihr den Durchbruch in die Gottmark wagen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate012", String = "Seht Euch aber vor! Die Eisenvorräte im Norden dieses Landes sind rar! Ihr werdet deshalb zu Beginn nur wenig Rüstungen und Waffen schmieden können!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate013", String = "Die Eisernen werden Eure Ankunft rasch bemerken! Ihr müsst schnell handeln! Baut Eure Verteidigung auf und versucht um jeden Preis die Stellung zu halten! Dann werden sich ihre Truppen an Eurer Abwehr aufreiben!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate014", String = "Sobald der Weg nach Osten frei ist, könnt Ihr das Monument der Orks erobern!"},
			Answer{Tag = "craighIcegate014PC", String = "Ich danke Euch, Kriegsherr!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 523} , QuestSolve{QuestId = 522},
						SetRewardFlagTrue{ Name = "EndeDesOrdens2DreiItems"},
			SetDialogType{Type = SideQuest},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q523HasASomeItems"},
		},
		Actions = {
			Say{Tag = "craighIcegate015", String = "Nun, es ist ein Anfang! Aber noch lange nicht genug! Sucht weiter! Es muss noch mehr im Eis zu finden sein!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q523HasASomeItems"}),
		},
		Actions = {
			Say{Tag = "craighIcegate016", String = "Habt Ihr Eure Suche überhaupt schon begonnen, Lichtbeter? Ihr habt nichts, was Euch in der Gottmark helfen könnte! Sucht weiter!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate017", String = "Ihr wisst viel für einen einfachen Krieger..."},
			Answer{Tag = "craighIcegate017PC", String = "Tyrgar hat mir berichtet, Ihr hättet Amra bis zuletzt begleitet!", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate018", String = "Das habe ich...! Nur in seinem letzten Kampf konnte ich ihm nicht beistehen! Wir suchten Lea überall und fanden schließlich eine Spur, die in die Düsterlande führte!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate019", String = "Wochenlang irrten wir in der Wüstenei umher! Amra war wie rasend! Weder Durst noch die Heere der Untoten konnten ihn aufhalten! Doch wir fanden nur Staub und Tod!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate020", String = "Bis wir eines Abends einen unheiligen Ort erreichten...! Der Wind sang klagend zwischen den Felsen. Und eine alte Festung trohnte über dem Land! Dort schließlich fand er uns...!"},
			Answer{Tag = "craighGodmark009PC", String = "Leas Gemahl?", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate021", String = "Ja! Ein Magier mit dunkler Kapuze, und von unglaublicher Macht! Er schwebte aus dem Himmel herab... fegte uns beiseite wie Strohhalme im Wind! Geifernd verlangte er von Amra das Pfand der Götter, jenen unseligen Ring!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate022", String = "Ich sah noch, wie Amra sich aufrichtete! Wie er der Magie trotzend auf den Zauberer zuschritt... dann löschte ein Blitz mein Bewusstsein..."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate023", String = "Als ich erwachte, fand ich Amra tot neben mir! Das Pfand der Götter war verschwunden. Ich begrub seinen Leichnam an jenem Ort. Mitsamt seinen Waffen und seiner Rüstung, wie es einem Krieger gebührt!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate024", String = "Alles nur wegen eines nutzlosen Rings!"},
			Answer{Tag = "craighIcegate024PC", String = "Nutzlos? Das Pfand der Götter muss doch unvorstellbar große Macht besessen haben?", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate025", String = "Nein! Es war nur ein einfacher Ring aus Messing! Manchmal ist der Glaube der Leute stärker als jede Magie! Versteht Ihr? Das Volk wollte einfach glauben, dass Lea gesegnet war! Sie selbst schufen diese Legende - mit ihrer eigenen Vorstellungskraft!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craighIcegate026", String = "Dabei war das Pfand der Götter nur ein wertloses Stück Metall! Und ein Spiegel für die Habgier und die Dummheit der Völker! Denn die Götter verschenken kein Pfand an die Sterblichen!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 521 , State = StateActive},
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate003PC", String = "Ihr kennt die Gottmark?", AnswerId = 3},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			QuestState{QuestId = 522 , State = StateActive},
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate009PC", String = "Reichen die Artefakte Eures Volkes aus, die ich hier bei mir trage?", AnswerId = 11},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			QuestState {QuestId = 390, State = StateActive},
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craighIcegate016PC", String = "Ihr wahrt einst ein Waffenbruder Amras?", AnswerId = 21},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 521 , State = StateActive}),
			Negated(QuestState{QuestId = 522 , State = StateActive}),
			Negated(QuestState {QuestId = 390, State = StateActive}),
		},
		Actions = {
			QuestSolve {QuestId = 390}, QuestBegin {QuestId = 391},
						SetRewardFlagTrue{ Name = "AmraUndLea4"},
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end