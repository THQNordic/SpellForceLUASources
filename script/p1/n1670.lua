-->INFO: Northwatch2
-->INFO: "Fackel Aus" Guard am Nordausgang
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
			IsNpcFlagTrue{Name = "HasMainquest" , UpdateInterval = 20},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			IsNpcFlagFalse{Name = "HasMainquest" , UpdateInterval = 20},
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
-- Hole Schlüssel aktiv
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 91, State = StateActive}
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END

AddGotoLocation{X = 164, Y = 119, Radius = 1}
AddGotoLocation{X = 168, Y = 119, Radius = 1}
AddGotoLocation{X = 169, Y = 135, Radius = 1}
AddGotoLocation{X = 172, Y = 138, Radius = 1}
AddGotoLocation{X = 166, Y = 144, Radius = 1}
AddGotoLocation{X = 163, Y = 141, Radius = 1}


OnIdleDoTorchJob
{
	Name = "NordAusgang", X = _X, Y = _Y, Direction = 6,
	TurnOff = TRUE , WaitForIdle = TRUE , UpdateInterval = 60
}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n1670_Northwatch2.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGate"},
			QuestState{QuestId = 91 , State = StateActive},
		},
		Actions = {
			Say{Tag = "northwatch001", String = "Wohin des Wegs, Bürger?"},
			OfferAnswer{Tag = "northwatch001PC", String = "Was liegt im Norden hinter diesem Tor?", AnswerId = 1},
			OfferAnswer{Tag = "northwatch003PC", String = "Ich benötige den Schlüssel zum Felstor!", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGate"},
			Negated(QuestState{QuestId = 91 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "northwatch001", String = "Wohin des Wegs, Bürger?"},
			OfferAnswer{Tag = "northwatch001PC", String = "Was liegt im Norden hinter diesem Tor?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGate"}),
			QuestState{QuestId = 91 , State = StateActive},
		},
		Actions = {
			Say{Tag = "northwatch001", String = "Wohin des Wegs, Bürger?"},
			OfferAnswer{Tag = "northwatch003PC", String = "Ich benötige den Schlüssel zum Felstor!", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGate"}),
			Negated(QuestState{QuestId = 91 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "northwatch001", String = "Wohin des Wegs, Bürger?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "northwatch002", String = "Dort oben haust Burgle mit seinen Goblins! Einer von Brannigans Unterführern, der sich dort verschanzt hat!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "northwatch003", String = "Auf seine Bekanntschaft legt Ihr keinen Wert, glaubt mir!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionGate"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGate"},
			QuestState{QuestId = 91 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "northwatch001PC", String = "Was liegt im Norden hinter diesem Tor?", AnswerId = 1},
			OfferAnswer{Tag = "northwatch003PC", String = "Ich benötige den Schlüssel zum Felstor!", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGate"},
			Negated(QuestState{QuestId = 91 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "northwatch001PC", String = "Was liegt im Norden hinter diesem Tor?", AnswerId = 1},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGate"}),
			QuestState{QuestId = 91 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "northwatch003PC", String = "Ich benötige den Schlüssel zum Felstor!", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGate"}),
			Negated(QuestState{QuestId = 91 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "northwatch004", String = "Mit wessen Erlaubnis?"},
			Answer{Tag = "northwatch004PC", String = "Shan Muir, die Heilerin, schickt mich! Es ist wichtig!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "northwatch005", String = "Nun gut, wie Ihr wollt! Seid vorsichtig, ich habe Euch gewarnt!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 92}, QuestSolve{QuestId = 91} , TransferItem{GiveItem = 3184 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGate"},
			QuestState{QuestId = 91 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "northwatch001PC", String = "Was liegt im Norden hinter diesem Tor?", AnswerId = 1},
			OfferAnswer{Tag = "northwatch003PC", String = "Ich benötige den Schlüssel zum Felstor!", AnswerId = 5},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGate"},
			Negated(QuestState{QuestId = 91 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "northwatch001PC", String = "Was liegt im Norden hinter diesem Tor?", AnswerId = 1},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGate"}),
			QuestState{QuestId = 91 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "northwatch003PC", String = "Ich benötige den Schlüssel zum Felstor!", AnswerId = 5},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGate"}),
			Negated(QuestState{QuestId = 91 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end