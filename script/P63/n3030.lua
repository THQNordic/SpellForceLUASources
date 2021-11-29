-->INFO: Sartarius
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 2,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "3030_IdleOff"},
	},
}

Respawn{WaitTime = 20 ,
Conditions = {QuestState{QuestId = 322 , State = StateUnknown}}
}
--Despawnen wenn Ende Reise 3
Despawn{
Conditions = {Negated(QuestState{QuestId = 322 , State = StateUnknown})}
}

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

--Reise 2
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
				},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}


--InfoFlags Reise 1 setzen
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 111 , State = StateUnknown},
			},
Actions = {
			SetNpcFlagTrue{Name = "QuestionBlackFist"},
			SetNpcFlagTrue{Name = "QuestionLiannon"},
			SetNpcFlagTrue{Name = "InfoOrder"},
			SetNpcFlagTrue{Name = "InfoDarius"}
			}
}
--InfoFlags Reise 2 wenn Belial bekannt
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 210, State = StateActive},
			},
Actions = {
			SetNpcFlagTrue{Name = "InfoBelial"}
			}
}
--InfoFlags Reise 3 wenn Ph�nix aktiv
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 265, State = StateActive},
			},
Actions = {
			SetNpcFlagTrue{Name = "InfoDesperateMulandir"},
			SetNpcFlagTrue{Name = "InfoPhoenix"}
			}
}
--OnToggleEvent
--{
--OnConditions = {
--			QuestState{QuestId = 444 , State = StateUnknown},
--			},
--OnActions = {
--			RemoveDialog{},
--			},
--OffConditions = {
--			QuestState{QuestId = 444 , State = StateActive},
--			},
--OffActions = {
--			EnableDialog{},
--			},
--}







--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n3030_Sartarius.txt


	

	OnBeginDialog{
		Conditions = {
			UND(Negated(QuestState{QuestId = 111 , State = StateSolved}) , Negated(QuestState{QuestId = 444 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 111 , State = StateSolved}) , Negated(QuestState{QuestId = 444 , State = StateUnknown}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSartariusToldAttack"}),
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "sartarius009", String = "Seid gegr��t, Freund!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "FlagSartariusToldAttack"},
		},
		Actions = {
			Say{Tag = "sartarius001", String = "Gute Arbeit, Freund! Nun, lasst uns �berlegen, was weiter zu tun ist!"},
			Answer{Tag = "sartarius001PC", String = "Jemand muss Rohen folgen und ihn warnen!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius002", String = "Aye! Und ich glaube, ich wei� auch schon, wer! Aber zeigt mir zun�chst die Schatulle, von der Ihr erz�hlt habt!"},
			Answer{Tag = "sartarius002PC", String = "Hier! Der dunkle Magier gab sie dem Boten! Sie enth�lt die Pl�ne f�r einen Angriff!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius003", String = "Lasst sehen... hmm... sie ist mit einem magischen Siegel verschlossen! Wenn Ihr das Losungswort nicht kennt, wird sie sich nicht �ffnen!"},
			Answer{Tag = "sartarius003PC", String = "Kann sie mit einem Zauber aufgebrochen werden?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius004", String = "Ja... Jedoch, dieses Siegel wurde von einem Zirkelmagier erstellt - und nur ein Zirkelmagier kann es brechen!"},
			Answer{Tag = "sartarius004PC", String = "Dann muss ich die Schatulle zu Rohen bringen!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius005", String = "Aye! Seht dies als Eure erste Aufgabe als K�mpfer des Ordens!"},
			Answer{Tag = "sartarius005PC", String = "Welchen Weg wird Rohen einschlagen?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius006", String = "Hm, er wird wohl zuerst Darius, den Kartographen, in Liannon aufsuchen! Darius hat schon lange von einer Bedrohung jenseits des Passes gesprochen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius007", String = "Dieses Schreiben wird Euch das Tor nach Liannon �ffnen! Und diese Rune hier mag Euch ebenfalls n�tzlich sein!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			QuestBegin{QuestId = 12} , QuestBegin{QuestId = 446} , QuestSolve{QuestId = 444}, 
				QuestSolve{QuestId = 441} , TransferItem{GiveItem = 3198 , Amount = 1 , Flag = Give} , 
				TransferItem{GiveItem = 776 , Amount = 1 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			SetNpcFlagTrue{Name = "FlagSartariusToldAttack"},
			Say{Tag = "sartarius008", String = "Fragt Darius nach Rohens Verbleib! Sucht Rohen und warnt ihn! Wenn der dunkle Magier ihn zuerst findet, dann m�gen die G�tter uns gn�dig sein!"},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius010", String = "Wir haben es bereits vernommen! Die Kunde von Rohens Tod liegt schwer auf diesem Tag! Es ist still geworden, in den Hallen des Ordens! Ein Schatten ist �ber das Land gefallen..."},
			Answer{Tag = "sartarius010PC", String = "Rohens letzte Worte ergeben f�r mich nur wenig Sinn! Hokan... ein merkw�rdiges Artefakt... dieses Buch hier... was hat er nur gemeint?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius011", String = "Ihr m�sst diesen Hinweisen nachgehen! Findet Hokan! Ergr�ndet, wie wir die Eisernen aufhalten k�nnen! Und sucht das Artefakt! Es ist vielleicht unsere letzte Hoffnung..."},
			Answer{Tag = "sartarius011PC", String = "Wo beginne ich meine Suche?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius012", String = "In den n�rdlichen Windwallbergen, im Lande des Hauses Hallit! Fragt dort nach Marcia! Sie ist die Botschafterin des Ordens in Brunnenfels, der Burg der Halliten!"},
			Answer{Tag = "sartarius012PC", String = "Wie kann sie mir helfen?", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius013", String = "Um Hokan zu finden, m�sst Ihr bis in das Herz des Todes - die D�sterlande! Ein �des, verw�stetes Land, das einst das Tor der K�nige genannt wurde! Dort befand sich Hokans Feste! Marcia kennt den Weg dorthin!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius014", String = "Hier, nehmt dieses Schreiben! Die Torfeste im S�den der Stadt f�hrt zu den Windwallbergen. Zeigt den hallitischen Wachen das Schreiben!"},
			Answer{Tag = "sartarius014PC", String = "Was werdet Ihr tun?", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius015", String = "Wir werden uns vorbereiten... auf den Krieg!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 122} , QuestBegin{QuestId = 123} , 
						QuestSolve{QuestId = 111}, QuestSolve{QuestId = 110} , 
						SetGlobalState{Name = "Plot" , State = "JourneyTwo"},
						TransferItem{GiveItem = 3199 , Amount = 1 , Flag = Give},
						SetNpcFlagTrue{Name = "InfoHokan"},
						SetNpcFlagTrue{Name = "InfoDarklands"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			IsNpcFlagTrue{Name = "InfoDarklands"},
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			IsNpcFlagTrue{Name = "InfoDarklands"},
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			IsNpcFlagTrue{Name = "InfoDarklands"},
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			IsNpcFlagTrue{Name = "InfoDarklands"},
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius016", String = "Die Schwarze Faust ist eine Bande von S�ldnern und Pl�nderern unter der F�hrung eines Kriegsveteranen namens Brannigan!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius017", String = "Bislang waren sie nur ein Bande von R�ubern! Ein �rgernis, nichts weiter!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius018", String = "Doch seit einigen Wochen gehen beunruhigende Berichte ein! Man erz�hlt von ganzen Heerscharen, die sich unter ihrem Banner sammeln! Ausgestattet mit besseren Waffen, st�rkeren R�stungen - und neuen Befehlshabern!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius019", String = "Irgend jemand unterst�tzt sie! Jemand mit viel Geld und Einfluss!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionBlackFist"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius020", String = "Die Gottsteine sind die gro�en Obelisken, die auf jeder Insel zu finden sind! Die Legende besagt, dass es die Blutstropfen Aonirs sind, die er vergoss, als er die Elemente niederrang!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius021", String = "Das Sternenblut des Gottes fiel auf Eo herab und bildete die kristallenen Obelisken! Damit wurde unsere Welt eins mit Aonir und seiner Macht! Andere wiederum behaupten, dass jemand sie gebaut haben muss, vielleicht die Former!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "InfoShapers"},
			Say{Tag = "sartarius022", String = "Fest steht, dass es diese Obelisken sind, die unsere Welt st�rken und uns vor dem Chaos der Elemente bewahrten! Nur dort, wo die Obelisken standen, wurde das Land vom W�ten der Konvokation verschont!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius023", String = "Wenn sich der Dunkle ihre Kr�fte wirklich f�r seine Zwecke zu Nutzen machen will, dann werden sie zu schwach sein, um uns noch zu sch�tzen! Dann werden die letzen Reste dieser Welt auch noch untergehen!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionGodstone"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius024", String = "Begebt Euch zum nord�stlichen Ende der Stadt! Dort findet Ihr ein Tor, das von Soldaten des Hauses Leonidar bewacht wird!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius025", String = "Gebt den Soldaten mein Schreiben, sie werden das Tor f�r Euch �ffnen! Dahinter findet Ihr das Portal nach Liannon!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "InfoPortals"} , SetNpcFlagFalse{Name = "QuestionLiannon"} , SetNpcFlagTrue{Name = "InfoLeonidar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius026", String = "Die Portale sind magische Verbindungen zwischen den Inseln! Sie sind der einzige Weg, um von Land zu Land zu reisen und die gewaltigen Entfernungen dazwischen zu �berwinden!"},
			Answer{Tag = "sartarius026PC", String = "Woher kommen sie?", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius027", String = "Rohen hat sie gefertigt! Wir wissen nicht viel �ber sie, nur dass er sechs Jahre fort war und sie in allen L�ndern errichtet hat!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius028", String = "Dabei machte er keinen Unterschied zwischen den V�lkern des Lichts und der Finsternis! Ebenso wenig wie zwischen V�lkern und Kreaturen! Sein Wunsch war es, dass diese Welt wieder eins werde! Deshalb ben�tigen wir die Torfesten!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "InfoPortals"} , SetNpcFlagTrue{Name = "InfoPortalKeep"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius029", String = "Leonidar ist eines der f�nf gro�en F�rstenh�user Nortanders! Es kontrollierte einst die gr�nen Lande n�rdlich von hier bis zur K�ste Fiaras!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius030", String = "Nun beherrschen sie nur noch die Insel Liannon und sind das kleinste der noch existierenden H�user!"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius031", String = "Die anderen H�user sind Utran, Hallit, Wulfgar - denen diese Stadt hier geh�rt - und Iskander, das allerdings ausgel�scht wurde!"},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "InfoLeonidar"} , SetNpcFlagTrue{Name = "InfoHouses"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius032", String = "Der Orden steht f�r den Neubeginn, den Aufbruch in eine neue Zeit! Rohen selbst hat ihn ins Leben gerufen, um ihm beim Ordnen der neuen Welt zu helfen!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius033", String = "Wir sind Besch�tzer, Lehrer und Baumeister! Unsere Aufgabe ist es, den neuen Reichen zu helfen! Selbst die dunklen V�lker erkennen uns an!"},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius034", String = "Doch es gibt viele in unserer Mitte, die nach mehr streben! Nach Ruhm... nach Macht! Doch Rohen wird die Geheimnisse seiner Magie nie preisgeben! Er hat erlebt, wozu sie imstande ist..."},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius035", String = "Dennoch keimen Zwist und Neid unter den Ordensbr�dern!"},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius036", String = "Ihr solltet Euch davon allerdings nicht beirren lassen! Konzentriert Ihr Euch nur auf Eure Aufgaben!"},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "InfoOrder"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			QuestState{QuestId = 111 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius009PC", String = "Ich bringe Euch schlechte Neuigkeiten...", AnswerId = 9},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			IsNpcFlagTrue{Name = "QuestionBlackFist"},
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius015PC", String = "Was ist die Schwarze Faust?", AnswerId = 17},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			IsNpcFlagTrue{Name = "QuestionGodstone"},
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius019PC", String = "Was sind die Gottsteine?", AnswerId = 23},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			IsNpcFlagTrue{Name = "QuestionLiannon"},
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius023PC", String = "Wie komme ich nach Liannon?", AnswerId = 29},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			IsNpcFlagTrue{Name = "InfoPortals"},
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius025PC", String = "Was sind das f�r Portale?", AnswerId = 33},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			IsNpcFlagTrue{Name = "InfoLeonidar"},
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius028PC", String = "Was ist das Haus Leonidar?", AnswerId = 38},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			IsNpcFlagTrue{Name = "InfoOrder"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius031PC", String = "Wof�r steht der Orden des Erwachens?", AnswerId = 43},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(QuestState{QuestId = 111 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "QuestionBlackFist"}),
			Negated(IsNpcFlagTrue{Name = "QuestionGodstone"}),
			Negated(IsNpcFlagTrue{Name = "QuestionLiannon"}),
			Negated(IsNpcFlagTrue{Name = "InfoPortals"}),
			Negated(IsNpcFlagTrue{Name = "InfoLeonidar"}),
			Negated(IsNpcFlagTrue{Name = "InfoOrder"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalState{Name = "Plot", State = "JourneyTwo" , Operator = IsEqual},
			IsNpcFlagTrue{Name = "InfoHokan"},
			IsNpcFlagTrue{Name = "InfoDarklands"},
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "sartarius037", String = "Willkommen zur�ck!"},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalState{Name = "Plot", State = "JourneyTwo" , Operator = IsEqual},
			IsNpcFlagTrue{Name = "InfoHokan"},
			IsNpcFlagTrue{Name = "InfoDarklands"},
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "sartarius037", String = "Willkommen zur�ck!"},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalState{Name = "Plot", State = "JourneyTwo" , Operator = IsEqual},
			IsNpcFlagTrue{Name = "InfoHokan"},
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "sartarius037", String = "Willkommen zur�ck!"},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalState{Name = "Plot", State = "JourneyTwo" , Operator = IsEqual},
			IsNpcFlagTrue{Name = "InfoHokan"},
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "sartarius037", String = "Willkommen zur�ck!"},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalState{Name = "Plot", State = "JourneyTwo" , Operator = IsEqual},
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			IsNpcFlagTrue{Name = "InfoDarklands"},
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "sartarius037", String = "Willkommen zur�ck!"},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalState{Name = "Plot", State = "JourneyTwo" , Operator = IsEqual},
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			IsNpcFlagTrue{Name = "InfoDarklands"},
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "sartarius037", String = "Willkommen zur�ck!"},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalState{Name = "Plot", State = "JourneyTwo" , Operator = IsEqual},
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "sartarius037", String = "Willkommen zur�ck!"},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalState{Name = "Plot", State = "JourneyTwo" , Operator = IsEqual},
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "sartarius037", String = "Willkommen zur�ck!"},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(IsGlobalState{Name = "Plot", State = "JourneyTwo" , Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius038", String = "Hokan war einer der Zirkelmagier! Er war der m�chtigste Nekromant, den Fiara je gesehen hat! Er kam hierher aus dem fernen Land Xu! Von dort brachte er viele d�stere Geheimnisse mit sich!"},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius039", String = "Im Krieg k�mpfte er mit seinen untoten Horden gegen Uram den Roten! Wir wissen nicht, was w�hrend der Konvokation mit ihm geschah. Wir dachten, er sei tot!"},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius040", String = "Fest steht allerdings, dass seine untoten Heerscharen von einst noch immer durch die D�sterlande streifen. Und wie es scheint, strecken sie mehr und mehr ihre knochigen Finger nach unserem Fleisch aus!"},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius041", String = "M�gen die G�tter den Krieg verfluchen - und alles was er hervorgebracht hat!"},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "InfoHokan"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			IsNpcFlagTrue{Name = "InfoDarklands"},
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{56;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			IsNpcFlagTrue{Name = "InfoDarklands"},
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
		}}

	OnAnswer{56;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{56;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
		}}

	OnAnswer{56;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			IsNpcFlagTrue{Name = "InfoDarklands"},
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{56;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			IsNpcFlagTrue{Name = "InfoDarklands"},
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
		}}

	OnAnswer{56;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{56;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius042", String = "Dort tobten einst die verheerendsten Schlachten des Konvokationskrieges!"},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius043", String = "Die K�mpfe zwischen Hokans untoten Horden und Urams D�monen wogten jahrelang hin und her!"},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius044", String = "Nun ist das Land �de und verbrannt! Die Armeen von einst hausen immer noch dort und machen es zu einem Ort des Todes!"},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius045", String = "Der Orden hat mehrmals versucht, die D�sterlande mit Grenzfesten abzuriegeln. Doch die meisten von ihnen wurden von den herrenlosen Armeen �berrannt!"},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "InfoDarklands"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			IsNpcFlagTrue{Name = "InfoDarklands"},
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{62;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			IsNpcFlagTrue{Name = "InfoDarklands"},
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
		}}

	OnAnswer{62;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{62;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
		}}

	OnAnswer{62;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			IsNpcFlagTrue{Name = "InfoDarklands"},
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{62;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			IsNpcFlagTrue{Name = "InfoDarklands"},
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
		}}

	OnAnswer{62;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{62;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius046", String = "Nun, diese Maske war einer seiner kostbarsten Sch�tze! Er brachte sie einst mit aus Xu! Aber niemand wei�, was sie bewirkt!"},
			Answer{Tag = "sartarius046PC", String = "K�nnen wir es wagen, ihm die Maske zu bringen?", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius047", String = "Fr�her h�tte ich eher mein Leben gegeben, als einem Nekromant des Zirkels auch nur einen Finger zu reichen! Doch die Bedrohung, die jenseits des Wildland Passes lauert, l�sst uns wohl keine andere Wahl!"},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius048", String = "Sucht diese Maske und bringt sie ihm! Wollen wir hoffen, dass es das wert ist und wir nicht noch weit gr��eres Unheil heraufbeschw�ren!"},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "InfoBelial"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			IsNpcFlagTrue{Name = "InfoDarklands"},
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{67;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			IsNpcFlagTrue{Name = "InfoDarklands"},
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
		}}

	OnAnswer{67;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{67;
		Conditions = {
			IsNpcFlagTrue{Name = "InfoHokan"},
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius037PC", String = "Wer ist Hokan Ashir?", AnswerId = 51},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			IsNpcFlagTrue{Name = "InfoDarklands"},
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			IsNpcFlagTrue{Name = "InfoDarklands"},
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius041PC", String = "Was sind die D�sterlande?", AnswerId = 57},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			IsNpcFlagTrue{Name = "InfoBelial"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius045PC", String = "Hokan verlangt die Maske des Belial!", AnswerId = 63},
		}}

	OnAnswer{67;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "InfoHokan"}),
			Negated(IsNpcFlagTrue{Name = "InfoDarklands"}),
			Negated(IsNpcFlagTrue{Name = "InfoBelial"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{68;
		Conditions = {
			QuestState{QuestId = 265 , State = StateActive},
		},
		Actions = {
			Say{Tag = "sartarius049", String = "Ich hoffe, Ihr kommt mir Eurer Suche nach dem Ph�nix voran..."},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(QuestState{QuestId = 265 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "sartarius063", String = "Aonirs Licht."},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{69;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{69;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{69;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{69;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
		}}

	OnAnswer{69;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{69;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{69;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{69;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
		}}

	OnAnswer{69;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{69;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{69;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{69;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
		}}

	OnAnswer{69;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{69;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{69;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{69;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius050", String = "Begebt Euch von Wisper aus weiter nach Norden! Dort werdet Ihr den Gottwall erreichen, eine hohes Gebirge, das Ihr erklimmen m�sst!"},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius051", String = "Wenn Ihr Euch auf seiner Spitze weiter in Richtung Norden haltet, erreicht Ihr Mulandir!"},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "BeenToMulandir"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{73;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{73;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{73;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
		}}

	OnAnswer{73;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{73;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{73;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{73;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
		}}

	OnAnswer{73;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{73;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{73;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{73;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
		}}

	OnAnswer{73;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{73;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{73;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{73;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius052", String = "Einst war Mulandir die Stadt der Zauberer. Ein wundervoller Ort des Wissens, von den gr��ten Baumeistern Fiaras gefertigt aus wei�em Marmor!"},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius053", String = "Mulandir wachte �ber das Tal der Asche - ein Ort, an dem das B�se schlief und von wo aus immer wieder D�monen aus dem Erdreich empor krochen. Die ganze Stadt war durchzogen von majest�tischen T�rmen und prunkvollen Bauten!"},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius054", String = "Dar�ber hinaus war Mulandir der Sitz des Zirkels! Von dort aus spann er seine F�den, an denen die K�nige der Welt wie Marionetten tanzten! Und in den Archiven der Stadt h�uften sich Sch�tze und magische Artefakte aus allen L�ndern!"},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius055", String = "Als der Zirkel zerfiel und der Krieg begann, begann auch der Streit um Mulandir! Uram der Rote war der letzte, der die Stadt kontrollierte, bevor die Konvokation ausbrach!"},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "InfoMulandir"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{79;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{79;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{79;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
		}}

	OnAnswer{79;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{79;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{79;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{79;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius056", String = "Eure Suche wird nicht einfach werden! Die Archive des Zirkels lagen im Zentrum von Mulandir! Heute m�sste dieser ehemalige Stadtkern im Norden der Insel zu finden sein!"},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius057", String = "Ich bezweifle aber, dass sich der Ph�nixstein noch dort befindet! Nach dem Krieg wurde Mulandir von Pl�nderern aller Art heimgesucht!"},
			Answer{Tag = "sartarius057PC", String = "Dann ist der Stein vielleicht gar nicht mehr in Mulandir?", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius058", String = "Vielleicht nicht. Dennoch ist es der Ort, an dem Ihr Eure Suche beginnen solltet! Wenn es irgendwo Hinweise auf den Verbleib des Ph�nix gibt, dann dort!"},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "InfoDesperateMulandir"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius059", String = "Ich habe die Bibliothek des Ordens nach Hinweisen durchsucht und bin f�ndig geworden!"},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius060", String = "Der Ph�nix ist ein uraltes Wesen! Ein Gesch�pf aus dem Allfeuer, das schon in den Str�men der Magie gelebt hat, als selbst die Drachen noch jung waren!"},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius061", String = "Der Zirkel lockte es an und bannte es in einen schwarzen Stein! Dort schlummert der Ph�nix seither! Und mit ihm die unb�ndige Kraft des Allfeuers!"},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sartarius062", String = "Seine Macht ist die einzige, die selbst die eines Zirkelmagiers noch �bertrifft! Richtig eingesetzt, k�nnte der Ph�nixstein unsere Rettung bedeuten!"},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "InfoPhoenix"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 90},
		}}

	OnAnswer{90;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{90;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{90;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{90;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
		}}

	OnAnswer{90;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{90;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{90;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{90;
		Conditions = {
			IsGlobalFlagFalse{Name = "BeenToMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius049PC", String = "Wie komme ich nach Mulandir?", AnswerId = 70},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			IsNpcFlagTrue{Name = "InfoMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius051PC", String = "Was ist Mulandir f�r ein Ort?", AnswerId = 74},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			IsNpcFlagTrue{Name = "InfoDesperateMulandir"},
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius055PC", String = "Wie soll ich in Mulandir den Ph�nix finden?", AnswerId = 80},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			IsNpcFlagTrue{Name = "InfoPhoenix"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sartarius058PC", String = "Was ist der Ph�nixstein?", AnswerId = 85},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "BeenToMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoDesperateMulandir"}),
			Negated(IsNpcFlagTrue{Name = "InfoPhoenix"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end