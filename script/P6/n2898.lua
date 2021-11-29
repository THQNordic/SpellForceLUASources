-->INFO: Sentos
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		QuestState {QuestId = 385, State = StateActive},
	},
}


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
-- Source: C:\project\main\mission\dialoge\p6\n2898_Sentos.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "SentosWPKnown"},
		},
		Actions = {
			Say{Tag = "sentosWP001", String = "Ah, tretet näher, Freund! Schön, dass Ihr es geschafft habt!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "SentosWPKnown"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			 QuestState {QuestId = 385, State = StateActive},
			IsGlobalFlagTrue {Name ="AllHelpersDead"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "SentosWPKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sentosWP003PC", String = "Was genau tun wir hier?", AnswerId = 4},
			OfferAnswer{Tag = "sentosWP005PC", String = "Worüber sprachen wir gerade?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			 QuestState {QuestId = 385, State = StateActive},
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "SentosWPKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sentosWP003PC", String = "Was genau tun wir hier?", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
			Negated( QuestState {QuestId = 385, State = StateActive}),
			IsGlobalFlagTrue {Name ="AllHelpersDead"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "SentosWPKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sentosWP005PC", String = "Worüber sprachen wir gerade?", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated( QuestState {QuestId = 385, State = StateActive}),
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "SentosWPKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
			IsGlobalFlagTrue {Name ="AllHelpersDead"},
		},
		Actions = {
			Say{Tag = "sentosWP002", String = "Ich... ich kann das erklären..."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
			 QuestState {QuestId = 385, State = StateActive},
			IsGlobalFlagTrue {Name ="AllHelpersDead"},
		},
		Actions = {
			Say{Tag = "sentosWP003", String = "Einen angenehmen Tod wünsche ich!"},
			OfferAnswer{Tag = "sentosWP003PC", String = "Was genau tun wir hier?", AnswerId = 4},
			OfferAnswer{Tag = "sentosWP005PC", String = "Worüber sprachen wir gerade?", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
			 QuestState {QuestId = 385, State = StateActive},
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
		},
		Actions = {
			Say{Tag = "sentosWP003", String = "Einen angenehmen Tod wünsche ich!"},
			OfferAnswer{Tag = "sentosWP003PC", String = "Was genau tun wir hier?", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
			Negated( QuestState {QuestId = 385, State = StateActive}),
			IsGlobalFlagTrue {Name ="AllHelpersDead"},
		},
		Actions = {
			Say{Tag = "sentosWP003", String = "Einen angenehmen Tod wünsche ich!"},
			OfferAnswer{Tag = "sentosWP005PC", String = "Worüber sprachen wir gerade?", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
			Negated( QuestState {QuestId = 385, State = StateActive}),
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
		},
		Actions = {
			Say{Tag = "sentosWP003", String = "Einen angenehmen Tod wünsche ich!"},
		}}

	OnAnswer{3;
		Conditions = {
			 QuestState {QuestId = 385, State = StateActive},
			IsGlobalFlagTrue {Name ="AllHelpersDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sentosWP003PC", String = "Was genau tun wir hier?", AnswerId = 4},
			OfferAnswer{Tag = "sentosWP005PC", String = "Worüber sprachen wir gerade?", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			 QuestState {QuestId = 385, State = StateActive},
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sentosWP003PC", String = "Was genau tun wir hier?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated( QuestState {QuestId = 385, State = StateActive}),
			IsGlobalFlagTrue {Name ="AllHelpersDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sentosWP005PC", String = "Worüber sprachen wir gerade?", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			Negated( QuestState {QuestId = 385, State = StateActive}),
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentosWP004", String = "Ihr seid doch auf der Suche nach Lea und Amra, nicht wahr?"},
			Answer{Tag = "sentosWP004PC", String = "Was wisst Ihr über sie? Finden wir hier eine Spur?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentosWP005", String = "Ihr seid zu neugierig,  junger Freund! Finden... was Ihr hier finden werdet... ist nur Euer Ende! Los, Männer!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 385}, QuestBegin {QuestId = 393},
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentosWP006", String = "Bi... bitte, Ihr... Ihr werdet doch einem Unbewaffneten töten? Erbarmen... im Namen aller Götter, die uns heilig sind!"},
			Answer{Tag = "sentosWP006PC", String = "Mir sind keine Götter heilig! Los, redet! Was wisst Ihr? Warum wolltet Ihr mich aus dem Weg räumen?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentosWP007", String = "Ich... ich weiß nicht! Ich... schwöre Euch..."},
			Answer{Tag = "sentosWP007PC", String = "Noch eine einzige Lüge, Kaufmann, und ich schicke Euch hinab zum Seelenfluss!", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentosWP008", String = "Ich weiß nur... dass es ein Grab gibt... eine Grabstätte in Wisper... man sagt, Lea liege dort! Der Schlüssel zu Amras Rüstung befindet sich in dieser Grabstätte!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentosWP009", String = "Schon oft habe ich Männer dorthin gesandt. Aber keiner ist je zurückgekehrt! Und nun sind meine letzten Männer auch noch tot! Ich bin am Ende!"},
			Answer{Tag = "sentosWP009PC", String = "Nein! Ihr seid am Anfang! Am Anfang ehrlicher Arbeit! Kehrt zu Euren Waren zurück, Sentos! Amras Rüstung wurde für Krieger geschmiedet, nicht für Kaufleute!", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentosWP010", String = "Was bleibt mir anderes! Lebt wohl, Krieger! Möge Euch bei der Suche mehr Glück beschieden sein!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 386}, QuestBegin {QuestId = 387},
							SetRewardFlagTrue{ Name = "AmraUndLea2Sentos"},
			RemoveDialog{},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			 QuestState {QuestId = 385, State = StateActive},
			IsGlobalFlagTrue {Name ="AllHelpersDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sentosWP003PC", String = "Was genau tun wir hier?", AnswerId = 4},
			OfferAnswer{Tag = "sentosWP005PC", String = "Worüber sprachen wir gerade?", AnswerId = 7},
		}}

	OnAnswer{13;
		Conditions = {
			 QuestState {QuestId = 385, State = StateActive},
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sentosWP003PC", String = "Was genau tun wir hier?", AnswerId = 4},
		}}

	OnAnswer{13;
		Conditions = {
			Negated( QuestState {QuestId = 385, State = StateActive}),
			IsGlobalFlagTrue {Name ="AllHelpersDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sentosWP005PC", String = "Worüber sprachen wir gerade?", AnswerId = 7},
		}}

	OnAnswer{13;
		Conditions = {
			Negated( QuestState {QuestId = 385, State = StateActive}),
			Negated(IsGlobalFlagTrue {Name ="AllHelpersDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end