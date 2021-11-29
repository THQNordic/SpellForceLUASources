-->INFO: urias
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END


--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END


Despawn{Conditions = {IsGlobalState{Name = "Plot" , State = "JourneyFour" }}}

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

-- Alles gesagt
OnOneTimeEvent
{
Conditions = {
			Negated(QuestState{QuestId = 206, State = StateUnknown}),
			Negated(QuestState{QuestId = 212, State = StateUnknown}),
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
-- Source: C:\project\main\mission\dialoge\p12\n2322_urias.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagUriasKnown"},
		},
		Actions = {
			Say{Tag = "urias001", String = "Wie, bei allen Schlünden des Barga Gor, kommt Ihr hierher?"},
			Answer{Tag = "urias001PC", String = "Ich bin durch den Westen vorgedrungen! Der Orden schickt mich!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUriasKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias005", String = "Grüße, Freund!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias002", String = "Die Rune zieht für den Orden? Nun denn, seid willkommen! Ich bin Urias, Kommandant dieser Feste!"},
			Answer{Tag = "urias002PC", String = "Ich fürchte, Eure Feste kann sich nicht mehr lange halten, Kommandant!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUriasKnown"},
			Say{Tag = "urias003", String = "Ich weiß... ihr Strom will nicht abreißen! Für jeden, den wir erschlagen, erscheinen drei neue! Es ist wie ein endloser, grauer Ozean, der gegen unsere Mauern wogt!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "urias004", String = "Die Männer sind schwach... es ist nur noch eine Frage der Zeit! Doch ich bitte Euch - erzählt meinen Leuten nichts von der Ausweglosigkeit unserer Lage!"},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias006", String = "Die Flammen des Barga Gor mögen ihn rösten! Es sind seine Horden, die uns überrennen!"},
			Answer{Tag = "urias006PC", String = "Aber Marcia sagte, er sei tot!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias007", String = "Aye! Das ist er! Sein eigener Zauber hat ihn erledigt! Aber der mächtigste Nekromant dieses Zeitalters stirbt nicht einfach so! Sein Geist weilt noch immer unter uns! Selbst von jenseits des Todes befehligt er seine Kreaturen!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias008", String = "Er sucht etwas! Etwas, das aus seinem Palast gestohlen wurde und das für ihn von unermesslichem Wert ist! Die Maske des Belial! Sie ist Schlüssel zu seiner Macht und sein Schutz vor der Rache der von ihm gepeinigten Seelen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias009", String = "Um diesen Gegenstand zu finden, hat er Korshar, den Knochenmalmer ausgesandt! Einen seiner mächtigsten Diener! Er befehligt die Heerscharen jenseits dieser Mauern!"},
			Answer{Tag = "urias009PC", String = "Deshalb greifen die Untoten an? Sie suchen die Maske?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias010", String = "Ja, die Maske ist der Grund für dieses Gemetzel!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q190QuestionHokanOff"} , SetPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias011", String = "Seid Ihr von Sinnen?"},
			Answer{Tag = "urias011PC", String = "Hokan ist der einzige, der uns helfen kann! Eine andere, größere Bedrohung zieht am Horizont herauf, Urias! Ich muss mit Hokan sprechen!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias012", String = "Nun, dazu müsst Ihr weiter nach Osten vorstoßen, nach Wisper! In die Stadt der Untoten..."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias013", String = "Aber selbst wenn Euch das gelingt... Hokan wird niemals mit Euch verhandeln! Er war ein Zirkelmagier! Alles was Ihr ernten werdet ist Spott und einen grausamen Tod! Es sei denn..."},
			Answer{Tag = "urias013PC", String = "Es sei denn - was?", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias014", String = "Es sei denn, Ihr bringt ihm die Maske des Belial! Für sie würde er Euch jedes Geheimnis verraten!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 192}, SetPlayerFlagFalse{Name = "Q190QuestionGhostOn"} , 
				SetPlayerFlagTrue{Name = "Q190QuestionSiegeOn"} , QuestBegin{QuestId = 210}, QuestBegin{QuestId = 559},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias015", String = "Die Stadt liegt weit im Osten, jenseits der klagenden Steine! Und dazwischen liegt Korshars Armee! Ein Heer von Untoten! Soviele haben selbst die Götter noch nicht gesehen!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q190StarGreyduskTacticsCutscene"},
			QuestBegin{QuestId = 206} , QuestBegin{QuestId = 193} , QuestBegin{QuestId = 194} , QuestBegin{QuestId = 198}, SetPlayerFlagFalse{Name = "Q190QuestionSiegeOn"} , SetPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"},
			EndDialog(),
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias022", String = "Ist das Euer Ernst? Selbst Hokans untote Heerscharen sind bislang an dieser Aufgabe gescheitert! Wie wollt Ihr das vollbringen?"},
			Answer{Tag = "urias022PC", String = "Mit Verstand, Geschick... und Eurer Hilfe, Urias!", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias023", String = "Hm! Ihr gefallt mir, Krieger! Also gut, hört zu... Als die Maske aus Hokans Grab entwendet wurde, zerbrach sie in zwei Teile!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias024", String = "Die Untoten vermuten eine der beiden Hälften in unserer Festung! Sie suchen einen Nekromant names Malicor!"},
			Answer{Tag = "urias024PC", String = "Und wo finde ich diesen Malicor?", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias025", String = "Irgendwo in den Düsterlanden! Er verließ die Feste, bevor die Angriffe begannen und ist nie zurückgekehrt! Keiner weiß, wo genau er steckt!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias026", String = "Aber selbst wenn Ihr Malicors Hälfte finden solltet, so bleibt Euch immer noch Korshar selbst! Er hat die zweite Hälfte! Sie befindet sich bereits in seinem Besitz!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 210} ,  QuestBegin{QuestId = 211} ,  QuestSolve{QuestId = 559},
				QuestBegin{QuestId = 215} , QuestBegin{QuestId = 216} ,
				QuestBegin{QuestId = 212} , QuestBegin{QuestId = 213} ,SetNpcFlagTrue{Name = "MaskAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias027", String = "Ich hoffe, Ihr habt Euch das gut überlegt! Diese Armee dort draußen dient nur einem Zweck - die Welt der Lebenden zu zerstören! Wollt Ihr wirklich dort hinaus?"},
			OfferAnswer{Tag = "urias027PC", String = "Ja! Öffnet das Tor!", AnswerId = 27},
			OfferAnswer{Tag = "urias30PC", String = "Nein! Ich muss erst meine Truppen vorbereiten!", AnswerId = 31},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias028", String = "Wohlan denn! Männer! Lasst diesen Runenkrieger passieren!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "urias029", String = "Der Weg ist frei! Das Tor wird sich für Euch öffnen!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q190OpenTheGate"}, 
			SetRewardFlagTrue{ Name = "Grenzkrieg1Festung"},
			Say{Tag = "urias030", String = "Viel Glück!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias005PC", String = "Ich suche Hokan Ashir!", AnswerId = 4},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"},
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias010PC", String = "Ich werde mit Hokan verhandeln!", AnswerId = 11},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"},
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias014PC", String = "Wie gelange ich nach Wisper?", AnswerId = 17},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias015PC", String = "Wie komme ich an die Maske des Belial?", AnswerId = 19},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "urias026PC", String = "Lasst das Tor öffnen, Urias! Ich werde nach Osten ziehen!", AnswerId = 26},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q190QuestionHokanOff"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionGhostOn"}),
			Negated(IsPlayerFlagTrue{Name = "Q190QuestionSiegeOn"}),
			Negated(UND(QuestState{QuestId = 210 , State = StateActive} , IsNpcFlagFalse{Name = "MaskAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "Q190QuestionOpenGateOn"} , IsGlobalFlagFalse{Name = "Q190OpenTheGate"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end