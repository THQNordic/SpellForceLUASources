-->INFO: Markwart
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

--SpawnOnlyWhen
--{
--Conditions = 	{
--		Negated(IsGlobalState{Name = "Plot" , State = "JourneyOne" , Operator = IsEqual})
--		}
--}

--!EDS RESPAWN BEGIN
Respawn{WaitTime=10}
--!EDS RESPAWN END

--Dialogsteuerung

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
-- Source: C:\project\main\mission\dialoge\p6\n1987_Markwart.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagMarkwartKnown"},
		},
		Actions = {
			Say{Tag = "markwart001", String = "Ah, Ihr müsst der Runenkrieger des Ordens sein! Man redet viel von Euch! Schätze, wir alle schulden Euch großen Dank!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMarkwartKnown"}),
			QuestState{QuestId = 107 , State = StateUnknown},
			QuestState{QuestId = 109 , State =  StateActive},
		},
		Actions = {
			Say{Tag = "markwart003", String = "Tretet näher, Freund!"},
			OfferAnswer{Tag = "markwart003PC", String = "Lebt Ihr schon lange hier?", AnswerId = 2},
			OfferAnswer{Tag = "markwart008PC", String = "Gehörte dieses Kleid Eurer Tochter?", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMarkwartKnown"}),
			QuestState{QuestId = 107 , State = StateUnknown},
			Negated(QuestState{QuestId = 109 , State =  StateActive}),
		},
		Actions = {
			Say{Tag = "markwart003", String = "Tretet näher, Freund!"},
			OfferAnswer{Tag = "markwart003PC", String = "Lebt Ihr schon lange hier?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMarkwartKnown"}),
			Negated(QuestState{QuestId = 107 , State = StateUnknown}),
			QuestState{QuestId = 109 , State =  StateActive},
		},
		Actions = {
			Say{Tag = "markwart003", String = "Tretet näher, Freund!"},
			OfferAnswer{Tag = "markwart008PC", String = "Gehörte dieses Kleid Eurer Tochter?", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMarkwartKnown"}),
			Negated(QuestState{QuestId = 107 , State = StateUnknown}),
			Negated(QuestState{QuestId = 109 , State =  StateActive}),
		},
		Actions = {
			Say{Tag = "markwart003", String = "Tretet näher, Freund!"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 107 , State = StateUnknown},
			QuestState{QuestId = 109 , State =  StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMarkwartKnown"},
			Say{Tag = "markwart002", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "markwart003PC", String = "Lebt Ihr schon lange hier?", AnswerId = 2},
			OfferAnswer{Tag = "markwart008PC", String = "Gehörte dieses Kleid Eurer Tochter?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 107 , State = StateUnknown},
			Negated(QuestState{QuestId = 109 , State =  StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMarkwartKnown"},
			Say{Tag = "markwart002", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "markwart003PC", String = "Lebt Ihr schon lange hier?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 107 , State = StateUnknown}),
			QuestState{QuestId = 109 , State =  StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMarkwartKnown"},
			Say{Tag = "markwart002", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "markwart008PC", String = "Gehörte dieses Kleid Eurer Tochter?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 107 , State = StateUnknown}),
			Negated(QuestState{QuestId = 109 , State =  StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMarkwartKnown"},
			Say{Tag = "markwart002", String = "Was kann ich für Euch tun?"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "markwart004", String = "Solange ich denken kann! Und hier werde ich auch bleiben, bis ans Ende meiner Tage!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "markwart005", String = "Nachdem der Spinnenmeister meine Tochter geholt hat, steht mir sowieso nach nichts mehr der Sinn! Da ist dieser Ort so gut wie jeder andere..."},
			Answer{Tag = "markwart005PC", String = "Eure Tochter wurde entführt?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "markwart006", String = "Ja! Von dieser verfluchten Kreatur... diesem Spinnenmann! Viele meinen, er sei nur eine Legende! Aber seit er aus dem Pass heruntergestiegen ist, sind auch die Spötter eines Besseren belehrt worden!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "markwart007", String = "Er war es, der all die Jahre unsere Kinder geraubt hat! Verdammt soll er sein!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 107} , QuestBegin{QuestId = 108},
			Say{Tag = "markwart008", String = "Wenn ich noch die Kraft hätte, dann würde ich ihn seinen eigenen Bestien zum Fraß vorwerfen! Dann wäre Sahra gerächt..."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 107 , State = StateUnknown},
			QuestState{QuestId = 109 , State =  StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "markwart003PC", String = "Lebt Ihr schon lange hier?", AnswerId = 2},
			OfferAnswer{Tag = "markwart008PC", String = "Gehörte dieses Kleid Eurer Tochter?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 107 , State = StateUnknown},
			Negated(QuestState{QuestId = 109 , State =  StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "markwart003PC", String = "Lebt Ihr schon lange hier?", AnswerId = 2},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 107 , State = StateUnknown}),
			QuestState{QuestId = 109 , State =  StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "markwart008PC", String = "Gehörte dieses Kleid Eurer Tochter?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 107 , State = StateUnknown}),
			Negated(QuestState{QuestId = 109 , State =  StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "markwart009", String = "Meine... Sahra... ja... ja, das war eines ihrer Kleider! Sie... sie hat es getragen... an dem Tag, als sie verschwand..."},
			Answer{Tag = "markwart009PC", String = "Eure Tochter wurde gerächt! Der Spinnenmann wird nie wieder ein Kind stehlen!", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "markwart010", String = "Ich... ich danke Euch...! Hier, bitte nehmt das! Es ist nur ein schwacher Dank eines alten Mannes, doch mehr habe ich nicht! Jetzt kann ich in Frieden sterben! Dann werde ich meine Sahra endlich wiedersehen..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 109} , QuestSolve{QuestId = 107},
					TransferItem{TakeItem = 2382 , Amount = 1 , Flag = Take},
					SetRewardFlagTrue{ Name = "KoenigDerSpinnen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 107 , State = StateUnknown},
			QuestState{QuestId = 109 , State =  StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "markwart003PC", String = "Lebt Ihr schon lange hier?", AnswerId = 2},
			OfferAnswer{Tag = "markwart008PC", String = "Gehörte dieses Kleid Eurer Tochter?", AnswerId = 8},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 107 , State = StateUnknown},
			Negated(QuestState{QuestId = 109 , State =  StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "markwart003PC", String = "Lebt Ihr schon lange hier?", AnswerId = 2},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 107 , State = StateUnknown}),
			QuestState{QuestId = 109 , State =  StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "markwart008PC", String = "Gehörte dieses Kleid Eurer Tochter?", AnswerId = 8},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 107 , State = StateUnknown}),
			Negated(QuestState{QuestId = 109 , State =  StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end