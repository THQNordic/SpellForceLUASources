-->INFO: Guard
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 6}
--!EDS ONIDLEGOHOME END



--!EDS RESPAWN BEGIN
Respawn{WaitTime=20}
--!EDS RESPAWN END



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
-- Source: C:\project\main\mission\dialoge\p9\n2021_Guard.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagGuardKnown"},
		},
		Actions = {
			Say{Tag = "guardNW001", String = "Willkommen in den n�rdlichen Windwallbergen, Land des Hauses Hallit!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuardKnown"}),
			IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"},
			QuestState{QuestId = 118 , State = StateActive},
		},
		Actions = {
			Say{Tag = "guardNW002", String = "Gr��e!"},
			OfferAnswer{Tag = "guardNW002PC", String = "Ich suche Marcia, die Botschafterin des Ordens!", AnswerId = 2},
			OfferAnswer{Tag = "guardNW004PC", String = "Wir brauchen Verst�rkung!", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuardKnown"}),
			IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"},
			Negated(QuestState{QuestId = 118 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "guardNW002", String = "Gr��e!"},
			OfferAnswer{Tag = "guardNW002PC", String = "Ich suche Marcia, die Botschafterin des Ordens!", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuardKnown"}),
			Negated(IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"}),
			QuestState{QuestId = 118 , State = StateActive},
		},
		Actions = {
			Say{Tag = "guardNW002", String = "Gr��e!"},
			OfferAnswer{Tag = "guardNW004PC", String = "Wir brauchen Verst�rkung!", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuardKnown"}),
			Negated(IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"}),
			Negated(QuestState{QuestId = 118 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "guardNW002", String = "Gr��e!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"},
			QuestState{QuestId = 118 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagGuardKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardNW002PC", String = "Ich suche Marcia, die Botschafterin des Ordens!", AnswerId = 2},
			OfferAnswer{Tag = "guardNW004PC", String = "Wir brauchen Verst�rkung!", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"},
			Negated(QuestState{QuestId = 118 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagGuardKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardNW002PC", String = "Ich suche Marcia, die Botschafterin des Ordens!", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"}),
			QuestState{QuestId = 118 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagGuardKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardNW004PC", String = "Wir brauchen Verst�rkung!", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"}),
			Negated(QuestState{QuestId = 118 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagGuardKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "guardNW003", String = "Marcia befindet sich auf Burg Brunnenfels, bei unserem Herrn, Lord Jonir!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "guardNW004", String = "Folgt dem Weg hinter diesem Tor nach S�den! Brunnenfels ist nicht weit!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Q112QuestionMarciaAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"},
			QuestState{QuestId = 118 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardNW002PC", String = "Ich suche Marcia, die Botschafterin des Ordens!", AnswerId = 2},
			OfferAnswer{Tag = "guardNW004PC", String = "Wir brauchen Verst�rkung!", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"},
			Negated(QuestState{QuestId = 118 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardNW002PC", String = "Ich suche Marcia, die Botschafterin des Ordens!", AnswerId = 2},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"}),
			QuestState{QuestId = 118 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardNW004PC", String = "Wir brauchen Verst�rkung!", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"}),
			Negated(QuestState{QuestId = 118 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q118SupportReady"}),
		},
		Actions = {
			Say{Tag = "guardNW006", String = "Ich habe bereits Nachricht nach Graufurt gesandt! Die Truppen des Ordens werden bald hier sein!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q118SupportReady"},
			IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"},
			QuestState{QuestId = 118 , State = StateActive},
		},
		Actions = {
			Say{Tag = "guardNW005", String = "Ich f�rchte, weitere Truppen wird Graufurt uns auf die Schnelle nicht schicken k�nnen! Wir m�ssen uns gedulden und ausharren!"},
			OfferAnswer{Tag = "guardNW002PC", String = "Ich suche Marcia, die Botschafterin des Ordens!", AnswerId = 2},
			OfferAnswer{Tag = "guardNW004PC", String = "Wir brauchen Verst�rkung!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q118SupportReady"},
			IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"},
			Negated(QuestState{QuestId = 118 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "guardNW005", String = "Ich f�rchte, weitere Truppen wird Graufurt uns auf die Schnelle nicht schicken k�nnen! Wir m�ssen uns gedulden und ausharren!"},
			OfferAnswer{Tag = "guardNW002PC", String = "Ich suche Marcia, die Botschafterin des Ordens!", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q118SupportReady"},
			Negated(IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"}),
			QuestState{QuestId = 118 , State = StateActive},
		},
		Actions = {
			Say{Tag = "guardNW005", String = "Ich f�rchte, weitere Truppen wird Graufurt uns auf die Schnelle nicht schicken k�nnen! Wir m�ssen uns gedulden und ausharren!"},
			OfferAnswer{Tag = "guardNW004PC", String = "Wir brauchen Verst�rkung!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q118SupportReady"},
			Negated(IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"}),
			Negated(QuestState{QuestId = 118 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "guardNW005", String = "Ich f�rchte, weitere Truppen wird Graufurt uns auf die Schnelle nicht schicken k�nnen! Wir m�ssen uns gedulden und ausharren!"},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"},
			QuestState{QuestId = 118 , State = StateActive},
		},
		Actions = {
			SetGlobalTimeStamp{Name = "Q118SupportTimer"} , SetGlobalFlagTrue{Name = "Q118CalledForSupport"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardNW002PC", String = "Ich suche Marcia, die Botschafterin des Ordens!", AnswerId = 2},
			OfferAnswer{Tag = "guardNW004PC", String = "Wir brauchen Verst�rkung!", AnswerId = 6},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"},
			Negated(QuestState{QuestId = 118 , State = StateActive}),
		},
		Actions = {
			SetGlobalTimeStamp{Name = "Q118SupportTimer"} , SetGlobalFlagTrue{Name = "Q118CalledForSupport"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardNW002PC", String = "Ich suche Marcia, die Botschafterin des Ordens!", AnswerId = 2},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"}),
			QuestState{QuestId = 118 , State = StateActive},
		},
		Actions = {
			SetGlobalTimeStamp{Name = "Q118SupportTimer"} , SetGlobalFlagTrue{Name = "Q118CalledForSupport"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardNW004PC", String = "Wir brauchen Verst�rkung!", AnswerId = 6},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Q112QuestionMarciaAsked"}),
			Negated(QuestState{QuestId = 118 , State = StateActive}),
		},
		Actions = {
			SetGlobalTimeStamp{Name = "Q118SupportTimer"} , SetGlobalFlagTrue{Name = "Q118CalledForSupport"},
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end