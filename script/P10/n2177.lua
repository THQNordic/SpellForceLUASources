-->INFO: Skarvig
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END



--!EDS RESPAWN BEGIN
Respawn{WaitTime=30}
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
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}

-- Ok und Goto Skeld
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"},
			Negated(QuestState{QuestId = 472, State = StateUnknown})
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
-- Source: C:\project\main\mission\dialoge\p10\n2177_Skarvig.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagSkarvigKnown"},
		},
		Actions = {
			Say{Tag = "skarvig001", String = "Ein Mensch? Was treibt Euch hierher? Euresgleichen ist bei meinen Brüdern nicht eben gerne gesehen!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSkarvigKnown"}),
		},
		Actions = {
			Say{Tag = "skarvig003", String = "Niethalfs Stärke mit Euch, Mensch!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSkarvigKnown"},
			Say{Tag = "skarvig002", String = "Man nennt mich Skarvig! Ich bin einer der Schmiede hier! Ich habe Euch Menschen eigentlich immer gemocht, bis dieser Lordling kam..."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			QuestState{QuestId = 139 , State = StateActive},
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			QuestState{QuestId = 139 , State = StateActive},
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			QuestState{QuestId = 139 , State = StateActive},
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			QuestState{QuestId = 139 , State = StateActive},
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			QuestState{QuestId = 139 , State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			QuestState{QuestId = 139 , State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			QuestState{QuestId = 139 , State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			QuestState{QuestId = 139 , State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"},
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig003PC", String = "Ich brauche jemanden, der für mich bürgt, Meister Skarvig!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			QuestState{QuestId = 139 , State = StateActive},
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			QuestState{QuestId = 139 , State = StateActive},
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			QuestState{QuestId = 139 , State = StateActive},
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			QuestState{QuestId = 139 , State = StateActive},
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			QuestState{QuestId = 139 , State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			QuestState{QuestId = 139 , State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			QuestState{QuestId = 139 , State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			QuestState{QuestId = 139 , State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig006PC", String = "Ich muss ins Grauschattental!", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"}),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig009PC", String = "Warum hat sich Euer Volk von den Menschen abgewandt?", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			IsPlayerFlagTrue{Name = "Q124QuestionHerger"},
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig012PC", String = "Was hat es mit dieser Blutsbrüderschaft auf sich?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig016PC", String = "Was ist die Kaltmark?", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"}))),
			Negated(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"}),
			Negated(QuestState{QuestId = 139 , State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 138 , State = StateSolved}) , IsNpcFlagFalse{Name = "HumansAsked"})),
			Negated(IsPlayerFlagTrue{Name = "Q124QuestionHerger"}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q139ColdmarkInfoGiven"},
					QuestState{QuestId = 139 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			QuestState{QuestId = 169 , State = StateActive},
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			QuestState{QuestId = 169 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			QuestState{QuestId = 169 , State = StateActive},
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			QuestState{QuestId = 169 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			QuestState{QuestId = 169 , State = StateActive},
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			QuestState{QuestId = 169 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			QuestState{QuestId = 169 , State = StateActive},
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			QuestState{QuestId = 169 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			QuestState{QuestId = 403 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig020PC", String = "Ich benötige ein Gefäß aus Adamantinum!", AnswerId = 26},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			QuestState{QuestId = 169 , State = StateActive},
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			QuestState{QuestId = 169 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			QuestState{QuestId = 169 , State = StateActive},
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			QuestState{QuestId = 169 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive}),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig022PC", String = "Ich bringe Euch den Splitter für das Gefäß!", AnswerId = 30},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			QuestState{QuestId = 169 , State = StateActive},
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			QuestState{QuestId = 169 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown}),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig024PC", String = "Fertigt Ihr auch Waffen?", AnswerId = 34},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			QuestState{QuestId = 169 , State = StateActive},
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			QuestState{QuestId = 169 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig029PC", String = "Was sagt Ihr zu dieser Klinge?", AnswerId = 41},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			PlayerHasItem{ItemId = 2536},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skarvig032PC", String = "Dieses seltsame Silber stammt aus der Kaltmark!", AnswerId = 46},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(ODER(IsGlobalFlagFalse{Name = "Q124SkarvigOKGiven"} , ODER(QuestState{QuestId = 472 , State = StateUnknown} , ODER(IsNpcFlagFalse{Name = "HumansAsked"} , IsNpcFlagFalse{Name = "BrotherAsked"})))),
			Negated(QuestState{QuestId = 403 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2544} ,
						  QuestState{QuestId = 404 , State = StateActive})),
			Negated(UND(IsNpcFlagFalse{Name = "Earthbladeasked"} , QuestState{QuestId = 166 , State = StateUnknown})),
			Negated(QuestState{QuestId = 169 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2536}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig004", String = "So? Denkt Ihr etwa, ich hege keinen Groll gegen Euer Blut? Lordling Joshuas Feigheit entfacht in mir den gleichen Zorn, wie bei meinen Brüdern!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig005", String = "Aber Streit führt uns nur in den Untergang! Wenn Ihr den Bund neu schmieden wollt, um der Gefahr aus dem Osten zu begegnen, dann soll es nicht am Starrsinn unseres Volkes scheitern!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig006", String = "Ihr macht einen anständigen Eindruck! Ihr seid kein Schwächling wie dieser Joshua - in Euren Augen brennt Feuer! Also gut, ich werde für Euch bürgen! Enttäuscht mich nicht, Mensch!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q124SkarvigOKGiven"},
					SetRewardFlagTrue{ Name = "InsGrauschattental1"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig007", String = "Ihr könnt unser Land durchreisen, wie es Euch beliebt, Mensch. Der Osten jedoch, dort wo es ins Tal der grauen Schatten geht, ist mit einem Tor verschlossen!"},
			Answer{Tag = "skarvig007PC", String = "Wofür dient das Tor?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig008", String = "Es soll uns vor dem schützen, was dahinter lauert! Jenseits des Tores beginnt die Kaltmark! Ein Land so grausam wie der Eiswind über den Bergen!"},
			Answer{Tag = "skarvig008PC", String = "Wenn dies der einzige Weg ins Grauschattental ist, dann werde ich ihn gehen!", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig009", String = "Der Wächter am Tor in die Kaltmark hört nur auf den Befehl unseres Thanen Skeld! Ihr werdet seine Erlaubnis benötigen, um weiter nach Osten vordringen zu können!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 139} , QuestBegin{QuestId = 472},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig010", String = "Joshua, der Lordsohn der Halliten, hat sich mit Schande bedeckt!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig011", String = "Er hat Herger, seinen Bruder im Blute, im Kampf verraten! Er floh, während Herger zurückblieb, dem Tod geweiht!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig012", String = "Fragt unseren Thanen Skeld! Es war sein Entschluss, den Bund mit den Menschen zu beenden! Denn Herger war sein Sohn!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q124QuestionHerger"} , SetNpcFlagTrue{Name = "HumansAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig013", String = "Seit Jahrhunderten leben die Zwerge und Menschen der Windwallberge in einem Bündnis!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig014", String = "Nach dem Krieg der sechs Völker begann die Bruderschaft des Blutes! Seit dieser Zeit verbinden die ältesten Söhne der Fürsten ihr Blut miteinander, um den Bund zu besiegeln!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig015", String = "Dies ist Tradition seit Generationen! Auch unser Thane Skeld und der Lord der Halliten Jonir wurden so einst zu Brüdern! Vor wenigen Monden nun schlossen Herger und Joshua den Bund!"},
			Answer{Tag = "skarvig015PC", String = "Gibt es nichts, was das Bündnis wieder herzustellen vermag?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig016", String = "Das kann nur unser Thane Skeld entscheiden!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagFalse{Name = "Q124QuestionHerger"} , SetNpcFlagTrue{Name = "BrotherAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig017", String = "Die Kaltmark ist ein verfluchtes Land! Vor vielen Jahren zerstritt sich Skeld mit seinem Bruder Argard! Die beiden Brüder teilten das Land untereinander auf! Argard aber beschwor einen Pakt mit einem uralten Bösen, um seinen Bruder zu vernichten!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig018", String = "Daraufhin verschloss Skeld Argards Land mit einem Tor! Er schloss ihn ein mit seinem Verbündeten aus der Unterwelt! Nächtelang hörte man die Schreie von jenseits des Tores!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig019", String = "Jetzt ist dieses Land jeglichen Lebens beraubt! Nur noch widerwärtige Kreaturen kriechen dort umher!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig020", String = "Hoffen wir, dass das Böse, das Argard rief, seinen Hunger gestillt hat und niemals wiederkehrt!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig021", String = "Das kann ich wohl herstellen. Allerdings brauche ich dafür einen Adamantinumsplitter!"},
			Answer{Tag = "skarvig021PC", String = "Wo kann ich so etwas finden?", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig022", String = "Geht nach Schwertfels! Dort gibt es Adamantinum in rauen Mengen!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 403},
							QuestBegin{QuestId = 404},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig023", String = "Ah, ein Splitter aus Adamantinum! Vom Schwertfels, nehme ich an? Gebt her!"},
			Answer{Tag = "skarvig023PC", String = "Hier, nehmt!", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig024", String = "Ein schönes Stück! Bestens geeignet, um es zu bearbeiten! Wartet... hier habt Ihr Euer Gefäß!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 404},
				   QuestBegin{QuestId = 405},
				   TransferItem{TakeItem = 2544 , GiveItem = 3167 , Flag = Exchange},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig025", String = "Ich habe keine wirklich gute Waffe mehr geschmiedet, seit die Minen auf dem Schwertfels zerstört wurden!"},
			Answer{Tag = "skarvig025PC", String = "Auf dem Schwertfels?", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig026", String = "Eine Insel, südwestlich von hier! Dort gruben wir das seltene Adamantinum aus der Erde und die Diener der Tiefe, die dort leben, empfingen uns als Brüder!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig027", String = "Aber der Zirkel befahl uns, immer mehr Waffen zu schmieden... und eines Tages traf uns der Zorn unseres Gottes! Die Minen wurden zerstört! Und die mächtigen Klingen der Macht sind seitdem nur noch Legende!"},
			Answer{Tag = "skarvig027PC", String = "Könntet Ihr mir eine Klinge der Macht fertigen?", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig028", String = "Das könnte ich wohl! Was glaubt Ihr, wen Ihr vor Euch habt?! Aber um ein solches Werk zu beginnen, benötige ich eine Grundform... eine Erdenklinge! Ein Gegenstand, wie er nur auf dem Schwertfels zu finden ist!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig029", String = "Die Diener der Tiefe schmiedeten sie in den Tagen, als noch ein Bund zwischen uns bestand! Nur auf dem Schwertfels werdet Ihr fündig werden!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Earthbladeasked"} , QuestBegin{QuestId = 166}, QuestBegin{QuestId = 482},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig030", String = "Niethalfs Bart, eine Erdenklinge!"},
			Answer{Tag = "skarvig030PC", String = "Kann man sie verwenden?", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig031", String = "Ihr benötigt einen Griff, der sie halten kann! Ich kann Euch einen anfertigen, wenn ich das richtige Material bekomme!"},
			Answer{Tag = "skarvig031PC", String = "Was benötigt Ihr?", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig032", String = "Rotes Adamantinum ist das einzige Metall, das sich mit dem der Erdenklinge verbinden lässt! Geht zu Meister Urak! Ihr findet ihn bei den Minen! Er wird Euch dabei helfen, es herzustellen!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 169} , QuestBegin{QuestId = 170},
					SetRewardFlagTrue{ Name = "Erdenklinge2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig033", String = "Gefrorenes Silber... Gefroren mit der Angst eines Sterbenden... Sehr selten!"},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig034", String = "Ich kann Euch etwas daraus fertigen! Oder Ihr könnt es bei Urak, dem Meister der Minen, gegen Münzen tauschen, wenn Ihr wollt!"},
			OfferAnswer{Tag = "skarvig034PC", String = "Fertigt mir etwas daraus!", AnswerId = 48},
			OfferAnswer{Tag = "skarvig039PC", String = "Ich werde es bei Urak eintauschen! Danke!", AnswerId = 53},
		}}

	OnAnswer{48;
		Conditions = {
			PlayerHasItem{ItemId = 2536 ,  Amount = 4},
		},
		Actions = {
			Say{Tag = "skarvig035", String = "Wie Ihr wünscht! Aus vier solcher Stücke kann ich einen Helm fertigen!"},
			Answer{Tag = "skarvig035PC", String = "Hier habt Ihr vier Teile!", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2536 ,  Amount = 4}),
		},
		Actions = {
			Say{Tag = "skarvig038", String = "Wie Ihr wünscht! Aus vier solcher Stücke kann ich einen Helm fertigen!"},
			Answer{Tag = "skarvig038PC", String = "Ich fürchte, ich habe keine vier Teile!", AnswerId = 52},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig036", String = "Wartet einen Moment!"},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig037", String = "Dieser Helm wird Euren Geist vor Beeinflussung schützen! Hier, er gehört Euch!"},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2536 , Amount = 4 , Flag = Take}, TransferItem{GiveItem = 2537 , Amount = 1 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skarvig039", String = "Dann hebt diese auf! Vielleicht findet Ihr noch mehr! Dann könnt Ihr zu mir zurückkehren!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}


	EndDefinition()
end