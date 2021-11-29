-->INFO: Elwen
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = South}
--!EDS ONIDLEGOHOME END

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
--Splitterqueste aktiv?
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 307 , State = StateActive}
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
-- Source: C:\project\main\mission\dialoge\p21\n2799_Elwen.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagElwenKnown"},
		},
		Actions = {
			Say{Tag = "elwen001", String = "Elen sei dank! Endlich frei! Nicht mehr lange und die Söldner hätten uns hingerichtet!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagElwenKnown"}),
			UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 307 , State = StateActive},
		},
		Actions = {
			Say{Tag = "elwen003", String = "Elens Segen, Freund!"},
			OfferAnswer{Tag = "elwen003PC", String = "Wie kommt Ihr hierher?", AnswerId = 2},
			OfferAnswer{Tag = "elwen006PC", String = "Seid Ihr im Besitz des Splitters des Herbstlichts?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagElwenKnown"}),
			UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 307 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "elwen003", String = "Elens Segen, Freund!"},
			OfferAnswer{Tag = "elwen003PC", String = "Wie kommt Ihr hierher?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagElwenKnown"}),
			Negated(UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"})),
			QuestState{QuestId = 307 , State = StateActive},
		},
		Actions = {
			Say{Tag = "elwen003", String = "Elens Segen, Freund!"},
			OfferAnswer{Tag = "elwen006PC", String = "Seid Ihr im Besitz des Splitters des Herbstlichts?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagElwenKnown"}),
			Negated(UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"})),
			Negated(QuestState{QuestId = 307 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "elwen003", String = "Elens Segen, Freund!"},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 307 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagElwenKnown"},
			Say{Tag = "elwen002", String = "Was allerdings immer noch angenehmer gewesen wäre, als noch länger in der Gesellschaft dieses Zwerges verweilen zu müssen!"},
			OfferAnswer{Tag = "elwen003PC", String = "Wie kommt Ihr hierher?", AnswerId = 2},
			OfferAnswer{Tag = "elwen006PC", String = "Seid Ihr im Besitz des Splitters des Herbstlichts?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 307 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagElwenKnown"},
			Say{Tag = "elwen002", String = "Was allerdings immer noch angenehmer gewesen wäre, als noch länger in der Gesellschaft dieses Zwerges verweilen zu müssen!"},
			OfferAnswer{Tag = "elwen003PC", String = "Wie kommt Ihr hierher?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"})),
			QuestState{QuestId = 307 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagElwenKnown"},
			Say{Tag = "elwen002", String = "Was allerdings immer noch angenehmer gewesen wäre, als noch länger in der Gesellschaft dieses Zwerges verweilen zu müssen!"},
			OfferAnswer{Tag = "elwen006PC", String = "Seid Ihr im Besitz des Splitters des Herbstlichts?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"})),
			Negated(QuestState{QuestId = 307 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagElwenKnown"},
			Say{Tag = "elwen002", String = "Was allerdings immer noch angenehmer gewesen wäre, als noch länger in der Gesellschaft dieses Zwerges verweilen zu müssen!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elwen004", String = "Ich war auf einem Botengang nach Süden, als diese Söldner mich aufgriffen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elwen005", String = "Seitdem bin ich neben diesem widerwärtigen Zwerg angekettet und muss mir sein Gemurre und Gejammer anhören!"},
			Answer{Tag = "elwen005PC", String = "Was war das für ein Botengang?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elwen006", String = "Das ist nicht für Eure Ohren bestimmt! Tut mir leid!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "InfoAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 307 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elwen003PC", String = "Wie kommt Ihr hierher?", AnswerId = 2},
			OfferAnswer{Tag = "elwen006PC", String = "Seid Ihr im Besitz des Splitters des Herbstlichts?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 307 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elwen003PC", String = "Wie kommt Ihr hierher?", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"})),
			QuestState{QuestId = 307 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elwen006PC", String = "Seid Ihr im Besitz des Splitters des Herbstlichts?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"})),
			Negated(QuestState{QuestId = 307 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elwen007", String = "Woher wisst Ihr davon?"},
			Answer{Tag = "elwen007PC", String = "Jon Farlorn sagte mir, Ihr hattet den Splitter bei Euch, als Ihr gefangen genommen wurdet!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elwen008", String = "Das stimmt. Doch ich konnte ihn verstecken, bevor die Söldner mich aufgriffen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elwen009", String = "Es gibt eine runde Baumgruppe, etwas südlich des Handelspostens! Unter dem großen Felsen in der Mitte liegt der Splitter verborgen!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elwen010", String = "Ein Wachzauber schützt ihn! Also seht Euch vor!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 334} , QuestSolve{QuestId = 307} , TransferXP{XP = 500 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 307 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elwen003PC", String = "Wie kommt Ihr hierher?", AnswerId = 2},
			OfferAnswer{Tag = "elwen006PC", String = "Seid Ihr im Besitz des Splitters des Herbstlichts?", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 307 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elwen003PC", String = "Wie kommt Ihr hierher?", AnswerId = 2},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"})),
			QuestState{QuestId = 307 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "elwen006PC", String = "Seid Ihr im Besitz des Splitters des Herbstlichts?", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 307 , State = StateUnknown} , IsNpcFlagFalse{Name = "InfoAsked"})),
			Negated(QuestState{QuestId = 307 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end