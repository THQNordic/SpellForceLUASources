-->INFO: Gunthar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OneTimeInitAction (HoldPosition{})
--!EDS ONIDLEGOHOME BEGIN
--!EDS ONIDLEGOHOME END
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 1,
	Conditions = 	
	{
		IsGlobalState{Name = "Plot" , State = "JourneyTwo" , Operator = IsEqual},
		IsGlobalFlagFalse{Name = "Q120TroopsRetakePortal"}
	}
}

OnIdleGoHome
{
	WalkMode = Walk, X = 221, Y = 43, Direction = 1, Range = 10,
	Conditions = 	
	{
		IsGlobalState{Name = "Plot" , State = "JourneyTwo" , Operator = IsEqual},
		IsGlobalFlagTrue{Name = "Q120TroopsRetakePortal"}
	}
}

OnIdleGoHome
{
	WalkMode = Walk, X = 260, Y = 375, Direction = 1, Range = 20,
	Conditions = 	
	{
		IsGlobalState{Name = "Plot" , State = "JourneyTwo" , Operator = IsNotEqual},
	}
}


--Dialogsteuerung
--Umschalter
OnToggleEvent
{
	OnConditions = 
	{
		IsNpcFlagTrue{Name = "HasMainquest"},
	},
	OnActions = 
	{
		SetDialogType{Type = MainQuest}
	},
	OffConditions = 
	{
		IsNpcFlagFalse{Name = "HasMainquest"},
	},
	OffActions = 
	{
		SetDialogType{Type = SideQuest}
	},
}
--initial
OnOneTimeEvent
{
	Conditions = {},
	Actions = 
	{
		SetNpcFlagTrue{Name = "HasMainquest"},
	}
}

-- Erste Welle Durch
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Q112FirstWaveDefeated"}
	},
	Actions = 
	{
		SetNpcFlagTrue{Name = "HasMainquest"},
	}
}
-- Zweite Welle Durch
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Q112SecondWaveDefeated"}
	},
	Actions = 
	{
		SetNpcFlagTrue{Name = "HasMainquest"},
	}
}
-- Dritte Welle Durch
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Q112ThirdWaveDefeated"}
	},
	Actions = 
	{
		SetNpcFlagTrue{Name = "HasMainquest"},
	}
}
-- Brunnnefels safe
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 121 , State = StateActive}
	},
	Actions = 
	{
		SetNpcFlagTrue{Name = "HasMainquest"},
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p9\n2019_Gunthar.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagGuntharKnown"},
		},
		Actions = {
			Say{Tag = "gunthar001", String = "Ein Runenkrieger? Von Eurer Sorte haben wir hier schon lange keinen mehr gesehen!"},
			Answer{Tag = "gunthar001PC", String = "Der Krieg kehrt zurück!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuntharKnown"}),
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar004", String = "Was gibt es?"},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuntharKnown"}),
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar004", String = "Was gibt es?"},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuntharKnown"}),
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar004", String = "Was gibt es?"},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuntharKnown"}),
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar004", String = "Was gibt es?"},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuntharKnown"}),
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar004", String = "Was gibt es?"},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuntharKnown"}),
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar004", String = "Was gibt es?"},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuntharKnown"}),
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar004", String = "Was gibt es?"},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuntharKnown"}),
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar004", String = "Was gibt es?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagGuntharKnown"},
			Say{Tag = "gunthar002", String = "Und mit ihm seine Ausgeburten!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar003", String = "Nehmt es mir nicht übel, alter Hass brennt lange! Sprecht mit Lord Jonir in der Stadt! Schätze, er kann Eure Hilfe gut gebrauchen! Wir alle können das wohl..."},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar003", String = "Nehmt es mir nicht übel, alter Hass brennt lange! Sprecht mit Lord Jonir in der Stadt! Schätze, er kann Eure Hilfe gut gebrauchen! Wir alle können das wohl..."},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar003", String = "Nehmt es mir nicht übel, alter Hass brennt lange! Sprecht mit Lord Jonir in der Stadt! Schätze, er kann Eure Hilfe gut gebrauchen! Wir alle können das wohl..."},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar003", String = "Nehmt es mir nicht übel, alter Hass brennt lange! Sprecht mit Lord Jonir in der Stadt! Schätze, er kann Eure Hilfe gut gebrauchen! Wir alle können das wohl..."},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar003", String = "Nehmt es mir nicht übel, alter Hass brennt lange! Sprecht mit Lord Jonir in der Stadt! Schätze, er kann Eure Hilfe gut gebrauchen! Wir alle können das wohl..."},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar003", String = "Nehmt es mir nicht übel, alter Hass brennt lange! Sprecht mit Lord Jonir in der Stadt! Schätze, er kann Eure Hilfe gut gebrauchen! Wir alle können das wohl..."},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar003", String = "Nehmt es mir nicht übel, alter Hass brennt lange! Sprecht mit Lord Jonir in der Stadt! Schätze, er kann Eure Hilfe gut gebrauchen! Wir alle können das wohl..."},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar003", String = "Nehmt es mir nicht übel, alter Hass brennt lange! Sprecht mit Lord Jonir in der Stadt! Schätze, er kann Eure Hilfe gut gebrauchen! Wir alle können das wohl..."},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gunthar005", String = "Sehr gut! Wir brauchen Schützen auf den Felsenkämmen! Bringt jeden Mann, den Ihr habt, dort oben rechts und links entlang des Passes in Stellung!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gunthar006", String = "Meine Leute werden versuchen den Durchgang so lange wie möglich zu halten!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gunthar007", String = "Unsere Späher berichten von drei anrückenden Wellen! Vor allem Nahkämpfer! Sie dürfen hier nicht durchbrechen! Sie sind erbarmungslos! Alles was lebt ist ihr Feind!"},
			Answer{Tag = "gunthar007PC", String = "Keiner von ihnen wird diesen Pass durchqueren!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gunthar008", String = "Gut! Bringt Eure Schützen in Position! Wünscht uns Glück! Wir werden es brauchen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 127} , QuestBegin{QuestId = 115},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q112ThirdWaveDefeated"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q112ThirdWaveDefeated"},
		},
		Actions = {
			Say{Tag = "gunthar009", String = "Es ist vorbei! Jetzt gilt es, sie zurückzutreiben und das Portal ins Grauschattental zu sichern!"},
			Answer{Tag = "gunthar009PC", String = "Ich werde sie nach Süden verfolgen!", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gunthar010", String = "Gut! Wir versorgen unsere Verwundeten. Dann kommen wir nach! Seid vorsichtig - sie sind noch nicht geschlagen! Und sie werden das Portal nicht kampflos aufgeben!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gunthar011", String = "Eins noch! Tretet auf keinen Fall durch das Portal hindurch! Sie haben es auf der anderen Seite gesichert! Die Wachen dort würden Euch in einem Augenblick zerfleischen!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q112SecondWaveDefeated"},
		},
		Actions = {
			Say{Tag = "gunthar012", String = "Noch nicht! Eine Welle kommt noch! Die letzte... und schlimmste!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q112SecondWaveDefeated"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q112FirstWaveDefeated"},
		},
		Actions = {
			Say{Tag = "gunthar013", String = "So leicht geben sie nicht auf! Das war nur ein Vorgeschmack, ihre Vorhut!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q112FirstWaveDefeated"}),
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar014", String = "Es hat noch nicht einmal begonnen! Nur Geduld, Ihr bekommt Eure Schlacht!"},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q112FirstWaveDefeated"}),
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar014", String = "Es hat noch nicht einmal begonnen! Nur Geduld, Ihr bekommt Eure Schlacht!"},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q112FirstWaveDefeated"}),
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar014", String = "Es hat noch nicht einmal begonnen! Nur Geduld, Ihr bekommt Eure Schlacht!"},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q112FirstWaveDefeated"}),
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar014", String = "Es hat noch nicht einmal begonnen! Nur Geduld, Ihr bekommt Eure Schlacht!"},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q112FirstWaveDefeated"}),
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar014", String = "Es hat noch nicht einmal begonnen! Nur Geduld, Ihr bekommt Eure Schlacht!"},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q112FirstWaveDefeated"}),
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar014", String = "Es hat noch nicht einmal begonnen! Nur Geduld, Ihr bekommt Eure Schlacht!"},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q112FirstWaveDefeated"}),
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "gunthar014", String = "Es hat noch nicht einmal begonnen! Nur Geduld, Ihr bekommt Eure Schlacht!"},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q112FirstWaveDefeated"}),
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "gunthar014", String = "Es hat noch nicht einmal begonnen! Nur Geduld, Ihr bekommt Eure Schlacht!"},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gunthar015", String = "Gute Arbeit! Wir werden das Portal halten und weitere Angriffe zurückschlagen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gunthar016", String = "Runenkrieger! Ohne Euch würden unsere Köpfe auf ihren Schwertern stecken!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gunthar017", String = "Lord Jonir wird hochzufrieden sein! Sucht ihn auf! Ihr wollt doch sicher Eure Belohnung in Empfang nehmen?"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gunthar018", String = "Und Marcia sollte jetzt auch Zeit für Euch haben! Brunnenfels steht Euch offen!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "PortalSentencePlayed"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 127 , State = StateActive},
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar004PC", String = "Lord Jonir schickt mich zu Eurer Entlastung!", AnswerId = 3},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar008PC", String = "Ist der Angriff vorüber?", AnswerId = 9},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gunthar014PC", String = "Das Portal ist jetzt sicher!", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 127 , State = StateActive}),
			Negated(ODER(QuestState{QuestId = 115 , State = StateActive} , QuestState{QuestId = 120 , State = StateActive})),
			Negated(UND(QuestState{QuestId = 121 , State = StateActive} , IsNpcFlagFalse{Name = "PortalSentencePlayed"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end