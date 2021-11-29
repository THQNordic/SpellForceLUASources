-->INFO: Lycande

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


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
--Eloni done?
OnOneTimeEvent
{
Conditions = {
			Negated(QuestState{QuestId = 28 , State = StateUnknown}),
			},
Actions = {
		SetNpcFlagFalse{Name = "HasMainquest"},
		}
}

--Lycande zu Hause und später vor dem Dorf
OnIdleGoHome
{
	X = _X, Y = _Y, Direction =1, WalkMode = Run,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "Q132VillageSafe"},
		IsGlobalFlagFalse {Name = "OrcAttackEloni"},
	},
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction =1, WalkMode = Run,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "OrcAttackEloni"},
	},
}

OnIdleGoHome
{
	X = 185, Y = 288, Direction =1, WalkMode = Run,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Q132VillageSafe" , UpdateInterval = 15},
		IsGlobalFlagFalse {Name = "OrcAttackEloni"},
	},
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p2\n1399_Lycande.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagLycandeKnown"},
		},
		Actions = {
			Say{Tag = "lycande001", String = "Aonirs Licht in dieser dunklen Stunde! Ihr seid... ein Runengebundener?"},
			Answer{Tag = "lycande001PC", String = "Meine Dienste sind wieder vonnöten!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLycandeKnown"}),
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "lycande003", String = "Seid gegrüßt!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLycandeKnown"},
			Say{Tag = "lycande002", String = "Nun, Eure Hilfe ist willkommen!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lycande004", String = "Mit jeder Stunde weniger! Bald werden unsere Häuser brennen! Elen steh uns bei!"},
			Answer{Tag = "lycande004PC", String = "Eure Göttin wird um Euch trauern! Doch Hilfe ist von den Wächtern nur selten zu erwarten...", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lycande005", String = "Dann bitte ich Euch - helft Ihr uns! Ruft die Heere Eurer Runen! Erkämpft die Brücke und den Wald gemeinsam mit uns zurück! Noch sind die Elfen von Eloni nicht bereit, zum Fluss der Seelen zu gehen!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lycande006", String = "Nehmt unseren Dank, Runendiener! Viel mehr kann ich Euch für unsere Rettung nicht bieten..."},
			Answer{Tag = "lycande006PC", String = "Das ist mehr, als ich sonst gewohnt bin, zu erhalten.", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lycande007", String = "Es wird lange dauern, bis die Wunden verheilt und die Totenklagen verstummt sind! Was habt Ihr nun vor?"},
			Answer{Tag = "lycande007PC", String = "Ich muss weiter nach Osten! Der Schattenhain ist mein nächstes Ziel!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lycande008", String = "Dann seid gewarnt! So leicht geben sich Brannigans Truppen nicht geschlagen! Sie werden mit Sicherheit einen Gegenangriff führen! Und diesmal werden sie ihre Elite-Orkkämpfer schicken!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "RewardFlagLycandeSaveVillage"},
								SetRewardFlagTrue{ Name = "TrommelnInWaeldern"},
			SetPlayerFlagTrue{Name = "QuestSolveSaveVillage"}, QuestSolve{QuestId = 132},
			SetGlobalFlagTrue {Name = "Q132GiveElves"},
			Say{Tag = "lycande009", String = "Ich werde Euch eine Gruppe unserer besten Schützen unterstellen! Mit ihrer Unterstützung solltet Ihr bis zum Schattenhain vorstoßen können! Sie werden Euch vor der Siedlung erwarten! Viel Glück, Runenkrieger!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lycande010", String = "Folgt dem Weg jenseits der Brücke weiter nach Nordosten! Es ist nicht weit bis zum Portal!"},
			Answer{Tag = "lycande010PC", String = "Leben im Schattenhain noch Elfen?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lycande011", String = "Wir fürchten, dass er verloren ist! Schon vor Wochen haben sich Brannigans Horden dort ausgebreitet! Viele unserer Schwestern wurden erschlagen..."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lycande012", String = "Wir hörten, dass Brannigan dort ein befestigtes Lager errichtet hat! Er nutzt es als Stützpunkt für seine Raubzüge!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			RevealUnExplored{X = 442 , Y = 424 , Range = 10} , SetNpcFlagTrue{Name = "LeafshadeQuestionAsked"},
			Say{Tag = "lycande013", String = "Aber bis Ihr das Portal dorthin erreicht, erwartet Euch noch ein harter Kampf!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lycande014", String = "Hier, nehmt diesen Steinschlüssel! Er wird das Tor öffnen!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lycande015", String = "Aber ich muss Euch warnen! Es gibt einen Grund, warum das Tor verschlossen ist - dahinter beginnt das Land der Tiermenschen und Oger!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3183 , Amount = 1 , Flag = Give} , SetNpcFlagTrue{Name = "QuestionStonegate"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q132VillageSafe"},
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande003PC", String = "Hält Eure Verteidigung noch stand?", AnswerId = 2},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			QuestState{QuestId = 132 , State = StateActive},
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande005PC", String = "Eure Heimstatt ist wieder in Sicherheit!", AnswerId = 5},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive}),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande009PC", String = "Wie gelange ich zum Schattenhain?", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			IsNpcFlagFalse{Name = "QuestionStonegate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lycande013PC", String = "Gibt es einen Weg, das Steintor im Süden zu passieren?", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q132VillageSafe"}),
			Negated(QuestState{QuestId = 132 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "LeafshadeQuestionAsked"} , QuestState{QuestId = 28 , State = StateActive})),
			Negated(IsNpcFlagFalse{Name = "QuestionStonegate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end