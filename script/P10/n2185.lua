-->INFO: Guardian
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = West}
--!EDS ONIDLEGOHOME END

--!EDS RESPAWN BEGIN
Respawn{WaitTime=1}
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

-- Tor öffnen
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 144, State = StateActive}
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p10\n2185_Guardian.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"}),
		},
		Actions = {
			Say{Tag = "guardian008", String = "Geht, Mensch! Ihr seid hier nicht willkommen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuardianKnown"}),
			IsGlobalFlagFalse{Name = "Q138GuardianOpeningGate"},
		},
		Actions = {
			Say{Tag = "guardian003", String = "Stärke und Stahl, Freund!"},
			OfferAnswer{Tag = "guardian003PC", String = "Öffnet mir das Tor!", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGuardianKnown"}),
			Negated(IsGlobalFlagFalse{Name = "Q138GuardianOpeningGate"}),
		},
		Actions = {
			Say{Tag = "guardian003", String = "Stärke und Stahl, Freund!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagGuardianKnown"},
		},
		Actions = {
			Say{Tag = "guardian001", String = "Ich wache über dieses Tor - und das Grauen, das es von uns fernhält!"},
			Answer{Tag = "guardian001PC", String = "Welches Grauen?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q138GuardianOpeningGate"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "guardian002", String = "Das Grauen, das einst unsere Brüder jenseits dieser Felsen in den Tod gerissen hat! Doch ich bin kein Barde! Fragt in der Stadt nach, wenn Ihr Geschichten hören wollt..."},
			OfferAnswer{Tag = "guardian003PC", String = "Öffnet mir das Tor!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q138GuardianOpeningGate"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagGuardianKnown"},
			Say{Tag = "guardian002", String = "Das Grauen, das einst unsere Brüder jenseits dieser Felsen in den Tod gerissen hat! Doch ich bin kein Barde! Fragt in der Stadt nach, wenn Ihr Geschichten hören wollt..."},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 144 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "guardian006", String = "Ich habe Anweisung, dieses Tor geschlossen zu halten! Nur der Thane selbst kann diesen Befehl aufheben!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 144 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "guardian004", String = "Wie Ihr wünscht! Achtet auf die Gefahren, die jenseits dieser Felsen liegen! Keiner wird Euch dort zur Hilfe eilen! In diesem verfluchten Land hört nur der kalte Wind Eure Schreie!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138GuardianOpeningGate"} , QuestSolve{QuestId = 144},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "guardian005", String = "Tretet hindurch - die Kaltmark erwartet Euch!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q138GuardianOpeningGate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardian003PC", String = "Öffnet mir das Tor!", AnswerId = 3},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q138GuardianOpeningGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "guardian007", String = "Der Name unseres Thanen ist Skeld Skjalfson! Ihr findet ihn in der Stadt!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q138GuardianOpeningGate"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "guardian003PC", String = "Öffnet mir das Tor!", AnswerId = 3},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q138GuardianOpeningGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end