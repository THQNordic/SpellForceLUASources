-->INFO: margay
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END

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



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p17\n2617_margay.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagMargayKnown"},
		},
		Actions = {
			Say{Tag = "margay001", String = "Haltet Euch nicht mit uns auf! Ihr müsst bis zum höchsten Punkt des Walles! Dort sind ihre Anführer! Sie haben meinen Vintus! Schnell!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagMargayKnown"}),
			QuestState{QuestId = 251, State = StateUnknown},
			UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
		},
		Actions = {
			Say{Tag = "margay002", String = "Ihr?"},
			OfferAnswer{Tag = "margay002PC", String = "Wer ist Vintus?", AnswerId = 2},
			OfferAnswer{Tag = "margay005PC", String = "Was wisst Ihr über diesen Splitter?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagMargayKnown"}),
			QuestState{QuestId = 251, State = StateUnknown},
			Negated(UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
		},
		Actions = {
			Say{Tag = "margay002", String = "Ihr?"},
			OfferAnswer{Tag = "margay002PC", String = "Wer ist Vintus?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagMargayKnown"}),
			Negated(QuestState{QuestId = 251, State = StateUnknown}),
			UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
		},
		Actions = {
			Say{Tag = "margay002", String = "Ihr?"},
			OfferAnswer{Tag = "margay005PC", String = "Was wisst Ihr über diesen Splitter?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagMargayKnown"}),
			Negated(QuestState{QuestId = 251, State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
		},
		Actions = {
			Say{Tag = "margay002", String = "Ihr?"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 251, State = StateUnknown},
			UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagMargayKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "margay002PC", String = "Wer ist Vintus?", AnswerId = 2},
			OfferAnswer{Tag = "margay005PC", String = "Was wisst Ihr über diesen Splitter?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 251, State = StateUnknown},
			Negated(UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagMargayKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "margay002PC", String = "Wer ist Vintus?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 251, State = StateUnknown}),
			UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagMargayKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "margay005PC", String = "Was wisst Ihr über diesen Splitter?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 251, State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagMargayKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "margay003", String = "Mein armer Mann! Er ist unser Schreiber! Dieser Zauberer, dieser Mechlan, glaubt, dass er etwas über den Splitter weiß!"},
			Answer{Tag = "margay003PC", String = "Den Splitter?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "margay004", String = "Ein Bruchstück eines magischen Gegenstandes! Mechlan sucht ihn! Sie haben meinen Vintus verschleppt und foltern ihn vielleicht wegen diesem Ding..."},
			Answer{Tag = "margay004PC", String = "Und der Anführer der Söldner ist auch dort oben?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "margay005", String = "Ja! Sein Name ist Kiar! Ihr seid ein Krieger! Bitte, rettet meinen Mann! Ich versuche, hier etwas Widerstand zu organisieren! Aber wir sind nur einfache Bauern, müsst Ihr wissen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 251} , TransferXP{XP = 300 , Flag = Give},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 251, State = StateUnknown},
			UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "margay002PC", String = "Wer ist Vintus?", AnswerId = 2},
			OfferAnswer{Tag = "margay005PC", String = "Was wisst Ihr über diesen Splitter?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 251, State = StateUnknown},
			Negated(UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "margay002PC", String = "Wer ist Vintus?", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 251, State = StateUnknown}),
			UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "margay005PC", String = "Was wisst Ihr über diesen Splitter?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 251, State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "margay006", String = "Vintus hat oft davon gesprochen! Aber ich habe nie viel darauf gegeben! Irgendwer muss sich ja um die Feldarbeit kümmern, während er über seinen Büchern sitzt!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "margay007", String = "Es heißt, Thorgin, der Gründer unserer Siedlung, brachte einst aus Mulandir einen wundervollen Splitter aus Glas mit. Er hütete ihn wie einen Schatz!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "margay008", String = "Nach seinem Tod galt der Splitter als verschollen. Doch dieser wahnsinnige Mechlan glaubt jetzt, dass wir ihn verstecken!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ShardAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 251, State = StateUnknown},
			UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "margay002PC", String = "Wer ist Vintus?", AnswerId = 2},
			OfferAnswer{Tag = "margay005PC", String = "Was wisst Ihr über diesen Splitter?", AnswerId = 7},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 251, State = StateUnknown},
			Negated(UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "margay002PC", String = "Wer ist Vintus?", AnswerId = 2},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 251, State = StateUnknown}),
			UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "margay005PC", String = "Was wisst Ihr über diesen Splitter?", AnswerId = 7},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 251, State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 251 , State = StateActive} , IsNpcFlagFalse{Name = "ShardAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end